---
title: "Artifact Review Summary: Efficient Memory Management for Large Language Model Serving with PagedAttention"
---

{% include_relative _result-header.html %}

## Description of the Artifact

The artifact is available as a GitHub repo ([https://github.com/sosp-ae-39/sosp-ae-astra](https://github.com/sosp-ae-39/sosp-ae-astra)) and consists of the following components:

- Code: The artifact contains the source code of Astra and baselines used in the paper (Orca and FasterTransformer).
- Instructions: The artifact includes a README with detailed instructions to set up the environment, run the experiments, and reproduce the results. It also includes scripts to facilitate experiment running and result visualization.
- Documentation: The artifact has a standalone README for Astra. The latest documentation could also be found here ([https://vllm.readthedocs.io/en/latest/](https://vllm.readthedocs.io/en/latest/)) in the vLLM project.

It is worth noting (and the authors have also mentioned) that `Astra` is the original system used in paper submission. The system has evolved significantly since its artifact and is not part of the `vLLM` project ([https://github.com/vllm-project/vllm](https://github.com/vllm-project/vllm)). We suggest using `Astra` to reproduce the results in the paper, while using `vLLM` to get the latest updates and report issues.

## Environment(s) Used for Testing

Some of the AEC members evaluated this paper’s artifact on a GCP `a2-highgpu-1g` instance. Here are the OS/hardware configurations of the instance:

- GPU: one Nvidia A100-40G
- OS: Debian 12 with Linux kernel 5.10
- CUDA: 11.3
- gcc: 10.2

Others manually set up the evaluation environment on their own machine. To set up the software environment, the authors provide instructions and scripts: [https://github.com/sosp-ae-39/sosp-ae-astra#setting-up-the-environment](https://github.com/sosp-ae-39/sosp-ae-astra#setting-up-the-environment)

## Step-By-Step Instructions to Exercise the Artifact

Reviewers followed the detailed instructions provided in the artifact repo: [https://github.com/sosp-ae-39/sosp-ae-astra#reproducing-main-experiments--figures](https://github.com/sosp-ae-39/sosp-ae-astra#reproducing-main-experiments--figures). There were several tiny misconfigurations in scripts during the artifact evaluation, but the authors have fixed all of them. Therefore, one should be able to reproduce the results following the latest README with no additional steps.

## How The Artifact Supports The Paper

The AEC agrees to award all three badges to this artifact. We describe the reasons for granting each badge below:

### Available

- The artifact is available on GitHub and it contains the source code of Astra as well as baselines (Orca and FasterTransformer).
- The artifact contains a README with instructions to set up the environment, install Astra, and run experiments in the paper. It also comes with a set of scripts to facilitate this process and plot the figures.
- The artifact contains a standalone README for Astra for the purpose of running it as a service.

### Functional

- AEC can successfully run the system with the provided scripts and finish the experiment within a reasonable time.
- The majority of the code is well written and documented. Both structure and style of the codebase help navigate and understand the code.

### Reproduced

- Although the exact numbers may different from run to run, the overall trends hold and AEC agrees that the results are sufficient to support the claims in the paper.

## Additional Notes and Resources

Interested users could find the latest version of PagedAttention implementation in the vLLM project: [https://vllm-project.github.io/](https://vllm-project.github.io/)

One of the baselines, FasterTransformer, is also available on GitHub: [https://github.com/NVIDIA/FasterTransformer/](https://github.com/NVIDIA/FasterTransformer/)