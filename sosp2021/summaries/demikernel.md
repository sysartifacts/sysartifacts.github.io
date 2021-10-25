---
layout: single
title: "Artifact Review Summary: The Demikernel Library OS Architecture for Microsecond, Kernel-Bypass Datacenter Systems"
sidebar:
    title: 'SOSP 2021'
    nav: sosp2021toc
---

{% include_relative _result-header.html %}

## Description of the Artifact

The authors provide a link to a github repository
(<https://github.com/demikernel/demikernel/>) that contains source for
`catnip-libos` as well as associated dependencies. `catnip-libos` consists of four
Rust source files covering DPDK, memory, a runtime, and a library interface for
C code. It also includes source for two example echo applications (`tcp.rs` and
`udp.rs`) corresponding to the Cantip (TCP) and Catnip (UDP)
microbenchmarks as described in the paper.

The authors also pointed the reviewers to another version of interest within
the demikernel repository: the `osdi-legacy-code` branch, which points to a
version of the code before significant re-factoring and re-implementation.
This contains other libOSes, in particular Catnap and Catmint.

The demikernel repository contains a README that covers how to build the
contents of the repository as well as a statement about contributing to the
project. It is licensed under the MIT license.

The authors also provided a link to a repository that contains an echo
benchmark (<https://github.com/demikernel/echo>) . This contains code
corresponding to the Linux/POSIX echo microbenchmark described in the paper.
This repo provides a `Makefile` for building the contents.

In addition to third-party libraries such as DPDK and SPDK, the artifact makes
use of other repositories developed by the authors and their collaborators,
notably <https://github.com/demikernel/catnip> and
<https://github.com/demikernel/dpdk-rs> .

## Environment(s) Used for Testing

The evaluators tried the artifact in two environments:

 * In CloudLab, using two `c6525-100g` nodes. These machines have AMD EPYC Rome
   24 core processors, 128GB of RAM, two PCIe v4.0 NVMe drives (NAND flash,
   unlike the Optane used for the authors' own experiments), and a ConnectX-5
   Ex NIC with two 100Gbps ports. Evaluators used the CloudLab Ubuntu 18.04 image, as
   that was the OS recommended by the authors: specifically, Ubuntu
   18.04.1 with kernel `4.15.0-147-generic`.

 * A set of author-provided VMs on Azure. Each evaluator was provided access to
   two VMs which contain 4 CPUs whose model name is `Intel(R) Xeon(R) CPU
   E5-2673 v4 @ 2.30GHz`, and a Mellanox Ethernet controller with type
   `MT27500/MT27520`.

The authors also provided a link to a public CloudLab profile
(<https://www.cloudlab.us/p/Demeter/testing-pair/9>) that allocates nodes with
25 Gbps Mellanox NICs.

Evaluators used the Mellanox OFED `MLNX_OFED-5.4-1.0.3.0` from <http://www.mellanox.com/downloads/ofed/MLNX_OFED-5.4-1.0.3.0/MLNX_OFED_LINUX-5.4-1.0.3.0-ubuntu18.04-x86_64.tgz>

## Step-By-Step Instructions to Exercise the Artifact

### Hardware allocation on CloudLab

Allocate an experiment on CloudLab using the `small-lan` profile. The version
specifically used by the AEC was version 28:
<https://www.cloudlab.us/p/PortalProfiles/small-lan/28>

Request two nodes, the Ubuntu 18.04 image, and hardware type `c6525-100g`.
Under "Advanced Options", set the link speed to 100Gbps, set the "Temp
Filesystem Max Space" checkbox, and set "Temporary Filesystem Mount Point" to
"/mydata". The filesystem-related options give sufficient space for
all files required.

Once the CloudLab machines boot, run

```
sudo chown $USER /mydata
```

### Installation of mlx5

This step and may not need to be performed on machines that already have the
OFED installed. (For example, it is already installed in the authors' CloudLab
profiles.) Perform the following on both machines in the experiment.

```
wget http://www.mellanox.com/downloads/ofed/MLNX_OFED-5.4-1.0.3.0/MLNX_OFED_LINUX-5.4-1.0.3.0-ubuntu18.04-x86_64.tgz
tar -xvf  MLNX_OFED_LINUX-5.4-1.0.3.0-ubuntu18.04-x86_64.tgz
cd MLNX_OFED_LINUX-5.4-1.0.3.0-ubuntu18.04-x86_64/
sudo ./mlnxofedinstall --upstream-libs --dpdk
```

When asked `Do you want to continue?[y/N]:`, answer `y`.

The install script adds a few packages that were not previously installed on my
system. The script did not update the NIC firmware, saying:

```
The firmware for this device is not distributed inside Mellanox driver: 41:00.0 (PSID: DEL0000000004)
To obtain firmware for this device, please contact your HW vendor.
```

This did not seem to present a problem.

When the process finishes, it prompts the user to run `/etc/init.d/openibd restart`
to load the driver - however, rebooting the machines (`sudo shutdown -r now`)
may be more reliable, because reloading the driver may interrupt the
user's `ssh` session and prevent the driver reload from working.

### Building `demikernel`

When the machines finish rebooting from installing the OFED, follow the
instructions at
<https://github.com/demikernel/demikernel/blob/master/README.md> (the AEC used
commit `6019399`).

#### Installing demikernel repo and dependencies

```
export WORKDIR=/mydata
cd $WORKDIR
git clone --recursive https://github.com/demikernel/demikernel.git
cd $WORKDIR/demikernel
sudo -H scripts/setup/debian.sh
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
source $HOME/.cargo/env
make dpdk
```

In the stage for installing `rustup`, take the default options when prompted.
(Note, this step is not required on the authors' profiles, which have rust
installed already.)

The `make` of DPDK succeeded for the evaluators, with the following information
about what was included, and not included, in the build:

```
Message: 
=================
Libraries Enabled
=================

libs:
	kvargs, telemetry, eal, ring, rcu, mempool, mbuf, net, 
	meter, ethdev, pci, cmdline, metrics, hash, timer, acl, 
	bbdev, bitratestats, cfgfile, compressdev, cryptodev, distributor, efd, eventdev, 
	gro, gso, ip_frag, jobstats, kni, latencystats, lpm, member, 
	power, pdump, rawdev, regexdev, rib, reorder, sched, security, 
	stack, vhost, ipsec, fib, port, table, pipeline, flow_classify, 
	bpf, graph, node, 

Message: 
===============
Drivers Enabled
===============

common:
	cpt, dpaax, iavf, octeontx, octeontx2, sfc_efx, mlx5, qat, 
	
bus:
	dpaa, fslmc, ifpga, pci, vdev, vmbus, 
mempool:
	bucket, dpaa, dpaa2, octeontx, octeontx2, ring, stack, 
net:
	af_packet, ark, atlantic, avp, axgbe, bond, bnx2x, bnxt, 
	cxgbe, dpaa, dpaa2, e1000, ena, enetc, enic, failsafe, 
	fm10k, i40e, hinic, hns3, iavf, ice, igc, ionic, 
	ixgbe, kni, liquidio, memif, mlx5, netvsc, nfp, null, 
	octeontx, octeontx2, octeontx_ep, pcap, pfe, qede, ring, sfc, 
	softnic, tap, thunderx, txgbe, vdev_netvsc, vhost, virtio, vmxnet3, 
	
raw:
	dpaa2_cmdif, dpaa2_qdma, ioat, ntb, octeontx2_dma, octeontx2_ep, skeleton, 
crypto:
	bcmfs, caam_jr, ccp, dpaa_sec, dpaa2_sec, nitrox, null, octeontx, 
	octeontx2, openssl, scheduler, virtio, 
compress:
	mlx5, octeontx, zlib, 
regex:
	mlx5, octeontx2, 
vdpa:
	ifc, mlx5, 
event:
	dlb, dlb2, dpaa, dpaa2, octeontx2, opdl, skeleton, sw, 
	dsw, octeontx, 
baseband:
	null, turbo_sw, fpga_lte_fec, fpga_5gnr_fec, acc100, 

Message: 
=================
Content Skipped
=================

libs:
	
drivers:
	common/mvep:	missing dependency, "libmusdk"
	net/af_xdp:	missing dependency, "libbpf"
	net/ipn3ke:	missing dependency, "libfdt"
	net/mlx4:	missing dependency, "mlx4"
	net/mvneta:	missing dependency, "libmusdk"
	net/mvpp2:	missing dependency, "libmusdk"
	net/nfb:	missing dependency, "libnfb"
	net/szedata2:	missing dependency, "libsze2"
	raw/ifpga:	missing dependency, "libfdt"
	crypto/aesni_gcm:	missing dependency, "libIPSec_MB"
	crypto/aesni_mb:	missing dependency, "libIPSec_MB"
	crypto/armv8:	missing dependency, "libAArch64crypto"
	crypto/kasumi:	missing dependency, "libIPSec_MB"
	crypto/mvsam:	missing dependency, "libmusdk"
	crypto/snow3g:	missing dependency, "libIPSec_MB"
	crypto/zuc:	missing dependency, "libIPSec_MB"
	compress/isal:	missing dependency, "libisal"
```

DPDK installs itself into various directories in `$HOME`, such as `$HOME/bin`,
`$HOME/lib`, etc.

#### Building catnip

This step, documented in the README, is straightforward:

```
cd $WORKDIR/demikernel
make
```

##### Running demikernel programs (catnip (UDP) and catnip (TCP))

###### Building the catnip programs

These programs are not built by default, but building them is straightforward

```
cd $WORKDIR/demikernel
make demikernel-examples
```

This step places executables in `$WORKDIR/src/target/release/examples/`

##### Setting up hugepages

Hugepages must be set up in order to run the DPDK code. The
script provided in the demikernel repository at the time of evaluation
(`scripts/setup/hugepages.sh`) did not work. An evaluator created the
following script to replace it:

```
#!/bin/sh

echo 1024 | sudo tee /sys/devices/system/node/node*/hugepages/hugepages-2048kB/nr_hugepages
echo 64 | sudo tee /sys/devices/system/node/node*/hugepages/hugepages-1048576kB/nr_hugepages
mkdir -p /mnt/huge || true
mkdir -p /mnt/huge/2MB || true
mkdir -p /mnt/huge/1GB || true
mount -t hugetlbfs -o pagesize=2M nodev /mnt/huge/2MB
mount -t hugetlbfs -o pagesize=1G nodev /mnt/huge/1GB
```

Replace the contents of `scripts/setup/hugepages.sh` with this, and execute it:

```
cd $WORKDIR/demikernel
sudo scripts/setup/hugepages.sh
```

This needs to be done on both machines. If nodes get rebooted, this must be run
after every boot.

##### Creating configuration files

The catnip programs require configuration files: modify
`scripts/config/default.yaml` on each of the machines. Configuration files used
by one of the evaluators on CloudLab are below; note, however, that they are
specific to the machines used and may need to be modified to run elsewhere,
even on other CloudLab machines. You can find the nodes' IP addresses with
`ifconfig` and the PCI bus addresses (for the `eal_init` line) for the cards
with `lspci | grep Mellanox` .  On CloudLab, make sure to look for interfaces
with private IP addresses, as these are on the "experiment" network.

`node0:`

```
client:
  connect_to:
    host: 10.10.1.2
    port: 12345
  client:
    host: 10.10.1.1
    port: 12345
server:
  bind:
    host: 10.10.1.2
    port: 12345
  client:
    host: 10.10.1.1
    port: 12345
catnip:
  my_ipv4_addr: 10.10.1.1
  arp_disable: true
dpdk:
  eal_init: ["-c", "0xff", "-n", "4", "-w", "41:00.0","--proc-type=auto"]
```

`node1:`

```
client:
  connect_to:
    host: 10.10.1.2
    port: 12345
  client:
    host: 10.10.1.1
    port: 12345
server:
  bind:
    host: 10.10.1.2
    port: 12345
  client:
    host: 10.10.1.1
    port: 12345
catnip:
  my_ipv4_addr: 10.10.1.2
  arp_disable: true
dpdk:
  eal_init: ["-c", "0xff", "-n", "4", "-w", "41:00.0","--proc-type=auto"]
```

##### Running catnip (UDP)

The catnip example programs `udp` and `tcp` respectively get built in
`src/target/release/examples/`

In addition to the configuration files above, they require a number of
environment variables. Additionally, because DPDK installs itself in `$HOME/`,
it is necessary to set `LD_LIBRARY_PATH=$HOME/lib/x86_64-linux-gnu`.

In addition to the configuration files above, they require a number of environment variables, which were provided via comments by the authors. Additionally, because DPDK installs itself in $HOME/, it is necessary to set LD_LIBRARY_PATH=$HOME/lib/x86_64-linux-gnu.

On the machine you are using as the server (`node1` in these examples), run:

```
cd $WORKDIR/demikernel
sudo env LD_LIBRARY_PATH=$HOME/lib/x86_64-linux-gnu/ MSS=9000 MTU=1500 NUM_ITERS=1000 BUFFER_SIZE=64 ECHO_SERVER=yes src/target/release/examples/udp scripts/config/default.yaml
```

On the client (`node0`), run:

```
cd $WORKDIR/demikernel
sudo env LD_LIBRARY_PATH=$HOME/lib/x86_64-linux-gnu/ MSS=9000 MTU=1500 NUM_ITERS=1000 BUFFER_SIZE=64 ECHO_CLIENT=yes src/target/release/examples/udp scripts/config/default.yaml
```

The evaluators were able to get results that were not identical to those in the
paper (Figure 5), but as close as can be expected given that they were run on a
different hardware platform than used for the paper.

##### Running catnip (TCP)

Running the TCP version of this microbenchmark is essentially the same as the UDP one.

On the machine being used as the server (`node1` in these examples), run:

```
cd $WORKDIR/demikernel
sudo env LD_LIBRARY_PATH=$HOME/lib/x86_64-linux-gnu/ MSS=9000 MTU=1500 NUM_ITERS=1000 BUFFER_SIZE=64 ECHO_SERVER=yes src/target/release/examples/tcp scripts/config/default.yaml
```

On the client (`node0`), run:

```
cd $WORKDIR/demikernel
sudo env LD_LIBRARY_PATH=$HOME/lib/x86_64-linux-gnu/ MSS=9000 MTU=1500 NUM_ITERS=1000 BUFFER_SIZE=64 ECHO_CLIENT=yes src/target/release/examples/tcp scripts/config/default.yaml
```

The evaluators got latency numbers very close to the values found for UDP on the same machines.

### Building and running programs from the echo repository: Linux/POSIX

The baseline Linux/POSIX microbenchmark can be found in a repository at <https://github.com/demikernel/echo>

#### Building programs from echo repository

Do the following to install the echo repository, as documented in the README:

```
cd $WORKDIR
git clone https://github.com/demikernel/echo.git
```

(`$WORKDIR` was still set to `/mydata` as above)

Install build dependencies:

```
sudo apt-get install libyaml-cpp-dev libboost-all-dev
```

At this point, the build should succeed for both the `src/posix` and `src/rust` directories.

```
cd $WORKDIR/echo
make
```


#### Running POSIX programs from the echo repository (Linux/POSIX)

The programs under `src/posix` test the configuration called `POSIX/Linux` in the paper. On the server machine (`node1` in the CloudLab experiment), run:

```
cd $WORKDIR/echo
./bin/server 
```

... and on the other (`node0`), run:

```
cd $WORKDIR/echo
./bin/client --ip 10.10.1.2
```


###  Building and running programs from the `osdi-legacy-code` branch of `demikernel` (catnap and catmint)

Some of the microbenchmarks in the paper can be found in the `osdi-legacy-code` branch of the main demikernel repository.

#### Checking out the `osdi-legacy-code` branch

The `osdi-legacy-code` branch contains references to four broken submodules, all related to the REDIS implementation. A reliable method to obtain a copy of the `demikernel` repository with the `osdi-legacy-code` branch is the following:


```
cd $WORKDIR
git clone --branch osdi-legacy-code https://github.com/demikernel/demikernel.git osdi-legacy-code
cd osdi-legacy-code
git submodule init
git submodule deinit -f -- submodules/redis-dpdk-catnip/
git rm -f submodules/redis-dpdk-catnip/
git submodule deinit -f -- submodules/redis-lwip
git rm -f submodules/redis-lwip
git submodule deinit -f -- submodules/redis-posix
git rm -f submodules/redis-posix
git submodule deinit -f -- submodules/redis-rdma
git rm -f submodules/redis-rdma
git add .gitmodules submodules/
git commit -m "Removed broken Redis submodules"
git submodule update
```

#### Building programs in the `osdi-legacy-code` branch

This is straighforward, following instructions from the `BUILDING.md` file in this branch. The basic steps are:

Install additional dependencies:

```
cd $WORKDIR/osdi-legacy-code
sudo scripts/setup/debian.sh
```

Set up and configure build environment:

```
cd $WORKDIR/osdi-legacy-code
mkdir -p build/release
cd build/release
cmake $WORKDIR/osdi-legacy-code
ccmake $WORKDIR/osdi-legacy-code
```

During the `ccmake` step, change `CMAKE_BUILD_TYPE` to `Release` and `DPDK_MLX5_SUPPORT` to ON; "cg" saves, exits, and reconfigures.

Only certain targets build successfully, so these are the ones to build to run the appropriate programs for this section:

```
cd $WORKDIR/osdi-legacy-code/build/release
make dmtr-rdma-echo dmtr-posix-echo
```

#### Running catnap


On the server (`node1`):

```
cd $WORKDIR/osdi-legacy-code/build/release
./src/c++/apps/echo/dmtr-posix-server --ip 10.10.1.2
```

On the client (`node0`):

```
cd $WORKDIR/osdi-legacy-code/build/release
./src/c++/apps/echo/dmtr-posix-client --ip 10.10.1.2 -i 10000
```

#### Running catmint


On the server (`node1`):

```
cd $WORKDIR/osdi-legacy-code/build/release
./src/c++/apps/echo/dmtr-rdma-server --ip 10.10.1.2
```

On the client (`node0`):

```
cd $WORKDIR/osdi-legacy-code/build/release
./src/c++/apps/echo/dmtr-rdma-client --ip 10.10.1.2 -i 10000
```

## How The Artifact Supports The Paper

Together, the `demikernel` and `echo` repositories make available four of the libOSes described in the paper. Excercising them requires the documentation in this summary.

## Additional Notes and Resources

In addition to the `master` branch in the `demikernel` repository, the `osdi-legacy-code` branch is likely to be of interest to others interested in this artifact. The authors stated that a re-write of demikernel was in progress at the time of the review, and more may be available in the `main` branch in the future.
