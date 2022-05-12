---
title: "Isolating at the Hardware Limit with Virtines"
---

{% include_relative _result-header.html %}

## Artifact contents

This artifact contains the source code for WASP, an embedded micro-hypervisor
for supporting Virtines - an abstraction for isolating code at function level
granularity for serverless settings. Extensive documentation is provided for
WASP, including examples of how to use the Virtines API. Reproducibility is a
core feature of this artifact, with a series of build scripts and example
applications provided. A single Makefile that enables simple centralized
automation of the whole artifact evaluation is included.

## Environment(s) used for testing

The AEC evaluators mainly used the Chameleon and CloudLad infrastructures for
the purposes of this evaluation. The paper authors provided profiles in the
artifact for configuring our academic cloud instances. Evaluation was also made
possible using a local machine providing that supported x86 virtualisation
extensions.

### System setups used

* Chameleon Cloud CHI@UC skylake instance with CC-Ubuntu20.04.

* Dell XPS desktop running Ubuntu20.04, with 11th Gen Intel Core i5-11400 and 16GB
RAM.

* CloudLab setup with the profile provided by the authors (c6525-25g, 16-core
AMD 7302P @ 3.00GHz, 128GB RAM). Cloudlab instance (AMD EPYC 7302P, Ubuntu
20.04).

## How the artifact supports the paper

The artifact includes a Makefile that runs all the experiments and generates
graphs exactly as they appear in their paper for easier comparison. The authors
list claims C1 - C8 in their appendix, with the TPC members also identifying the
following additional claim:

“The effort to incorporate virtines into OpenSSL and Javascript is minimal”.

The evaluators were able to validate most of the claims reported in the paper.
More precisely, they found that the trends (e.g. speed-up or slow-down) remained
consistent with the ones reported in the paper. However, the exact magnitude of
each trend would differ depending on the hardware platform used, e.g. Figure 13
(b) showed around a 60% slowdown on an AMD EPYC 7302P CPU compared to the 12%
reported in the paper. However, the authors provided their own data with WASP
running on the same academic clouds used by the AEC, and when comparing against
these then all the claims are strongly supported.

## Additional notes

Overall, the evaluators felt that this is an excellent artifact presenting a
range of best practices for the systems community. The use of a single Makefile
for automating the processes made the evaluation more focused on the results,
rather than on trying to get the artifact to work. Data dumps from the authors
running their system on the academic clouds made it easier to make a judgment
call when the results obtained were significantly different to the results of
the paper. The authors not only document how to reproduce the paper's results,
but also how to use their artifact for further research or experimentation. The
artifact includes clear, basic and easily accessible examples for that purpose.

