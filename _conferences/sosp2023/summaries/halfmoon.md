---
title: "Artifact Review Summary: Halfmoon: Log-Optimal Fault-Tolerant Stateful Serverless Computing"
---

{% include_relative _result-header.html %}

## Description of the Artifact

The artifact is located on GitHub, at [https://github.com/pkusys/Halfmoon-bench](https://github.com/pkusys/Halfmoon-bench) and its README file at [https://github.com/pkusys/Halfmoon-bench/blob/main/README.md](https://github.com/pkusys/Halfmoon-bench/blob/main/README.md).
This artifact includes the source code of the Halfmoon client based on SOSP '21 paper https://github.com/ut-osa/boki and all the following scripts and tools:
* Dockerfiles for building the Docker images
* Scripts for running individual experiments
* Helper scripts for setting up AWS EC2 environment, building Docker images, and summarizing experiment results.
* A submodule with a Halfmoon's logging layer implementation

## Environment(s) Used for Testing

For evaluation of this artifact the AWS EC2 controller that the authors provided was used by all evaluators


## Step-By-Step Instructions to Exercise the Artifact

The evaluators used the following steps to exercise the artifact:
* Used ssh to login to the instance provided
* Ran run_quick.sh for each experiment in the experiments directory OR ran run.sh in the experiments directory to run all experiments
* Used scp to transfer all generated data locally


## How The Artifact Supports The Paper

All evaluators agreed that the authors did a great work in providing a comprehensive and easy to use artifact.
The reproduction of the paper's claims was achieved with a good accuracy for most of the evaluators but there were cases where the reproduction was not successful or there were number mismatches.

The artifact is awarded with the following badges:
* Artifact Available
* Artifact Functional
* Results Reproduced


## Additional Notes and Resources

The following suggestions/comments were presented by the evaluators:
* The README file should note that the $RUN parameter must be numerical
* The artifact could have some diagrams illustrating what types of services were involved in each workload, and what AWS infrastructure was being used to implement the associated services.
* The scripts should have some verbose output
* The authors should consider providing clearer instructions and simplifying the process for "Setting up EC2 security group and placement group."
* Address and provide clearer instructions regarding the errors: "Max spot instances exceeded" and "Ignoring unsupported options: restart".
