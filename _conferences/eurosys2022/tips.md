---
title: Tips
order: 40
---

The following guides will be useful when preparing your artifact:
- [HOWTO for AEC Submitters](https://docs.google.com/document/d/1pqzPtLVIvwLwJsZwCb2r7yzWMaifudHe1Xvn42T4CcA/edit),  
  by Dan Barowy, Charlie Curtsinger, Emma Tosch, John Vilk, and Emery Berger
- [Artifact Evaluation: Tips for Authors](https://blog.padhye.org/Artifact-Evaluation-Tips-for-Authors/),  
  by Rohan Padhye

You may also find these examples of past artifacts useful:
- [Bundler](https://github.com/bundler-project/evaluation), a middlebox and its multi-machine benchmarks (EuroSys'21)
- [Serval](https://unsat.cs.washington.edu/projects/serval/sosp19-artifact.html), a verification tool with correct and buggy code to test it (SOSP'19)
- [TinyNF](https://github.com/dslab-epfl/tinynf), a network driver with low-level multi-machine benchmarks (OSDI'20)


Here are some general tips to make life easier for both artifact authors and evaluators:

- **Automate as much as possible**, you will save a lot of time in the end from not having to re-run experiments that suffered from human error.
  This is feasible even for artifacts that need multiple nodes or to replicate configuration in multiple places.
  See [this repository](https://github.com/SolalPirelli/docker-artifact-eval) for an example of artifact automation with Docker.

- **Try out your own artifact on a blank environment**, following the steps you documented.
  One lightweight way to do this is to create a Docker container from a base OS image, such as `ubuntu:latest`.
  You can also use a virtual machine or even provision a real machine if you have the infrastructure to do so.

- **Log both successes and failures**, so that users know that something happened.
  Avoid logging unnecessary or confusing information, such as verbose output or failures that are actually expected.
  Log potential issues, such as an optional but recommended library not being present.

- **Measure resource use** using tools such as `mpstat`, `iostat`, `vmstat`, and `ifstat` to measure CPU, I/O, memory, and network use respectively on Linux,
  or `/usr/bin/time -v` to measures the time and memory used by a command also on Linux.
  This lets users know what to expect.
