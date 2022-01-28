---
title: "Artifact Review Summary: Snoopy: Surpassing the Scalability Bottleneck of Oblivious Storage"
---

{% include_relative _result-header.html %}

## Description of the Artifact

The Snoopy (SOSP 2021) artifact locates at <https://github.com/ucbrise/snoopy> under the Apache v2 license.

Snoopy is a novel oblivious storage system that scales similarly to a plaintext storage system. Experiments show that Snoopy can scale out horizontally, and performs at least 10x faster than state-of-the-art oblivious systems.

This artifact includes all the necessary instructions for building and installing Snoopy locally. The authors also have provided highly automatic scripts for reproducing the experimental results on Azure. A good feature of these scripts is that they can generate side-by-side figures for readers to compare the reproduced results and the paper's results with a lot of ease.


## Environment(s) Used for Testing

Snoopy can be built and run locally using a 64-bit machine/VM running Ubuntu 18.04 LTS. Since the experiments require multiple machines for testing with scalability, it is recommended to use the cloud resources, such as the Azure clusters used by the authors.

For Oblix (Oakland 2018) as the baseline, an evaluator needs to launch 1 Azure SGX (Software Guard Extensions) VM with an image that has Oblix installed. 

For Obladi (OSDI 2018) as the baseline, it needs to launch a cluster of 2 VMs. The provided script compiles Obladi and sends the compiled jar files to the remote Obladi cluster.

For Snoopy, it needs to launch a cluster of 21 Azure SGX VMs and update the experiment `config` files with the used machines' IP addresses.

For the ease of reproducing the paper results, the authors provide an Azure client VM containing the Snoopy repo. The command lines launch several Azure SGX VM instances, perform the experiments, and propagate the results to the client VM for figure generation.

Note that although the techniques used in Snoopy do not depend on Azure, its current implementation uses [OpenEnclave](https://github.com/openenclave/openenclave), which relies on Azure's provisioned remote attestation.


## Step-By-Step Instructions to Exercise the Artifact

An evaluator can easily follow the authors' instructions on how to provision the Azure VMs, generate the baseline numbers, perform the experiments, obtain the results, and finally shut down the provisioned VMs. These steps provided by the authors are clear and concise.

The following are mainly copied from the original authors' instructions:

### Oblix Baseline
```
cd ~/snoopy/scripts/oblix
python3 runExperiment.py --config=config/oblix_benchmark.json -psrc     # 5 minutes
```

### Obladi Baseline
```
cd ~/snoopy/scripts/obladi
python3 runExperiment.py -psrc      # 15 minutes
```

### Propagate Baselines
```
cd ~/snoopy/scripts
./process_baselines.sh      # <1 minute
```

### Provisioning Machines for Snoopy
```
cd ~/snoopy/scripts
./provision_machines.sh     # 5 minutes
```

### Figure 9
```
./figure9.sh      # 195 minutes
```

### Figure 10a
```
python3 runExperiment.py -f 10a -srg        # 35 minutes
```

### Figure 10b
```
python3 runExperiment.py -f 10b -srg        # 10 minutes
```

### Figure 11a, 11b, 11c:
```
./figure11.sh     # 6 minutes
```

### Figure 12a
```
python3 runExperiment.py -f 12a -srg      # 2 minutes
```

### Figure 12b
```
python3 runExperiment.py -f 12b -srg      # 12 minutes
```

### Figure 14a, 14b (PREREQUISITE: Figure 11a, 11b, and 11c)
```
./figure14.sh     # 2 minutes
```

### Cleanup
```
python3 runExperiment.py -c     # 10 minutes
```

## How The Artifact Supports The Paper

### Available

The [artifact](https://github.com/ucbrise/snoopy) is a public GitHub repo and shows how to produce all the figures from the Snoopy paper.

### Functional

The artifact instructions provide how to compile and use Snoopy locally on Ubuntu 18.04 as well as how to enable debugging.

The process of running Snoopy on the Azure public cloud and replicating the authors' results is well-documented. This includes generating figures from the raw data produced, and drawing two sub-figures to ease comparisons intuitively. The expected time for each run is also kindly given. The execution runs mostly smoothly, with easy automation of the experiments and result production.

### Reproduced

The artifact can successfully generate 11 (sub)figures (from figure-9 to figure-14).
All of the figures reproduced correspond to ones from the paper, and hence support the authors' claim. While a slight difference (for example, Figure 12a) did occurr, the artifact evaluators believe it is negligible.

