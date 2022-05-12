---
title: "BetrFS: A Compleat File System for Commodity SSDs"
---

{% include_relative _result-header.html %}

## Artifact contents

The artifact includes everything needed to evaluate and test the new implementation of BetrFS. Scripts made available by the authors gave an easy-to-access suite in which to compile and load modified kernels, and proper benchmark scripts for each case study.

## Environment(s) used for testing

The artifact has been tested and evaluated on the author’s machines, made accessible to the evaluators over ssh. No special system requirements were needed to evaluate the artifact, besides the one specified on the repository, namely a bare-metal x86_64 Ubuntu 18.04.6 machine and a commodity SATA SSD with at least 250 GB capacity separate from the root partition disk.

* CPU: Intel Xeon E3-1220 v6 @ 3.00 GHz
* RAM: 32GB
* 64-bit Ubuntu 18.04.6
    * Linux kernel version 4.19.99 for BetrFS variants
    * Linux kernel version 5.9.15 for other file systems
* Disks:
    * boot: 500 GB TOSHIBA DT01ACA0 HDD
    * benchmarks:  ​​250 GB Samsung EVO 860 SSD, 512-byte page size, 12 GB write cache

## How the artifact supports the paper

The artifact was used to reproduce Table 3 and Figure 2 from the related paper, claiming that BetrFS v0.6 performs consistently well across a range of file systems performance workloads and that these results will correctly translate to good performance on real-life applications. Results confirmed paper claims and data analysis, giving no doubt about the validity of assumptions made in the paper. Furthermore, no peculiar obstacle was found while testing the artifact with the provided machines, and all the evaluators were able to reproduce benchmarks.

## Additional Notes

The repository included a detailed process to reproduce the results included in the original paper, including ETA for different benchmarks.