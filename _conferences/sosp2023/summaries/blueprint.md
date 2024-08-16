---
title: "Artifact Review Summary: Turbo: Effective Caching in Differentially-Private Databases"
---

{% include_relative _result-header.html %}

## Description of the Artifact

Blueprint is a microservice development toolchain that facilitates swift CBD. By making just a few code modifications, users can seamlessly reconfigure an application's design, and Blueprint generates a fully functional variant of the application based on the new design. 
The artifact is conveniently accessible through the "blueprint-compiler" repository. Within this repository, all the essential scripts needed to carry out the experiments detailed in the paper are included. The authors thoughtfully provide an overview of the Blueprint evaluation procedure, meticulously delineate the workflow for conducting Blueprint experiments, and furnish comprehensive instructions for executing each individual experiment.
In addition, the artifact is augmented by Blueprint-compatible iterations of various open-source microservice applications. These tailored applications are available within the "blueprint-systems" repository. It's important to note that each of these applications enjoys its own dedicated repository, as previously indicated.

## Environment(s) Used for Testing

* A Intel SPR node with 96 cores, 192 vcpus, and 1.5 TB DRAM
* A single cloudlab bare-metal node was used for the evaluation with the following hardware spec: CPU 16-core AMD 7302P at 3.00GHz RAM 128GB ECC Memory (8x 16 GB 3200MT/s RDIMMs), Disk Two 480 GB 6G SATA SSD, Ubuntu 22.04 with Linux kernel version 5.15.0-69-generic
* 2-node topology using Cloudlab machines
* A cluster of two machines running on Google Cloud Platform, each with 16 CPUs and 64GB memory (n2-standard-16) and running Ubuntu 20.04

## How The Artifact Supports The Paper

# Artifact Available
The artifact is available, and has a good setup script.

# Artifact Functional
The artifact consists of a compiler for microservice applications. The Blueprint compiler itself can function properly.
