---
title: "Artifact Review Summary: FIFO Queues are All You Need for Cache Eviction"
---

{% include_relative _result-header.html %}

## Description of the Artifact

The artifact is located on GitHub, at [https://github.com/Thesys-lab/sosp23-s3fifo](https://github.com/Thesys-lab/sosp23-s3fifo) and its README file at [https://github.com/Thesys-lab/sosp23-s3fifo/tree/main/README.md](https://github.com/Thesys-lab/sosp23-s3fifo/tree/main/README.md).
This artifact includes the source code of S3-FIFO and instructions to reproduce the results.

## Environment(s) Used for Testing

The evaluators used the following environments:
* Physical machine with 20 cores, 256 GB memory, and Ubuntu 18.04
* Bare-metal machine on my end: 2 sockets, 20 cores per socket (Xeon Gold 6230), 1.5 TB RAM, Ubuntu 20.04.4 LTS, Linux kernel 5.4.0-122-generic
* Physical machine with Intel Xeon Silver 4210 (two sockets with 10 physical coreseach) and 256GB of DRAM. OS: Ubuntu 22.04, Linux version: 6.3.8
* n2-standard-16 instance on Google Cloud. Specs: 16 vCPUs and 64 GB of memory. OS: Ubuntu 20.04 LTS.
* Server with Intel(R) Xeon(R) Silver 4210R CPU, Hyperthreading disabled, Turbo disabled, 256GB memory. OS: Ubuntu 22.04.1 with Linux 6.3.8.


## Step-By-Step Instructions to Exercise the Artifact

The evaluators used the following steps to exercise the artifact:
* Followed the instructions in [https://github.com/Thesys-lab/sosp23-s3fifo/blob/main/doc/AE.md](https://github.com/Thesys-lab/sosp23-s3fifo/blob/main/doc/AE.md)
* Cloned and installed libCacheSim from [https://github.com/1a1a11a/libCacheSim](https://github.com/1a1a11a/libCacheSim)
* Installed numpy and matplotlib packages using pip install numpy matplotlib before being able to run the experiments and generate the plots.

## How The Artifact Supports The Paper

All evaluators agreed that the artifact is well documented and functional. 
The claims made by the paper were mostly verified by the evaluators, although there were some evaluators that could not reproduce all results due to lack of hardware requirements (e.g. figure 8 or 11).

## Additional Notes and Resources

* ```python3 scripts/plot_one_hit_zipf.py``` and ```python3 scripts/plot_one_hit_trace.py``` take a long time (~20 min on n2-standard-16 GCP machine) so a note or some logging to indicate progress would help
