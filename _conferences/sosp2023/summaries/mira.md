---
title: "Artifact Review Summary: Mira: A Program-Behavior-Guided Far Memory System"
---

{% include_relative _result-header.html %}

## Description of the Artifact

The artifact is hosted on [https://bitbucket.org/mira-sosp23/mira-ae](https://bitbucket.org/mira-sosp23/mira-ae) but no permanent archived version is available as of writting this summary.
It contains mira compiler, mira runtime, a pointer to a specific snapshot of llvm code, scripts for reproducing some figures in the paper and instructions to reproduce figures.

NOTE: The camera-ready/published version of the paper updated some figures and made the figure numbering in the artifact inconsistent with the numbering in the camera-ready paper. An artifact -> camera-ready mapping is provided for clarity[2]. The rest of this summary will stick with the figure numbering used in the artifact.


The artifact in particular reproduces the following results (major ones but not all) from the paper:
1. Figure 5,15,16: The profile guided auto compiling process and the performance metrics of example applications including Edge Traverse, DataFrame and GPT2.
2. Figure 8,9,22: Detailed breakdown of Mira system's performance under different setups (e.g., cache with different line sizes and associativities; multi-threading).

An important deficiency of this artifact is that it does not provide any instructions to setup the baseline system for comparison.

## Environment(s) Used for Testing

All evaluators used the cloudlab instances provided and pre-configured by authors.

The machine type is:
```
Cloudlab C6220 Machine:
c6220 (Ivy Bridge, 16 cores)
CPU 2 x Xeon E5-2650v2 processors (8 cores each, 2.6Ghz)
RAM 64GB Memory (8 x 8GB DDR-3 RDIMMs, 1.86Ghz)
NIC 1 x Mellanox FDR CX3 Single port mezzanine card

OS: Cloudlab Ubuntu Ubuntu 20.04 LTS image, with kernel version 5.4.0-100-generic #113-Ubuntu
MLNX_OFED version: MLNX_OFED_LINUX-4.9-7.1.0.0-ubuntu20.04-x86_64
```

## Step-By-Step Instructions to Exercise the Artifact

To complete the whole evaluation, all evaluators used provided and pre-configured environments so no build/install process were performed.
Evaluators simply ssh into the provided machines and execute ` ./test/scripts/figureXX.sh`.

One evaluator managed to build the artifact binaries on the provided machine from scratch. But the self-built ones did not match the performance of prebuilt binaries provided by authors[3].
The authors believed such difference was caused by environment and artifact limitations that evaluators cannot properly replace all prebuilt binaries with self-built ones. Eventually, the evaluator could not evaluate self-built binaries properly before the deadline.

The build and install procedures the evaluator tried are basically the same as authors' instruction and documented below. But they are not expected to work well given the rather unpolished state of the artifact.

### Build
The main repo is expected to locate in the `/data` folder (i.e., something like `git clone xxx /data`).

First, initialize and fetch the submodule in `compiler/llvm-project`. Then apply patches in the `compiler/patches` to the LLVM module. Then using the following command to build LLVM libraries, replace `DC_INCLUDE_PATH` with your C standrard library include path, which could be found using the command `` `gcc -print-prog-name=cc1` -v``. On cloudlab machines the directories are `/usr/local/include:/usr/include/x86_64-linux-gnu:/usr/include`.

```sh
mkdir llvm-project/build
cd llvm-project/build
cmake -G Ninja ../llvm \
  -DLLVM_ENABLE_PROJECTS="mlir;clang" \
  -DLLVM_TARGETS_TO_BUILD="host" \
  -DLLVM_ENABLE_ASSERTIONS=ON \
  -DCMAKE_BUILD_TYPE=Release \
  -DLLVM_INSTALL_UTILS=ON \
  -DCMAKE_C_COMPILER="clang" \
  -DCMAKE_CXX_COMPILER="clang++" \
  -DC_INCLUDE_DIRS="<your-c-library-path>" \
  -DLLVM_ENABLE_RUNTIMES="libcxx;libcxxabi;libunwind" \
  -DLIBCXXABI_USE_LLVM_UNWINDER=YES \
  -DCLANG_DEFAULT_CXX_STDLIB=libstdc++ \
  -DLIBCXX_ENABLE_EXCEPTIONS=OFF
ninja
```

Then build Mira's compiler and front ends.

```sh
mkdir compiler/build
cd compiler/build
cmake -G Ninja .. \
  -DMLIR_DIR=$PWD/../../llvm-project/build/lib/cmake/mlir \
  -DCLANG_DIR=$PWD/../../llvm-project/build/lib/cmake/clang \
  -DLLVM_EXTERNAL_LIT=$PWD/../../llvm-project/build/bin/llvm-lit \
  -DCMAKE_C_COMPILER="clang" \
  -DCMAKE_CXX_COMPILER="clang++" \
  -DLLVM_TARGETS_TO_BUILD="host" \
  -DLLVM_ENABLE_ASSERTIONS=ON \
  -DCMAKE_BUILD_TYPE=DEBUG
ninja
```

### Install

Most of the artifact used the binaries built within the source directories, no installation is necessary.

But certain components/instructions seem to be missing, especially regarding the memory node (referred as `remote_server`).  The scripts are claimed to take care of everything according to the authors. But the evaluator, who managed to build from scratch earlier, could not confirm the scripts all working correctly. Besides, scripts such as `run_remote.sh` and `run_remote2.sh` are missing from the artifact.

### Run

Execute ` ./test/scripts/figure*.sh`.

The expected runtime of each figure is still missing from the artifact. Authors' response during the AE:
```
Figure 5 15min
Figure 8a and Figure 8b 20min
Figure 9abc 15min each.
Figure 10 30min
Figure 15 10min
Figure 16 50min
Figure 22 10min
```

## How The Artifact Supports The Paper

### The Functional Badge:

All evaluators managed to run all scripts under `./test/scripts/figure*.sh` successfully. Those scripts ran the edge-traverse application under different configurations and ran two relatively more complex appplications: DataFrame and GPT2.

### The Reproduced Badge:

The baseline system (i.e., Leap, Fastswap, AIFM) setup were missing in the artifact and not provided during the AE. Thus evaluators were not able to reproduce any baseline datapoints, only able to collect Mira metrics.

Evaluators confirmed the reproduced results of the following figures were consistent with the data reported in paper: Figure 5,8,9,10,15,16.
Evaluators reported the reproduced results of Figure 22 were NOT consistent with the paper: evaluators observed declining trend when scaling to more threads while the paper showed increasing trend.

The evaluator writing this summary suggested to NOT award the Results Reproduced Badge given the current state of the artifact. The majority including chairs decided to award it as the artifact can demonstrate a working end-to-end flow and all reviewers reported to successfully reproduce almost all results in the artifact.

## Additional Notes and Resources

[1] For the latest version of Mira, readers may check the source code later published on github [https://github.com/WukLab/Mira](https://github.com/WukLab/Mira). But note the benchmarks/applications and scripts are only avaiable in the bitbucket repo as of writting this summary.

[2] The artifact -> camera-ready figure mapping is provided for clarity:
```
figure5.sh  -> Figure 5
figure8{a,b}.sh -> Figure 9
figure9{a,b,c}.sh -> Figure 10
figure10.sh -> Figure 11
figure15.sh -> Figure 16
figure16.sh -> Figure 17
figure22.sh -> Removed in Camera Ready
```

[3] [A google spreadsheet](https://docs.google.com/spreadsheets/d/e/2PACX-1vS8oGIMDuSygYw2p1fjp9jiYSyEY1PfAM49QvxceAWN1xQnx4SM_a2GILNWNN5t1OicoCWLPXiRONLA/pubhtml) captures the numbers that one evaluator collected on the cloudlab instances provided and pre-configured by the authors during the AE process.
