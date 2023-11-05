---
title: "Artifact Review Summary: Paper [Enabling High-Performance and Secure Userspace NVM File Systems with the Trio Architecture]"
---

{% include_relative _result-header.html %}

## Description of the Artifact

### Artifacts location

https://github.com/vmexit/trio-sosp23-ae

### Artifacts commit/tag/version

commit `8fa7f8338812d935d6a379d724db815e9f2c39c3`

### Paper summary

The paper introduces the concept of Userspace Library File Systems (LibFSes) which aims to leverage the performance capabilities of non-volatile memory (NVM) by allowing direct access to it. This approach empowers unprivileged applications to tailor LibFSes according to their specific workloads. However, the advantage of this approach raises a significant concern about maintaining metadata integrity. The existing methods either compromise NVM's potential performance or sacrifice the file system's essential security guarantees.

The paper presents Trio, an innovative architecture designed for userspace NVM file systems. Trio effectively addresses the inherent challenge by clearly separating file system design, access control, and metadata integrity enforcement. The key insight is that auxiliary state within a file system can be regenerated from its core "ground truth" state. As a result, Trio defines a core state's data structure that is shared as common knowledge between LibFSes and a trusted entity. This setup enables LibFSes to directly access NVM without requiring the involvement of the trusted entity, while still allowing customization with private auxiliary states. The trusted entity ensures metadata integrity by validating a file's core state when write access transitions from one LibFS to another.

Furthermore, the paper introduces ArckFS, a versatile file system resembling POSIX, and two customized file systems built on the Trio architecture. The evaluation demonstrates the superior performance of ArckFS compared to existing NVM file systems, with improvements of up to 34.2×. Additionally, the customized file systems surpass ArckFS's performance by an additional factor of 1.3×. These findings emphasize the efficacy of Trio in mitigating the trade-off between performance and integrity in userspace NVM file systems.

### Artifact summary

The submitted artifacts are available in a public repository and include:

- Source code of customized Linux kernel

- Source code of arckfs

- Source code of other file system to be evaluated

- Scripts of

	1. Automatic installation of dependecies(dedicated to Ubuntu Linux)

	2. Compile and install the file system

	3. Run the benchmark

	4. Parse data and draw the figure

- Instructions of steps above

- Expected execution time for each benchmark, and known issues that may occur during the evaluation

## Environments Used for Testing

### Environment 1

- Intel Xeon Silver 4215 CPUs (8 cores, 2 sockets),

- 128 GB of first-gen Optane per socket,

- 64 GB DRAM per socket,

- fedora 38,

- docker container (Ubuntu 20.04)

### Environment 2

- Intel Xeon Gold 5220 CPUs (18 cores, 2 sockets),

- 512 GB of first-gen Optane per socket,

- 192 GB DRAM per socket,

- fedora 38,

- docker container (Ubuntu 20.04)

### Environment 3

- Intel(R) Xeon(R) Gold 6238R CPU @ 2.20GHz (28 cores per socket, 2 sockets),

- 384GB DRAM,

- 1.5 TB Optane PMM,

- 350 GB Intel Optane SSD PX4800,

- fedora 32,

- docker container (Ubuntu 20.04)

## Step-By-Step Instructions to Exercise the Artifact

- Set up a Docker container with Ubuntu 20.04 as instructed

	> If you are in Ubuntu 20.04, container isn't needed

- Build the kernel and kernel modules inside the container (as RPM), then installed it to the host system

	> Note: Building the kernel outside the container as instructed caused crashes later on, probably due to different compilers

- Reboot to the new kernel, **disabled hyperthreading**

	> Note: The instructions suggest disabling hyperthreading for running the benchmarks, but it is actually necessary to disable hyperthreading already for compiling the benchmarks since the build scripts seem to record the system configuration at build time.

- Compile and install the arckFS file system

- Compile and install benchmarks

- Run `run-test.sh` and check whether it is bug-free

- Run `run-all.sh` to collect sample data

- Run `parse.sh` and `fig.sh` to parse and generate figures

> If you are on a server **less than 12 cores**:

> - current configuration uses **12 cores** for access delegation

> - reduce number of delegation threads by changing Line 39 of `eval/scripts/common.sh` from `DTHREADS=12` to `DTHREADS=<LESS THAN CORES OF YOUR CPU>`

