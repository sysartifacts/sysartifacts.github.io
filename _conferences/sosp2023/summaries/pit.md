---
title: "Artifact Review Summary: PIT: Optimization of Dynamic Sparse Deep Learning Models via Permutation Invariant Transformation"
---

{% include_relative _result-header.html %}

## Description of the Artifact

The artifact of the paper is publicly hosted on [GitHub](https://github.com/microsoft/SparTA/tree/pit_artifact). The repository is well-documented, featuring a comprehensive README file that offers clear instructions for replicating the reported results. Additionally, the repository includes generated figures and scripts, streamlining the reproduction process for users.

To showcase the validity of their artifact, the authors have thoughtfully included screencast videos as well.

The source code of the system incorporating the artifact, SparTA, is also publicly available on GitHub. 

The submitted code picks up a trained BERT model and sparsifies the linear (dense) layers using the described method. It then runs the model with all of the GLUE benchmark datasets and reports the time and memory. Other experiments measure the above metrics as a function of the max sequence length of the input sentence, percentage sparsity of input, and compares them against state-of-the-art baselines. 

## Environment(s) Used for Testing

The artifact was evaluated on a server provided by the authors with the following specification -

GPU: 4 V100 with 16 GB RAM  
OS: Linux 4.15   
CPU: Intel(R) Xeon(R) CPU E5-2690 v4 @ 2.60GHz

## Step-By-Step Instructions to Exercise the Artifact

Set up and execute the docker container -

```
docker run -it --gpus all --shm-size=32gb --rm -d --name pit_artifact -h docker zhengningxin/pit_artifact:v100
docker exec -it pit_artifact bash
```

Setup the artifact in docker -

```
mkdir -p workspace && cd workspace
git clone https://github.com/microsoft/SparTA && cd SparTA && git checkout pit_artifact
```

Execute the evaluation scripts -

```
bash script/init_env_v100.sh
bash script/run_v100.sh
```

## How The Artifact Supports The Paper

Among the 10 (i.e., Figure 8-17) figures, most can be reproduced with most of the same results based on the author-provided environment. 

Some Out Of Memory errors were encountered during evaluations because the server provided by the authors contained GPUs with lower memory than required.

 The other little difference is that for Figure 17, for the Tile Size = 1 x 1 group, our results show that the latency for PyTorch-S (one of the baselines) is not so long. But the authors re-ran this evaluation on another internal machine and the results conform to the paper. They speculate that the potential causes for this discrepancy might be related to underlying hardware differences, varying driver versions, and disparities in the CPUs of the two machines. 

The provided screencast also complied with the experiments in the paper.

## Additional Notes and Resources

The artifact needs 8 32 GB V100 GPUs to run all the experiments, however the authors were able to provide the artifact evaluators with a machine with 8 16 GB V100 GPUs which were sufficient to run most but not all experiments. 

