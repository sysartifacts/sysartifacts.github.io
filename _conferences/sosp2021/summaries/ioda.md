---
title: "Artifact Review Summary: IODA: A Host/Device Co-Design for Strong Predictability Contract on Modern Flash Storage"
---

{% include_relative _result-header.html %}

## Description of the Artifact

The main artifact provided was a Github link <https://github.com/huaicheng/IODA-SOSP21-AE>.
It provides a detailed description of the repository, a paper summary, and a step by step installation process to deploy the necessary IODA components.
More specifically, it provides three main assets:

  - a VM image containing pre-installed tools to run IODA benchmarks,
  - a IODA patched Linux Kernel (based on v4.15), and
  - a IODA ssd controller (iodaFEMU).

Additionally, it provides scripts to automatically run some benchmarks presented in the corresponding research paper and scripts to help plot graphs of Figures 5 and 6 of the paper.

Lastly, the artifact provides a 23mins recording that shows the step by step process and usage of IODA: <https://asciinema.org/a/431726>.


## Environment(s) Used for Testing

Three evaluators relied on a CloudLab Emulab D430 instance to conduct their evaluation. The server runs on top of an *Intel(R) Xeon(R) CPU E5-2630 v3 CPU  2.40GHz with 32 cores* with *62 GB* memory and *200GB INTEL SSDSC2BX20* SSD. One evaluator used a similar testbed but with *128GB memory*.

As advised by the authors, the server OS was *Ubuntu 20.04 LTS* with *kernel Linux 5.4.0-77-generic*. We all installed *GCC 9.3.0*.


## Step-By-Step Instructions to Exercise the Artifact

The steps to run the artifact was similar to all evaluators.

Concretely, we followed step by step the instructions to

    (1) download the IODA VM image,
    (2) build IODA, and
    (3) run the `run_bat_all` script.

## How The Artifact Supports The Paper

The evaluators awarded the three badges **Available, Functional, and Reproduced**.

The **Available** badge was awarded due to the availability of IODA components on an open platform, Github.

The **Functional** badge was awarded since all evaluators could correctly build the IODA components (after fixing the ̀`r.sh` issue).

**Reproduced** badge was awarded since all the evaluators correctly reproduced the results of Figures 5 and 6 of the research paper with no significant difference with the paper's claim (regarding the improvement of the tail latency).


## Additional Notes and Resources

The evaluators liked the video recording that shows each step of the build and usage process, and it helped to ensure they were on the right track for each significant command. 
