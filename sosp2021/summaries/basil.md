---
layout: single
title: "Artifact Review Summary: Basil: Breaking up BFT with ACID (transactions)"
sidebar:
    title: 'SOSP 2021'
    nav: sosp2021toc
---

## Description of the Artifact

The github repo contains a prototype implementation of Basil, a replicated Byzantine Fault Tolerant key-value store offering interactive transactions and sharding. The prototype uses cryptographically secure hash functions and signatures for all replicas, but does not sign client requests on any of the evaluated prototype systems. The prototype simulates Byzantine Clients failing via Stalling or Equivocation, and is robust to both. The authors had provided details steps to install all tool dependencies and necessary environment setup, script to execute results and compare against related approaches.

## Environment(s) Used for Testing

Evaluators used two different environments

* The CloudLab public profile provided by the authors: <https://www.cloudlab.us/p/morty/SOSP108>.  This includes 37 virtual machines (including a control machine for orchestrating experiments, 18 clients, and 18 servers), each with 16gb or RAM, running Ubuntu 18.04.

* AWS EC2 machines: 10 `c5xlarge` instances for server and 10 instances for clients. Ubunutu-18.04 OS along with the following software tools: `libevent-openssl libevent-pthreads libevent-dev libssl-dev libgflags-dev libsodium-dev libbost-all-dev libuv1-dev python3 C++ 17`

## Step-By-Step Instructions to Exercise the Artifact

The evaluators followed the authors' instructions as written in: <https://github.com/fsuri/SOSP21_artifact_eval#readme>

## How The Artifact Supports The Paper

The results of the evaluators' runs of the experiments mostly matched the paper. One possible exception was that the Client failures experiment, under the RW-U workload, with 98-2 failures, appeared to loop indefinitely. The control machine appeared to kill all the server processes, and start up again. 

While a few samples performed better or worse than as presented in the paper, they did not do so in any way that conflicts with the claims of the paper. 

Specifically, one evaluator produced the following results:
```
Workloads

TxHotstuff

TPCC

Throughput: 853.7	latency: 95.2
Throughput: 830.5	latency: 100.3
Throughput: 865.0	latency: 95.9

Smallbank

Throughput: 6056.7	latency: 50
Throughput: 5893.3	Latency: 51.3
Throughput: 6009.35	Latency: 70.3

Retwis
Throughput: 4698.95	Latency: 62.1
Throughput: 4826.6	Latency: 37.9
Throughput: 4757.0	Latency: 59.7

TxBFTSmart
Note: the configs are different from the TxHotstuff configs, before I change the usernames and such. This caused bugs until I re-wrote the config files. 

TPCC
Throughput: 1306.4	Latency: 60.41
Throughput: 1300.7	Latency: 59.88
Throughput: 1316.2	Latency: 59.79

Smallbank
Throughput: 8768.2	Latency: 19
Throughput: 8786.4	Latency: 18.97
Throughput: 9082.05	Latency: 18.34

Retwis
Throughput: 6253.75	Latency: 24.0
Throughput: 6229.35	Latency: 24.0
Throughput: 6241.05	Latency: 23.7

Tapir

TPCC
Throughput: 20263.9	Latency: 7.4
Throughput: 20632.9	Latency: 7.3
Throughput: 20992.3	Latency: 7.2

Smallbank
Throughput: 64330.7	Latency: 2.27
Throughput: 63684.7	Latency: 2.3
Throughput: 64584.7	Latency: 2.26

Retwis
Throughput: 46376.5	Latency: 1.86
Throughput: 45016.5	Latency: 1.95
Throughput: 44796.6	Latency: 1.97

Basil

TPCC
Throughput: 5284.65	Latency: 28.88
Throughput: 5341.35	Latency: 28.48
Throughput: 5103.5	Latency: 29.72

Smallbank
Throughput: 23475.4	Latency: 12.36
Throughput: 23423.4	Latency: 12.4
Throughput: 23191.8	Latency: 12.5

Retwis
Throughput: 23491.9	Latency: 11.4
Throughput: 23986.5	Latency: 11.2
Throughput: 23168.8	Latency: 11.7


Client Failures

Workload RW-U

No failures: 0%	110.4

failures 90-2
Equiv-forced: 
42%     81.64
42%     84.2
42%     83.4
Equiv-real:
44.8%  113.7
44.8%  113.7
44.8%  112.6
Stall-early
45.7%   107
45.7%   105
45.7%   105
stall-late
44.9%  102.9
44.9%  103.3
44.9%  102.7


Workload RW-Z

No Failures: 0% 70.5

failures 90-2
EquivForced: 27%. 26.4
EquivReal: 35%. 78
StallEarly: 40.2. 50.9
StallLate: 40%. 60.9






Crypto Overheads

RW-U
With Crypto
39349
Without Crypto
125977

RW-Z
With Crypto
4779
Without Crypto
18797



Reads
Single Read
17240
f+1 reads
13731
2f+1
11996



Sharding

Crypto
Scale factor 1
20488
Scale factor 2
23271
Scale factor 3
28055

NonCrypto
Scale factor 1
43952
Scale factor 2
62233
Scale factor 3
91105



FastPath

RW-U
FastPath On
39653
FastPath Off
31307

RW-Z
FastPath On
5295
FastPath Off
3260


Batching Throughput

RW-U
8: 30530
16: 37611
32: 35775

RW-Z
1: 3570
2: 5208
4: 4662
8: 3321
```
