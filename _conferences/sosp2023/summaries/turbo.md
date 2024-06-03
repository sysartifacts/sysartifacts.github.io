---
title: "Artifact Review Summary: Turbo: Effective Caching in Differentially-Private Databases"
---

{% include_relative _result-header.html %}

## Description of the Artifact

Turbo is a proposed caching system for linear query tasks in differentially-private databases. The artifact includes the source code and instructions to build docker containers for simulation experiments, which are hosted at [Github](https://github.com/columbia/turbo-artifact).

## Environment(s) Used for Testing

* Cloudlab (Ubuntu 20.04)
* Laptop with 16 cores and 32 RAM with Windows Subsystem Linux 2 and Docker Desktop
* PC with Intel(R) Xeon(R) E-2124G CPU, 64GB RAM, Ubuntu 18.04, and Linux kernel 5.4.0-150-generic


## How The Artifact Supports The Paper

The artifact is available on a public platform and functions properly.

The artifact reproduces all the results in the paper (Figure7a-7d, Figure 8a-8b, Figure 9a-9c, and Figure 10a-10c). While some minimal differences exist, the reproduced results are overall consistent with the results reported in the paper.

## Additional Notes and Resources

We appreciate the author's efforts in integrating all data-producing and figure-plotting work into one script, which is very easy to use. 
To improve the artifact, we encourage the authors to provide the basic hardware requirement for conducting all experiments in a reasonable time.
