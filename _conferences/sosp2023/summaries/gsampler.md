---
title: "Artifact Review Summary: gSampler: General and Efficient GPU-based Graph Sampling for Graph Learning"
---

{% include_relative _result-header.html %}

## Description of the Artifact
The artifact comprises two main code repositories:

- [gSampler](https://github.com/gsampler9/gSampler) containing the source code of gSampler
- [gsampler-artifact-evaluation](https://github.com/gpzlx1/gsampler-artifact-evaluation) containing scripts for reproducing Figures 7, 8 and 10 from the paper.

The `README.md` provides extensive information on how to navigate the code and on how to exercise the artifact: 
- The code directory structure illustrates where to find gSampler's novel implementation details described in the paper
- There are clear instructions and working examples for running end-to-end Graph Neural Network training with gSampler and the considered graph sampling baselines. Instructions are also provided for applying gSampler on new graph datasets.

## Environment(s) Used for Testing

I used the testbed provided by the authors, consisting of a p3.16xlarge instance running Ubuntu 22.04 LTS. The instance was equipped with 8 NVIDIA V100 GPUs, 64 vCPUs, and 480GB memory.

## Step-By-Step Instructions to Exercise the Artifact

The evaluation environments provided by the authors came pre-configured with all the necessary dependencies. Said dependencies include both gSampler and the baselines considered in the paper. Building gSampler from scratch requires a reasonably small set of dependencies (gcc, CMake, CUDA, PyTorch and Deep Graph Library), and I expect it to be compatible with most modern Linux-based systems. The code for the baselines is fetched from official implementations with reference to specific git commits.

The artifact evaluation repository contains scripts for reproducing Figures 7, 8 and 10 from the paper. The code for reproducing the figures is organized in self-contained subfolders, each one with its own `README.md` file. For each figure, I ran a `testbench.sh` script that executed sequentially the experiments for gSampler and the considered baselines. The numerical results are saved in an output `.csv` file, and can be displayed by running a self-explanatory `plot.py` Python script.

## How The Artifact Supports The Paper

### Artifact Functional
The artifact has a README file with very well-written documentation. Specifically, the authors provide:

- A comprehensive description of the code structure organization.
- A list of necessary dependencies.
- Installation instructions for all the necessary dependencies.
- Configuration instructions for loading generic graph datasets.
- Usage instructions for applying gSampler for end-to-end GNN training.
- Instructions for a minimal working example for the smallest graph dataset considered in the paper.
- The artifact has documentation explaining the high-level project organization, a test suite, and code comments. The experiments for reproducing the main results of the paper are well-documented and easily understandable.
- All the different components described by the paper are outlined in the code repository diagram and easily findable.

The artifact is of high-quality and easily exercisable for a variety of use-cases beyond the ones considered in the paper.

### Results Reproduced
The artifact's README file also documents:
- The exact environment the authors used, i.e., a p3.x16large instance equipped with an NVIDIA V100 GPUs, 64 vCPUs, and 480GB memory.
- The exact commands to run to reproduce each claim from the paper, which are sequentially executed by the `testbench.sh` scripts.
- The artifact’s external dependencies (e.g., PyTorch Geometric, Deep Graph Library, Gunrock, Skywalker...) are fetched either from official PyPI distributions or GitHub repositories.

The produced results were in complete agreement with the paper's main claims. 
