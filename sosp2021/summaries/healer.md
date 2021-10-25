---
layout: single
title: "Artifact Review Summary: HEALER: Relation Learning Guided Kernel Fuzzing"
sidebar:
    title: 'SOSP 2021'
    nav: sosp2021toc
---

{% include_relative _result-header.html %}

## Description of the Artifact

The artifact includes the code base of HEALER, build scripts, and minimal documentation.

All of them are hosted on GitHub, under the author's personal account: <https://github.com/SunHao-0/healer>

## Environment(s) Used for Testing

Three evaluators used private environments:

- a physical machine featuring an Intel(R) Xeon(R) CPU E5-2640 v4 @ 2.40GHz (1TB of RAM) with Debian Buster (Linux 4.19.0-17-amd64)
- a physical machine featuring an Intel(R) Xeon(R) CPU X5670 with Ubuntu 17.10
- a physical machine featuring an AMD FX(tm)-8350 Eight-Core Processor (16GB of RAM) with Ubuntu 20.04.3 LTS

Two evaluators used CloudLab setups:

- a Utah `c6525-25g` node with Ubuntu 18.04
- a Clemson `c6420` node with Ubuntu 20.04 LTS (Linux 5.4.0-77-generic)

## Step-By-Step Instructions to Exercise the Artifact

### Build and Installation

The evaluators first installed dependencies, before building and installing the artifact following author's instructions.

The evaluators reported 6 steps: (1) install dependencies (Rust and Go), (2) build HEALER (`cargo build --release`), (3) compile Linux for the guest image, (4) prepare the guest disk (filesystem) image, (5) setup the HEALER workdir, and (6) build QEMU.

A number of comments on peculiarities or minor difficulties were reported:

- One evaluator reported issues relative to the generation of the kernel image. The first image generated did not work, probably due to missing Linux kernel configuration options. After enabling all options as specified in Syzkaller's documentation, the image worked.
- Certain evaluators generated Debian Stretch guest filesystems, others went for Debian Buster. Both are fine.
- One evaluator has difficulties building `syz-executor` due to an old version of GCC.

### Running & Reproducing Crashes

Following the installation, evaluators ran the artifact for various amounts of time.

HEALER ran successfully for at least 6 consecutive hours.

Here too, a number of comments on peculiarities or minor difficulties were reported:

- At first, a crash related to `unwrap()` was encountered after about 45mn by several evaluators. This is a known issue; after applying author's fix, the artifact worked successfully.
- Between each run, the output directory had to be backed up and removed, but this was later addressed by the authors as well.
- A number of crashes found by HEALER during the evaluation were invalid, but the output of the fuzzer makes it hard to differenciate between valid and invalid crashes. In general, evaluators reported difficulties to evaluate the progress of the fuzzer.

Overall, evaluators report that getting HEALER to run was fairly straightforward.

### Code Inspection

Several evaluators inspected the code to match the implementation with the paper's claims (see next sections).

## How The Artifact Supports The Paper

The evaluators confirmed that the artifact is available: <https://github.com/SunHao-0/healer>

The evaluators confirmed that the artifact is functional:
- The artifact documentation contains detailed instructions on how to set up all required dependencies and run HEALER.
- HEALER found crashes after about 1h30. In the course of about 6h, HEALER found 21 crashes.

The code inspection confirmed that the artifact matches the paper's claims:
- The overall architecture seems to match Figure 3
- From a high-level PoV, HEALER makes use of a relation table filled in statically and dynamically and uses the Syzlang
- The relation learning routines in the source code seems to match the algorithms described in the paper (see additional notes)

## Additional Notes and Resources

Links to algorithm implementations in the source code:

- the 2D relational table to record the influence relations (`struct Relation` with `influence` and `influence_by`): <https://github.com/SunHao-0/healer/blob/4102214efc5b9e4fe62ed7194ccbdd5819ded23c/healer_core/src/relation.rs#L51>
- Algorithm 1: <https://github.com/SunHao-0/healer/blob/4102214efc5b9e4fe62ed7194ccbdd5819ded23c/healer_core/src/gen/mod.rs#L194>
- Algorithm 2: <https://github.com/SunHao-0/healer/blob/4102214efc5b9e4fe62ed7194ccbdd5819ded23c/healer_fuzzer/src/fuzzer.rs#L239>
- Algorithm 3: <https://github.com/SunHao-0/healer/blob/4102214efc5b9e4fe62ed7194ccbdd5819ded23c/healer_core/src/select.rs>
