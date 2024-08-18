---
title: "Artifact Review Summary: Paella: Low-latency Model Serving with Software-defined GPU Scheduling"
---

{% include_relative _result-header.html %}

## Description of the Artifact

- Location: [github.com/eniac/paella/tree/sosp23_artifact](https://github.com/eniac/paella/tree/sosp23_artifact)
- Branch: `sosp23_artifact`
- Git Hash: `e4afcee`
- README: [github.com/eniac/paella/blob/master/sosp23_artifact/README.md](https://github.com/eniac/paella/blob/master/sosp23_artifact/README.md)

The artifact comprises Paella's source code, documentation, and scripts for setting up the environment, conducting experiments, and generating corresponding graphs. The experiments explore three scenarios: serving a mix of 8 models, serving 2 extreme models, and evaluating fairness between 2 extreme models. The first two scenarios produce performance graphs illustrating latency and throughput during inference, while the third one demonstrates Paella's tunable capability regarding fairness.

## Environment Used for Testing

Virtual machine specifications:

- OS: Ubuntu 22.04.2 LTS (Linux kernel 5.15)
- CPU: 2x Intel(R) Xeon(R) Silver 4114 CPU @ 2.20GHz
- Memory: 196 GB
- GPU: NVIDIA Tesla P100 PCIe 12GB (CUDA 12.2)

The authors provided a pre-configured virtual machine on [CloudLab](https://cloudlab.us) with the specified specifications. The environment setup details are available in the [instructions](https://github.com/eniac/paella/blob/master/sosp23_artifact/setup/README.md) for future users to replicate independently.

## Step-By-Step Instructions to Exercise the Artifact

The evaluation process involves two steps:

1. Follow the setup instructions in a clean environment using the provided [guide](https://github.com/eniac/paella/blob/master/sosp23_artifact/setup/README.md).
2. Use the provided machine to reproduce figures 11, 12 and 13 following the step-by-step [instructions](https://github.com/eniac/paella/blob/master/sosp23_artifact/README.md#serving-a-mix-of-8-models-fig-11).

For the first part, it is crucial to note that future users must *"Either source ~/.bash_profile or logout and then log back in to ensure that the environment variables are set"* after each step of the setup:

```sh
./install_dependencies.sh
source ~/.bash_profile
./build_triton_docker.sh
source ~/.bash_profile
...
```

For the second part, we could not test [serving 2 extreme models using MPS](https://github.com/eniac/paella/blob/master/sosp23_artifact/README.md#mps) due to lack of fully supported [MPS](https://docs.nvidia.com/deploy/mps/index.html) hardware. Figures 14 and 15 scripts were not provided by the authors, so we could not replicate these.

## How The Artifact Supports The Paper

The artifact substantiates the paper's main claims by offering Paella's source code and experiment scripts, generating the paper's figures. The main paper claims are:

- Paella maintains a lower latency baseline and sustains higher throughput before saturation.
- Paella allows the use of different scheduling policies on top of the GPU's built-in scheduler.

We award the Functional badge as the artifact includes adequate documentation and setup instructions for independent Paella use and experiment replication. The Reproducible badge is granted because we successfully reproduced the main paper figures (11, 12, 13). While our GPU model differed from the authors', the observed trends align with the paper's results. The absence of figures 14 and 15 does not impact the core claims, so their absence did not affect our evaluation.

Overall, the source code's quality and the comprehensiveness of the experiments fully support the paper's main claims, even on hardware distinct from the paper's setup.

## Additional Notes and Resources

- [Project Dependencies](https://github.com/eniac/paella/tree/sosp23_artifact#dependencies)
