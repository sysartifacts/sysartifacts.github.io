---
title: "Artifact Review Summary: Snowcat: Efficient Kernel Concurrency Testing using a Learned Coverage Predictor"
---

{% include_relative _result-header.html %}

## Description of the Artifact

The artifact, LUMOS, is a framework for kernel concurrency testing. It utilizes a graph neural network as a kernel code-coverage predictor and thus only selects interesting test candidates for dynamic executions. The artifacts are available in [a public repository](https://github.com/rssys/snowcat/tree/main) and include
(1) source code of LUMOS and (2) README, including artifact description, supported environments, running instructions with ETA for each step, and license.

## Environment(s) Used for Testing

* 2 x Intel(R) Xeon(R) Platinum 8358 CPU @ 2.60GHz, 256GB memory, 8TB HDD disk + Btrfs compression enabled. Docker (version 20.10.23, build 7155243) with Docker image ubuntu:18.04.
* 4x Intel Xeon CPU E7-4830 v2 @ 2.7GHz, 252 GB memory, Ubuntu 15.10 wily.
* 64-core machine with 256 GB RAM and 2 TB storage, Ubuntu 18.04
*  32 cores and 128GB of memory, Ubuntu 18.04 with a kernel version of 4.15.0

## How The Artifact Supports The Paper

### Artifact Available 
The artifact is available on a public website. It has a README file with high-level documentation. 

### Artifact Functional
The artifact is well-documented and designed with user-friendliness in mind. Additionally, the package offers scripts that facilitate the configuration of both learning and testing components, as well as enabling the collection of data, model training and inference, and execution of testing tools. It's noteworthy that even in some local environment without GPU hardware, one reviwer was able to successfully train and perform inference using the PIC model.

### Results Reproduced
Major claims in the paper can be validated by reproduced Figures 6.a, 6.b, 6.d, 6.f, and Table 4. The results meet the expectations of Reproduced badge.

## Additional Notes and Resources
The reviewers really enjoyed reviewing the artifact. The guideline is very clear and detailed. Besides, it's worth noting that the btrfs compression level remained fixed at the default value of 3, with no adjustable options available.
