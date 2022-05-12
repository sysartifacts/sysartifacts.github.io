---
title: "VMSH: Hypervisor-agnostic Guest Overlays for VMs"
---

{% include_relative _result-header.html %}

## Artifact contents

The artifact contains the implementation of VMSH, a hypervisor-agnostic abstraction for KVM that allows developers to provide minimal, lightweight images. The artifact also contains scripts to reproduce the experiments and figures from the EuroSys paper "VMSH: Hypervisor-agnostic Guest Overlays for VMs".

## Environment(s) used for testing

The evaluators used the hardware provided by the authors to test the artifact on the exact same environment that was used for the paper’s experiments. The CPU config of that machine is shown below:

```
Architecture:        	x86_64
    CPU op-mode(s):    	32-bit, 64-bit
    Address sizes:     	39 bits physical, 48 bits virtual
    Byte Order:        	Little Endian
CPU(s):              	16
    On-line CPU(s) list:   0-15
Vendor ID:           	GenuineIntel
    Model name:        	Intel(R) Core(TM) i9-9900K CPU @ 3.60GHz
    CPU family:      	6
    Model:           	158
    Thread(s) per core:  2
    Core(s) per socket:  8
    Socket(s):       	1
    Stepping:        	12
    CPU max MHz:     	5000.0000
    CPU min MHz:     	800.0000
    BogoMIPS:        	7200.00
```

## How the artifact supports the paper

The evaluators could perform all the experiments of this artifact following the instructions provided by the authors. The artifact supports all the claims (refer to A.4.1 Major Claims of that artifact appendix) regarding generality (C1), performance (C2), and functionality (C3). In fact, for a few experiments, some of the evaluators observed small variations compared to the paper’s results. But for the large majority of the experiments, the evaluators were able to reproduce the exact, or very similar, results to the ones reported in the paper.
