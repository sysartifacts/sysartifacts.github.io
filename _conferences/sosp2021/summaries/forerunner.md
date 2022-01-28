---
title: "Artifact Review Summary: Forerunner: Constraint-based Speculative Transaction Execution for Ethereum"
---

{% include_relative _result-header.html %}

## Description of the Artifact

The artifact includes Forerunner source code (forked from go-ethereum), scripts, and Ethereum data. The source code is available at <https://github.com/microsoft/Forerunner>. The execution script is available at <https://github.com/microsoft/Forerunner/tree/master/evaluation/executionScripts>, and the evaluation script is available at <https://github.com/microsoft/Forerunner/tree/master/evaluation/perfScripts>. The authors also provide Ethereum workload data from 03/12/2021 to 03/22/2021, which can be downloaded from <https://github.com/microsoft/Forerunner/blob/master/evaluation/Introduction%20of%20Evaluation.md>. 

## Environments Used for Testing

The authors provide the reviewers with private-key access to pre-configured VMs. Each VM runs on Intel Xeon E5-2673 with 64 vCPUs, and 256 GB memory. The VM runs Ubuntu 18.04.5 and kernel version 5.4.0-1056-azure.

A reviewer also set up evaluation on a CloudLab `c220g5` machine:

- CPU: Two Intel Xeon Silver 4114 10-core CPUs at 2.20 GHz
- RAM: 192GB ECC DDR4-2666 Memory
- Disk: One 1 TB 7200 RPM 6G SAS HDs
- Disk: One Intel DC S3500 480 GB 6G SATA SSD
- NIC: Dual-port Intel X520-DA2 10Gb NIC (PCIe v3.0, 8 lanes)
- NIC: Onboard Intel i350 1Gb

## Step-By-Step Instructions to Exercise the Artifact

#### On pre-configured VMs

The reviewers followed the instructions provided by the authors to evaluate Forerunner on the VM. The reviewers took the following steps to perform the evaluation:

1. Successfully logged into the VM provided using the private key.
2. Ran the baseline using the execution script `runEmulateBaseline.sh` provided by the authors.
3. Stopped the baseline and collected the logs after a fixed amount of time (2 to 10 hours).
4. Copied `PerfTxLog.baseline.txt` into `perfScripts/` directory.
5. Ran forerunner using `runEmulateForerunner.sh` for the same duration and collected the logs .
6. Copied `PerfTxLog.reuse.txt` into `perfScripts/` directory.
7. Ran the provided `join_perf.py` script using the baseline and the forerunner logs to generate the output `TxSpeedupResult.txt`.

The length of experiments conducted by the reviewers varies from 2 to 10 hours.

#### On CloudLab instance:

Steps that deviate from the authors' instructions are in ***emphasis***.

1. I started with a clean installation of Ubuntu 18.04.6 LTS. The paper states that the evaluation machines run Ubuntu 16.04.6 LTS, but because CloudLab has dropped support for Ubuntu 16.04, I upgraded one LTS release.
2. I cloned the artifact from the [public Github repository](https://github.com/microsoft/Forerunner/) to my home directory: `git clone https://github.com/microsoft/Forerunner/ forerunner`.
3. I followed the instructions for building the artifact from the README in the base directory of the repository.
   1. I installed Go version 1.17.1.
      1. I downloaded Go: `wget https://golang.org/dl/go1.17.1.linux-amd64.tar.gz`
      2. I extracted the files to an installation directory: `sudo tar -C /usr/local -xzf go1.17.1.linux-amd64.tar.gz`
      3. I added Go to the system path for all users: `echo 'export PATH=$PATH:/usr/local/go/bin/' | sudo tee -a /etc/profile.d/golang.sh`
   2. I installed the `build-essential` package: `sudo apt update && sudo apt install build-essential`. Note that this package is installed by default on Ubuntu 18.04.
   3. I built the artifact: `make geth`
4. I ***downloaded*** the data and scripts for the evaluation from one of the VMs provided by the authors. Note that the authors have later published the data and scripts at https://github.com/microsoft/Forerunner/blob/master/evaluation/Introduction%20of%20Evaluation.md.
5. I ***modified the scripts to use the correct paths***.
   1. I modified the scripts (`runEmulateBaseline.sh`, `runEmulateForerunner.sh`, `emulate-3-12.sh`, `emulate.sh`) to use the correct paths to the sub-scripts.
   2. I modified the script `emulate.sh` to use the correct paths to the Ethereum chain data, Ethereum ancient data, and recorded traffic for emulation.
6. I attempted to verify that the artifact is functional by running the script`runEmulateForerunner.sh` and connecting the output to the code.
7. I attempted to reproduce the results by following the instructions in the submitted instructions.
   1. I ran script `runEmulateBaseline.sh` for several hours before terminating it.
   2. I copied the results to my performance scripts directory: `cp /tmp/PerfTxLog.baseline.txt ~/forerunner/scripts/perf/`
   3. I ran script `runEmulateForerunner.sh` for several hours before terminating it.
   4. I copied the results to my performance scripts directory: `cp /tmp/PerfTxLog.reuse.txt ~/forerunner/scripts/perf/`
   5. I ran the Python script to compute the speedups: `python ~/forerunner/scripts/join_perf.py -b ~/forerunner/scripts/perf/PerfTxLog.baseline.txt -f ~/forerunner/scripts/perf/PerfTxLog.reuse.txt -o ~/forerunner/scripts/`

## How The Artifact Supports The Paper

The GitHub repository contains the code and instructions used to evaluate the system described in the paper. The location is public and is hosted on a site deemed sufficiently permanent. The workload and scripts used to evaluate the artifact are also publicly available.

Three out of four reviewers run the experiments on the pre-configured VMs. We run either the pre-built binary or the binary built by ourselves. An execution script launches the binary using the emulated dataset, which is saved from paper experiments on the live Ethereum mainnet. One reviewer runs the experiments on CloudLab instance. This reviewer is able to build and run the artifact. This reviewer also confirms that the artifact runs as an Ethereum node receiving transactions from other live nodes in the Ethereum network. The artifact is seen to be functional.

The three reviewers, who run the experiments on the pre-configured VMs, report similar average effective speedup rate and perfect satisfaction rate as reported in the paper. Reviewer1 runs the artifact for 10 hours. His/her results show the effective speedup (transactions where speculative execution is applied) as 10.02x. Reviewer 2 runs the artifact for 4 hours. His/her results show the effective speedup as 10.40x. Reviewer3 runs the artifacts for 2 hours. His/her results show effective speedup as 9.04x. All our results are higher than the paper result, which is 8.39x. We obtain similar perfect satisfaction ratio and time-weighted ratio as reported in the paper.

## Additional Notes and Resources

The reviewer who conduct experiments on CloudLab instance report 99.0x effective speedup, which is beyond the expected range. As explained by the authors, this is due to the "prefetcher is very effective in reducing disk I/O on the critical path as mentioned in Section 4.1 of the paper," and thus, when the CloudLab baseline is using a low-performance HDD, "the benefit of eliminating disk I/O on the critical path would be over exaggerated." 

We thank the authors for open sourcing. The artifact is very organized, and evaluation is made easy thanks to the authors' efforts in providing automation scripts and pre-configured VMs.
