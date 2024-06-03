---
title: "Artifact Review Summary: Sia: Heterogeneity-Aware, Goodput-Optimized ML-Cluster Scheduling"
---

{% include_relative _result-header.html %}

## Description of the Artifact

The artifact is located on GitHub, at [https://github.com/siasosp23/artifacts/tree/main](https://github.com/siasosp23/artifacts/tree/main) and its README file at [https://github.com/siasosp23/artifacts/blob/main/README.md](https://github.com/siasosp23/artifacts/blob/main/README.md).
This artifact includes the source code of Sia and instructions to reproduce the results.

## Environment(s) Used for Testing

The following environments have been used to evaluate the artifact by the reviewers:
* A private server with Linux version 3.10.0-957.el7.x86_64
* A private machine with specs: OS: Ubuntu 20.04.5 LTS, Linux version: 5.15.0-79-generic
* Physical machine with 20 cores, 256 GB memory, and Ubuntu 18.04
* Physical machine with Ubuntu 22.04.2, Linux version: 5.15.0
* Ubuntu on VM for artifact evaluation with this specs: 32 GB RAM, 200 GB SSD storage, 20-core CPU


## Step-By-Step Instructions to Exercise the Artifact

The evaluators used the following steps to exercise the artifact:
* Prepare the environment with miniconda following the document for simulation experiments.
* Ran the scripts listed in [the README file](https://github.com/siasosp23/artifacts/blob/main/README.md).
* Parse the logs to summarize the results, and compare the results with the paper.


## How The Artifact Supports The Paper

All evaluators were able to run the simulation but not everyone could verify the claims in the paper. 
In addition, the testbed experiments could not be run by everyone due to hardware restrictions that was hard to overcome.

The artifact is awarded with the following badges:
* Artifact Available
* Artifact Functional
* Results Reproduced
