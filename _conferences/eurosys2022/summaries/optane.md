---
title: "Characterizing the Performance of Intel Optane Persistent Memory -- A Close Look at its On-DIMM Buffering"
---

{% include_relative _result-header.html %}

## Artifact contents

This is the artifact of the EuroSys'22 paper "Characterizing the Performance of Intel Optane Persistent Memory -- A Close Look at its On-DIMM Buffering".
The artifact includes a collection of benchmarks and case studies, accompanied by
build instructions, scripts, and documentation for experiments in the paper.

## Environment(s) used for testing

The evaluators used the author’s machines, equipped with 1st and 2nd generation Intel Optane DCPMM.
Some evaluators also corroborated the results using their own machines equipped with the 1st gen Optane.

## How the artifact supports the paper

The artifact’s experiments support multiple claims about two generations of Intel Optane DCPMM:
Reads have a separate buffer that supports prefetching.
The 1st gen has a write buffer that flushes back fully modified XPLines periodically and retains partially modified XPLines until evicted.
The 2nd gen has a different write buffer size and eviction algorithm.
The 1st gen has high latency on accesses on recently persisted addresses, the 2nd gen fixes this issue.
With smaller WSS than the write buffer size, relaxed model write operations have lower latency than the strict persistency model, but their performance converges and plateaus as WSS grows. If the WSS overwhelms LLC, the latency of load instructions overshadows the store instructions
With helper threads, CCEH achieves lower latency and higher throughput for insert operations
By employing a redo log, FAST&FAIR achieves lower latency and higher throughput on the 1st gen due to performing out-of-place writes

To support these claims the authors provided instructions to run 8 experiments, reproducing figures 2-5, 7, 8 and 12. The results reproduced by the evaluators match the claims made by the authors.

