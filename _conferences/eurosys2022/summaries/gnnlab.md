---
title: "GNNLab: A Factored System for Sample-based GNN Training over GPUs"
---

{% include_relative _result-header.html %}

## Artifact contents

The artifact provides the source code and scripts for FGNN, a sample-based GNN training system in a single machine and multi-GPU setup. This artifact is shipped with the performance validation approach of FGNN along with its components compared with baselines. This artifact contains step-by-step scripts and clear documentation for compiling, running, and verifying all results in the corresponding paper.

## Environment(s) used for testing

The evaluators used the pre-configured machine on the public cloud provided by the authors to assess the performance-related results. Some of them also used their own hardware for the evaluation of this artifact. The environment included:

Operating system: Ubuntu ≥ 18.04.
Software dependencies: gcc-7, g++-7, CMake ≥ 3.14, CUDA=10.1, Python=3.8, PyTorch=1.7.1, DGL=0.7.1, PyG=2.0.1
Hardware information: An ECS (`ecs.gn6e-c12g1.24xlarge` on Alibaba Cloud) with two 2.5 GHz Intel Xeon Platinum 8163 CPUs (48 cores each), eight NVIDIA Tesla V100 GPUs (32GB of memory each) and 736GB RAM.

## How the artifact supports the paper

Based on the paper, the artifact appendix and the input collected by the TPC, the evaluators concluded that the major claims from the paper this artifact should support are:
C1: With the chosen datasets and models, FGNN outperforms DGL by 2.2x-9.1x, PyG by 10.2x-74.3x, and SGNN by 0.63x (i.e., performs lower)-3.2x.
C2: When dividing execution time into "sample", "extract", and "train" stages, FGNN and SGNN perform similar to each other in "sample" and "train" stages, but SGNN is 1.4X to 7.1X slower than FGNN in the "extract" stage.

The authors provided one convenient script for running all the necessary experiments to reproduce each figure and table in the paper. The authors also provided an **expected running time table**, to estimate the number of test cases and time needed to obtain the expected results. The evaluators agreed on obtained figures and tables supporting the claims (C1 and C2) in the paper.

## Additional notes

The evaluators believe that the organization of the instructions and of the script files in this artifact makes it easily reusable.
