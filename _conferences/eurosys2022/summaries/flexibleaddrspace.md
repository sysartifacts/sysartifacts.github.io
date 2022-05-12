---
title: "Building an Efficient Key-Value Store in a Flexible Address Space"
---

{% include_relative _result-header.html %}

## Artifact contents

This artifact implements

- FlexTree, a B+ tree variant for supporting efficient mapping data insertion (and removal) in O(logN) time.
- FlexSpace, a file interface library supporting efficient read/write, pread/pwrite, and insert_range/collaspse_range.
- FlexDB, a light-weight KV store, with an anchor-based index, and all KV pairs stored in the FlexSpace.

## Environment(s) used for testing

For hardware, the evaluators used the authors’ server to reproduce the experiments.  The detailed configuration is (Intel 10-core Xeon Silver 4210 CPU, 64 GB RAM and Intel Optane 905P SSD with 960 GB capacity).

For software, this artifact requires a Linux kernel with io_uring support (5.1+). The user space dependencies are liburing, jemalloc and clang.

## How the artifact supports the paper

The artifact supports three major claims.

- C1: (Tbl 1) FlexTree achieves significantly lower asymptotic time complexity on shift operations compared to B+ Tree, and it introduces negligible extra cost on regular index operations.
- C2: (Tbl 2, Fig 10) FlexSpace achieves significantly faster insertrange/collapse-range speed compared to address spaces provided by file systems.
- C3: (Fig 9, 12, Tbl 4) FlexDB can achieve high performance and low write amplification ratio under various workloads and benchmarks.

All reviewers could run the aforementioned experiments with the author-provided scripts and most of the reproduced results are consistent with that in the paper,  except for the followings.

- Table 1, btree/sorted array insert
- Table 2, W. A. ratio