---
layout: single
title: "Artifact Review Summary: Solving Large-Scale Granular Resource Allocation Problems Efficiently with POP"
sidebar:
    title: 'SOSP 2021'
    nav: sosp2021toc
---

{% include_relative _result-header.html %}

## Description of the Artifact

* Artifact location: <https://github.com/stanford-futuredata/POP>
* Readme: <https://github.com/stanford-futuredata/POP/blob/main/EXPERIMENTS.md>

The provided artifact has code, dependencies, scripts to run the experiments for each of the three -- Cluster scheduling, Load balancing, Traffic engineering -- application areas on which POP technqiue was evaluated on. 
For each application area, there are quite a few dependencies. The dependencies have been clearly documented (typically in requirements.txt which corresponds to the required python modules) in their folders. Scripts have also been furnished to run the experiments and to proces the results.  


## Environment(s) Used for Testing

#### Environment-1: 

Used the image provided by the authors on an AWS EC2 spot instances (m5.8xlarge, recommended by the authors) to evaluate. 

#### Environment-2:

Used the instructions provided by the authors to develop an image (shared among the reviewers) to run evaluations on CloudLab. 
Server: C6420 node, with 32 cores and 384 GB memory, which is in configuration similar to m5.8xlarge VMs. 
OS: Ubuntu 18.04


## Step-By-Step Instructions to Exercise the Artifact

* Software/Licenses required: 
    
    * See instructions at <https://github.com/stanford-futuredata/POP/blob/main/EXPERIMENTS.md>
    * Dependenices:
       * Gurobi academic license
       * IBM CPLEX 20.1 optimization package.
       * Use python packages suggested in the instructions.

* Installation instructions:

```
    # Ubuntu 18.04 installation
    sudo apt update && sudo apt -y upgrade
    sudo apt install -y build-essential cmake python-dev openjdk-11-jre-headless default-jre maven unzip zip htop g++ gcc libnuma-dev make numactl zlib1g-dev    

    # Requied Python 3.7 or higher. Need to make sure that is the default version of python/py3
    sudo apt install python3.7
    sudo update-alternatives --install /usr/bin/python3 python3 /usr/bin/python3.7 37
    sudo update-alternatives --install /usr/bin/python python /usr/bin/python3.7 37

    # In order to make sure we install the python dev package of the right python-version.
    sudo apt remove python3-dev
    sudo apt purge python3-dev
    sudo apt install python3.7-dev 

    # Install Miniconda
    wget https://repo.anaconda.com/miniconda/Miniconda3-py38_4.10.3-Linux-x86_64.sh
    bash Miniconda3-py38_4.10.3-Linux-x86_64.sh

    #Install Gurobi:
    wget https://packages.gurobi.com/8.1/gurobi8.1.1_linux64.tar.gz
    tar xvf gurobi8.1.1_linux64.tar.gz

    # Install IBM CPLEX 20.1 (check instructions in the repo)
    Run the installer, specifying /home/ubuntu/cplex201 as the install directory.

    # Modify .bashrc
    export GUROBI_HOME=$HOME/gurobi811/linux64
    export CPLEX_HOME=$HOME/cplex121/cplex
    export LD_LIBRARY_PATH=$CPLEX_HOME/bin/x86-64_linux:$GUROBI_HOME/lib:$LD_LIBRARY_PATH
    export PATH=$GUROBI_HOME/bin:$PATH

    # Installation related to Cluster Scheduling
    cd POP/cluster_scheduling
    conda create --name cluster_scheduling
    pip3 install scikit-build numpy cython  # The list of modules in requirements.txt might not be in the right order.
    pip3 install -r requirements.txt
    cd scheduler; make

    # Traffic engineering
    cd POP/traffic_engineering
    conda env create -f environment.yml
    conda activate traffic_engineering
    pip install -r requirements.txt
    ./download.sh # Download the traffic matrices used in experiments.

    # Installation related to load balancing
    cd POP/load_balancing
    mvn package    
```

## How The Artifact Supports The Paper


The work was awarded the following badges, followed by the reasons:
1. Artifact available: 
The repo provides the necessary code, and the experimental setup for all the three different application areas in which the proposed solution was evaluated. A comprehensive documentation on the organization of the aritfact is available.

2. Artifact functional:
The reviewers were able to run the experiments related to each application area. While the instructions weren't comprehensive in the beginning, from the interactions between the reviewers and the authors, we were ultimately able to run all the experiments. The authors have updated the instructions based on the the recommendations from the reviewers. Since the reviewers were able to satisfactorily run the experiments, we awarded the badge "Functional" badge. 

3. Results reproduced:
In environment-1, we were able to run all the experiments. However, the experiments can take rather long time to run, making it harder to monitor the progress. 
In environment-2, not all the reviewers were able to run all the experiments. But we were generally able to run 2 of the 3 applications. 

The authors provided us instructions on how to interpret the results, scripts were provided to get the relevant datapoints for the corresponding plots from the paper. 
Since we were able to confirm the key results --there is reduction in job completion time, and the allocations are close to optimal-- were verified for two (cluster scheduling and load balancing) applications, the reviewers came to the consensus that the artifact merited the results reproduced badge.
