---
title: "Artifact Review Summary: Flexible Advancement in Asynchronous BFT Consensus"
---

{% include_relative _result-header.html %}

## Description of the Artifact

The artifact provided by the authors targets artifact functional and reproducible badges. It is not open-sourced. The artifact includes a Go-lang implementation of the MyTumbler algorithm presented in the paper. This artifact lays down steps to execute the codebase and testing it on (1) all the data points, and (2) a selected sample of data points. This artifact is both functional and reproducible. 


## Environment(s) Used for Testing

This artifact was evaluated on authors account on AWS. 
Depending on the experiment, we deployed 4, 10, and 100 virtual machines with 8 vCPUs, 32 GiB RAM and 5 Gbps network running on Ubuntu 20.04.3 LTS. 
We deployed replicas and clients across five regions: Ohio, Singapore, Tokyo, Frankfurt and Canada Central.
All the experiments were compiled and run from a test machine (also deployed on AWS).


## Step-By-Step Instructions to Exercise the Artifact

To facilitate artifact evaluation, authors provided us python3 scripts to create, start, stop, and destroy the machines. 
We did the following steps for running MyTumblr-c1, MyTumblr-c2, and BKR protocols:
1. In these scripts, we modified the number of replicas and the regions for deploying the replicas. 
2. We created three terminals for running: replicas, clients, and coordinator.
3. These scripts expected the following parameters as input: number of replicas, number of non-faulty replicas, batch size, rate of client requests, and payload channels.
4. For each graph in the paper, we ran each protocol on the four selected data points. 
5. Each data point had to manually run, one at a time. 
6. Post running all the data points, we created a graph to observe the trend presented in the paper.

As authors directed us to download and install open-sourced HotStuff and Tusk codebases, we followed the steps described on their repositories to test at specific points.


## How The Artifact Supports The Paper

This artifact supports paper's claim. 
1. The artifact is functional as we were able to compile and run the codebase on the experiments stated in the paper.
2. The artifact was reproduced as it matches the trend illustrated in the paper.
However, the results produced by the artifact had an error bound of +-2% in comparison to the numbers presented in the paper. *

## Additional Notes and Resources

Open-sourced link for HotStuff and Narwhal comparison: [https://github.com/asonnino/narwhal/tree/master](https://github.com/asonnino/narwhal/tree/master)

