---
title: "OS Scheduling with Nest: Keeping Tasks Close Together on Warm Cores"
---

{% include_relative _result-header.html %}

## Artifact contents

This is the artifact of the EuroSys'22 paper "OS Scheduling with Nest: Keeping Threads Close Together on Warm Cores". The artifact includes the patch of the Nest scheduler to the Linux kernel 5.9. The build instructions, scripts, and documentation for experiments in the paper are also provided.


## Environment(s) used for testing
The evaluators used Grid 5000 (https://www.grid5000.fr/w/Grid5000:Home) with Open Access account. Grid 5000 is the same environment used in the paper and offers machines with Intel 5218 and 6130 CPUs. However, E7-8770v4, one of the machines used in the paper, was not available, and therefore the evaluators did not evaluate the artifact on it.

## How the artifact supports the paper

The artifacts' experiments showed that concentrating threads in a smaller number of (warm) cores in multicores results in better performance and lower power consumption than spreading them across all cores.

The evaluators reproduced the main results of Figures 3-9 in the paper. The configure benchmarks showed the 8-24% performance improvements (except nodejs) with high-frequency distribution, reducing energy consumption. As of the dacapo benchmarks, the Nest scheduler had a comparable performance for a single thread application compared to the CFS and better performance for multi-threaded applications. NAS benchmarks showed that on the 2-socket machines, Nest and CFS were comparable, and on the 4-socket machine, Nest showed performance improvements in several cases. The Phoronix benchmark showed mixed results: some were improved, some were compatible, and others were degraded.

The evaluators did not reproduce the results on E7-8770v4 and Table 4 because of no resources available.

## Additional notes

- Due to its large size, the kernel image for the experiment and the configuration files for the Phoronix benchmarks are not included in the artifact's repository. Those were made available in a Grid5000's user directory (/home/hpandya).
- The experiment scripts are not entirely automated (e.g., some scripts have hard-coded node names). However, this is intentional to reproduce results in the paper because even machines with the same hardware may behave differently on Grid5000 for various reasons.