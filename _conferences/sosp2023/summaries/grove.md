---
title: "Grove: a Separation-Logic Library for Verifying Distributed Systems"
---

{% include_relative _result-header.html %}

## Description of the Artifact

The artifact is located at <https://github.com/mit-pdos/grove-artifact>.

The artifact has two conceptual main parts: the Grove verification library, and its mechanized proofs; and the GroveKV, a distributed key-value store, for performance evaluation. GroveKV is crash-safe, distributed, linearizable key-value store, verified using Grove.

Concretely, the artifact is organized around the following four submodules:

1. `go-ycsb` Yahoo! Cloud Serving Benchmark, for performance evaluation. 
2. `gokv` the Go implementation of GroveKV. 
3. `perennial` library that contains the Grove extension library, and specs and proofs of GroveKV. 
4. `redis` copy of redis KV store, for comparison with GroveKV. 

In addition, the artifact includes helpful scripts and a readme, to ease setup and performance evaluation. The artifact contains over 660K lines of code, of which 330K comes from perennial, and 313K from Redis.

## Environments Used for Testing

### Performance testing environment: CloudLab

1. Go to [CloudLab dashboard](https://www.cloudlab.us/login.php)
2. From the navigation menu, choose Experiments > Start Experiment
3. Step "Select a Profile": select or change to `small-lan` 
4. Step "Parameterize":
   - Number of nodes: `8`
   - Select OS image: `UBUNTU 20.04`
   - Optional physical node type: `d430`
   - Checkboxes: unchecked
   - Advanced options: skip
5. Step "Finalize": use default options
6. Step "Schedule": use default options
7. Click finish; the environment will boot.

### Mechanized Proofs: Coq 

The Coq environment is used to compile the proof code. Coq versions 8.17.0 and 8.17.1 were tested during artifact evaluation and were found compatible. If a suitable Coq installation already exists on the local machine, no further setup is necessary. Otherwise, the repository root contains an installation script to prepare a suitable Coq environment. Running the setup takes ~15 minutes.

```
./coq-setup.sh
```

## Step-By-Step Instructions to Exercise the Artifact

These experiments are best performed in the order listed here.

### CloudLab experiments

The performance evaluation switches between environments/machines. The steps are annotated as follows:

- CL = CloudLab website
- LH = local machine/host
- N4 = node4 in CloudLab virtual environment

1. (CL) Set up 8 nodes following the CloudLab setup instructions. 
2. (CL) Once booted, in "List View" tab, take note of the node names -- e.g. `pc800`, `pc801`, ... -- and cluster name.
3. (LH) Cloned the artifact repository to host. Make sure to also clone the submodules.
4. (LH) Edit the `ssh-setup.py`. On line 9 list the allocated CloudLab nodes.

    For example, if the node names are `pc800`, ..., `pc807` and located in the Emulab cluster, the setup script should be:

    ```
    nodes = [ f"pc{n}.emulab.net" for n in [800, 801, 802, 803, 804, 805, 806, 807]]
    ```
   
5. (LH) Edit the `ssh-setup.py`. On line 10, change the username to your own CloudLab username.
6. (LH) run the `ssh-setup.py` script.
7. (LH) Login to CloudLab node4 over ssh.
8. (N4) Run `~/grove-artifact/gokv/simplepb/bench/eval-setup.py` by artifact readme instructions.
9. (LH) Disconnected from node4, then login again.
10. (N4) Run the quick experiment `~/gokv/simplepb/bench.experiments.e2` and check it generates expected files, `reads.dat` and `writes.dat` in `./bench/data/reconfig/`
11. (N4) Start a screen session `screen -S artifact` and launched the long experiments `~/gokv/simplepb/bench/eval-run.py`.
12. (N4) Log out; then return after a few (~3-4) hours.
13. (N4) Generated the experiment plot for figures 6--8 by readme instructions.
14. (LH) Copy the `p.pdf` to host for inspection. 

    ```
    scp /path/to/file username@a:/path/to/destination
    ```

### Exercising the proof code

1. cd into `perennial` submodule
2. Build `print_assumptions.vo` to confirm only expected axioms are used. This step takes ~30 min.

   ```
   make -j`nproc` src/program_proof/simplepb/apps/print_assumptions.vo
   ```
 
3. Manually inspect the lemmas discussed in the Sections 4.4 and 5 of the paper. The artifact readme section "Reading the top-level theorems" provides additional explanation. Confirm that the paper and readme discussion of these lemmas matches the proof code.
4. Following the instructions from artifact readme about Goose tool, confirm that the GroveKV source code is in sync with its formal model in Coq. Change go source code and rerun `update-goose.py`. Observe the proof fails.

## How The Artifact Supports The Paper

**Reproduced badge.** Running the performance evaluation allows to reproduce the performance claims, also presented in paper figures 6--8 (throughput and latency of GroveKV compared to Redis, throughput over time, and peak throughput of GroveKV, respectively). Furthermore, the provided scripts enable high levels of automation, the artifact readme includes time estimates for each step, and the obtained numbers are within reasonable small variation of the expected. Overall, the reviewers concluded unanimously that the artifact supports reproducibility of results.

**Available badge.** The artifact is available in a public GitHub repository and references the paper. The perennial library, which includes Grove, is licensed under permissive terms (MIT license). Redis and go-ycsb are out of scope for this discussion. GroveKV does not have a license. The reviewers found the available criteria is sufficiently met to award the available badge.

**Functional badge.** The artifact is sufficiently well-documented to understand the artifact contents and how to exercise it. The artifact includes all necessary components and source code. The reviewers confirmed the artifact is exercisable by running all described setup steps and experiments. The formalization in Coq is consistent with the provided descriptions. Overall, the artifact is consistent with the paper's claims. The reviewers found artifact satisfies all functional criteria.