> Double check whether your **CPU core number is in sequence**, i.e. cores 0-27 are in NUMA node 0, and core 28-55 are in NUMA node 1. If not, you can try VM to bind vCPU 0-27 to NUMA node 0, etc.

## How The Artifact Supports The Paper

This artifact gives us the claims they want for this paper (https://github.com/vmexit/trio-sosp23-ae/blob/master/docs/main-claim.md). With these main claims, we can confirm that the implementation of this artifact can support the paper.

We run all the tests to confirm that each claim is met, details are as follows:

### Environment 1 & 2

Machines only have 16/36 cores, so it can only look at a small part of some of the author's graphs (which go up to 224 cores), and we do not attempt to reproduce SplitFS in these environments.

#### 1. Single thread performance (Sec 6.2) ✔

   - Figure 5 (a) looks as expected for read and write performance

   - Figure 5 (b) looks as expected, though ArckFS faster than OdinFS by a much smaller margin than in the paper.

   - Figure 5 (c) and (d) are as expected

#### 2. Data operation performance (Sec 6.3) ✔

   - The claims for Figure 6 match the graphs I could obtain on my machines for up to 16/36 threads.

#### 3. Scalability (Sec 6.4) ✔

   - Figure 7 looks as expected for 1-16/36 threads and supports the author's claim.

#### 4. Macrobenchmarks (Sec 6.6) (ok)

   - Figure 9 (a) and (b) show OdinFS sometimes outperforming ArckFS which does not happen in the figure in the paper, but is consistent with the claims.

   - Figure 9 (c) is consistent with the paper and the claims.

   - In Figure 9 (d), ArckFS shows a large dip in performance for 8 threads on my small machine and 16 threads on my large machine.

   - Table 5: ArckFS is slower than NOVA and WineFS for fill100k on both my machines (e.g., ArckFS 3.59, WineFS 5.15 on my large machine). The other rows are consistent with the paper and the claims.



#### 5. Customized file systems (Sec 6.6)

   - FPFS is slower than ArckFS on both my machines, which does not match the author's claims.

   - KVFS is faster than ArckFS, as expected.

#### Conclusion

After reducing the number of delegation threads on these small machines, as suggested by the authors, we were able to reproduce most of the paper's claims. In addition, we were able to reproduce most of the claims without modification on a larger machine. We do not believe that the claims we could not reproduce (outliers at the highest thread count in Figure 9, FPFS slower than ArckFS) are problematic in context, so we support awarding the Results Reproduced badge.

### Environment 3

#### Claim #1

- Some data are missing, and it is possible that runtime errors may have influenced the outcomes.

- Figure 5(b) presents data only for OdinFS and ArckFS, which show similar performance. This figure does not support the claim that ArckFS should outperform other file systems.

- Other data are expected.

#### Claim #2

- With small access sizes, claim meets.

- With large access sizes, only result of write meets the claim. The test results for read operations show that ArckFS does not have a performance advantage compared to other file systems.

- In addition to larger access sizes, the claim that "ArckFS always outperforms OdinFS" is met.

#### Claim #3

- The claim is met.

#### Claim #4

- In the benchmark tests for Webproxy and Varmail, data for ArckFS is absent, as well as data for some other file systems.

- In Filebench and Webserver, the assertion does not hold up, as ArckFS is comparable or marginally superior to other file systems.

#### Claim #5

- The claim is met.

#### Conclusion

In this environment, some claims fails because CPU cores is not in sequence. However, this machine has enough CPU resources to produce some information that environment 1 and 2 don't support.

In general, the main performance claims in the paper are that (a) direct NVM access improves LibFS performance since it avoids the communication between LibFS and a trusted entity (e.g., a privileged process for kernel) and (b) customized LibFS enabled by Trio can further improve performance over a generic LibFS.

Based on the results, claim (b) has been mostly reproduced. Regarding claim (a), we have mostly reproduced the results of metadata-intensive workloads. **Hence, it seems to us that a significant portion of the key claims from the paper have already been reproduced**. Most failed-reproduced claims are on data-intensive workloads. For such workloads, the performance largely depends on many hardware-dependent factors, such as CPU cache sizes, prefetching algorithms, SIMD instructions implementations, and PM interleaving.

Therefore, we can consider this result as complementarity.
