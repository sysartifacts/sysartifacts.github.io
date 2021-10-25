---
layout: single
title: "Artifact Review Summary: Exploiting Nil-Externality for Fast Replicated Storage"
sidebar:
    title: 'SOSP 2021'
    nav: sosp2021toc
---
## Description of the Artifact

The submitted artifact is a fork of an open-source implementation of Viewstamped Replication that implements Skyros. It also includes instructions and scripts for running the experiments from the paper on an AWS cluster.

The artifact is located on bitbucket at <https://bitbucket.org/aganesan4/skyros/>. The repository contains:

1. instructions and scripts for running Skyros on provided AWS machine,
2. code base of Skyros,
3. instructions to build and run on local machines.

## Environment(s) Used for Testing

### Evaluator-configured nodes in CloudLab

To test the functionality of the artifact, the evaluators used a variety of node types on CloudLab:


* Six CloudLab `m510` machines: CPU: Eight-core Intel Xeon D-1548 at 2.0 GHz, RAM: 64GB ECC Memory (4x 16 GB DDR4-2133 SO-DIMMs), Disk: 256 GB NVMe flash storage, NIC: Dual-port Mellanox ConnectX-3 10 GB NIC (PCIe v3.0, 8 lanes)
* CloudLab machines with Linux 4.15.0, 64 GB, 16 core
* ClouLab nodes with Ubuntu 18.04, 40 cores, and 157 GB RAM

### Author-provided resources on AWS

For the replicated badge (to match performance), the evaluators used AWS instances provided by the authors. The AWS clusters contain six servers and one client.

## Step-By-Step Instructions to Exercise the Artifact

### Running on CloudLab to test functionality

The following are steps taken by one of the evaluators to get the artifact running in CloudLab. Steps that differ from those in the artifact instructions are marked with *emphasis*.

