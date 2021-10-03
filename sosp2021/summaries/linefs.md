---
layout: single
title: "Artifact Review Summary: LineFS: Efficient SmartNIC Offload of a Distributed File System with Pipeline Parallelism"
sidebar:
    title: 'SOSP 2021'
    nav: sosp2021toc
---

## Description of the Artifact

Artifact location: <https://github.com/casys-kaist/LineFS> 

README file of this project: <https://github.com/casys-kaist/LineFS/blob/master/docs/README.md>

The artifact includes the LineFS prototype implementation (based on Bluefield-1), and benchmarks necessary to reproduce the results presented in the paper. The document contains clear instructions on how to setup the system. 


## Environment(s) Used for Testing

This artifact is evaluated on author-provided testbed
1. OS: Ubuntu 18.04.5 LTS (kernel 5.3.11)
2. CPU : Intel(R) Xeon(R) Gold 5218 CPU
3. SmartNIC : NVIDIA Bluefield 1 SmartNIC (MBF1M332A-ASCAT)
4. Persistent memory: 6x 128 GB Optane Persistent Memory Module per CPU socket (Only one socket is used.)
5. Network switch: Switch supporting RoCE at 25GbE speed


## Step-By-Step Instructions to Exercise the Artifact


1. Cloned the repository from github into primary node
2. Setup NFS to share the source in replication nodes and nics
3. Configured and build the system.
4. Run the benchmarks

Authors provided clear instruction for each step and it can be found at <https://github.com/casys-kaist/LineFS/blob/master/docs/README.md>


## How The Artifact Supports The Paper

Overall the artifact is successful to prove all the major claims in the paper.


1. **Throughput scalability ( Figure 4 )**
This experiment compares throughput scalability between 5 systems. Authors provided script to run two major systems Pipeline and Assise. For these systems there are similar trends as described by the authors in the paper. Others are missing.

2. **Latency when idle and busy ( Table 2 )**
Assise-hyperloop is missing from the experiment. But for Assise and Pipeline  there is similar trend as described by the authors in the paper. Latency in the evaluation was better than the latency reported in the paper. Authors explained this in their benchmarking instructions. They have optimized the latency.

3. **Performance interference ( Figure 7 )**
Assise-opt is missing. Found similar trend for Assise and Pipeline described in the paper.

4. **Performance interference by copying methods ( Figure 6 )**
DMA-interrupt experiment is missing. Authors explained this in their benchmarking instruction.
    > DMA-interrupt is an experimental feature and it occasionally incurs a kernel error that requires a system reboot. It is currently commented out to prevent our testbed from failure

   For latency there are similar trends as described in the paper. But for throughput DMA Polling was better than DMA Polling + Batching.

5. **LevelDB latency (Figure 8a)**
Found similar trend described in the paper.

6. **Filebench throughput (Figure 8b)**
Fileserver trend matched with the paper. But Varmail trend didnt' match with the paper. Found higher throughput in Pipeline than Assise.





