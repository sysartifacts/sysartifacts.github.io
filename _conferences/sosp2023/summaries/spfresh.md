---
title: "Artifact Review Summary: SPFresh: Incremental In-Place Update for Billion-Scale Vector Search"
---

{% include_relative _result-header.html %}

## Description of the Artifact

The SPFresh GitHub repository can be found [here](https://github.com/SPFresh/SPFresh). This artifact allows for the evaluation of a new approach for in-place vector updates that outpeforms the current state-of-the-art graph and partition based approaches. The authors evaluate their proposed against two such approaches (one graph based and one partition based) on two widely used vector datasets from the literature with three different workloads. The authors demonstrate SPFresh outperforms the other approaches on a number of metrics such as search accuracy, search tail latency, queries per second, and memory usage.

The submitted artifact includes a GitHub repository with their system SPFresh, third parties like SPDK and rocksdb, and source code of the baseline system they compare against in their evaluation DiskANN. The overall artifact is divided into two parts, FreshDiskANN and SPFresh, corresponding to the baseline and the system of this paper respectively. The README provides instructions for the configuration of the whole experiment environment, including instructions on how to build the source code and the required dependencies that need to be installed. There is also a separate README that explains how to reproduce the figures in the paper, with the scripts for each figure being placed in their own separate folder. They also provide the approximate duration needed to run the particular experiment which is a nice touch.

## Environment(s) Used for Testing

*Describe the environments the evaluators used. If multiple environments were used successfully, list all of them. Describe the environment in sufficient detail that a later reader could conceivably re-create something similar. If author-provided resources were used, say as much about them as we know (but don't provide hostnames, etc.)*

The evaluators used a [Standard_L16s_v3](https://learn.microsoft.com/en-us/azure/virtual-machines/lsv3-series) Azure instance provided by the authors. This instance was already set up with the data and code necessary to start running experiments, so the evaluators did not need to follow the instructions provided by the authors in their artifact's GitHub repository relating to environment setup. The instructions to retrieve the code and data artifacts needed to reproduce the evaluation are linked below:

Retrieving code artifacts - [README.md](https://github.com/SPFresh/SPFresh/blob/main/README.md)
Generating data artifacts - [README.md](https://github.com/SPFresh/SPFresh/blob/main/Script_AE/iniFile/README.md)

## Step-By-Step Instructions to Exercise the Artifact

There are scripts to run the commands needed to reproduce the figures in the artifact's GitHub repository that can be found [here](https://github.com/SPFresh/SPFresh/tree/main/Script_AE).

For experiments that need SPDK for evaluation (SPFresh and SPANN+):
```
sudo nvme format /dev/nvme0n1
sudo ./SPFresh/ThirdParty/spdk/scripts/setup.sh
cp bdev.json /home/sosp/SPFresh/
```

For experiments that need DiskANN for evaluation:
```
sudo ./SPFresh/ThirdParty/spdk/scripts/setup.sh reset
sudo mkfs.ext4 /dev/nvme0n1
sudo mount /dev/nvme0n1 /home/sosp/testbed
sudo chmod 777 /home/sosp/testbed
```

The following commands need to be run to switch from DiskANN to SPFresh during evaluation:
```
sudo umount /home/sosp/testbed
sudo nvme format /dev/nvme0n1
sudo ./SPFresh/ThirdParty/spdk/scripts/setup.sh
```

## How The Artifact Supports The Paper

The artifact allows for the reproduction of all of the results figures in the paper. We compared that the reproduced results matched what was reported in the paper both at a qualitative level and within a certain bound of the actual reported numbers. The evaluators reproduced Figures 1, 7, 8, 9, 10, and 11. We were unable to reproduce Fig. 6 due to time constraints and the inability to work in parallel because the artifact evaluators had to share a single virtual machine that could only be used to reproduce one figure at a time.