1. I started with a clean installation of Ubuntu 18.04.6 LTS.
2. I cloned the artifact from the [public Bitbucket
repository](https://bitbucket.org/aganesan4/skyros) to my home directory:
`git clone git@bitbucket.org:aganesan4/skyros.git skyros`.
3. I followed the instructions for building the artifact from the README in the
`src` directory of the repository.
    1. I installed the dependencies using a package manager: `sudo apt install
    software-properties-common python-setuptools screen curl ant expect-dev
    python-dev python-pip protobuf-compiler pkg-config libunwind-dev libssl-dev
    libprotobuf-dev libevent-dev libgtest-dev g++ cmake libboost-all-dev
    libevent-dev libdouble-conversion-dev libgoogle-glog-dev libgflags-dev
    libiberty-dev liblz4-dev liblzma-dev libsnappy-dev make zlib1g-dev
    binutils-dev libjemalloc-dev libssl-dev pkg-config libunwind-dev
    libunwind8-dev libelf-dev libdwarf-dev libdouble-conversion-dev
    libfarmhash-dev libre2-dev libgif-dev libpng-dev libsqlite3-dev
    libsnappy-dev liblmdb-dev libiberty-dev`
    2. I installed the Folly library using the instructions from the README:
    `pushd . ; cd /tmp; git clone https://github.com/facebook/folly.git;
    cd folly; git checkout 49926b98f5afb5667d0c06807da79d606a6d43c3;
    git clone https://github.com/fmtlib/fmt.git; cd fmt; mkdir _build;
    cd _build; cmake ..; make -j10; sudo make install; cd /tmp/folly;
    mkdir _build; cd _build; cmake ..; make -j10; sudo make install; popd;`
    2. *I installed an additional dependency that is used by the experiment
    scripts to generate plots*: `sudo apt install gnuplot`
3. *I installed a Python package that is used by the experiment scripts
    to compute statistics*: `sudo pip -H install statistics`
    4. I built the artifact: `cd skyros; make -j$nproc`
4. I attempted to verify that the artifact is functional by following the
instructions from the README in the `src` directory of the repository.
    1. I started the replicas: `cd skyros/sample; ./startReplicas.sh`
    2. I started the client: `cd skyros/sample; ./runClient.sh`
    3. I verified that, after the client completed, the output files `lat.1`
    and `latencies.1.raw` were present and that they contained meaningful
    results for the test workload.
5. *I downloaded the workload data for the evaluation from one of the VMs
provided by the authors.*
    1. I mounted a large filesystem with enough space for all data (>60 GB).
    2. I downloaded the workloads: `rsync -avz -e 'ssh -i <path to private key>
    ubuntu@<VM address>:/mnt/data/ /mnt/data/`
6. *For each branch in the repository, I made the same modifications to
configuration files and scripts.*
    1. I modified the IPs in the `experiments/external_ips` and
    `experiments/internal_ips` files to match the IPs of my machines.
    2. *I modified the scripts in the `experiments` folder to run properly with
    my machines*.
        1. I changed the SSH username in the following scripts:
            * `results_repro/micro-nilext-reads/run.sh`
            * `results_repro/commutativity-compat/run.sh`
            * `results_repro/micro-read-latest/run.sh`
            * `results_repro/micro-nilext-only/run.sh`
            * `results_repro/commutativity-fs/run.sh`
            * `results_repro/commutativity-kv/run.sh`
            * `results_repro/ycsb/run.sh`
            * `results_repro/micro-mixed-all/run.sh`
            * `results_repro/rocksdb/run.sh`
            * `results_repro/update_sources_common.py`
            * `results_repro/micro-nilext-nonnilext/run.sh`
            * `remote-throughput.py`
            * `vrclient.py`
            * `download_graphs.sh`
        2. I commented out a line in `results_repro/update_sources_common.py`
        that asserts the SSH username is `ubuntu'.
        3. I changed the path to my local Skyros directory in the following scripts:
            * `results_repro/update_sources_common.py`
            * `download_graphs.sh`
        4. I commented out a line in `results_repro/update_sources_common.py`
        that fetches the latest version from the upstream repository so that my
        changes are not overwritten.
7. I attempted to reproduce the results by following the instructions from the
README in the `experiments` directory of the repository.
    1. I ran all of the experiments with the `run_all.sh` script.
    2. I downloaded the graphs using `rsync`.

### Running on author-provided resources in AWS to test performance

To check reproducibility, evaluators followed instructions [here](https://bitbucket.org/aganesan4/skyros/src/master/experiments/README.md). The `run_all.sh` is under `/mnt/base/skyros/experiments`.


## How The Artifact Supports The Paper

### Artifacts Available

The provided artifact location contains the code used to evaluate the system described in the paper. The location is public and is hosted on a site deemed sufficiently permanent.

### Artifacts Functional 

The artifact contains documentation, and evaluators were able to get it running in both AWS VMs provided by the authors and on machines they set up themselves in CloudLab.

### Results Reproduced

The graphs generated agree with almost all the results presented in the paper. One noticable diffence noted by an evaluator was that in their results, for the LOAD workload in Figure 9a, skyros has speed up of 1.66 instead of 2.29 as noted in the paper. The minor difference may be caused by network bandwidth fluctuation.

Other specific results obtained by evaluators, with reference to the claims from the paper that they support:

> that the artifact achieves higher throughput than a baseline without batching
> and lower latency that the baseline with batching for nilext-only workloads.

The plot `micro-nilext-only.eps` from my run shows Skyros at ~2x the throughput
of Paxos (without batching) and ~0.5x the latency of Paxos. This result agrees
with the result from the paper.

> that the artifact achieves throughput similar to that of a baseline with
> batching non-nilext-only workloads.

The plot `micro-nilext-nonnilext.eps` from my run shows Skyros at roughly the
same throughput of Paxos at 100% non-nilext operations. This result agrees with
the result from the paper.

> that the artifact achieves higher throughput than a baseline with batching
> when replicating RocksDB.

The plot `rocks.eps` from my run shows Skyros at ~1.3x the throughput of Paxos
for workload A. This result agrees with the result from the paper.

> that the artifact achieves throughput similar to that of a baseline on
> workloads with many nilext commutative operations and higher throughput than
> the baseline on workloads with many nilext conflicting operations

The plot `kvcurp.eps` from my run shows Skyros at roughly the same throughput
as Curp for 100% kv-write operations with no conflicts. The plot `fscurp.eps`
from my run shows Skyros at ~2.75x the throughput of Curp for 100% conflicting
nilext operations. These results agree with the results from the paper.
