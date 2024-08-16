---
title: "Artifact Review Summary: GEMINI: Fast Failure Recovery in Distributed Training with In-Memory Checkpoints"
---

{% include_relative _result-header.html %}

## Description of the Artifact

GEMINI is a failure recovery mechanism for the distributed DNN training system. It solves the problems in handling failures efficiently when training large language models in a distributed manner. The artifact consists of the source code of GEMINI built atop DeepSpeed. It includes the design introduced in the paper and examples of different models adopting GEMINI. It also provides a script that automates the artifact evaluation process to generate the necessary results.

## Environment(s) Used for Testing

* AWS instances provided by authors. In particular, the setup is a cluster of 4 AWS p3dn.24xlarge instances, in total having 32 V100 GPUs. OS: Amazon Linux 2 Kernel: 4.14.200-155.322. Nvidia Driver: 450.80.02 CUDA Version: 10.0


## How The Artifact Supports The Paper

### Artifact Available
The artifact is available on [Github](https://github.com/zhuangwang93/SOSP-30_AE) and it has a README file.

### Artifact Functional
The artifact has a README file. It includes a list of supported environments and running instructions. The description of the file structures meets the minimum requirement and could be further improved later. The authors have provided a minimal working example, both three language models and a dedicated script for the artifact evaluation process.
The artifact contains the components the paper has introduced and can function properly.

### Artifact Reproduced
The artifact evaluation example is a scaled-down version of the evaluation in the paper. The claims that can be reproduced in the testbed are reproduced correctly.


## Additional Notes and Resources

It would be better if the authors could put more comments in the code so that it would be easy to locate the implementation of GEMINI.

The artifact was publicly available during the evaluation. However, it is not available for unknown reasons.