---
title: "Artifact Review Summary: Oobleck: Resilient Distributed Training of Large Models Using Pipeline Templates"
---

{% include_relative _result-header.html %}

## Description of the Artifact

Oobleck is a system designed for resilient distributed hybrid-parallel training of expansive DNN models. It guarantees fault tolerance while optimizing throughput. The artifact encompasses the source code for Oobleck, scripts for environment setup, and comprehensive instructions. The evaluation process is divided into two distinct phases: (1) Functional Correctness Evaluation phase: include unit tests like pipeline template generation, pipeline instantiation, and dynamic reconfiguration; (2) Paper Figure Correctness Evaluation phase: reproduce the paper's results using the Bamboo simulator.


## Environment(s) Used for Testing

* Chameleon Cloud (Ubuntu) provided by the authors
* Servers with 4 NVIDIA DGX V100 and Ubuntu 20.04

## Step-By-Step Instructions to Exercise the Artifact

- Follow the README located here: https://github.com/SymbioticLab/oobleck/blob/sosp23-artifact/README.md
- Install matplotlib and colorama packages using pip install matplotlib colorama before generating the plots as mentioned here: https://github.com/SymbioticLab/Oobleck/tree/sosp23-artifact/tools/simulator

## How The Artifact Supports The Paper

### Artifact Available 
The artifact can be accessed through a public repository, accompanied by detailed documentation and instructions for executing the experiments and reproducing the result.

### Artifact Functional 
All commands and scripts were successfully executed on my end. Although the actual training wasn't performed within the artifacts, pivotal steps like pipeline template generation, pipeline instantiation, and dynamic reconfiguration were accomplished without issue. 

### Artifact Reproduced 
By executing the bash script in the simulator, the outputs (Figure 1, 9, 10, 12, 13, 14, and 15) were produced and they consistently align with the results showcased in the paper. 


## Additional Notes and Resources

The evaluated artifact primarily covers specific key steps mentioned in the paper, falling short of offering comprehensive end-to-end training and execution. Subsequent researchers may benefit significantly from insights gleaned from end-to-end executions.
