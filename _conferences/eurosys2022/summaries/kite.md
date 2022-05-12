---
title: "Kite: Lightweight Critical Service Domains full strip note"
---

{% include_relative _result-header.html %}

## Artifact contents

The artifact includes Kite source code, configuration files to build virtual machines, and scripts to launch benchmarks, along with documents.
The documents contain detailed instructions to reproduce the paper’s experiments.

## Environment(s) used for testing

The evaluators used the AnyDesk remote desktop provided by the authors to access its pre-installed Xen domain0.
The authors' environment has the same configuration described in the paper.

## How the artifact supports the paper

The evaluators ran the three experiments described in the appendix.
All evaluators obtained roughly the same results as those reported in the paper.
These results meet Claims C1-C3 defined in the appendix.
Although Claim C4 is not evaluated, it sounds reasonable because the image size of Kite's network/storage domain is reduced.

## Additional notes

Evaluators experienced some unexpected crashes/hangs during the artifact evaluation.
The authors have recognized the issues, and they are investigating them.
