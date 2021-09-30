---
layout: single
title: "Artifact Review Summary: Boki: Stateful Serverless Computing with Shared Logs"
sidebar:
    title: 'SOSP 2021'
    nav: sosp2021toc
---

## Description of the Artifact

The artifact is located in <https://github.com/ut-osa/boki-benchmarks>. The correct version of the artifact is in the `main` branch. According to the authors, this repository includes source code of evaluation workloads of Boki, and scripts for running experiments. It includes all materials for the artifact evaluation of the SOSP '21 paper `Boki: Stateful Serverless Computing with Shared Logs`.

According to the reviewers, the artifact includes three major modules:

- the core algorithm of Boki (source code in `~/boki`)
- the evaluation suites (evaluation programs in `~/workloads`, configuration files and execution scripts in `~/experiments`)
- supporting materials (pre-compiled docker files in `~/dockerfiles`, auxiliary utility functions in `~/scripts`, and a document `~/README.md`)

The entry point for the evaluation is at `~/experiments/run_quick.sh`. Logically, this script executes all `run_once.sh` scripts in each of the experimental directory with a set of configurations.

According to all reviewers, the artifact is well organized in structure and is easy to evaluate. Reviewers can run experiments successfully under documental guidance.

## Environment(s) Used for Testing

Two environments were used successfully for the evaluation: the author-provided environment and the user-built environment.

Some reviewers used the public EC2 instance at region `us-east-2` well prepared by the authors to run experiments. This instance was a `t3.micro` instance with 2 vCPU cores, 1GiB RAM, 12GB EBS disk. As for the software, it was based on `Ubuntu 20.04` with all the necessary dependencies such as `Python 3.8.10` installed.

Others created the EC2 instance on their own. The EC2 instance was based on the AMI artifact presented by the author. That instance was configured to a `t2.micro` type with 1GB RAM, 1 vCPU core, and 16GB disk space. The controller machine run on `Ubuntu 20.04.2 LTS` with `Python 3.8` installed.

Any of the pre-mentioned instances serves as a **controller machine** in the cluster that hosts all the serverless experiments. `config.json` in each experiment folder determines what kind of cluster should be created for the evaluation. 

## Step-By-Step Instructions to Excercise the Artifact
1. Setting up the controller machine.

- For an author-provided environment, the authors granted reviewers access to the instance by acknowledging public keys. The instance had pre-installed all required packages. Therefore, no extra operations are required for evaluation.

- For a user-built environment, to build up an environment suitable to run experiments, the reviewer took these additional steps:
  - Redirect python from `Python 2.7` to `Python 3.8` with commands `sudo rm /usr/bin/python` and `sudo ln -s /usr/bin/python3 /usr/bin/python`.
  - Install packages `unzip` and `python3.8-venv` to unzip and install aws CLI version 1.
  - Configure your aws CLI within the instance to allow connections to itself.
  - Clone the repository with all git submodules with `git clone --recursive https://github.com/ut-osa/boki-benchmarks.git`
  - Execute `scripts/setup_sshkey.sh` to setup SSH keys that will be used to access experiment VMs.

2. Setting up EC2 security group and placement group.

- The controller machine creates EC2 instances with security group `boki` and placement group `boki-experiments`. The security group includes firewall rules for experiment VMs (including allowing the controller machine to SSH into them), while the placement group instructs AWS to place experiment VMs close together.

- Reviewer had to execute `scripts/aws_provision.sh` on the controller machine to create these groups with correct configurations.

3. Building Docker images (optional).

- Use the script `scripts/docker_images.sh` for building Docker images relevant to experiments in this artifact. As the authors have already pushed all compiled images to DockerHub, there is no need to run this script as long as you do not modify source code of `Boki` (in `~/boki` directory) and evaluation workloads (in `~/workloads`).

4. Run the experiments.

- As an initial attempt, run `~/experiments/run_quick.sh`. The script should ran for at least an hour and terminated without any problem. After its competence, run `~/boki-benchmarks/scripts/summarize_results.py` for obtaining a printed summary on the recorded metrics.

- Compare the obtained summary with an expected one which is located at `~/boki-benchmarks/tmp/expected_summary.txt`. Also, compare the results with the major claims made in the paper for precise evaluation results.

## How The Artifact Supports The Paper
Above all, the artifact well supports the major performance claims made in Sections 7.2-7.4.

In Section 7.2 `BokiFlow`, the authors made the following arguments:
- In both workloads, `BokiFlow` achieves much lower latencies than `Beldi` for all throughput values.
- In the `movie` workload, when running at 200 requests per second (RPS), BokiFlow’s median latency is 26ms, 4.7× lower than `Beldi` (121ms).
- In the `travel` workload, BokiFlow’s median latency is 18ms at 500 RPS, 4.3× lower than `Beldi` (78ms).

In Section 7.3 `BokiStore`, the authors made the following arguments:
- `BokiStore` achieves 1.18–1.25× higher throughput than `MongoDB`.
- `BokiStore` has considerable advantages over MongoDB in transactions (up to 2.3× faster).
- `BokiStore` is slower than MongoDB for non-transactional reads.

In Section 7.4 `BokiQueue`, the authors made the following arguments:
- When the P:C ratio is 1:4, both `BokiQueue` and `Pulsar` achieve double the throughput of `Amazon SQS`. `BokiQueue` achieves up to 2.0× lower latencies than `Pulsar`.
- When the P:C ratio is 4:1, `Amazon SQS` suffers significant queueing delays, limiting its throughput. `BokiQueue` and `Pulsar` have very similar throughput, while `BokiQueue` achieves 1.18× lower latency than `Pulsar` in the case of 256 producers.
- When the P:C ratio is 1:1, `BokiQueue` consistently achieves higher throughput and lower latency than both `Amazon SQS` and `Pulsar`.

All in all, there are **nine** major claims in this part of the paper. These claims proved to be affirmable and correct according to the evaluations by all reviewers. There are no significant conflicts between the authors' arguments and the experimental outcomes.

In conclusion, the `Artifact Available` badge is **approved** because all reviewers have access to the source codes of the artifact. The `Artifact Functional` badge is **approved** because all reviewers can re-execute all the experiments the author mentioned in the paper. The `Results Replicated` badge is **approved** because all reviewers have obtained evaluation results that have met the expectations argued by the authors.
