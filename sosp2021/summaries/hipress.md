---
layout: single
title: "Artifact Review Summary: Gradient Compression Supercharged High-Performance Data Parallel DNN Training"
sidebar:
    title: 'SOSP 2021'
    nav: sosp2021toc
---

{% include_relative _result-header.html %}


## Description of the Artifact

HiPress is a DNN training framework which aims to address the challenge of synchronization in data-parallel training for gradient compressed networks. It is composed of two key components - CaSync, a gradient synchronization architecture, and CompLL, a developer abstraction for implementing gradient compression algorithms. 

The source for HiPress, including both CaSync and CompLL, is presented as artifacts in support for this paper. The authors have provided links to the [public gitlab repository](https://gitlab.com/hipress/hipress) and [instructions](https://gitlab.com/hipress/hipress/-/blob/master/README.md) on how to build, use and replicate results on MxNet(vgg-19, bert-base and vision models), PyTorch (lstm, ugatit) and Tensorflow (resnet50, transformer).

## Environment(s) Used for Testing

Because of the large GPU requirements, all evaluators used the author provided cluster of 16 nodes, each of which had 2x Nvidia 1080Ti (12GB) and 56Gbps RDMA interconnects. The authors provided a python venv on the cluster to replicate results, but the gitlab repo also provides a [Dockerfile](https://gitlab.com/hipress/hipress/-/blob/master/src/CaSync/Dockerfile) to compile a docker image with the environment setup.


## Step-By-Step Instructions to Exercise the Artifact

Each framework(torch/mxnet/tensorflow) and model included a run.sh script that was used to replicate the results presented in Figures 14 and 15. The GitLab repository includes detailed instructions for each framework and model in the ` hipress/src/CaSync` directory.

The author provided cluster had the hipress environment setup and the run scripts were configured to use the 32 GPUs across 16 machines. Running the artifact was as simple as
running `bash run.sh` for different model/framework configurations.

For example, to train imagenet on resnet-50 with torch, the evaluators ran a variant of  run-resnet50.sh located in [hipress/src/CaSync/horovod-torch/imageNet/](https://gitlab.com/hipress/hipress/-/tree/master/src/CaSync/horovod-torch/imageNet). 

Similarly, `run-*.sh` scripts for language models and other vision models are available in the [repository](https://gitlab.com/hipress/hipress/-/tree/master/src/CaSync/examples).

## How The Artifact Supports The Paper

The committee awarded this artifact all three badges - artifact available, artifact functional and results replicated.

*Artifact Available*
Both the [artifact](https://gitlab.com/hipress/hipress) and [the baselines](https://gitlab.com/hipress/baselines) are available publicly on gitlab.

*Artifact Functional*
The reviewers were successfully able to run MxNet(vgg-19, bert-base and vision models), PyTorch (lstm, ugatit) and Tensorflow (resnet50, transformer) with HiPress using the provided run.sh scripts on the authors' cluster. 

*Results Replicated*
The primary results of HiPress are presented in Figures 7 and 8. However, re-running those experiments on EC2 would have been prohibitively expensive and required coordination amongst reviewers, so the evaluation of results was centered around replicating Figures 14 and 15, which are the same experiments but run on the authors' local clusters.

All evaluators were able to reproduce the performance numbers for HiPress in Figure 14 and 15. After the authors provided scripts to run baselines, an evaluator was able to replicate the results for the `Ring` baseline presented in Figure 14 and 15. Since the artifact provides an adequate reference implementation of HiPress and its performance matches what is claimed in the paper, the paper was awarded the results replicated badge. 

## Additional Notes and Resources

The initial artifact submission did not include scripts to run baselines. On request, the authors provided links and instructions on running the `Ring`, `BytePS` and `Ring(OSS-DGC)` baselines at [https://gitlab.com/hipress/baselines](https://gitlab.com/hipress/baselines). Ring uses standard horovod backend and was provided as a pre-compiled environment to the reviewers, and the reviewers were provided with examples on how to run the `BytePS` baseline. Here's the example script provided by the authors for running the BytePS baseline on 2 nodes (`gpu3` and `gpu4` refer to two servers on the authors' cluster):

```
# Clone the scripts from the public repo first.
# Launch Scheduler on gpu3
export DMLC_NUM_WORKER=2
export DMLC_ROLE=scheduler
export DMLC_NUM_SERVER=2
export DMLC_PS_ROOT_URI=10.0.0.43
export DMLC_PS_ROOT_PORT=1234
export DMLC_INTERFACE=ib0
export DMLC_ENABLE_RDMA=ibverbs
export BYTEPS_ENABLE_IPC=1
export BYTEPS_RDMA_RX_DEPTH=256
bpslaunch

# Launch Servers on gpu3 and gpu4
export DMLC_NUM_WORKER=2
export DMLC_ROLE=server
export DMLC_NUM_SERVER=2
export DMLC_PS_ROOT_URI=10.0.0.43
export DMLC_PS_ROOT_PORT=1234
export DMLC_INTERFACE=ib0
export DMLC_ENABLE_RDMA=ibverbs
export BYTEPS_ENABLE_IPC=1
export BYTEPS_RDMA_RX_DEPTH=256
bpslaunch

# Set enviroment variables on both gpu3 and gpu4
export DMLC_NUM_WORKER=2
export DMLC_ROLE=worker
export DMLC_NUM_SERVER=2
export DMLC_PS_ROOT_URI=10.0.0.43
export DMLC_PS_ROOT_PORT=1234
export DMLC_INTERFACE=ib0
export DMLC_ENABLE_RDMA=ibverbs
export BYTEPS_ENABLE_IPC=1
export BYTEPS_RDMA_RX_DEPTH=256
export NVIDIA_VISIBLE_DEVICES=0,1
export DISTRIBUTED_FRAMEWORK=byteps

# Set worker id for gpu3 and gpu4 respectively
export DMLC_WORKER_ID=0 # on gpu3
export DMLC_WORKER_ID=1 # on gpu4

# An example of launching scripts to train UGATIT
bpslaunch python baselines/pytorch/ugatit/main.py --dataset selfie2anime --dataset_dir ~/trainData/ --light True --batch_size 1
```
