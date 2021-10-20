---
layout: single
title: "Artifact Review Summary: Scale and Performance in a Filesystem Semi-Microkernel"
sidebar:
    title: 'SOSP 2021'
    nav: sosp2021toc
---

## Description of the Artifact

This paper introduces the _semi-microkernel_ architecture for storage systems -- aka a "filesystem as a process", and evaluates it using a user-level filesystem called uFS, which consists of a server built atop Intel's SPDK system, and a client library linked into applications that communicates with the server via IPC.

Three artifacts were submitted by the authors:

- The uFS server and library, available at <https://github.com/WiscADSL/uFS>
- The benchmark suite used in the paper, including Filebench, LevelDB, and ScaleFS, available at <https://github.com/WiscADSL/uFS-bench/>
- A suite of scripts to install dependencies, compile the system, and reproduce the results in the paper, available at <https://github.com/WiscADSL/uFS/tree/main/cfs_bench/exprs/artifact_eval>

All artifacts are released under the MIT license, apart from the open-source benchmark suites released under their own licenses.

## Environment(s) Used for Testing

The AEC evaluated this paper's artifact using a combination of CloudLab resources and servers provided by the authors.

- CloudLab experiments were run using a `c6525-100g` instance: 24-core AMD 7402P at 2.80 GHz, 128 GB RAM, two Samsung PM173X 1.6 TB NVMe SSDs, and Mellanox ConnectX-5 Ex 100 GB NIC.
- The author-provided resources included a server with a Intel Xeon Gold 5218 CPU, 128 GB RAM, and Intel Optane 905P Series (960GB) SSD

Author-provided resources were necessary because CloudLab does not (yet) provide access to Optane SSDs.

uFS was run on Ubuntu 20.04 LTS, with Linux kernel 5.4.0 and SPDK 18.04.


## Step-By-Step Instructions to Exercise the Artifact

The authors have provided detailed instructions for building and
exercising the artifact using the provided `artifact-eval.sh` script
at
<https://github.com/WiscADSL/uFS/tree/main/cfs_bench/exprs/artifact_eval>


## How The Artifact Supports The Paper

The artifact was awarded the Artifact Available and Artifact Functional badges because the source code for uFS is available at the GitHub URLS listed above, and the evaluators were able to build and run it.

The artifact was awarded the Results Replicated badge because the evaluators were able to reproduce the main results of the paper. Specifically, the evaluators reproduced most of the results from Figures 5-11 from the paper. The evaluators were only able to partially reproduce the LevelDB experiments (Figure 12) on CloudLab due to hardware limitations, but were able to run the full workload on the author-provided servers, and concluded that the results largely matched the conclusions in the paper.

The AEC is grateful to the authors for providing comprehensive scripts for exercising the artifact! 
