---
layout: single
title: "Artifact Review Summary: BIDL: A High-throughput, Low-latency Permissioned Blockchain Framework for Datacenter Networks"
sidebar:
    title: 'SOSP 2021'
    nav: sosp2021toc
---

{% include_relative _result-header.html %}

## Description of the Artifact

The code of the project is publicly available on github, as well as the instructions for running the experiments (in their cluster or to configure your local environment).

To reproduce the results, the authors provided bash scripts for executing the experiments and generating as output graphics in `.pdf` format, allowing the user to evaluate the performance of BIDL in comparison with the other benchmarks.

## Environment(s) Used for Testing

The evaluator used 8 machines provided by the authors, hosted on the authors' campus. Each machine has 64GB memory and 24 cores of Intel(R) Xeon(R) CPU E5-2690 v3 @ 2.60GHz.

## Step-By-Step Instructions to Exercise the Artifact

The evaluators then ran each of the experiments as recommended in the documentation by using the bash `run.sh <experiment_type>` and obtained the resulting figure and logs from the evaluation of each experiment.



## How The Artifact Supports The Paper

Although the benchmark is performed in a slightly different environment, the results support the paper's claims, in the following way:

1. Figure 5 is reproduced with the following differences: FastFabric has about 2x lower throughput. BIDL's breaking point did not show up in the evaluation. Still, the evaluators think this is sufficient to show that BIDL can achieve a higher throughput without having a long latency.

2. Figure 6 is reproduced with the following differences: only BIDL-SMART is given. There is a sudden drop of latency when the number of organizations is about 12. Still, the scalability is clear.

3. Figure 8 is reproduced with a slightly higher throughput for BIDL and a slightly lower throughput for FastFabric. But the trends are similar.

4. Figure 7 is reproduced, though the change in the throughput is much more aggressive. But the change in throughput upon malicious attackers matches the expectations.

We also offer the following notes:

1. One of the baselines, StreamChain, is broken. The evaluators could not evaluate StreamChain, and instead compared it with author-provided logfiles  log file. Since the StreamChain benchmark is not used to show the strength of BIDL, but to admit the strength of StreamChain over BIDL, the evaluators considered this reasonable decided to trust the result.

2. Experiment 1-1 was not fully stable. One evaluator needed rerun the experiment for the second time to make sure sufficient data was collected for the Python scripts to draw the figure.

