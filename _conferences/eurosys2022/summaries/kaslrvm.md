---
title: "KASLR in the age of MicroVMs"
---

{% include_relative _result-header.html %}

## Artifact contents

The artifact consists in a benchmark repository containing the binaries and scripts required to reproduce the experiments and figures presented in the paper, as well as links to forks of Firecracker and Linux with the modifications presented in the paper.

## Environment(s) used for testing

The artifact was evaluated independently by the evaluators on their own hardware, as well as in a CloudLab (academic cloud) machine:
- Intel(R) Xeon(R) CPU E5-2637 v2 @ 3.50GHz, with 8GB DDR3 @ 1866 MT/s and a 112.75 MB/sec HDD running Ubuntu.
- Intel Xeon E-2288G CPU @ 3.70 GHz with 64 GB RAM. Running Linux 4.15.0.
- A CloudLab setup (c6525-25g, 16-core AMD 7302P @ 3.00GHz, 128GB RAM) with Ubuntu 20.04 and Linux 5.4.0-100-generic.

## How the artifact supports the paper

The claims supported by the artifact are described in the artifact appendix (claims C1 to C5).
The evaluators found that they were able to reproduce the results presented in the paper (Fig 3, 5, 6, 9 and 10) with only reasonable differences in performance (arguably attributable to the differences in hardware configurations), and that the results corroborate the claims.

A notable exception is claim C1 (based on Fig 4), that the evaluators were not able to reproduce. Two evaluators reported not being able to run the experiment with provided scripts, while two other evaluators found that uncompressed images had lower performance in both cached and non-cached setups.
The evaluators agreed that C1 is not a major claim and therefore does not impact the conclusions presented in the paper. Quoting the paper itself, claim C1 serves as a potential explanation for the “lack of enthusiasm for supporting  bzImage images in most modern hypervisors”.
