---
title: "Artifact Review Summary: MIND: In-Network Memory Management for Disaggregated Data"
---

{% include_relative _result-header.html %}

## Description of the Artifact

The artifact is hosted in the [Github repo](https://github.com/shsym/mind), and it can reproduce figures 6, 7, 8, 9 in the paper. The artifact includes the following:

1. The source code of the MIND linux kernel and switch program.
2. Scripts for running these experiments on a Yale's cluster.
3. Memory access traces for the TF, GC, MA, and MB benchmarks used in the evaluation.
4. Pre-built switch program and linux kernel.
5. A memory allocation simulator with memory allocation traces.
6. A cache coherence emulator with pre-computed input for PSO/PSO+ calculation. Pre-computed output for bounded splitting algorithm.
7. Documents and readme to guide evaluation.

In all, the submitted artifact is well organized, and includes complete codes for experiments and many useful scripts to automatically conduct the experiments. Detailed documents are provided, and both description of source code and instruction for evaluation can be found. Generally it is easy to follow instructions and reproduce the results.

## Environment(s) Used for Testing

We use machines provided by authors located at Yale. It is a cluster with roughly 10 machines and a programmable p4 switch. The authors have tried to deploy the system at CloudLab, but due to the use of special hardware, it is not working yet.

Here we list information of environment in the manual.

* System architecture: x86-64
* NIC: Mellanox ConnectX-5
* Base OS: Ubuntu server 18.04 LTS, the default kernel is 4.15.x

## Step-By-Step Instructions to Exercise the Artifact

We followed the instructions by authors.

1. For every experiment, we first shut down all VMs for other experiments running via a shutdown script and load the appropriate switch program.
2. For **Performance evaluation with memory traces**, we load traces and run evaluations by running scripts with corresponding profiles, as the document instructs. Evaluating different systems requires changing directory.
3. For **Latency measurements for state transition cases**, **Benchmark with various sharing and read/write ratios**, **Memory allocator comparison**, we load traces and run evaluations by running scripts with corresponding profiles.
4. For **Cache coherence emulator**, according to the authors, the computation for applications may take days to reproduce, so pre-computed inputs are used. We reproduced the results with the pre-computed inputs by running scripts.
5. For **Bounded splitting algorithm**, we examine the pre-computed outputs. They can be found in readme.

## How The Artifact Supports The Paper

Most results **agree with** the figures in the paper. And we list our comments for each figure as follows.

- Figure 6. We successfully reproduce the results about all traces for MIND, MIND-PSO, MIND-PSO+ and FastSwap, but fail for GAM. The authors aim to point out the scalability of MIND. Though the reproduction for GAM fails, the conclusion still holds for the observed reproduced results, as we usually observe a 2x performance improvement for 2x threads or 2x blades.
- Figure 7. The authors aim to point out the bottlenecks in MIND.
  - For the 7-left, the reproduced results match the figure. According to our results, M->S/M shows a much lower latency, while the latency in other situations is generally the same.
  - For the 7-right, the trend of data points roughly matches the figure.
- Figure 8. The authors show the resource bottlenecks in MIND.
  - For the 8-left, as the authors do not provide tools to plot the figure, we just check the log simply. The trend of different traces generally follows the figure.
  - For the 8-central and 8-right, As the authors comments, the 2 MB page table is too slow for evaluation so we do not conduct it. For 1 GB and MIND, the trend matches the figure.
- Figure 9. The authors show the efficiency of bounding splitting algorithms.
  - For 9-left, we examine the last line in the prepared text in `~/tools/cache_coherence_sim/bounded_split_eval/dynamic_sized` and `~/tools/cache_coherence_sim/bounded_split_eval/static_sized`. The `dynamic_sized` stands for adaptive. The results are roughly the same with the figure.
  - For 9-right, we examine the last line in the prepared text in `~/tools/cache_coherence_sim/bounded_split_eval/epoch_size`, and find the results roughly the same.

