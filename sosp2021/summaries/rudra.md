---
layout: single
title: "Artifact Review Summary: Rudra: Finding Memory Safety Bugs in Rust at the Ecosystem Scale"
sidebar:
    title: 'SOSP 2021'
    nav: sosp2021toc
---

{% include_relative _result-header.html %}
 

## Description of the Artifact

The artifact is available on GitHub, at [sslab-gatech/Rudra-Artifacts](https://github.com/sslab-gatech/Rudra-Artifacts). The core of the artifact has been open-sourced as a reusable tool at [sslab-gatech/Rudra](https://github.com/sslab-gatech/Rudra).

The artifact contains:

- The Rudra static analysis tool: source code, along with a Docker build script and pre-built Docker images
- Instructions, human and compute time estimates, and expected outputs for reproducing the results from the paper
- Scripts that automate the evaluation and analysis of results
- Raw data for some experiments, including a snapshot of the [crates.io](https://crates.io/) repository to ensure reproducibility

## Envrionment(s) Used for Testing

The evaluation, aside from wall clock run time, was not sensitive to choice of environment used for evaluation. All reviewers ran the artifact in a Docker container on a host machine running Linux, following the instructions in the artifact.

Basic information about the machines that the reviewers used:

- Intel Core i7-5930K with 32 GB RAM
- Intel Core i7-6700 with 32 GB RAM
- 2 x Intel Xeon Silver 4114 with 192 GB RAM
- Intel Core i7-8700 with 16 GB RAM
- Intel Xeon Platinum 8175M with 64 GB RAM

## Step-By-Step Instructions to Excercise the Artifact

Reviewers followed the detailed instructions in commit [addac3a](https://github.com/sslab-gatech/Rudra-Artifacts/commit/addac3ac82a70c770d899b3c56fd15a6449db787) of the artifact. The reviewers did not need to take any additional steps to reproduce the results.

## How The Artifact Supports The Paper

The reviewers awarded the _Artifact Available_ badge because the artifact is publicly available on GitHub, the _Artifact Functional_ badge because all reviewers were able to build and run the artifact, and the _Results Replicated_ badge because all reviewers were able to reproduce the main claims from the paper.

The reviewers were able to reproduce all of the results mentioned in the artifact README, which make up the majority of the claims of the paper:

- Analysis speed
    - The reviewers' machines were not identical to the machine used in the paper's evaluation; performance results were comparable when accounting for difference in CPU performance
- Detected bugs and types: on crates.io snapshot, Rust standard library, and rustc
- RustSec bugs / ratio
- Precision

The artifact did not have instructions to reproduce the results of running Rudra on Rust-based OSes, nor did it have instructions to run the related work (other static analysis tools or fuzzers) on the projects. The reviewers believed that this was a relatively small part of the claims, and that overall the artifact reproduces the results of the paper.
