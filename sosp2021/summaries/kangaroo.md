---
layout: single
title: "Artifact Review Summary: KANGAROO: Caching Billions of Tiny Objects on Flash"
sidebar:
    title: 'SOSP 2021'
    nav: sosp2021toc
---

{% include_relative _result-header.html %}

## Description of the Artifact

As stated in the paper abstract, Kangaroo is "a new flash-cache design that
optimizes both DRAM usage and flash writes to maximize cache performance while minimizing cost". The Kangaroo artifact is comprised of the two codebases summarized below:

1) [Simulator](https://github.com/saramcallister/Kangaroo): This repository has a simulator for the experimental Kangaroo caching design, as well as simulators for baseline designs set-associative cache (SA) and a log-structured cache (LS) to compare to Kangaroo. It also has a parser to provide new configurations and scripts to generate different runtime configurations.

2) [On-Flash Implementation](https://github.com/saramcallister/CacheLib-1/tree/artifact-eval-kangaroo-upstream): The artifact-eval-kangaroo-upstream branch of the CacheLib-1 repository contains the Kangaroo Flash Cache design built on top of the CacheLib engine. It includes the instructions required to run Kangaroo on any machine with compatible hardware, along with the Set Associate and Log-Structured Cache baseline comparison designs. Also included are the scripts for running multiple configurations of the cache along with graphing scripts to generate the graphs from the paper.

<!-- *Start by including the links and any other useful description (not instructions) provided by the authors, then summarize the reviewers' artifact descriptions* -->

## Environment(s) Used for Testing

The environmental requirements for each codebase are as follows:

1) Simulator: In order to run the simulations, both [SCons](https://scons.org/) and [Python3](https://www.python.org/downloads/) need to be installed. Note that these are both essential packages as [described in the repository](https://github.com/saramcallister/Kangaroo#simulation-code) because SCons is needed to build the simulator and Python3 is needed to generate configurations and run the simulations.

2) On-Flash Implementation: In order to run the on-flash implementation, a flash device is essential. Any machine with at least two drives and at least one of which is flash will work for the purposes of the experiment.

While the above are the bare minimum requirements needed to run the experiments, there are other environmental factors which will make getting all dependencies installed and running the application much easier and faster. The reviewers either used Cloudlab machines with the appropriate hardware or a provided Azure VM, and all used Ubuntu 18.04 as their base operating system. Note that Ubuntu 18.04 is the author recommended environment to run both codebases on. 
<!-- *Describe the environments the evaluators used. If multiple environments were used succesfully, list all of them. Describe the environment in sufficient detail that a later reader could conceivably re-create something similar. If author-provided resources were used, say as much about them as we know (but don't provide hostnames, etc.)* -->

## Step-By-Step Instructions to Exercise the Artifact
**Simulation:**

1) Clone the ‘Kangaroo’ [repository](https://github.com/saramcallister/Kangaroo).

2) Build instructions for the simulator software:

    a) Install pip for python (Note: This was not included in the instructions in the repo. This step is necessary if you are starting from a bare metal machine) 

    b) Run `pip install SCons`

    c) `cd` into the ‘simulator’ folder

    d) Install scons using `sudo apt-get install scons` (Note: This was not included in the original instructions in the repo. The provided installation instructions, which depended on pip, did not successfully install scons. Since I was using an Ubuntu 18.04 Linux distro, the apt-get installation method worked.)

3) Generate simulator configurations:

    a) `cd` into the ‘run-scripts’ folder

    b) Generate scripts using the genConfigs.py script. I generated the scripts Kangaroo, SA, and LS using commands provided in the README.

4) Running the simulation: Run the n simulations generated, where n is the number of configurations you want to run at one time. For example, if we take n = 3, then we run `./runLocal.py configs --jobs 3`.

**On-flash experiment** (Note that the instructions for running the on-flash experiments are in the simulator repository [README](https://github.com/saramcallister/Kangaroo#kangaroo-flash-experiments))**:**

1) Clone the CacheLib-1 repository. 

2) Checkout branch #artifact-eval-kangaroo-upstream to run Kangaroo and SA.

3) Run the provided build script.

4) Choose a configuration to run the experiment on. There are sample configurations available for use. Various parameters can also be tuned to create custom configurations.

5) Run the experiment for each configuration.

6) Execute commands 3-5 for branch artifact-eval-log-only-upstream to run LS.
<!-- *Describe what the evaluators did in a step-by-step manner to build, install, run, etc. Ideally, assuming the reviews contain enough detail, a later reader should be able to try to re-trace the evaluators' steps. Specific command lines, if they can be found in the authors' instructions, reviews, or comments, are encouraged. If multiple environments were used, and these require different steps, you may need to make notes about the differences.* -->

## How The Artifact Supports The Paper
Here we enumerate the awards given to this artifact and why the artifact received the award:

1) **Available:** The Kangaroo artifact makes use of two codebases (Kangaroo and the modified CacheLib), which are easily accessible on Github. 

2) **Functional:** We were able to successfully build, run, and observe results from both the simulator and the on-flash device code. More specific results for each code repository are as follows:

    a) Simulator: We ran the simulator on some sample configurations in the Kangaroo repository. The simulator implementation allows for changing the four parameters (device write budget, DRAM budget, flash capacity, and average object size). It also measures miss ratio and estimates write amplification as described in the paper. 

    b) On-Flash Implementation: For Kangaroo, the artifact allows the user to tune various parameters like the number of KLog partitions, the Kangaroo's threshold, and KLog size (KLog percent of flash). The artifact includes scripts to evaluate these three settings. These are consistent with the paper discussion. We also noted the artifact  incorporates RRIParoo as described in the paper.

The paper also describes about the on-flash experiments of Kangaroo, and compare Kangaroo with 1) CacheLib's small object cache which is a set-associative (SA) design and 2) an optimistic version of a log-structured cache (LS). 

In the CacheLib repository, the output of the experiments contained detailed statistics as described in the paper, for example, miss / hit ratios, request read / write latency, and throughput for different operations.

<!-- *This is the summary of why we chose to award the badges we did: If we called it Functional, what, specifically did we run? If we called it Reproduced, what specifically, did we reproduce (eg. what experiments and/or figures)? Why did we consdier this sufficient to award the badge (eg. if we did not reproduce all figures, why were the ones we did run enough)? Badges that we did not award do not need to be discussed. Stick to the facts rather than opinions as much as possible.* -->

## Additional Notes and Resources
Note that the exact steps for installing and building the simulations in the Kangaroo README did not strictly work for us, so refer to the set of instructions we provide in the section **Step-By-Step Instructions to Excercise the Artifact** as a supplement to the instructions in the README.

<!-- *If there are any other notes of interest that came up in the reviews or discussions that you think would be interesting to a future user of the artifact, you can include them here. This is also a good place to include links to other things that might be relevant to using this artifact.* -->

