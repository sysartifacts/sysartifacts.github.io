---
layout: single
title: "Artifact Review Summary: The Aurora Single Level Store Operating System"
sidebar:
    title: 'SOSP 2021'
    nav: sosp2021toc
---

## Description of the Artifact

Aurora homepage is available at <https://rcs.uwaterloo.ca/aurora/>

### Artifact Summary

The artifact consists of
* a set of patches on top of FreeBSD 12.1 that implements the OS core
  <https://github.com/rcslab/aurora-12.1>
* Kernel modules that implement the Single level store (SLS)
  <https://github.com/rcslab/aurora>
* Live images (ISO, dd) that comes with everything pre-installed
  <https://rcs.uwaterloo.ca/aurora/installer.iso.gz>
* Aurora package repository for installing FreeBSD packages
  <https://rcs.uwaterloo.ca/aurora/Aurora:amd64:12.1/>

## Environment(s) Used for Testing

1) We used emulab infrastructure to build and install Aurora from sources

**Hardware used:** Emulab Utah d430 (<https://wiki.emulab.net/Emulab/wiki/d430>)
- Two 2.4 GHz 64-bit 8-Core E5-2630 "Haswell" processors, 8.0 GT/s bus speed, 20 MB cache, and VT (VT-x, EPT, and VT-d) support
- 64 GB 2133 MT/s DDR4 RAM (8 x 8GB modules)
- 4 Broadcom NetXtreme BCM5720 GbE NICs builtin to motherboard (only one in use)
- 1 dual-port or 1 quad-port Intel I350 1GbE PCI-Express NICs
- 1 dual-port or 1 quad-port Intel X710 10GbE PCI-Express NICs
- 1 200GB Intel SATA SSD, 2 x 1TB 7200 rpm SATA disks

2) We used the machines provided by the authors for reproducing the results.

The recommended configuration is:
* A machine with 4x NVMe SSDs (256 GB minimum each)
* A machine for remote benchmarks
* Connected via 10 Gbps or better networking

**Hardware used:**
- Dual socket Intel Skylake SP Silver 4116 CPUs running at 2.10 GHz
- 4 x Intel Optane 900P PCIe SSDs
- 96 GiB of RAM
- 1 x Intel X722 NICs
```
$ sysctl hw.model hw.machine hw.ncpu
hw.model: Intel(R) Xeon(R) Silver 4116 CPU @ 2.10GHz
hw.machine: amd64
hw.ncpu: 48
```

**Operating system**:
```
$ uname -a
FreeBSD aurora.rcs.uwaterloo.ca 12.1-RELEASE FreeBSD 12.1-RELEASE PERF  amd64
```

## Step-By-Step Instructions to Exercise the Artifact

To compile Aurora kernel and their modules from sources, we did the following.

1) Instantiate a node with FreeBSD-12.1 (Readily available on Emulab/Cloudlab machines).
   To request an account, please visit https://cloudlab.us/signup.php

2) Clone the Aurora-freebsd [kernel](https://github.com/rcslab/aurora-12.1) and
follow the build instructions from the [aurora-bench](https://github.com/rcslab/aurora-bench) repository
  ```
  git clone https://github.com/rcslab/aurora-12.1
  cd aurora-12.1
  make buildworld
  make buildkernel KERNCONF=PERF
  make installworld
  make installkernel KERNCONF=PERF
  ```

3) The next step is to build the kernel modules available at: https://github.com/rcslab/aurora
  ```
  git clone https://github.com/rcslab/aurora.git
  cd aurora
  make
  mkdir -p /usr/lib/debug/boot/modules
  mkdir -p /usr/lib/debug/sbin
  mkdir -p /usr/aurora/tests
  make install
  ```
  - If you encounter the following error,
    ```
    make[1]: "/usr/share/mk/bsd.kmod.mk" line 16: Unable to locate the kernel source tree. Set SYSDIR to override.
    ```
    you should invoke 
    ```
    make SYSDIR=/path/to/aurora-12.1/sys/
    ```

4) Run the provided testbench script under tests [directory](https://github.com/rcslab/aurora/tree/master/tests) to verify the installation
  ```
  # cd tests
  # ./testbench
  ```
  The log would look like this (Some of the tests were disabled)
  ```
  Build: FreeBSD 12.1-RELEASE PERF
  Host: node-d430.emulab
  Stress testing: OFF
  229-chroot.sh                            [ disabled ]    N/A
  230-chroot-devfs.sh                      [ disabled ]    N/A
  ...
  238-metropolis-pymetro.sh                [ disabled ]    N/A
  239-metropolis-pymetro-multiple.sh       [ disabled ]    N/A
  240-metropolis-pymetro-partitions.sh     [ disabled ]    N/A
  241-metropolis-pymetro-cachedparts.sh    [ disabled ]    N/A
  ```

5) Loading the kernel module was successful with some warnings
  ```
  kldload sls
  ```
  ```
  Warning: memory type sls leaked memory on destroy (1 allocations, 512 bytes leaked).
  Freed UMA keg (Btree Fnode Slabs) was not empty (54 items).  Lost 1 pages of memory.
  Freed UMA keg (SLOS node zone) was not empty (4 items).  Lost 1 pages of memory.
  Warning: memory type slos btree leaked memory on destroy (1 allocations, 32 bytes leaked).
  ```

6) The artifact-evaluation scripts are available under `https://github.com/rcslab/aurora-bench/tree/1a9c4907f0945d20a899e01d68158aea95379baf/artifact_evaluation`.
  The below scripts run the appropriate experiments for each figure and table that produces a graph/table.
  ```
  fig3.sh
  fig4a.sh
  fig4b.sh
  fig5.sh
  table4.sh
  table5.sh
  table6.sh
  ```

## How The Artifact Supports The Paper

The submission was awarded "Artifact available and Functional" badges.
To award these two badges, we did,

We were able to successfully build and install the Aurora operating system using the
provided instructions on an independent machine.

Also, We ran the scripts provided under `artifact-evaluation` to evaluate the
functionality of the operating system.

## Additional Notes and Resources

[How to install FreeBSD packages](https://docs.freebsd.org/en/books/handbook/ports/)

