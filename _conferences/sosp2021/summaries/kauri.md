---
title: "Artifact Review Summary: Kauri: Scalable BFT Consensus with Pipelined Tree-Based Dissemination and Aggregation"
---

{% include_relative _result-header.html %}

## Description of the Artifact

### Authors' Description
Kauri is a BFT communication abstraction that leverages dissemination/aggregation trees for load balancing and scalability while avoiding the main limitations of previous tree-based solutions, namely, poor throughput due to additional round latency and the collapse of the tree to a star even in runs with few faults while at the same time avoiding the bottleneck of star based solutions.

#### Features
Kauri extends the publicly available implementation of HotStuff (<https://github.com/hot-stuff/libhotstuff>) with the following additions:

- Tree Based Dissemination and Aggregation equally balancing the message propagation and processing load among the internal nodes in the tree.

- BLS Signatures: Through BLS signatures the bandwidth load of the system is reduced significantly and signatures may be aggregated at each internal node.

- Extra Pipelining: Additional pipelining allows to offset the inherent latency cost of trees, allowing the system to perform significantly better even in high latency settings.

#### Run Kauri
At the moment only bls signatures are supported. To run HotStuff with libsec signatures, this can be done by running vanilla Hotstuff at <https://github.com/hot-stuff/libhotstuff>.

### Summary of Reviewers' Descriptions
Kauri modifies HotStuff to avoid leader bandwidth bottlenecks using dissemination / aggregation trees.
It uses a novel pipelining technique for scalability, and improves HotStuff's throughput without significant damage to latency.

The artifact includes a modified version of a HotStuff codebase featuring the Kauri alterations.
It also includes experiment scripts which can setup a docker swarm, run experiments based on a simple configuration file, and report throughput and latency.

Overall setup was easy, bet several key issues remain.
Specifically, the artifact can only run HotStuff-BLS and Kauri experiments varying a limited set of parameters, and tracking aggregates of throughput and latency.
This is not sufficient to reproduce all of the data in the paper.


## Envrionment(s) Used for Testing
### Reviewer A Used
[Cloudlab](https://cloudlab.us/) with 5 c6525-100g instances in the [utah cluster](https://cloudlab.us/hardware.php#utah) running [Ubuntu 20.04](https://releases.ubuntu.com/20.04/).
Technical specifications include:

| attribute    | value          |
|--------------|---------------:|
|dom0mem       | 8192M          |
|hw_cpu_bits   | 64             |
|hw_cpu_cores  | 24             |
|hw_cpu_hv     | 1              |
|hw_cpu_sockets| 1              |
|hw_cpu_speed  | 2800           |
|hw_cpu_threads| 2              |
|hw_mem_size   | 131072         |
|processor     | AMD EPYC 7402P |

### Reviewer B Used
3 different clusters on [grid5000](https://www.grid5000.fr/), all  running [Ubuntu 20.04](https://releases.ubuntu.com/20.04/):

| cluster      | [gros](https://www.grid5000.fr/w/Nancy:Hardware#gros) | [chiclet](https://www.grid5000.fr/w/Lille:Hardware#chiclet) | [dahu](https://www.grid5000.fr/w/Grenoble:Hardware#dahu) |
|--------------|-------------------------------------------------------|-------------------------------------------------------------|----------------------------------------------------------|
| nodes        | 7                                                     | 7                                                           | 14                                                       |
| cpu          | Intel Xeon Gold 5220                                  | AMD EPYC 7301                                               | Intel Xeon Gold 6130                                     |
| architecture | Cascade Lake-SP                                       | Zen                                                         | Skylake                                                  |
| frequency    | 2.20GHz                                               | 2.20 GHz                                                    | 2.10 GHz                                                 |
| cpu / node   | 1                                                     | 2                                                           | 2                                                        |
| cores / cpu  | 18                                                    | 16                                                          | 16                                                       |
| RAM          | 96 GiB                                                | 128 GiB                                                     | 192 GiB                                                  |
| ethernet     | 2 x 25Gbps                                            | 2 x 25 Gbps                                                 | 10 Gbps                                                  |



## Step-By-Step Instructions to Excercise the Artifact
Reviewers followed the [instructions in the artifact README](https://github.com/Raycoms/Kauri-Public/blob/latest/README.md#preliminary-setup-1).

### Setup
To summarize the [instructions in the artifact README](https://github.com/Raycoms/Kauri-Public/blob/latest/README.md#preliminary-setup-1), on each cluster, the reviewer:
- downloaded the latest version of the artifact with git onto each machine
- built a Kauri docker image on each machine
- selected one cluster machine as the control machine, initiated a docker swarm
- added all the docker images on all the cluster machines to the swarm, and 
- created a network within the docker swarm
The reviewers had no problems following artifact instructions for these steps.
Reviewers were also able to adjust the number of kauri replicas in `kauri.yaml` as described in [the instructions](https://github.com/Raycoms/Kauri-Public/blob/latest/README.md#run-experiments).

### Running Experiments
As explained in [the instructions](https://github.com/Raycoms/Kauri-Public/blob/latest/README.md#run-experiments), the `experiments` file outlines the parameters to be used in each experiment.
Each line represents one experiment (they will be run sequentially), and each runs 5 times by default. 
Reviewers were able to run each experiment only once by altering [runexperiment.sh](https://github.com/Raycoms/Kauri-Public/blob/latest/runkauri/runexperiment.sh).
The file format is:
```
 type, fanout pipeline-depth pipeline-lat latency bandwidth :  number of internals : number of total : suggested physical machines
['bls','10','6','10','100','25','1000']:11:89:5
# HotStuff has fanout = N
['bls','100','0','10','100','25','1000']:11:89:5
```
Note that HotStuff experiments are simply those where the fanout equal the number of servers (no tree structure will be used).

The [default experiments file](https://github.com/Raycoms/Kauri-Public/blob/latest/runkauri/experiments) now contains the parameters for replicating much of the data in figures 6, 7, and 9.
To replicate data form figure 5, reviewer B used the same parameters as the third test of figure 6, but with varying pipeline depth:
```
['bls','10','1','10','100','25','1000']:11:89:5
['bls','10','2','10','100','25','1000']:11:89:5
['bls','10','3','10','100','25','1000']:11:89:5
['bls','10','4','10','100','25','1000']:11:89:5
['bls','10','5','10','100','25','1000']:11:89:5
['bls','10','6','10','100','25','1000']:11:89:5
['bls','10','7','10','100','25','1000']:11:89:5
['bls','10','8','10','100','25','1000']:11:89:5
```

To run a batch of experiments, on the control node, run [runexperiment.sh](https://github.com/Raycoms/Kauri-Public/blob/latest/runkauri/runexperiment.sh).
It's probably best to run this in `tmux` or similar, as it runs for a long time, and prints out valuable output. 
Specifically, it produces output similar to:
```
2021-08-17 14:14:43.546142 [hotstuff proto] x now state: <hotstuff hqc=affd30ca8f hqc.height=2700 b_lock=22365a13f8 b_exec=63c209503b vheight=27xx tails=1>
2021-08-17 14:14:43.546145 [hotstuff proto] Average: 200"
```
Where `hqc.height=2700` presents the last finalized block. Considering the 5 minute interval, that results in 2700/300 blocks per second. Considering the default of 1000 transactions pr block, that results in 2700/300*1000 = 9000 ops per second. The value next to "average" represents the average block latency.





## How The Artifact Supports The Paper

### Available
The artifact, which includes an implementation of Kauri, is available at (<https://github.com/Raycoms/Kauri-Public>)

### Functional
Reviewers were able to run instances of Kauri's BFT consensus using the [runexperiment.sh](https://github.com/Raycoms/Kauri-Public/blob/latest/runkauri/runexperiment.sh) outlined above.

### Some Results Reproduced
The paper presents a lot of measurement results, both with Kauri and with control systems. 
Reviewers were able to reproduce several of these results.
It's easiest to consider the results by figure:

#### Figure 5
At least at low pipeline-depths, reviewer results are similar (but not identical) to the paper.
Reviewer B found that throughput does increase with pipeline-depth, reaching a maximum around depth 5 or 6, with less dramatic trend than was in the paper.
Some results below:
```
250Kb (1000 tx per block) - throughput measured in blocks per 5-minute period. 
  1 pipelining stretch - expect 300
    884 - Dahu with latency 657
  2 pipelining stretch - expect 900
    1378 - Dahu with latency 636
  3 pipelining stretch - expect 1260
    1768 - Dahu with latency 667
  4 pipelining stretch - expect 1650
    2166 - Dahu with latency 679
  5 pipelining stretch - expect 2010
    2603 - Dahu with latency 677
  6 pipelining stretch - expect 2400
    2705 - Dahu with latency 758
  7 pipelining stretch - expect 2500
    2683 - Dahu with latency 867
  8 pipelining stretch - expect 2500
    2703 - Dahu with latency 976
```

#### Figure 6
The reviewers were able to replicate the Figure 6 experiments for 100 processes, and their results agree with the paper.
One reviewer was able to replicate figure 6 results for 150 and 200 nodes as well.


#### Figure 7
Reviewers were able to replicate the Kauri line from Figure 7 (the artifact was not set up for non-Kauri experiments).

#### Figure 8
The latencies reviewer B measured for Kauri in Figure 9's Kauri (h=2) experiments reflect the general downward trend in Kauri's latency shown in Figure 8, although not the specific values.
In particular, the trend is much stronger (Kauri's latency is higher at low bandwidth and lower at high bandwidth than the figure shows).
(The artifact was not set up for non-Kauri experiments)

#### Figure 9
On low throughput Kauri datapoints, reviewers were able to reproduce Figure 9 results (for Kauri and HotStuff-BLS).
Specifically, results were:
```
(throughput measured in blocks per 5-minute period)
Fig 9 (and sort-of Fig 8)
RTT=100, block size = 1000
Throughput measured in blocks per 5 minutes

Kauri (h=2, fanout=10)
  25Mb (pipeline-depth = 3)
    Expected Throughput 2700 Latency 590
    Chiclet: Throughput 2471 Latency 477
  50Mb (pipeline-depth = 4)
    Expected Throughput 5700 Latency 490
    Chiclet: Throughput 4179 Latency 353
  100Mb (pipeline-depth = 6)
    Expected Throughput 10800 Latency 400
    Chiclet: Throughput  6952 Latency 296
  1000Mb (pipeline-depth = 8)
    Expected Throughput ???? Latency 350
    Chiclet: Throughput 9840 Latency 269

Kauri (h=3, fanout=5)
  25Mb (pipeline-depth = 4)
    Expected Throughput 5700 Latency 600
    Chiclet: Throughput 2889 Latency 505
  50Mb (pipeline-depth = 6)
    Expected Throughput 10800 Latency 510
    Chiclet: Throughput  4719 Latency 437
  100Mb (pipeline-depth = 8)
    Expected Throughput ???? Latency ???
    Chiclet: Throughput 6579 Latency 404
  1000Mb (pipeline-depth = 8)
    Expected Throughput ???? Latency ???
    Chiclet: Throughput 6941 Latency 378

HotStuff BLS
  25Mb
    Expected Throughput 270 Latency 1090
    Dahu:    Throughput  60 Latency 998  # must be a fluke
    Chiclet: Throughput 275 Latency 1074
    Chiclet: Throughput 273 Latency 1074
  50Mb
    Expected Throughput 540 Latency 580
    Dahu:    Throughput 521  Latency 569
    Chiclet: Throughput 515 Latency 575
  100Mb
    Expected Throughput 750 Latency 350
    Dahu:    Throughput 858 Latency 344
    Chiclet: Throughput 840 Latency 350
  1000Mb
    Expected Throughput 1800 Latency 200
    Dahu:    Throughput 1760 Latency 168
    Chiclet: Throughput 1636 Latency 180
```

## Additional Notes and Resources
Several adjustments were made to the artifact during (and after) the review period. 
Hopefully, these will make it easier for future users to reproduce more results.

