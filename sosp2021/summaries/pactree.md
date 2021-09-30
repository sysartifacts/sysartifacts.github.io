---
layout: single
title: "Artifact Review Summary: PACTree: A High Performance Persistent Range Index Using PAC"
sidebar:
    title: 'SOSP 2021'
    nav: sosp2021toc
---

## Description of the Artifact

The artifact is available at https://github.com/cosmoss-vt/pactree,
commit 88e6ada507b077f2b8032df3ba61b31379d36733.

In the artifact, the authors provide the source code, the documentation, and an example of the PacTree.

The source code also includes dependencies such as PDL-ART.
The README contains the information on how to install, compile and configure the system.
The example program can be compiled and executed successfully, and most of the source
code match the claims in the paper.


## Environments Used for Testing

Evaluations were performed in the following environments:
* Environment 1
  - CPU: Intel Xeon Gold 5218R @ 2.10GHz
  - Memory: 128GB
  - PMem: 512GB (2 x 256GB)
  - SSD: 1TB
  - OS: CentOS Linux release 8.2.2004 (Core)

* Environment 2
  - CPU: Intel Xeon E5-2630
  - Memory: 256GB
  - OS: CentOS 7 with Linux kernel 4.14

* Environment 3
  - CloudLab Instance
  - CPU: Intel Xeon Gold 6142
  - Memory: 384GB
  - OS: Ubuntu 18.04 with Linux kernel 4.15

* Environment 4
  - CPU: Intel Silver 4210 @ 2.2GHz
  - Memory: 256GB
  - Commodity SSDs (non-NVM)
  - OS: Arch Linux (5.10.56-1-lts)

* Environment 5
  - CPU: Intel Xeon E5-2670 X86 @ 2.3GHz
  - Memory: 192GB (12 x 16GB)
  - SSD: 256GB
  - OS: Ubuntu 18.04.5 with gcc-7.5

## Step-By-Step Instructions to Exercise the Artifact

### Install dependencies

You can skip this step if CMake is available in your package manager.
  - Install CMake
    ```
    Download latest version from https://cmake.org/download/
    $ tar -xvf cmake-your_version.tar.gz
    $ cd cmake-your-version
    $ ./bootstrap
    $ make
    $ sudo make install
    ```

  - Install other dependencies
    ```
    # Ubuntu
    $ sudo apt-get install g++ libtbb-dev libjemalloc-dev libnuma-dev libpmem-dev libpmemobj-dev python zlib1g-dev libboost-dev

    #Fedora
    $ sudo yum install cmake make gcc-c++ tbb-devel jemalloc-devel numactl-devel libpmem-devel libpmemobj-devel python3 zlib-devel boost-devel
    ```

### Get and compile the source code
  - Get the source code `git clone https://github.com/cosmoss-vt/pactree.git && cd pactree`
  - Generate NUMA config `bash ./tools/get-numa-config.sh`
  - Create and enter build folder `mkdir build && cd build`
  - Generate Makefile and build the code `cmake .. && make`

### Set up test environment
  - If you have actual NVM
    ```
    $ sudo mkfs.ext4 -b 4096 -E stride=512 -F /dev/pmem0
    $ sudo mount -o dax /dev/pmem0 /mnt/pmem0

    $ sudo mkfs.ext4 -b 4096 -E stride=512 -F /dev/pmem1
    $ sudo mount -o dax /dev/pmem0 /mnt/pmem1
    ```

  - If you do not have actual NVM (non-NVM)
    - Mount test device to `/mnt`
    - Prepare environment for PacTree
      ```
      sudo mkdir /mnt/pmem0
      sudo chmod 777 /mnt/pmem0
      sudo mkdir /mnt/pmem1
      sudo chmod 777 /mnt/pmem1
      ```

* Run example
  - Change directory `cd ~/pactree/build/example`
  - Run the example `./pactree-example`


## How The Artifact Supports The Paper


The artifacts include an implementation of PacTree.
Detailed designs in Section 5 in the paper can be found in the source code.
The design of PacTree includes two layers: search layer and data layer.
The implementations of these layers match the descriptions in the paper.
Besides, some auxiliary structures such as the memory management are also contained in the artifact.

Overall, the system can run well and support most of the paper's claims.
We find a small issue that Section 5.9 of the paper introduces the design of recovery,
but the `LinkedList::Recovery` function in the artifact is neither implemented nor called.

Most of the source code can be matched with the claims in the paper,
and we were able to compile and run the example program. The Functional badge was awarded.

