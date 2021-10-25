---
layout: single
title: "Artifact Review Summary: Witcher: Systematic Crash Consistency Testing for Non-Volatile Memory Key-Value Stores"
sidebar:
    title: 'SOSP 2021'
    nav: sosp2021toc
---

{% include_relative _result-header.html %}

## Description of the Artifact

The artifact is publicly available [on GitHub](https://github.com/cosmoss-vt/witcher). The artifact
was evaluated at [commit ad69038](https://github.com/cosmoss-vt/witcher/tree/ad69038cdcd4ac20f1bde38ebf7e6d9fd6999b36).

The artifact contains the following:

- A [set of instructions](https://github.com/cosmoss-vt/witcher/blob/sosp21-ae/README.md) that describes how to use the artifact.
- A fork of Giri, a dynamic program slicing tool implemented on LLVM, that the authors extended to support PM
tracing and the invariant analysis required by Witcher.
- Access to a ready-to-use virtual machine image ([hosted on Google Drive](https://github.com/cosmoss-vt/witcher#download-the-vm-image-in-google-drive)) which contains all dependencies pre-configured and pre-installed that are required to run the artifact.
- A collection of Python scripts that run Witcher and run the third-party applications used in evaluation section of the paper.
- Lists of the [correctness](https://github.com/cosmoss-vt/witcher/blob/sosp21-ae/bugs/sosp21-correctness-bugs.md) and [performance](https://github.com/cosmoss-vt/witcher/blob/sosp21-ae/bugs/sosp21-performance-bugs.md) bugs that present the details of found bugs in the paper.

## Environment(s) Used for Testing

The evaluators were able to use the author-provided virtual machine image (using `qemu-system_x86`) running
on a host machine equipped with Intel(R) Xeon(R) Gold CPUs and at least 64GB of DRAM and 100GB of storage.
The evaluators were also able to evaluate the artifact on a bare-metal machine running 64-bit Fedora 29 with a
similar CPU, memory, and storage configuration as used to run the virtual machine.

## Step-By-Step Instructions to Exercise the Artifact

The evaluators first had to install `gdb` (both on the author-provided virtual machine and on a bare-metal installation), as `gdb` is a dependency of Witcher. This can be done by running the following:

```sh
sudo yum install gdb
```

The evaluators then ran the remainder of the [dependency installation instructions](https://github.com/cosmoss-vt/witcher#dependencies) first before running the other installation and compilation steps.

For the ["Setup from scratch"](https://github.com/cosmoss-vt/witcher#setup-from-scratch) instructions (applicable only when not using the author-provided virtual machine image), the evaluators substituted the "get source" instructions under [Installation of llvm and clang 9.0.1](https://github.com/cosmoss-vt/witcher#installation-of-llvm-and-clang-901), with the following:

```sh
mkdir -p $LLVM9_HOME
wget https://github.com/llvm/llvm-project/releases/download/llvmorg-9.0.1/llvm-9.0.1.src.tar.xz
wget https://github.com/llvm/llvm-project/releases/download/llvmorg-9.0.1/clang-9.0.1.src.tar.xz
wget https://github.com/llvm/llvm-project/releases/download/llvmorg-9.0.1/compiler-rt-9.0.1.src.tar.xz
tar xvf llvm-9.0.1.src.tar.xz && rm -f llvm-9.0.1.src.tar.xz
tar xvf clang-9.0.1.src.tar.xz && rm -f clang-9.0.1.src.tar.xz
tar xvf compiler-rt-9.0.1.src.tar.xz && rm -f compiler-rt-9.0.1.src.tar.xz
cp llvm-9.0.1.src/* $LLVM9_HOME
cp clang-9.0.1.src/* $LLVM9_HOME/tools/clang
cp compiler-rt-9.0.1.src/* $LLVM9_HOME/projects/compiler-rt
```

The evaluators were then able to follow the remainder of the instructions provided with the artifact as written.

## How The Artifact Supports The Paper

The artifact is available; The authors provide the source code, documentation, and examples on GitHub that match the description of the system in the paper. The artifact is also functional; Witcher can be built and run with minimal modifications to the author-provided instructions. The instructions for running the experiments are straightforward and many of the experiments described in the paper can be easily run using the provided instructions. So, the artifact is available and is functional in its current state and meets the criteria for these badges ("Artifacts Available" and "Artifacts Evaluated - Functional").

## Additional Notes and Resources

### Experiment Notes

Under the instructions for [running the scripts to generate figures/tables from the paper](https://github.com/cosmoss-vt/witcher#play-1), a future user should note that `python3 $WITCHER_HOME/script/instrument.py` must be run after making any modifications to `$WITCHER_HOME/script/tasks.py` file.

Additionally, the evaluators encountered issues instrumenting (i.e., running `instrument.py`) on the `P-HOT` and `redis` experiments (listed in `tasks.py`), so future users may also encounter issues with these experiments as well.

### Bug Diagnosing Instructions

The authors provided an overview of how to manually find correctness bugs found by Witcher, which may be of interest to future users interested in further exploring some of the bugs detailed in [the provided bug lists](https://github.com/cosmoss-vt/witcher/blob/sosp21-ae/bugs/sosp21-correctness-bugs.md):

    Take Level_Hash as an example:

    path: $WITCHER_HOME/benchmark/Level_Hashing/random/2000/replay-output-p/res
    file: classify_res_details
        it shows the grouping result
        for example, pm.img-0-99664-99661-output: 0 is the crash operation id, 99664 is the crash fence id, 99661 is the crash store id
    file: atmoic_write.pmtrace
        it shows the collected trace
        search for the crash store/fence id, then you can reason about the crash state
