---
layout: single
title: "Artifact Review Summary: HeMem: Scalable Tiered Memory Management for Big Data Applications and Real NVM"
sidebar:
    title: 'SOSP 2021'
    nav: sosp2021toc
---

{% include_relative _result-header.html %}

## Description of the Artifact

HeMem is implemented as a userland library in Linux. Performance is evaluated using GUPS microbenchmarks as well as three application benchmarks (TPC-C on Silo, FlexKVS key value store, and GapBS a graph processing suite).

The authors provided a repository for the HeMem system <https://bitbucket.org/ajaustin/hemem/src/sosp-submission/> and a detailed README: <https://bitbucket.org/ajaustin/hemem/src/sosp-submission/README>

## Environment(s) Used for Testing

The evaluation environment was provided by the authors and is presented as the same one from the paper. It is a 2 socket system with containing two 64-core Intel Xeon Gold 6252 CPU @ 2.10GHz. It has 12 slots of DDR4 DRAM (384GiB total) with 144GiB reserved for HeMem, 240 GiB for the OS, and kernel parameters `memmap=140G!4G`. It has 12 slots of Intel Optane 128 GiB NVM (part number NMA1XXD128GPS) for a total of 1.5 TiB, with 768 GiB allocated for HeMem. It is not the exact same system described in the paper (2 x 24 cores and 2 x 192 GiB DRAM), however it certainly is similar. It is running Debian with a custom Linux kernel 5.1.0-rc4+.

## Step-By-Step Instructions to Exercise the Artifact

Detailed instructions for configuring the environment on a machine with Optane PMEM can be found at <https://bitbucket.org/ajaustin/hemem/src/sosp-submission/README>. An outline of the process is:

1. Download and install the [special Linux kernel](https://github.com/aj-austin/linux/tree/uffd-wp-merged) in the `uffd-wp-merged` branch. The INCLUDES in the Makefiles of the source directory must be updated with the downloaded headers.
2. Download and install [Hoard](https://github.com/emeryberger/Hoard).
3. Set up the DRAM and NVM `/dev/dax` files.
4. `make` HeMem from the [provided source](https://bitbucket.org/ajaustin/hemem/src/sosp-submission/).

Steps taken in evaluation on an already configured machine:

1. Use SSH to log into the machine.
2. Use `sudo su` to raise the privilege.
3. In the home folder, `source init_env.sh`, which takes several seconds to execute.
4. To reproduce results of two microbenchmarks and three application benchmarks:

  - **Microbenchmarks**
    - **Uniform**: In the `hemem/microbenchmark folder`, run `./run-random.sh`. Results can be found in `random.txt`. This corresponds to the "HeMem" line in Fig. 5 in the paper.
    - **Hotset**: In the `hemem/microbenchmark folder`, run `run.sh`. Results can be found in `results.txt`, which corresponds to the "HeMem" line in Fig. 6.
    - **Instantaneous**: In the `hemem/microbenchmark` folder, run `run-instantaneous.sh`. Results can be found in `tot_gups.txt` file, which corresponds to the "HeMem-PEBS" line in Fig. 8.
  - **Application benchmarks**
    - **Silo**: Run `apps/silo_hemem/silo/run_batch.sh`. Results can be found in `batch/results.txt` corresponding to "HeMem" line in Fig. 10.
    - **GapBS**: Run `apps/gapbs/run_bc.sh`, and results are found in `28v.txt` and `29v.txt`, which correspond to Fig. 11 and Fig. 12.
    - **FlexKVS**: Not done because it requires a separate machine used in tandem.


## How The Artifact Supports The Paper

The paper was awarded all three badges. The provided repository justified the Artifact Available badge. We were able to run all microbenchmarks and two of three provided applications on the HeMem system without trouble justifying Functional. For Results Replicated, nearly all of the claims in the paper are backed up by the results obtained by the reviewers. Specifically, the HeMem results in Fig. 5, 6, 8, 10, 11, and 12 have been replicated. One of the datapoints in Figure 10 does not match exactly, but the difference does not change the argument or conclusions presented by the authors. The FlexKVS experiment was not conducted since it required a server machine. The authors did not provide scripts to reproduce the non-HeMem results. However, even with these limitations, the claims about HeMem's performance matched closely and we felt it was justified to award all three badges.
