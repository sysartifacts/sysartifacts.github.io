---
title: "Artifact Review Summary: Caracal: Contention Management with Deterministic Concurrency Control"
---

{% include_relative _result-header.html %}

## Description of the Artifact

The authors provide an open-source version of Caracal through Github: <https://github.com/uoft-felis/felis> and <https://github.com/uoft-felis/felis-controller>

The code is divided between 2 repositories: `felis` and `felis-controller`. `felis` contains the source code of Caracal, while `felis-controller` contains configuration and evaluation related scripts. Additionally, the authors provide instructions on how to install, build, run and process results.

## Environment(s) Used for Testing

The evaluation was performed on several physical machines provided by the authors. This environment consisted of HP ProLiant DL560 and DL160 Gen8 nodes with 512 GB of RAM and commodity 10 GB Ethernet cards. Some nodes run Xeon E5-4620 CPUs (DL560s), while others run Xeon E5-2650 CPUs (DL160s).

In terms of software, the machines had CentOS version 7.9.2009 with Linux kernel 3.10.0-1127.13.1.el7.x86_64 (released on Aug 7, 2019), Clang 9, and OpenJ9 installed. In addition, `felis` requires Homepages for memory allocation in order to reduce TLB misses. The default configuration provided by the authors reallocated 400 GB Homepages. 

## Step-By-Step Instructions to Exercise the Artifact

Instructions provided by the authors were largely sufficient to successfully install, build, and run Caracal. However, a few Shell commands needed tweaking --- they were either mistyped or did not produce the desired result --- which the authors promptly corrected.

The narrative below describes the steps taken by the reviewers to exercise Caracal. Note that commands for `felis` are intertwined with those for `felis-controller`.

#### Configuration

Assuming, Clang 9 and OpenJ9 are already installed, first step is configuring `felis`:
```
cd ~/felis/./configure
```

Users also need to configure Homepages for memory allocation (note that in Linux, the Homepages size is $$2 MB by default)
```
echo 204800 > /proc/sys/vm/nr_hugepages
```

Finally. Users need to set up OpenJ9 for `felis-controller`. The controller can be run on `local host` (for single-node experiments) or on a separate machine (for mutl0node experiments), and thus environment variables should be exported accordingly:
```
export PATH=/pkg/java/j9/bin:path
export JAVA_HOME=/pkg/java/j9
```

#### Build

Building `felis` in `Release` mode requires users to run:

```
cd ~/felis/
buck build db_release
```

Alternatively, users have the option to build `felis` in `Debug` mode (which at the time of this writing was the default option):
```
cd ~/felis/
buck build
```

The final step requires building `felis-controller`: 
```
cd ~/felis-controler/ 
mill FelisController.assembly
```

This last command generates a standalone `jar` file --- `out/FelisController/assembly/dest/out.jar` --- to be run standalone before starting `felis` (see below).

#### Run

The first step in running Caracal is to first start `felis-controler`. The controller either runs on `local host` (for single-node experiments) or on a separate machine (for multi-node experiments). The latter requires manually configuring the IP address in `con fig.json`.

The standalone `jar` file generated previously can be exercised directly:
```
cd ~/felis-controler/ 
java -jar out/FelisController/assembly/dest/out.jar con fig.json
```

However, if users share the machine, they need to avoid cache conflicts:
```
java -Dvertx.cacheDirBase=/tmp/user/ -jar out/FelisController/assembly/dest/out.jar con fig.json
```

Once the controller is initialized and running, users needs to start an evaluation workload on each node:
```
cd ~/felis/
buck-out/gen/db#release -c 127.0.0.1: -n host1 -w tpcc -Xcpu16 -Xmem20G -XVHandleBatchAppend -XVHandleParallel
```
where `-c` configures the IP address of the `felis-controller` (`127.0.0.1` for single-node, or user-provided for multi-node), `-n` specifies the name of the host and `-w` specifies the workload. The `-X` options allow users to specify extended arguments. A complete description of the available options/parameters can be found in `~/felis/opts.h`.

At this stage each node will initialize a workload data set. Once idle, nodes await further commands from the controller. Users can signal to the controller that all nodes can proceed by running:
```
curl local host:/broadcast/ -d '{"type": "status_change", "status": "connecting"}'
```

Finally, users can signal the controller to gracefully shut down by running:
```
curl local host:/broadcast/ -d '{"type": "status_change", "status": "exiting"}'
```

### Debugging and logs

To debug Caracal's components, users can inspect `dbg-$hostname.log` when running in `Debug` mode. By default, logging is set to minimal (i.e., the `info` option), but users can choose from different verbosity levels (`trace`, `debug`, `warning`, `error`, `critical`) or even disable logging altogether (`off`).

## How The Artifact Supports The Paper

#### Available Badge

The evolution confirmed that Caracal is publicly available on Github: <https://github.com/uoft-felis/felis> and <https://github.com/uoft-felis/felis-controller>. Additionally, the authors provide detailed instructions on how to install, build, and run the artifact, while also providing the scripts used during the paper's evaluation.

#### Functional Badge

The authors provide detailed instructions to download, install, build, and run Caracal. Throughout the reviewing process, the authors also fixed/corrected a few steps that were either mistyped or did not produce the desired outcome. Consequently, the reviewers were able to successfully exercise Caracal, and confirm that the artifact coincides with what the paper describes.

As a suggestion for future improvement, the reviewers believe Caracal could benefit from automating results post-processing (e.g., aggregating numbers, generating plots).

#### Results Replicated Badge

Overall, the reviewers were able to replicate almost all results in support of the paper's main claims. Numbers obtained during this independent evaluation follow similar trends as those in the paper. However, 3 out of 4 reviewers reported difficulties when replicating 2 of the measurements:

1. Fig 5a: re-running the experiment initially showed that both Bohm and PWV scale poorly. Moreover, Caracal appears to be less scalable than originally claimed when using the Granola workload.

2. Fig 7c: re-running the experiment for single for the warehouse TCP-C workload shows that although the `batch-append` optimization achieves the most throughput, `bin-packing` appears to scale similarly to the `no-optimization` version. Moreover, the plot for the overall scalability of Caracal follows that of `bin-packing`. This suggests that the proposed optimizations have little effect on the artifact's scalability for this particular workload.

The authors investigated these inconsistencies, concluding that:

1. Fig 5a: bin-packing can produce worse results as a known side effect of the partition/update algorithm, and 

2. Fig 7c: batch-append fluctuating scalability values are due to an outlier in the TCP-C workload (i.e., 1 extremely contended row that dominates all others).

Given the initial replication success rate and the ensuing discussion with the authors, reviewers agree that Caracal's main claims can be independently verified up to a reasonable degree.
