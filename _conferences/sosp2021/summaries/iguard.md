---
title: "Artifact Review Summary: iGUARD: In-GPU Advanced Race Detection"
---

{% include_relative _result-header.html %}

## Description of the Artifact

The submitted artifacts include the iGUARD race detection tool source code and
build/run scripts, as well the following benchmarks:

1. An accuracy benchmark which shows that iGUARD detects known races in GPU
programs (Table 4).
2. A study of iGUARD's & Barracuda's baseline performance overhead due to race
detection (Figure 9).
3. A study of iGUARD's performance overhead with and without performance
optimizations (Figure 10).
4. A README to run the experiments and to understand the results.

### Artifact Location
Available at [https://github.com/csl-iisc/iGUARD](https://github.com/csl-iisc/iGUARD)

### Artifact README
Available at [https://github.com/csl-iisc/iGUARD/blob/main/README.md](https://github.com/csl-iisc/iGUARD/blob/main/README.md)

### Software/Hardware requirements
* NVIDIA GPU with Turing architecture (e.g. TitanRTX).
* CUDA 11 on Linux.
* GPU Driver version >= 450.51.05

## Environment(s) Used for Testing

### Environment 1
* GPU: NVIDIA RTX 6000
* OS: Ubuntu 20.04
* Driver: CUDA 11

### Environment 2
* CPU: Intel(R) Xeon(R) Gold 6226 CPU @ 2.70GHz
* GPU: NVIDIA GeForce 2080 Ti
* OS: Ubuntu 20.04.2 LTS
* Driver: CUDA 11.2

### Environment 3
* CPU: Intel(R) Xeon(R) Gold 6126 CPU @ 2.60GHz
* GPU: NVIDIA Quadro RTX (72 SMs, 24 GB GDDR6)
* OS: Ubuntu 20.04.2 LTS
* Driver: CUDA 11.2

### Environment 4
* CPU: Intel(R) Xeon(R) W-2133 CPU @ 3.60GHz
* GPU: NVIDIA GeForce RTX 2080 Ti
* OS: Ubuntu 18.04 LTS
* Driver: CUDA 11.4

## Step-By-Step Instructions to Exercise the Artifact

1. Download software artifact, found [here](https://github.com/csl-iisc/iGUARD)
2. Install required software packages with ```sudo apt-get install -y wget bc gcc time gawk libtbb-dev```
3. Download NVIDIA's GPU binary instrumentation tool, NVBit, and build the iGUARD tool with ```make setup```
4. Generate the results in Table 4 with ```make table_4```
5. Generate the results in Figure 9 with ```make figure_9```
6. Generate the results in Figure 10 with ```make figure_10```

## How The Artifact Supports The Paper

### Artifact Available

The artifact is publicly available on [GitHub](https://github.com/csl-iisc/iGUARD).

### Artifact Functional

The reviewers were able to build and run the iGUARD without issue. The
reviewers were able to figure out how to run the iGUARD tool on arbitrary
applications beyond the included benchmarks by inspecting the included scripts.

### Results Replicated

The artifact supports the claims made in the paper. While the reviewers did not
reproduce the exact numbers reported in the paper, they were able to reproduce
the general trends in the author's performance evaluation for the paper's key
results (namely Table 4, Figure 9, and Figure 10).  The reviewers are confident
that the authors' performance measurements are accurate, and the differences in
their evaluations can be attributed to differences in hardware setups.  iGUARD
consistently shows performance improvements over Barracuda, and appears to
detect races which Barracuda is unable to capture.
