---
title: "SafePM: A Sanitizer for Persistent Memory"
---

{% include_relative _result-header.html %}

## Artifact contents

The artifact contains the source code of SafePM, a document, and scripts to reproduce the experiments in the paper.

## Environment(s) used for testing

The evaluators used a remote machine that the authors provided as the artifact requires a machine with a persistent memory module to obtain accurate performance results. The artifact also provides a simulated mode that runs without persistent memory (for the functional tests with inaccurate results). The evaluators were able to run all experiments in the simulated environment as well.

## How the artifact supports the paper

The evaluators were able to reproduce all experiments in the artifact by following the instructions provided by the authors. The scripts in the `artiafct_evaluation` directory reproduce the experiments and generate the figures and tables. The artifact supports the claims described in Appendix A that SafePM (C1) incurs reasonable overhead by reproducing Figures 3-6, (C2) offers the same memory safety guarantees as ASan by reproducing Table 4, (C3) preserves the crash consistency by running `memcheck` and `pmemcheck` (E4), and (C4) can uncover bugs in PMDK by reproducing PMDK bugs (E5).

## Additional notes

The artifact misses the experiment for the space overhead (Table 3), but the evaluators think that it is not crucial as all the other results are sufficient to support the claims.