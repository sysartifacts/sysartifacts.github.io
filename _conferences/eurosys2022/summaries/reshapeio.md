---
title: "Improving Scalability of Database Systems by Reshaping User Parallel I/O"
---

{% include_relative _result-header.html %}

## Artifact contents

The artifact contains AppleS code and the testbed for performance evaluation. AppleS is a user I/O regulator, written mostly in C, which reshapes the input stream of the user requests to the database system, used to improve the performance through better user-parallel I/O requests.

## Environment(s) used for testing

The evaluators used a machine provided by the authors. The authors provided the following information about the machine setup:
- The computing server has 2 Intel Xeon E5-2650 V4 processors, 64GB of RAM, a Broadcom NetXtreme II BCM57810 10Gb NIC, and 2 * 1TB SATA HDDs.
- The storage server has 2 Intel Xeon E5-2603 V4 processors, 64GB of RAM, a Broadcom NetXtreme II BCM57810 10Gb NIC, and a RAID-0 SSD array with five 800GB SATA MLC SSDs.
- All the servers are connected by a Dell N4032F switch with a peak bandwidth of 10Gb.

The software environment is as follows:
- The computing server uses CentOS 8.3 with the Linux kernel 5.10.10 that should be enabled for full functionality of Cgroup(v2).
- The storage server uses CentOS 7.3 with the default Linux kernel.
- All the servers have the iSCSI protocol enabled.

The evaluation is done in MySQL 8.0.23 and MongoDB 4.4.3.

More details of the environment can be found in https://github.com/NingBellWind/AppleS_Artifact

## How the artifact supports the paper

The artifact supports the major claims of the paper, as follows:
- AppleS can enhance user-level I/O fairness and improve the throughput.
- AppleS can cooperate well with Cgroup (v2) to combine its effects on CPU fair sharing and further improve throughput and user-level I/O fairness.
- AppleS is portable to MySQL and MongoDB.
- AppleS is orthogonal to existing kernel-level resource management tools (e.g., Cgroups).

Experiment 1 performs the experiments on MySQL, with different optimizations on and off. The number roughly fits and matches the example results. The experiment results report a smaller latency and variance.

Experiment 2 performs the experiments on MongoDB. In some experiments, the evaluators observed higher latency and unfairness, but they agreed that the observed results do not affect the main claims.