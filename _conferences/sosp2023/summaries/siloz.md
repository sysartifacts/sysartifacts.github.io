---
title: "Artifact Review Summary: Siloz: Leveraging DRAM Isolation Domains to Prevent Inter-VM Rowhammer"
---

{% include_relative _result-header.html %}

## Description of the Artifact

The artifact is available in a public [git repository](https://github.com/efeslab/siloz/tree/08c642c86256d0193ff5b14b7c4b211b7edb1472).

It contains the prototype of the Siloz hypervisor, which is implemented as a set of extensions to the Linux/KVM hypervisor shipped with Ubuntu 22.04 (tag: [Ubuntu-5.15.0-43.46](https://git.launchpad.net/~ubuntu-kernel/ubuntu/+source/linux/+git/jammy/commit/?id=b8509484e0bab1dd935e504fa1b1f65a3866f0f6)).
The artifact also provides a modified version of QEMU 6.2, which Siloz requires.

The artifact has a README file with high-level documentation such as implementation details, dependencies, build and installation instructions, and instructions for a minimal working example.
It includes all the components described in the paper and it uses consistent terminology and naming. 

The artifact also includes helpful configuration files and scripts that streamline the process of provisioning and booting an example virtual machine on top of Siloz.

## Environment(s) Used for Testing

The authors provided `ssh` access to a private testbed.
The artifact evaluation was performed on a physical machine in the provided testbed.
The machine had already been provisioned by the authors and was running the artifact (Siloz hypervisor) and an example guest (Ubuntu VM).

Testbed configuration that could be confirmed by the reviewers:
- Host:
  - Dual-socket Intel Xeon Gold 6230 CPU @ 2.1 GHz (40 logical cores per socket)
  - 384 GiB DRAM
  - Siloz hypervisor (Ubuntu 22.04.2 LTS + Linux/KVM 5.15.0-47-generic-siloz (generic configuration + Siloz extensions))
  - QEMU 6.2.0 (Debian 1:6.2+dfsg-2ubuntu6.12)
- Guest:
  - 40 cores
  - 160 GiB DRAM
  - Ubuntu 22.04.1 LTS + Linux 5.15.0-48-generic (generic configuration)

Note:
The Siloz prototype implements support for running natively on dual-socket Intel Skylake and Intel Cascade Lake servers using (1) the physical-to-media address mapping provided by the default (`adaptive`) DRAM page policy and (2) assumed subarray sizes of 512, 1024, and 2048 rows.
Other configurations -- including the `close` DRAM page policy -- are not yet supported in the prototype, may require alternative physical-to-media address translation drivers, and may require additional code modifications described in the paper (e.g., offlining potential cross-boundary pages).
On the testbed machines, the authors verified that the `adaptive` page policy is in use via `sudo setpci -s 3a:0a.0 87c.b`, where the least significant bit of the return value should be 0 (*per "Second Generation Intel® Xeon® Scalable Processors Datasheet, Vol. 2" (section 3.1.2, page 20)*).
The authors also verified that ADDDC is disabled, which forces the DRAM page policy to be `close` if enabled.

## Step-By-Step Instructions to Exercise the Artifact

The artifact documentation contains detailed instructions on how to build, install, and boot the Siloz hypervisor.
Therefore, we have attempted to reproduce the artifact from scratch on Cloudlab `c6420` servers.
The Siloz hypervisor and the modified QEMU sources can be successfully built and installed on the machines.
However, after following up with the authors, we found that the required DRAM page allocation policy is not enabled in the BIOS of the Cloudlab servers, rendering them incapable to boot Siloz.

On the other hand, using the provided testbed, we were able to verify the functionality of the artifact.
We performend the following steps:

- confirm that the host is running the Siloz hypervisor

  `uname -r`
  expected: `5.15.0-47-generic-siloz+`

- confirm that the system is aware of Siloz's logical NUMA nodes

  `numactl --show`
  expected: shows all of Siloz's logical nodes as options for `membind`

- confirm that the properties of the NUMA nodes correspond to the information/node mapping described in the paper

  for node `X`: `cat /sys/devices/system/node/nodeX/meminfo`
  expected: According to the node mapping provided in the paper, nodes numbered 6 and above are guest-reserved and filled entirely with hugepages (`HugePages_Total`).
            Since the running VM is using huge pages from nodes [6, 114], there are few (if any) `HugePages_Free` on these nodes via the node's meminfo.
            In contrast, all huge pages remain free on nodes with higher numbers.

- confirm that the guest is functional

  login via `ssh`
  expected: works

- confirm that the guest has been provisioned with the correct evaluation parameters (CPU cores, DRAM size, etc.) as described in the evaluation section of the paper

  `nproc`, `free -g`
  expected: displays correct configuration

- run benchmark for memory profiling in the guest

  with root privileges: `~/git/subarray-benchmarking/profile.sh`
  without root privileges: `~/mlc_v3.9a/Linux/mlc --max_bandwidth`

- audit benchmark results

## How The Artifact Supports The Paper

We have identified two claims in the paper:

  1. Siloz can enforce isolation and reliably prevent inter-VM bit flips.
  2. Siloz’s implementation has a negligible impact on the average performance of various cloud workloads.

Following the instructions in the documentation, some reviewers were able to successfully reproduce the build and the installation of the artifact on a public Cloudlab machine.
As mentioned above, we were unable to boot the artifact there because we could not change the DRAM page allocation policy.

Regarding the functionality of the artifact provided on the author's private testbed, we are convinced that a) the instance does indeed run the submitted artifact, and that b) the results of the steps taken during the evaluation support claim 1 of the paper.
Therefore, we have unanimously decided to award the *Artifact Functional* badge.

However, we also identified room for improvement in the presentation of the artifact.
Some reviewers criticized that the intended exploration process solely incorporates the read/write bandwidth test for Siloz, omitting both a comparative analysis with a baseline approach and a security test to demonstrate the effectiveness of inter-VM Rowhammer prevention.
This is rather unfortunate, as we consider this security property to be a key feature and selling point of the artifact.
To better highlight the achievements of this work, we recommend improving the minimal working example.

As an aside, the evaluation in the testbed does not support claim 2, but again, this limitation is attributed to the evaluation process rather than being a shortcoming of the artifact itself.
Furthermore, claim 2 is concerned with reproducible results, which were outside the scope of this evaluation.

## Additional Notes and Resources

We thank the authors for submitting a well-packaged artifact with extensive documentation, and for their responsive and thorough communication during the evaluation phase.

