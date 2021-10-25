---
layout: single
title: "Artifact Review Summary: Mycelium: Large-Scale Distributed Graph Queries with Differential Privacy"
sidebar:
    title: 'SOSP 2021'
    nav: sosp2021toc
---

{% include_relative _result-header.html %}

## Description of the Artifact

This artifact contains several microbenchmarks for separated system components, including homomorphic encryption, zero-knowledge proof, onion routing, and committee election. This artifact does not provide an end-to-end implementation of Mycelium, but this is coherent with the evaluation setup in the paper. The artifact provides graph scripts to directly generate the figures in the paper.

## Environment(s) Used for Testing

The evaluators were able to run this artifact in several environments:

* Cloudlab: for onion routing tests, the tests were run on CloudLab m510 machines (8-core 2 GHz Intel Xeon D-1548 processor and 64 GB RAM, Ubuntu 20.04); For other components, I run them on a single VM Ubuntu 20.04.

* CloudLab: `c240g5` nodes

* VMs on local evaluators' own machines: Ubuntu 20.04, and Ubuntu 18.04 with python 3.8

The evaluators noted that at least python 3.8 seems to be required: their attempts to use python 3.7 failed.

## Step-By-Step Instructions to Exercise the Artifact

The artifact's README contains step-by step instructions that evaluators were able to execute successfully.

## How The Artifact Supports The Paper

The tests generate similar results claimed in the paper. The numbers in some figures are generated with equations, and others are real tested numbers.


