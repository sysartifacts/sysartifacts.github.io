---
layout: single
title: "WineFS: a hugepage-aware file system for persistent memory that ages gracefully"
sidebar:
    title: 'SOSP 2021'
    nav: sosp2021toc
---

## Description of the Artifact

[WineFS's source code and scripts for related experiments.](https://github.com/rohankadekodi/WineFS)

The authors have provided source code for WineFS along with scripts to reproduce the following results
    - Figure 7 : Performance of applications on aged file systems
        - File Systems: ext4-DAX, xfs-DAX, NOVA, WineFS
        - Applications: RocksDB, LMDB
    - Figure 9 : Performance of applications using system calls on clean file systems
        - File Systems: ext4-DAX, xfs-DAX, NOVA, WineFS
        - Applications: Filebench, WiredTiger

## Environment(s) Used for Testing

All the evaluators used the machine provided by the authors with the following specifications:

Processor: Intel(R) Xeon(R) Platinum 8276L CPU (112 CPUs: 2 sockets, 28 cores per socket, 2 threads per core),
(2 NUMA nodes, 56 CPUs on each)

RAM: 375GiB

Intel Optane DC Persistent Memory module 500GB

OS: Ubuntu 20.04.2 LTS

Kernel: 5.1.0

The authors also provided pre-aged images of file systems for the evaluation as the aging process is a lengthy
one. However, scripts to age a file system are part of the above linked code repository.

## Step-By-Step Instructions to Exercise the Artifact

As all evaluators used the authors' machine, no initial setup and installation of dependencies was required.

Following the authors' instructions at
[WineFS/Experiments.md](https://github.com/rohankadekodi/WineFS/blob/main/Experiments.md), all evaluators were
able to collect results for the artifacts and visualize them with their preferred plotting tool chains.

## How The Artifact Supports The Paper

As WineFS is open-sourced on GitHub, has sufficient documentation for installation and usage, contains scripts
to run experiments and age file systems, and works with real world applications like RocksDB, WiredTiger, and
LMDB, we choose to award the badges: Available and Functional.

While all experiments (and figures) were not reproduced, we awarded the Reproduced badge as for a majority of
file systems and applications, all evaluators could reproduce the following major claims:
1. Applications that use mmap work far better on an aged WineFS than on conventional aged file systems.
    - With the given time constraints, the aging process and performance of the above on fresh file systems
      was not evaluated. However, the results using aged images provided by the author supports the claim.
1. Applications that use the system call interface on a fresh WineFS perform as good as, or better than
conventional fresh file systems.
