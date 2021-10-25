---
layout: single
title: "Artifact Review Summary: Coeus: A system for oblivious document ranking and retrieval"
sidebar:
    title: 'SOSP 2021'
    nav: sosp2021toc
---

{% include_relative _result-header.html %}

## Description of the Artifact
This paper presents the artifact in <https://github.com/ishtiyaque/Coeus_artifact>.

This paper of the artifact presents Coeus, a system for oblivious document ranking and retrieval. Coeus consists of two cryptographic primitives: secure matrix-vector product for scoring document relevance using the widely-used term frequency-inverse document frequency (tf-idf) method, and private information retrieval (PIR) for obliviously retrieving documents.

The artifacts include all the functionality, baseline scripts, AWS experiment scripts, and plotting scripts. Running the artifact does not need special hardware, but requires machines with large memory (128GB) and computing capabilities (96 vCPU).

## Environment(s) Used for Testing

Local machines with Ubuntu 18.04 are tested for single-machine experiments.

96 AWS instances (clients, master and workers) are used for evaluating the distributed experiments. `c5.12xlarge` is used for the workers and `c5.24xlarge` is used for the master. The details of the machine setup can be found in the paper. 

## Step-By-Step Instructions to Exercise the Artifact

The repo provides clear descriptions on running the experiment on local machines (<https://github.com/ishtiyaque/Coeus_artifact/blob/master/README.md>) and AWS (<https://github.com/ishtiyaque/Coeus_artifact/blob/master/aws_scripts/README.md>).

## How The Artifact Supports The Paper

All figures can be reproduced in the artifacts.

figure 5: the trend is the same with the one in the paper, some variances in Coeus's value.

figure 6: the trend is the same with the one in the paper, some variances in Coeus's value.

Figure 8: the value and trend are the same with the one in the paper.

Figure 9: the value and trend are the same with the one in the paper (with some marginal errors).

The figures show that Coeus is faster than the baselines, and is scalable to the number of machines.

## Additional Notes and Resources

### Problem of the SEAL version

Step1 of Coeus uses SEAL v3.5.6 whereas step 2 and 3 uses SEAL 3.2. If there are some compiling problems, the following can be try:

* Comment out lines 29-36 in `env-setup.sh` and then run `env_setup.sh`
* Perform the experiments involving matmult and step1
* Make lines 29-36 active again, comment out lines 20-27 in `env_setup.sh`. Run `env_setup.sh`
* Perform experiments involving step 2 and 3.
