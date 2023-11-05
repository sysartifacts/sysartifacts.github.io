---
title: "Artifact Review Summary: UGACHE: A Unified GPU Cache for Embedding-based Deep Learning"
---

{% include_relative _result-header.html %}

## Description of the Artifact

The artifact is uplooaded to [the GitHub repository](https://github.com/SJTU-IPADS/ugache-artifacts). The repository contains scripts and instructions for reproducing the experiments in the paper as well as the the original log files and the links to the screencasts for additional results. There's also a one-click script to reproduce the results and plot the figures.

## Environment(s) Used for Testing

The evaluation in the paper involves three platforms including DGX-V100 Station, DGX-1 and DGX-A100 and the DGX-V100 setup is accessible for evaluators.
All Evaluators used the servers with Docker containers provided by the authors. 
The server is equipped with hard-wired NVLink, 2 x Intel Xeon Gold 6138 CPUs (20 cores each) and 4 x NVIDIA V100 (16GB) GPUs with a symmetric fully-connected NVLink topology.

## Step-By-Step Instructions to Exercise the Artifact

As shown in [the GitHub repository](https://github.com/SJTU-IPADS/ugache-artifacts), a later reader is able to setup and reproduce with the following instructions:
``` bash
# to build docker images
cd <ugache-dir>/docker
docker build --pull -t ugache-gnn -f Dockerfile.gnn --build-arg RELEASE=false .
docker build --pull -t ugache-dlr -f Dockerfile.dlr --build-arg RELEASE=false .

# to launch the containers
docker run  --shm-size=200g --ulimit memlock=-1 --ulimit core=0 --runtime=nvidia --privileged=true --cap-add=SYS_ADMIN --cap-add=SYS_NICE --ipc=host --name ugache-ae-gnn -it ugache-gnn bash
docker run  --shm-size=200g --ulimit memlock=-1 --ulimit core=0 --runtime=nvidia --privileged=true --cap-add=SYS_ADMIN --cap-add=SYS_NICE --ipc=host --name ugache-ae-dlr -it ugache-dlr bash

# to bind an external storage to the container since the dataset requires a large disk volume
docker run  --shm-size=200g --ulimit memlock=-1 --ulimit core=0 --runtime=nvidia --privileged=true --cap-add=SYS_ADMIN --cap-add=SYS_NICE --ipc=host -v <extern_host_storage>:/dataset_gnn --name ugache-ae-gnn -it ugache-gnn bash
docker run  --shm-size=200g --ulimit memlock=-1 --ulimit core=0 --runtime=nvidia --privileged=true --cap-add=SYS_ADMIN --cap-add=SYS_NICE --ipc=host -v <extern_host_storage>:/dataset_dlr --name ugache-ae-dlr -it ugache-dlr bash

# to pull and build UGache
## for GNN:
docker exec -it ugache-ae-gnn bash
bash /tmp/setup_docker.sh
bash /tmp/setup_docker.gnn.sh
## for DLR:
docker exec -it ugache-ae-dlr bash
bash /tmp/setup_docker.sh
bash /tmp/setup_docker.dlr.sh

# to prepare the Gurobi license
/opt/gurobi-install/linux64/bin/gurobi_cl --license

# to prepare the dataset
## in GNN container
cd /ugache/datagen/gnn
python friendster.py
python mag240M.py
python papers100M.py
## in DLR container
cd /ugache/datagen/dlr
python syn.py
cd criteo
bash criteo.sh

# to reproduce the results
cd /ugache/eval/gnn        # GNN tests in gnn folder should be run in gnn container
                             # for DLR tests, enter /ugache/eva/dlr in dlr container
bash run-all-4v100.sh      # run scripts that match the platform: run-all-(4v100,8v100,8a100).sh

# to plot the figures
# e.g., to plot dlr figures, run in the dir container
cd /ugache/eval/dlr/figure11-4v100
make run
make plot
```

## How The Artifact Supports The Paper


* Availability: The scripts of the evaluations and the original logs for the paper evaluations are available on the GitHub page.
* Functioning: The system (UGache) and the evaluation scripts are all functioning well when we re-ran. 
* Reproducibility: All the results of the evaluations based on V100 can be reproduced based on the provided scripts with consistent results and some results of the system (UGache) are even better than the paper shows. All the remaining results can be analyzed and plotted based on the author-provided logs. Although we only evaluated one of the three setups, we checked the screencasts and the raw logs. Given the fact that the three setups are very similar, we believe UGache is functional and reproducible on all the three setups.

## Additional Notes and Resources

The artifacts are well prepared. Scripts contain the one-click version and the detailed single-figure versions with the estimated times, which is very nice. 