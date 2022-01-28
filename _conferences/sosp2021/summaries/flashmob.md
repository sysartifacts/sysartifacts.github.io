---
title: "Artifact Review Summary: Random Walks on Huge Graphs at Cache Efficiency"
---

{% include_relative _result-header.html %}

# Description of the Artifact
The paper proposes FlashMob, a modern CPU cache optimized implementation of the random walk algorithm. The key idea is to exploit the data locality through careful partitioning, rearranging, and batching of operations commonly present within the graph while performing random walks.  FlashMob achieves an order of magnitude overall performance improvement over existing systems like GraphVite and KightKing on 5 real-world graph datasets with 2 random walk algorithms- node2vec and deepwalk.

# Artifact submitted by the authors comprised of:
* FlashMob and baseline implementation, available at <https://github.com/flashmobwalk/flashmob/tree/sosp21-ae>
* Datasets and scripts to evaluate the performance of FlashMob and baseline with detailed dependency information.  
All artifacts are released under the MIT license, apart from the third-party implementation like baseline released under their own licenses.

# Environment(s) Used for Testing
The AEC evaluated this paper's artifact using a combination of Chameleon resources, AWS resources, and self-hosted servers.  
1. A Chamelon instance with dual-socket Intel(R) Xeon(R) Gold 6126 CPU @ 2.60GHz, and RAM of size 192 GiB running  Ubuntu 20.04.
2. AWS m5.12xlarge instance, with Ubuntu Server 20.04 LTS (HVM), SSD Volume Type, 64-bit (x86), 24 cores on 1 NUMA node, and 192GB memory.
3. A dual-socket Intel Xeon Gold 5118 processor matching the CPU used in the paper. The system used Skylake architecture with 24 physical cores, 32KB L1 and 1MB L2 cache, and all cores within a socket share a 16.5MB L3 cache (LLC).
4. AMD EPYC 7702 64-Core Processor running Ubuntu 20.04 with 1TB DRAM.

This makes the artifact well tested at different types of x86 platforms.  

# Step-By-Step Instructions to Exercise the Artifact
The authors have provided detailed instructions for building and exercising the artifact using the provided script at <https://github.com/flashmobwalk/flashmob/tree/sosp21-ae#readme>

# How The Artifact Supports The Paper
The artifact was awarded the Artifact Available and Artifact Functional badges because the source code for FlashMob is available at the GitHub URL listed above, and the evaluators were able to build and run it. The authors of the paper did not apply for the Results Replicated badge. Even then, a couple of AEC committee members were able to reproduce a few results with small graphs within an acceptable range. The AEC reviewers did make a note that the performance was machine-dependent.  The AEC is grateful to the authors for providing comprehensive scripts for exercising the artifact!
