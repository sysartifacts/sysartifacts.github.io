---
title: "DAMYSUS: Streamlined BFT Consensus Leveraging Trusted Components"
---

{% include_relative _result-header.html %}

## Artifact content

Damysus consists of two trusted components called checker and accumulator. The artifact includes Damysus-C, where nodes are equipped with a checker only; Damysus-A, where nodes are equipped with an accumulator only; Damysus, where nodes are equipped with both an accumulator and a checker; and Chained-Damysus, a chained version of Damysus, where nodes are equipped with both an accumulator and a checker. Additionally, the artifact includes implementations of basic and chained HotStuff. These protocols are implemented in C++, and their trusted components rely on Intel SGX. The artifact provides docker containers to help run the code.

## Environment(s) used for testing

The AEC evaluators conducted only single-machine experiments using the provided Docker containers on their own hardware.

## How the artifact supports the paper

The evaluators replicated the results in only small-scale experiments (f<20) on a single machine. Hence, the resulting performance results are lower than those reported in the paper's figures. The evaluators performed each experiment with only one repeat because running the full experiments takes some considerable amount of time (namely, several days for each experiment). This last factor produced results not as stable as the ones in the paper. However, those results overall exhibit similar trends with the experiments in the paper for both Damysus and the baselines, supporting the major claims in the artifact appendix.
