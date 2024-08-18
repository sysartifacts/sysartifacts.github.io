---
title: "Artifact Review Summary: Partial Failure Resilient Memory Management System for (CXL-based) Distributed Shared Memory"
---

{% include_relative _result-header.html %}

## Description of the Artifact

The artifact, CXL-SHM, is a distributed memory management system designed to address the challenges of memory management in a distributed environment, particularly in the presence of client failures. 
It is posted on [a GitHub repository](https://github.com/madsys-dev/sosp-paper19-ae). 
It contains a detailed README.md document, which provides configuration instructions and scripts for each plot mentioned in the paper.
The cxl-shm library is included in the repository, with its source code located in the /include and /src directories.
Additionally, the repository includes test cases for evaluating the cxl-shm library, which can be found in the /script and /test directories.

## Environment(s) Used for Testing

* Two-socket AMD Server (each socket has 64 physical cores and 12GB DRAM, Ubuntu 22.04)
* Rack server (two Intel 4th Gen Xeon Platinum 8470 processors with 4800 MHz and 512 GB DDR5 DRAM for each socket): Although the Intel CXL type3 design example did not support the FPGA DEV KIT during the artifact evaluation period, one reviewer managed to set up an numactl-based environment to evaluate the artifact.

## Step-By-Step Instructions to Exercise the Artifact

The reviewers managed to follow the instructions in the README file provided by the authors to run the artifact.

## How The Artifact Supports The Paper

## Artifact Available
The artifact is open-source and publicly accessible at https://github.com/madsys-dev/sosp-paper19-ae.

## Artifact Functional
After installing the required dependencies, the cxl-shm library can be compiled without any issues and provides a functional API in a simulation environment.

## Artifact Reproduced
The main claim is that cxl-shm can provide better performance with the requirement of failure tolerance on cxl distributed shared memory. After executing the scripts on the machines, the results can support this claim.

## Additional Notes and Resources

The reviewers encountered an issue with Phoenix. Although it is a known issue (https://github.com/kozyraki/phoenix/issues/3) with Phoenix, the reviewers had to manually search and fix it. It would be beneficial if this issue could be noted in the document, or the authors could provide a version with the issue fixed.