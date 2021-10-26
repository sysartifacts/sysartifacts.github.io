---
layout: single
title: "Artifact Review Summary: FragPicker: A New Defragmentation Tool for Modern Storage Devices"
sidebar:
    title: 'SOSP 2021'
    nav: sosp2021toc
---

{% include_relative _result-header.html %}

## Description of the Artifact

FragPicker artifact is publically available on Github
(<https://github.com/jonggyup/FragPicker>).  It provides the source code and
scripts of a defragmentation tool for modern storage devices. The repository
contains sufficient documentation to install FragPicker and its dependencies.
The authors provide instructions for producing "the sequential read performance
with various frag size and frag distance" for Figure 4 in the paper (the
motivational experiments); and synthetic workloads on Optane SSD and Flash SSD
for Figure 8 and 9, respectively.


## Environment(s) Used for Testing

The evaluators used the following environments for the artifact evaluation:

- A server provided by the authors: The provided server has all the storage
  devices needed to perform the evaluation, including HDD, SSD, Optane-SSD. The
  provided server has Ubuntu 18.04 LTS and Linux v5.7.0 installed.

- CloudLab ``c220g2`` machine: similarly Ubuntu 18.04 LTS and Linux Kernel
  5.7.0 are used as the base environment. Cloudlab environment only contains an
  HDD and SSD (no Optane).

- The evaluator's local server with an SSD and HDD. Ubuntu 18.04 is used as the
  authors suggested. In order to independently confirm the behaviors, the
  evaluator built and ran the benchmarks using different machines.


## Step-By-Step Instructions to Exercise the Artifact

Basically, the evaluators followed the instructions provided by the authors.
Some steps were skipped when the evaluators were using the author-provided
server, such as "1. Evaluation Setup" because the machine has been
pre-installed, and "make" the individual tests in part 2 & 3. The general steps are

- Running the motivation experiments used in Figure 4 across all 4 types of
  block devices (Optane, SSD, HDD and MicroSD);
- Running the synthetic workloads (read/write + sequential/stride) across the
  baseline and FragPicker over 3 FSes (ext4, F2FS, and Btrfs). This step
  demonstrates the major claim of the paper, i.e., FragPicker achieve better
  bandwidth in terms of MB/s and writes less to the drives.

- For a new bare metal ubuntu 18.04 LTS instances on Cloudlab, one of the
  evaluators had to first upgrade the kernel to 5.7. The evaluator then
  followed the instructions in the README.md to install dependencies.  Since
  the block devices are different, the evaluator had to modify the bash scripts
  provided by the authors to point to the right devices. The evaluator also
  cleaned up the output files into more convenient tool readable csv files and
  visualized results using the python/pandas/matplotlib/jupyter toolchain.
  - Instructions for Cloudlab install: 
    - Machines used for discussion are below:
      - Two Intel E5-2660 v3 10-core CPUs at 2.60 GHz (Haswell EP)
      - 160GB ECC Memory (10x 16 GB DDR4 2133 MHz dual rank RDIMMs)
      - HDD: HGST HUC101212CSS600 Ultrastar C10k1200 1.2tb 10000rpm Sas-6gbps
        64mb Buffer 2.5inch Sff Enterprise Hard Drive
      - SSD: Intel DC S3500 480 GB 6G SATA SSDs
    - Steps to run the artifact on CloudLab:
      - Select an Ubuntu 18.04 machine.
      - Install necessary kernel packages for 5.7.0 kernel (headers, image,
        modules, etc.)
      - Clone github repo.
      - Run ``./install_dep.sh`` to install dependencies.
      - Install build dependencies for ``bcc``
      - Clone, build, and install ``bcc``
      - Update run scripts to reflect actual disk layout (e.g. ``sdb1`` ->
        ``SSD``, ``sdd1`` -> ``HDD``)
      - Run all experiments using ``./run_all_bench.sh``


## How The Artifact Supports The Paper

Overall, the evalutors reached a concensus that this artifact supports the
major claims made in the paper, although some evaluators had some
"inconclusive" finding during the artifact evaluation process. Details are
below.

The results the evaluators got from the experimental runs were (basically)
consistent with what are in the paper, including both the motivation
experiments and synthetic workloads. The experiments run smoothly without
hurdles. The evaluators were able to reproduce the results in overall for
Figure 4 (a-d), and Figure 8 and 9. The major performance benefits claimed by
FragPicker is also demonstrated through the synthetic workloads (a total set of
{read, write} x {sequential, stride} x {Original, FragPicker-B, FragPicker,
Conv} x {EXT4, F2FS, BtrFS} = 48 experiments. These results make up the major
claims of the paper, albeit the lack of artifact for
running other experiments in the evaluation section (e.g., YCSB in Figure 10,
FileBench in Figure 11, and hotness test in Figure 12). 

### "Inconclusive" Voice from One Evaluator:

FragPicker's performance on the SSD tested was inconclusive. The evaluators can
confirm that it generally writes from one half (seq. read, seq. update) to one
quarter (str.  read, str. update). However performance found by one evaluator,
did not correspond to the results presented in the paper. For example, for ext4
sequential reads, baseline performance is 236 MB/s while both FragPickers only
obtain 238 MB/s and 242 MB/s, while conventional defrag reaches 371 MB/s. For
the same benchmark, F2FS gets 231 MB/s baseline, 240 MB/s in FP-B, 230 MB/s in
FP, and 362 MB/s in conventional.

Updates are more in line with the claims presented in the paper, though the
not enough to entirely convince one evaluator of the conclusion "Overall, FragPicker
efficiently reduces the write amount incurred by defragmentation while
achieving a similar level of performance improvement as existing tools.
Moreover, FragPicker even outperforms the existing tools in terms of stride I/O
performance due to better utilization of internal parallelism" (p.10). In the
example of the SSD, greatly underperforms conventional defragmentation in 1/4
cases, and matches in 3/4 of the cases. The greatest improvement over
conventional defragmentation was 6.8% in the case of stride update on F2FS.
