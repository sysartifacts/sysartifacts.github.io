---
title: "OPEC: Operation-based Security Isolation for Bare-metal Embedded Systems"
---

{% include_relative _result-header.html %}

## Artifact contents

The artifact contains the source code of OPEC, a docker image containing a precompiled OPEC and its dependencies, and the scripts required to reproduce the results of the paper.

## Environment(s) used for testing

The evaluators used the docker image on their own machines to repeat the experiments presented in the paper that are not associated with the runtime performance evaluation of OPEC. To evaluate the runtime overhead in an STM32F407 board, the evaluators used a machine provided by the authors.

## How the artifact supports the paper

The evaluators managed to complete all the experiments in the artifact by following the instructions provided by the authors. For the vast majority of the experiments, the evaluators were able to reproduce the exact (or really close) results of the paper using the scripts in the `experiments` directory. The evaluators were able to only test the performance overhead for Camera, CoreMark, and FatFs-SD applications, since they were the only applications supported by the testing environment. The evaluators concluded that the artifact supports all the major claims (refer to A.4.1 Major Claims of the appendix) regarding security (C1), confinement (C2), performance (C3), execution-time over-privilege issue (C4), and icall analysis (C5).

## Additional notes

- As none of the evaluators had an STM32F407 board, reproducing runtime overhead required borrowing the author’s environment.
- All of the evaluators used the docker image as they were not able to build OPEC from source using the author-provided scripts (`init_svf.sh` failed to complete).