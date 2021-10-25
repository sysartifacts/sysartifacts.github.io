---
layout: single
title: "Artifact Review Summary: CLoF: A Compositional Lock Framework for Multi-level NUMA Systems"
sidebar:
    title: 'SOSP 2021'
    nav: sosp2021toc
---

{% include_relative _result-header.html %}

## Description of the Artifact

The artifact contained the CLoF source code, benchmarks and dependencies, and scripts to reproduce Figures 1, 2, 3, 8, 9, and Table 1 from the paper.
The artifacts were bundled into a single directory of the archive named `evaluations/`, with scripts to run the performance evaluation through various existing benchmarks. The benchmark script, called `campaigns` are Python scripts in charge of configuring, compiling and running the benchmark programs (LevelDB and the Kyoto cabinet). The data analysis process is done using a Jupyter Notebook.

The artifact was accompanied with a README with the following structure:
1. Overview
2. Generating the data analysis report on the submitted data
3. Repeating the experiments
    1. Preparing the target machine (To skip if running on author's servers)
    2. Ensuring Linux is predictable (To skip if running on author's servers)
    3. Campaigns
    4. Generating heatmaps
    5. Configure CLoF hierarchy in tools (To skip if running on author's servers)
    6. Generating the bar charts data (To skip if running on author's servers)
    7. Selecting the best CLoF locks
    8. Comparing best CLoF locks to state-of-the-art locks
4. Generating the data analysis report
5. Interpreting the obtained results
6. Contact (The authors' contact details in order to request access to the testbed)


## Environment(s) Used for Testing

The environment used to repeat the experiments was the same as described in section 5.1.1, including the OS and kernel. 
The plots were also successfully generated on a Dell 7400, Debian 11.

## Step-By-Step Instructions to Exercise the Artifact

The reviewers were given access to the following two servers:
- an Armv8 server: a 128-core HiSilicon Kunpeng 920 with 2 sockets, 4 NUMA nodes.
- an x86_64 server: a 48-core AMD EPYC 7352 with 2 sockets, 2 NUMA nodes, 96 CPUs with hyperthreading.

The authors pre-configured both servers (Armv8 & x86) with a fresh Ubuntu install, and installed all the packages required to run the artifacts. Moreover, they already set the server in a configuration ready to run the performance evaluations: the right kernel installed, the cores isolated, and the different balancing daemon disabled.

The authors provided detailed steps in a README for both running the experiments and generating the plots. The flow to reproduce the results reported in the paper is the following:

1. Run the benchmark campaign scripts with a fixed set of parameters (chosen locks, number of threads, benchmark duration, number of repetitions, etc.). A set of CSV files, called the `dataset` is created at this step.

~~~~
cd sosp21-paper136-clof-artifacts/evaluations/scripts
./all-paper-campaigns.sh
~~~~

Copy the dataset from both arm and x86 servers into a single folder `results`.

2. Run the analysis of the produced data, by using the `dataset`, by loading the records from the CSV files, computing aggregations and finally generating Tables and Plots as depicted in the paper. Generate all `results/graphs` with 
~~~
DATASET=results/ ./generate-html.sh
~~~

## How The Artifact Supports The Paper

The *push button* scripts provided by the authors were helpful for quick evaluation. An evaluation run of the experiments on the author-provided environment agreed with the results of the data set provided by the authors. The plots and table generated from the evaluation agreed with the ones generated from the author provided dataset, except Figure 9. For Figure 9, the reviewers had varying results. However, the data generated in the reproduction did not refute the authors' subsequent claim that, "each architecture... needs a tailored lock to exploit... performance benefits." And also was in favour of CLoF with higher throughput.
Overall, the artifacts support the claims made in the paper.


## Additional Notes and Resources

Due to the specific hardware requirements, the reviewers only ran the paper's experiments on the authors' testbed. Moreover, one set of experiment (for generating Figure 2) is not straightforward to run on any other setup which the authors have clearly mentioned.

