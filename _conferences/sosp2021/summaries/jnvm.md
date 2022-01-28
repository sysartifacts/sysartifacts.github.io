---
title: "Artifact Review Summary: J-NVM: Off-heap Persistent Objects in Java"
---

{% include_relative _result-header.html %}


## Description of the Artifact

The artifacts contain the source code of J-NVM on [GitHub](https://github.com/jnvm-project/jnvm). The evaluated version of artifacts is commit [c8d78bb287](https://github.com/jnvm-project/jnvm/tree/c8d78bb2877c78b5420d479bdc42afe4f66df524). There are detailed instructions and useful scripts in the artifacts to reproduce the paper's results. The authors' scripts will automatically pull prebuilt docker images on DockerHub, which contain configured workloads for testing.

## Environment(s) Used for Testing

Evaluators used two different environments for testing.

#### Author-Provided Machine

Some evaluators used machines provided by authors. Each machine is equipped with 4 Intel(R) Xeon(R) Gold 5220R CPU @ 2.20GHz, 192 GB DRAM, and 2 non-interleaved 128-GB Optane pmem modules configured in app direct mode. The operating system is Debian 11 (kernel version: Linux 5.10.0).

#### Evaluator's Machine

One evaluator run the tests on a machine with Optane pmem modules owned by his lab. The machine is equipped with 2 Intel(R) Xeon(R) Gold 6230R CPU @ 2.10GHz and 192 GB DRAM (16 GB * 12). For each CPU socket, one 256-GB Optane pmem module is connected and configured in app direct and non-interleaved mode. The operating system is Ubuntu 18.04.3 (kernel version: Linux 5.4.0).

## Step-By-Step Instructions to Exercise the Artifact

#### Author-Provided Machine

Since the environment was already configured in authors' testbed, it is straightforward to run all tests following the [instructions](https://github.com/jnvm-project/jnvm/blob/c8d78bb2877c78b5420d479bdc42afe4f66df524/EXPERIMENTS.md).

Specifically, run the 9 experiments using YCSB at once (command lines to run these experiments individually are available in the [instructions](https://github.com/jnvm-project/jnvm/blob/c8d78bb2877c78b5420d479bdc42afe4f66df524/EXPERIMENTS.md)):

```sh
    $ ./bench.sh ycsb_all
```

Run the experiment using TPC-B:

```sh
    $ ./bench.sh tpcb
```

Run the experiment using go-pmem:

```sh
    $ ./bench.sh go-pmem
```

Note that the experiments run silently by default. The outputs (including logs, collected data, and plotted figures) are in the `results` folder.

#### Evaluator's Machine

Without author-provided machines, the environment needs to be set up before running experiments. Based on the documentation in artifacts, the summarized steps of the experimental setup for the artifact evaluation are as follows.

1. Install `git` and `docker` on the machine

2. Configure the non-interleaved Optane pmem modules in app direct mode (`fsdax` mode) via [ndctl](https://docs.pmem.io/persistent-memory/getting-started-guide/what-is-ndctl)

3. Configure the [NullFSVFS](https://github.com/abbbi/nullfsvfs) as a baseline scheme for testing

```sh
    $ git clone https://github.com/abbbi/nullfsvfs.git
    $ cd nullfsvfs
    $ make
    $ sudo insmod nullfs.ko
    $ sudo mkdir -p /blackhole
    $ sudo mount -t nullfs none /blackhole
```

4. Uncomment and update the environment variables in `bench.sh` according to the configurations

5. Create the required folder for the TPC-B experiment

```sh
    mkdir -p /tmp/bank
```

After the experimental setup, the steps to run the experiments are the same with those on author-provided machines.


## How The Artifact Supports The Paper

Artifacts Available: The artifacts are available on [GitHub](https://github.com/jnvm-project/jnvm) (commit [c8d78bb287](https://github.com/jnvm-project/jnvm/tree/c8d78bb2877c78b5420d479bdc42afe4f66df524) evaluated) and DockerHub (prebuilt workloads).

Artifacts Functional: The artifacts contain clear documentation and scripts to facilitate the artifact evaluation. The scripts are flexible and easy to use. In addition to the straightforward evaluation on author-provided machines, it is easy to configure and run the experiments on a bare-metal machine equipped with Optane pmem modules.

Results Reproduced: The main evaluation results from two environments sufficiently support the paper's claims. The trends of plotted figures by scripts were similar to those in the paper. Most figures' results were reproduced on both environments. In the documentation of artifacts, authors explained the failure to reproduce the TPC-B's results on the evaluator's machine (the results were reproduced on authors' machines). However, the reproduced results are enough to verify the efficiency of J-NVM. For example,

- Figure 7 shows the improvement in throughputs of J-NVM using YCSB workloads. The results were reproduced by running `./bench.sh ycsb_throughput`.
- Figure 9 presents the results of sensitivity study of J-NVM and reports the latency. The results were reproduced by running `./bench.sh ycsb_cacheratio`, `./bench.sh ycsb_recordcount`, `./bench.sh ycsb_fieldcount`, and `./bench.sh ycsb_recordsize`.
- Figure 10 compares the multi-thread throughput of J-NVM with baselines. The results were reproduced by running `./bench.sh ycsb_concurrent`.

In summary, the key results can be reproduced using different environments. The artifacts are available, functional, and reproducible, thus meeting the criteria of three badges.
