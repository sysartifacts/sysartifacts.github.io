---
title: "Artifact Review Summary: Formal Verification of a Multiprocessor Hypervisor on Arm Relaxed Memory Hardware"
---

{% include_relative _result-header.html %}

## Description of the Artifact

The artifact for the paper "Verifying a Multiprocessor Hypervisor on Arm Relaxed Memory Hardware" consists of the following repositories on GitHub:
- [main artifact repo](https://github.com/VeriGu/sosp-paper211-ae) contains instructions for artifact evaluation and references to the sub-repositories.
- [SeKVM kernel repo](https://github.com/VeriGu/usenix-ae-linux) contains source code for SeKVM kernel module.
- [QEMU for SeKVM repo](https://github.com/VeriGu/vct-qemu) contains source code for QEMU compatible with the SeKVM kernel module.
- [Coq Proof repo](https://github.com/VeriGu/sosp-paper211-ae-proof) contains the machine-checkable Coq proofs for SeKVM and instructions to check the proof.

The artifact contains the source code and instructions to build and benchmark the SeKVM kernel module against KVM on the Cloublab platform. The artifact also includes instructions to build SeKVM for generic Linux servers. In addition, The artifact contains machine-checkable Coq proofs for the SeKVM kernel and instructions to verify their correctness.

## Environment(s) Used for Testing

The following environment was used for performance evaluation and benchmarking:
- Cloudlab profile `e6998-vct-m400` was used for evaluation, as suggested by the instructions. The profile references a custom image on Cloublab.
- `e6998-vct-m400` contains a server and a client, both of which are running on Linux 4.18.0 aarch64 with a 64G RAM and 8-core processor. The server comes with a version of QEMU source code, which one can build for KVM benchmarking purposes.

The Coq proofs were checked successfully in multiple environments:
1. a server with two Intel Xeon Gold 6230R and Ubuntu 20.04, and
2. a desktop with Intel Xeon E5-2687W and Fedora 34, with `opam switch ocaml-base-compiler.4.02.0`, `coq.8.4.6`, `menhir.20151112`.

## Step-By-Step Instructions to Exercise the Artifact

### Coq proof correctness verification
1. clone the [Coq proof repo@f6a4ae8](https://github.com/VeriGu/sosp-paper211-ae-proof/tree/f6a4ae8ba1ea0578e0430846dfc41aff1c578b6b),
2. install the OCaml package manager `opam`, through the system's package manager or from scratch (instructions can be found [here](https://opam.ocaml.org/doc/Install.html)),
3. install the 4.02.0 OCaml compiler by executing
```
opam init --compiler 4.02.0
```
or if `opam` is already in the system, create a new switch by executing
```
opam switch create 4.02.0
```
4. install `coq.8.3.6` and `menhir.20151112` by executing
```
opam install coq.8.4.6 menhir.20151112
```
5. make sure `coqc` is in the `PATH` environment variable, or add it manually by executing
```
export PATH="path/to/.opam/4.02.0/bin":$PATH
```
6. use the `Makefile` to check the Coq proofs. optionally, use the `-j` option to utilize multiple cores for speedup,
```
make
```
7. verify the correctness of the proof by verifying the `make` process exited normally, and there are no admitted lemmas in the Coq code.

### SeKVM benchmarking
1. Join the cloudlab project "VirtualCloudTech",
2. Use the provided `e6998-vct-m400` profile to create an experiment. This process will spawn two ARM servers connected with a private network,
3. All instructions in the following steps are executed as `root` user, 
4. Clone the [artifact repo](https://github.com/VeriGu/sosp-paper211-ae) on both machines. On the server, make sure it's located inside `/mydata` directory by executing
```
cd /mydata && git clone https://github.com/VeriGu/sosp-paper211-ae.git
```
5. On the server, make basic preparation by executing the following commands,
```
cd /mydata/sosp-paper211-ae/scripts/tools/
./download-images.sh
./copy-image.sh
```
this process takes approximately 10 minutes. On the client, make basic preparation by executing the following commands,
```
sosp-paper211-ae/scripts/client/install.sh
```

5. For benchmarking, one needs to configure the bridge for the VM by executing the following command
```
/mydata/sosp-paper211-ae/scripts/tools/net.sh
```
It's worth noting that this command needs to be executed every time the server is rebooted, such as after the installation of SeKVM.

6. For the baseline benchmark of KVM, one needs to build the QEMU on the server, and it can be done using the following commands,
```
cd /srv/vm/qemu
./configure --target-list=aarch64-softmmu --disable-werror
make -j8
```
The baseline benchmarking of KVM and QEMU can only happen before benchmarking SeKVM, as the installation of SeKVM will override the kernel.

7. To perform single-VM benchmarks, one needs to first start the VM image by executing the following command
```
cd /mydata/sosp-paper211-ae/scripts/tests/
./run-guest-kvm.sh -i /mydata/cloud-apache.img
```
Afterward, one can perform the benchmark with the following commands on the client machine,
```
cd sosp-paper211-ae/scripts/client
./prep-apache.sh 10.10.1.100
./apache.sh 10.10.1.100
```
One can replace the name `apache` with `mongo` or `redis` for other benchmarks. `hack` and `kern` benchmark can also be performed similarly (detailed instructions [here](https://github.com/VeriGu/sosp-paper211-ae#2102-hackbenchkernbench)).

8. To perform multiple-VM benchmarks, one needs to first start the VM images by executing the following command,
```
cd /mydata/sosp-paper211-ae/scripts/multi/
./multi-kvm.py apache
```
Afterward, one can perform the benchmark with the following commands on the client machine,
```
cd sosp-paper211-ae/scripts/client
./multi-connection.sh
./multi-prep.sh apache
./multi-run.sh apache
```
One can replace the name `apache` with `mongo` or `redis` for other benchmarks. `hack` and `kern` benchmark can also be performed similarly (detailed instructions [here](https://github.com/VeriGu/sosp-paper211-ae#2113-hackbenchkernbench)).

9. One can build and install SeKVM and customized QEMU for SeKVM using the following commands,

```
cd /mydata/sosp-paper211-ae/
git submodule update --init qemu
cd qemu
./configure --target-list=aarch64-softmmu --disable-werror
make -j8

cd /mydata/sosp-paper211-ae/
git submodule update --init linux
cd linux
make sekvm_defconfig
make -j8
make modules_install
make install

cd /mydata/sosp-paper211-ae/scripts/tools/
./install-kernel.sh
reboot
```

the server machine will reboot with the SeKVM kernel installed.

10. To perform a SeKVM benchmarking, one only needs to replay steps 7 and 8. The only difference is to replace all `kvm` occurrences in the commands with `sekvm`.


## How The Artifact Supports The Paper

### Badge: Artifact Available

The artifact provides the source code and instructions to the two primary claims of the paper, that the SeKVM's performance is on par with vanilla KVM, and that SeKVM is verified correct. All materials are available open-sourced on GitHub.

### Badge: Artifact Functional

The artifact is functional in the following sense:
- One can verify the Coq Proof on any machine with correct `Coq` and `menhir` version,
- One can build and install the `SeKVM` kernel on an ARM machines with Linux kernel 4.18.0.

### Badge: Artifact Replicated

The artifact is replicated on Cloudlab platform successfully with multiple reviewers. The produced benchmark results match the figures and claims in the paper.
