---
title: "Artifact Review Summary: Pushing Performance Isolation Boundaries into Application with pBox"
---

{% include_relative _result-header.html %}

## Description of the Artifact

The paper presents pBox, a new operating system abstraction designed to mitigate intra-application interference in modern distributed applications. pBox achieves its goal by monitoring application-level virtual resources, often overlooked by the OS. The authors measure the effectiveness of pBox against 16 performance interference use-cases happening in production environments for Apache HTTP, MySQL, PostgreSQL, Memcached, and Varnish.

The artifact is available on a public GitHub repository. This repository hosts the pBox code, utility tooling, and guidelines for compiling, building, and testing the system. The authors further provide steps to verify the key findings of the paper. Specifically, the
repository includes:
    * the pBox kernel: a custom kernel that implement pBox's functionality.
    * the pBox user-level library (psandbox-userlib): a library that serves as a bridge between user applications and the pBox kernel.
    * tooling that automates the installation, building, and validation procedures.
    * comprehensive documentation indicating how to prepare the kernel environment, install the user library, manage interactions between master and client nodes, and validate the main findings of the work.

## Environment(s) Used for Testing

The reviewers primarily used four CloudLab m510 nodes — one server and three client nodes, each equipped with an 8-core processor, 64GB DRAM, and an NVMe SSD. Some reviewers also used four CloudLab xl170 nodes, each equipped with a 10-core processor, 64GB DRAM, and a SATA SSD. On the server machine, reviewers installed the pBox kernel and applications used to evaluate the system. On the client nodes, they installed relevant benchmarks and data sets.

## How The Artifact Supports The Paper

The artifact was awarded the "Artifact Available" and "Artifact Functional” badges.

  1. Artifact Available Badge: The artifact is hosted on a public [GitHub repository](https://github.com/OrderLab/pBox/) that includes code, supplemental tooling, and comprehensive documentation.
  
  2. Artifact Functional Badge: Reviewers followed the step-by-step instructions provided by the authors in the artifact's [documentation](https://github.com/OrderLab/pBox/blob/master/README.md), and were able to successfully replicate experiments related to Figure 10. Specifically, reviewers iterated through the following high-level steps:
    * Set up the CloudLab environment, by instantiating a master and three client nodes;
    * Compiled and installed the pBox kernel on the master node using provided scripts;
    * Manually configured SSH connectivity between the master node and client nodes;
    * Ran a basic micro-benchmark experiment to verify the installation (Figure 10).

  3. Results Reproduced Badge: While reviewers replicated the results of Figure 10 using both m510 and xl170 machines, Figures 11 (latency measurements) to 13 (overhead measurements) presented several challenges. Notably, the reviewers could not exercise approximately a third of the latency measurements, and could not match overhead measurement for two out of five applications.

## Additional Notes and Resources

The reviewers appreciate the authors' dedication to addressing feedback and enhancing the artifact during the review process. These efforts resulted in a more robust and user-friendly system. We encourage the authors to continue adding tooling around pBox to help future users apply the system to even more performance use-cases.
