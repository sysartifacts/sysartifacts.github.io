---
layout: single
title: "Artifact Review Summary: When Idling is Ideal: Optimizing Tail-Latency for Highly-Dispersed Datacenter Workloads with Perséphone"
sidebar:
    title: 'SOSP 2021'
    nav: sosp2021toc
---

{% include_relative _result-header.html %}

## Description of the Artifact

The source code takes the form of a [Github repository](https://github.com/maxdml/psp) which includes **three modules**:

1. The core algorithm (the source code);
2. The evaluation suites (the logic for launching, configuring, and running experiments on an evaluation cluster from a remote orchestrator with the help of `Shremote`);
3. The external libraries that are necessary for this artifact (e.g., the source code of the two baselines `Shenango` and `Shinjuku` and the payload application RocksDB).

The **entry point** for the artifact evaluation is a Jupyter NoteBook `~/sosp_aec/aec.ipynb`, wherein each body cell notes down all the commands needed for reproducing one important figure in the paper. In terms of running the artifact, the authors created a [CloudLab experiment profile](https://www.cloudlab.us/login.php?referrer=%2Finstantiate.php%3Fproject%3DPsp%26profile%3DsospAEC), with which evaluators were able to set up exactly the **same deployment environment** as the one used in the paper.

## Envrionment(s) Used for Testing

As above mentioned, we used a cluster installation with **1 server node and 6 client nodes**, each of which is a `c6420` instance located at Clemson, South Carolina, and specifically equipped with
  * two 16-core Intel Xeon Gold 6142 CPUs at 2.6GHz,
  * a 384GB ECC DDR4-2666 memory,
  * two Seagate 1TB 7200 RPM 6G SATA HDs, and
  * a dual-port Intel X710 10Gbe NIC,

according to the official [manual](https://www.clemson.cloudlab.us/portal/show-nodetype.php?type=c6420). For the Shenango experiments, we used Linux kernel `4.15.0-142-generic`, while for the Shinjuku and Perséphone experiments we used Linux kernel `4.4.0-187-generic`.

To orchestrate the predefined evaluation process, we introduced **one additional coordinator node** which is not one of the CloudLab nodes. Its capabilities did not really matter for it was only responsible for sending commands and collecting results. The software stack there did not matter, either, as all the evaluation logic and the dependencies, had been shipped as a Docker image for unified configurations. Still, we hereby list our choices of the coordinator node for possible reference:

- (Reviewer A) a c5-4xlarge AWS EC2 instance located at region us-east-2;
- (Reviewer B) an Intel(R) Core i7-8700 CPU @ 3.20GHz with 16 GB of RAM;
- (Reviewer C) a local machine running Ubuntu server 18.04 LTS;
- (Reviewer D) a local server with Ubuntu 18.04 LTS.


## Step-By-Step Instructions to Excercise the Artifact

Here are the steps we took to exercise the artifact:

1. We initiated an experiment in CloudLab with the profile provided in the section titled [Creating the cloudlab experiment](https://github.com/maxdml/psp/tree/master#creating-the-cloudlab-experiment) of the artifact README.
2. We then ran scripts to prepare the server and client machines for experiments by exactly following the commands provided in the section titled [Building the systems](https://github.com/maxdml/psp/tree/master#building-the-systems), which instructed us to clone the repository, install Persephone and Shinjuku on kernel version `4.4.0-187-generic` and Shenango on kernel version `4.15.0-142-generic`.
3. Instructed by the section titled [Simple client-server tests](https://github.com/maxdml/psp/tree/master#simple-client-server-tests), we then conducted some simple experiments to ensure that the installation of the three systems was successful. It eventually turned out that the system worked as expected. For example, we could see an output similar to the one below at the tested client machine when we tested Persephone:
    ```
    019.746:/usr/local/sosp/client/src/c++/apps/client/client.hh:105:~Client(): INFO: Duration: 10.00s -> Sent: 10007406, Received: 10007405, 1 sent but not answered, 0 behind schedule,  0 skipped, 1
    70531237 events processed, 10007405 send attempts
    eth stats for port 0[port 0], RX-packets: 10007405 RX-dropped: 0 RX-bytes: 600444300
    [port 0] TX-packets: 10007405 TX-bytes: 600444300
    RX-error: 0 TX-error: 0 RX-mbuf-fail: 0
    EXTENDED PORT STATISTICS:
    ================
    Port 0: _______ rx_good_packets:                10007405
    Port 0: _______ tx_good_packets:                10007405
    Port 0: _______ rx_good_bytes:          600444300
    Port 0: _______ tx_good_bytes:          600444300
    Port 0: _______ rx_unicast_packets:             10007405
    Port 0: _______ rx_unknown_protocol_packets:            10007405
    Port 0: _______ tx_unicast_packets:             10007405
    Port 0: _______ rx_size_64_packets:             10007405
    Port 0: _______ tx_size_64_packets:             10007405
    Port 0: _______ tx_size_65_to_127_packets:              3
    Port 0: _______ rx_flow_director_sb_match_packets:              2
    ```
4. We then proceeded to the full evaluation of the reproducibility of the artifact. We followed the instruction in the section titled [Setting up an orchestrator node](https://github.com/maxdml/psp/tree/master#setting-up-an-orchestrator-node) to set up the orchestrator node. Specifically, we built a Docker container based on the [image](https://github.com/maxdml/psp/blob/master/Dockerfile) provided by the authors. We also performed necessary modifications on the configuration files `~/Shremote_cfgs` and `~/Shremote_cfgs/shinjuku.yml` based on the runtime dynamics of our deployed clusters. We finally ended up with an all-in-one testing script in the form of a [IPython Notebook](~/sosp_aec/aec.ipynb), wherein each cell provides detailed instructions for reproducing a particular figure mentioned in the evaluation part of the paper.
5. In most cases, the steps in the workflow of a figure reproduction process include:
    1. reboot the server machine in the cluster if necessary (due to the requirements of the kernel version);
    2. ran the server-side program `/usr/local/sosp/Persephone/sosp_aec/base_start.sh [Persephone/shinjuku/Shenango]`;
    3. ran the commands provided for executing the corresponding experiments in the Docker container at the coordinator machine, e.g., `/psp/Shremote_cfgs/run.py 0 psp DISP2 -p DARC CFCFS DFCFS --load-range .05 1.01` for reproducing Fig. 3;
    4. ran the code inside the notebook for generating the desired figure after all the related experiments finished, e.g., executing the following line of code for generating Fig. 3:
        ```Python
        plot_p99s(['Figure3'], reset_cache=False, use_ylim=True, clients=[0,1,2,3,4,5], value="p99.9", close_all=True, remove_drops=True, ncols=3)
        ```
6. For each successfully generated figure, we compared the counterpart presented in the paper to see whether their conveying messages match. When encountering problems, on the other hand, we tried to fix by manually rerunning missing/failed experiments or by requesting the authors' for technical supports (e.g., during the evaluation period, we drove the authors to come up with a [new commit](https://github.com/maxdml/psp/commit/12c71fc03fb92616b62738adfc60b60c3293d45d) that solved the issue regarding plotting Fig. 8).

We hereafter summarized the reproducibility of the main results observed by each of the reviewers.


| Figure | Reviewer A | Reviewer B | Reviewer C | Reviewer D |
|:------:|:----------:|:----------:|:----------:|:----------:|
| Fig. 3 | &#10004;   | &#10004;   | &#10004;   | &#10004;   |
| Fig. 4a | &#10004; | &#10004; | &#10004; | &#10004; |
| Fig. 5a | &#10004; | &#10004; | &#10004; | &#10004; |
| Fig. 5b | &#10004; | &#10004; | &#10004; | &#10004; |
| Fig. 6 | &#10004; | &#10004; | &#10004; | &#10004; |
| Fig. 7 | | | | |



## How The Artifact Supports The Paper

Above all, the artifact **well supports** the major performance claims made in Sec. 5.2-5.4., and we thus decided to award this artifact the **Replicated badge**. Here is a list of the authors' major arguments and our respective verification results.

* **Figure 3**: DARC improves slowdown over c-FCFS by up to 15.7x, and can sustain 2.3x higher throughput for an SLO of 20us for short requests, at a cost of up to 4.2x increased tail latency for long requests.
    1. When the throughput equaled around 240 kRPS, the p99.9 slowdowns of c-FCFS and DARC were around 150x and 10x, respectively; when p99.9 latency of processing short requests was around 15us, the maximum possible throughputs for c-FCFS and DARC were around 100 kRPS and 250 kRPS, respectively; for long requests, the p99.9 latency gap between DARC and c-FCFS was no larger than 2x of the latency of DARC. All these observations **comply with** the main claims derived from Figure 3.
* **Figure 4a**: reserving 1 core for High Bimodal decreases slowdown by 4.4x.
    1. Compared to the case with no worker reserved which yields around 75x, reserving one worker gave us the least p99.9 slowdown--around 13x. This implicates an acceleration factor of more than 5 and thus **agrees with** the claim made by the authors.
* **Figure 5a**: For a 20x slowdown target in High Bimodal, DARC can sustain 2.35x and 1.3x more traffic than Shenango and Shinjuku, respectively.
    1. For the overall circumstance, given a p99.9 slowdown of around 15us, the maximum achievable throughputs for Shenango (c-FCFS), Shinjuku, and Persephone were 120 kRPS, 195 kRPS, and 250 kRPS, respectively, which constitutes the **agreement with** the conclusion made by the authors.
* **Figure 5b**: For a 50x slowdown target in Extreme Bimodal, DARC can sustain 1.4x more load than Shenango. DARC also reduces slowdown by up to 2x over Shinjuku.
    1. For the overall circumstance, given a p99.9 slowdown of around 50x, the maximum achievable throughputs for Shenango (c-FCFS) and Persephone were 1600 kRPS and 3200 kRPS, respectively. This **exceeds** the claim made in the paper as DARC can actually sustain 2x more load than Shenango instead of merely 1.4x.
    2. For long requests, we saw that Shinjuku slightly increased the p99.9 latency over Persephone (around 700 us v.s. 500 us) even with the modest load (i.e., when the throughput was around 200 kRPS. This **slightly falls below** the expectation set in the paper (i.e., 1.4x v.s. up to 2x). Nevertheless, such discrepancy was due to the fact that the authors had found a way to make Shinjuku run faster after the submission of the paper. Thus, as long as the authors can update the claims in the camera-ready version accordingly, we have no problem with this minor difference.

* **Figure 6**: At 85% load (around 635 kRPS), Persephone offers 9.2x, 7x, and 3.6x improved p99.9 latency to Payment, OrderStatus, and NewOrder transactions, compared to c-FCFS, reducing the overall slowdown by up to 4.6x. For a slowdown target of 10x, Persephone can sustain 1.2x and 1.05x more throughput than Shenango and Shinjuku, respectively.
    1. When the throughput is around 635 kRPS, the p99.9 latencies of c-FCFS are 170 us, 170 us, and 180 us for Payment, OrderStatus, and NewOrder, respectively; while those data of DARC are 25 us, 30 us, and 65 us, respectively. This **roughly meets** the expectation set in the paper.
    2. As for the overall performance, the p99.9 slowdowns for c-FCFS and DARC at 85% load are around 25x and 13x, respectively. This **falls below** the expectation.
    3. When the p99.9 slowdown is targeted around 10x, the maximum achievable throughputs of Persephone, Shenango, and Shinjuku are around 610kRPS, 500 kRPS, and 600 kRPS, respectively. This **meets** the corresponding claim.
* **Figure 7**: For a 20x slowdown target, DARC can sustain 2.3x and 1.3x higher throughput than Shenango and Shinjuku, respectively.
  1. We were **not able to reproduce** the figure. Still, the artifact may be eligible for the Replicated badge as the source of problems did not lie at Persephone but another baseline system.
* **Figure 8**: Persephone's profiler picks on the new service time and ratio for each type and accordingly adjusts core allocation.
  1. According to our generated figure, the core allocation did change with the state transition. In terms of the p99.9 latency, whenever DARC's performance becomes stable, the weighted average latency over A and B workloads was no worse than c-FCFS. In all, DARC exhibited an effective reaction towards sudden changes in workload composition as c-FCFS. This **meets** our expectation.
