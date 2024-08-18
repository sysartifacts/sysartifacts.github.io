---
title: "Artifact Review Summary: Validating JIT Compilers via Compilation Space Exploration"
---

{% include_relative _result-header.html %}

## Description of the Artifact

The research artifact is made for Artemis: Validating JIT Compilers via Compilation Space Exploration. It contains a minimal example to test HotSpot's JIT compilers (revision: bd9c2fb38532) using Artemis, which is open-sourced at [https://github.com/test-jitcomp/Artemis](https://github.com/test-jitcomp/Artemis) and archived at [https://zenodo.org/records/8188346](https://zenodo.org/records/8188346).

The artifact, primarily focused on the JIT-Op Neutral Mutation(JoNM) strategy, is an implementation aimed at uncovering JIT compiler bugs by introducing neural loops at pivotal program junctures to discern discrepancies in compilation outputs. Comprehensive setup and usage instructions accompany the artifact, presented in a detailed README on Zenodo. Additionally, a Docker Hub image of the Artemis tool has been provided for ease of setup. This hands-on artifact offers users the chance to trigger JIT Compiler anomalies via Artemis and provides a platform for active JIT Compiler evaluations. Moreover, the tool is publicly accessible via its GitHub repository, ensuring transparency and community engagement.

## Environment(s) Used for Testing

According to the authors, to build and run the artifact, the evaluating machines are required to:

- be backed by Intel or AMD *x86_64/amd64* chips, at least 8 GiB memory,
- with Ubuntu or macOS operating system, and the [Docker](https://docs.docker.com/engine/install/) tool installed, and
- have good internet connection to [Docker Hub](https://hub.docker.com/).

The authors have tested the artifact on Ubuntu 20.04 with AMD EPYC 7742 64-Core (252GiB) and macOS Ventura 13.4 with Quad-Core Intel Core i5 (8GiB).

The artifact is also successfully evaluated on the following environments:

- Environment A: Native hardware, physical machine

    - Darwin 22.2.0 with arm64, 10 cpu physical cores, 16.00GB virtual memory

    - Docker 24.0.2

- Environment B: 

    - Ubuntu 16.04 xenial with 4x Intel Xeon CPU E7-4850 v4 @ 2.8GHz (252GiB)
    - Docker 19.03.4

- Environment C:

    - Machine1: Debian 12 with 3.2 GHz 8-core AMD Ryzen 7 5800H (16GiB)
    - Machine2: macOS Ventura 13.5 with 2.6 GHz 6-Core Intel Core i7 (16GiB)

- Environment D:

    - Arch Linux (Linux 6.1) with AMD Ryzen 7 5800H with Radeon Graphics (16) @ 3.2 GHz  (16GiB)
    - Docker 24.0.5

- Environment E:

    - Ubuntu 20.04 with 32 GB RAM and 16 cores

## Step-By-Step Instructions to Exercise the Artifact

The evaluators generally follow the instructions described in the README:

- Step 1: Pull and Run a Docker Container

```bash
docker pull leetsong/artemis-sosp23ae:latest
# Notice, for some old versions of Docker (like 19.X), you need to add '--security-opt seccomp=unconfined' when docker run
docker run -itd --name sosp_ae_57 leetsong/artemis-sosp23ae:latest
docker exec -it sosp_ae_57 /bin/bash
```

- Step 2: Mutate an Example Seed Prgram by Artemis

```bash
# mutate the seed program by Artemis and save it as /artemis/example/crash/mutant/Test.java
java -jar /artemis/artemis/artemis.jar -v -s 3980266633 -p artemis -m 1000 -M 20000 -b /artemis/code_bricks -o /artemis/example/crash/mutant -i /artemis/example/crash/Test.java
cat /artemis/example/crash/mutant/Test.java | grep ax
```

- Step 3: Crack HotSpot's JIT Compiler C2 by Artemis-Generated Mutant

```bash
# Compile the mutant
/artemis/example/hotspots/jdk11u.bd9c2fb38532/bin/javac -cp /artemis/example/crash/mutant/ /artemis/example/crash/mutant/Test.java
# run the mutant via the HotSpot build
/artemis/example/hotspots/jdk11u.bd9c2fb38532/bin/java -cp /artemis/example/crash/mutant Test
# after the command above, HotSpot build will crash

# disables JIT compilation and HotSpot will execute the mutant with its interpreter only, no crash happend
/artemis/example/hotspots/jdk11u.bd9c2fb38532/bin/java -cp /artemis/example/crash/mutant -Xint Test
```

- Step 4: Test HotSpot's JIT Compilers by Artemis

```bash
cd /artemis/artemis
python3 artemi.py ../example/artemi.yaml
```

- Step 5: Check the Testing Results (If Any). 

Some of the evaluators got no result after several hours of running. And some others found some bugs after more than 12 hours test.

```bash
# Check results at /artemis/example/out/differences/diffs.csv, where each subdirectory /artemis/example/out/differences/<diff_id> saves the information of one detected bug, including the used seed program (<diff_id>/Test.java), the Artemis-generated mutant (<diff_id>/mutant/Test.java), the output of the seed (<diff_id>/reference.txt), the output of the mutant (<diff_id>/mutant.txt), and Artemis' mutation log (<diff_id>/mutant/mutations.txt).
```

- Step 6: Stop and Cleanup Artemis

```bash
docker rmi leetsong/artemis-sosp23ae:latest
```

- Step 7: Check All Reported JIT Compiler Bugs of HotSpot, OpenJ9 and ART. 

We manually checked parts of the reported bugs, including Hotspot [JDK-8287223, JDK-8290862, JDK-8305428, JDK-8288190 (inaccessible)] OpenJ9 [15476, 15874] and ART [230079540, 230635320]. Based on this spot-check, the bug list is credible and the POCs were indeed generated by Artemis according to the code styles.

## How The Artifact Supports The Paper

The **Artifacts Available** and **Artifacts Evaluated - Functional** badges were awarded. 

**Availability.** The docker image, readme instructions, and github repository are publicly accessible, which can support the **Artifacts Available badge**.

**Functionality.** According to the paper and artifact materials, the authors have the following claims:

1. Artemis ia able to mutate the test program with the method of CSE.
2. Some mutants generated by Artemis can cause the JIT compiler to crash, which means that Artemis can be a bug-finding tool for the HotSpot JIT compiler.
3. Artemis has found many bugs in HotSpot, OpenJ9 and ART.

Through the multi-level evaluation steps in the provided README, Claim 1 is validated by Step 2~3, and Claim2 is validated by Step4-7. Especially, by inspecting the reported bugs in Step7, Claim 3 is also validated. So we think this artifact can support the paper's claims and award the **Artifacts Evaluated - Functional badge**.

## Additional Notes and Resources

This artifact is well evaluated by evaluators and there is a consensus: Artemis, as an innovative method, can find bugs in JIT compilers, but bug discovery itself is causal and time-consuming. Therefore, as an Artemis user, it is better to modify the configuration for higher concurrency and be patient when exploring potential bugs.
