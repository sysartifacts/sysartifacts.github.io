---
title: "Artifact Review Summary: RackBlox: A Software-Defined Rack-Scale Storage System with Network-Storage Co-Design"
---

{% include_relative _result-header.html %}

## Description of the Artifact

The code of the artifact is publicly available on GitHub at [https://github.com/breidys2/RackBlox](https://github.com/breidys2/RackBlox). All instructions needed to install/run the artifact are documented in the repository's `README.md` file (i.e., [https://github.com/breidys2/RackBlox/blob/main/README.md](https://github.com/breidys2/RackBlox/blob/main/README.md>)).  

The artifact contains all of *RackBlox*' code minus a couple of NDA-protected headers. These headers are needed for *RackBlox*' switch functionality, which uses a proprietary switch implementation. The available code of *RackBlox* exists out of: P4 code for programmable switches, VSSD code for programmable SSDs and client/server code to interact with programmable switches/SSDs.  
Besides the *RackBlox* code the artifact contains a number of functionality tests/benchmarking traces to showcase that *RackBlox* is functional.

The provided code is licensed under the `Apache license 2.0`.

## Environment(s) Used for Testing

The artifact was evaluated within one remote testbed, which was accesible through a VPN. This testbed was used because the artifact requires special hardware/software. Further on, part of the code was under an NDA and hence not available to setup outside of the testbed.

The artifact requires atleast the following the hardware: P4 programmable switches, programmable SSDs that expose read/write/erase, NICs and at least two servers. Additionally the artifact requires the following software: DPDK v22.11 and BF SDE v9.10.0.

During the evaluation Barefoot Intel Tofino 1 switches were used. The used SSDs were not specified. The evaluation was run on 3 servers. The first server is responsible for starting the scripts (from the artifact on GitHub) and runs Ubuntu 14.04, the second server controls the switch and runs Ubuntu 18.04, and the third server controls two vSSDs and runs Ubuntu 20.04.  

## Step-By-Step Instructions to Exercise the Artifact

The code of the artifact is evaluated up to commit `c63b9e3` of the `main` branch. The artifact was evaluated as follows:

1. Ssh into the remote environment.
2. Follow the instructions of the `./README.md` file and the `README.txt` files in the subfolders of the GitHub repository.
3. `cd` into the `scripts` directory.
4. Run each script in this directory, but before each script first run `./cleanup_.sh` and `./setup.sh`.

The artifact has a couple of additional things that need to be considered. When running the artifact on shared hardware (like was the case for the artifact evaluation review), it needs to be verified that there is no additional user. The artifact only has support for one concurrent user (verify with `top`/`who`). Additionally, the script becomes unresponsive at times. If this happens, press `CTRL+C` (i.e., `SIGINT`), followed by executing `./cleanup_.sh` and `./setup.sh`.

Running the artifact in this manner allows evaluating the functionality of: *processing hard GC packets*, *processing soft GC packets*, *end-to-end functionality between vSSDs with a subset of the auctionmark trace*.

## How The Artifact Supports The Paper

The artifact is awarded the "Available" and "Functional" badges because of the following reasons:

* **Available**: The artifact contains all code of *RackBlox* (apart from proprietary header files for the Intel switch). All of this code is clearly commented and it is documented how the project can be used/tested. Further on, most hardware/software requirements are listed. Lastly, the code is licensed under Apache v2.0, allowing for use in future research.

* **Functional**: The main aim of *RackBlox* is to support coordinated I/O scheduling- and garbage collection across SSDs over the network. The artifact is able to showcase that it is able to achieve such feats, showcasing its functionality. We determined *RackBlox*' functionality with the help of the provided scripts available in the GitHub repository (named *test_**), which showcase GC and end-to-end functionality. *RackBlox* is able to complete all of these tests, and the results returned by these tests matched (or did not contradict) those in the paper.  

## Additional Notes and Resources

Note that the artifact was evaluated on one specific testbed. The artifact supports other testbeds, but changing testbeds requires changing a couple of constants (e.g., network addresses). Therefore, to reproduce the results on a different testbed/cluster, the code should be partially changed/recompiled. Instructions on how to do this are provided in the GitHub.

The repository does not mention all (it lists a few) of it's software dependencies. For example, supported operating systems are not mentioned. The repository also does not include a script to install all of its dependencies. Hence, installing *RackBlox* might lead to unforeseen issues not present during the artifact evaluation.
