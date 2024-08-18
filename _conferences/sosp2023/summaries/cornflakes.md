---
title: "Artifact Review Summary: Cornflakes: Zero-Copy Serialization for Microsecond-Scale Networking"
---

{% include_relative _result-header.html %}

## Description of the Artifact

CornFlakes is a hybrid serialization library that employs both approaches, by dynamically chooses between scatter-gather and copying. It is implemented on Intel and Mellanox NICs. Authors evaluated CornFlakes to work with a custom KV-store and Redis and CornFlakes is shown to have significant performance gains.

The artifact is placed in 3 separate Github repositories:

1. [Source code of Cornflakes](https://github.com/deeptir18/cornflakes)

2. [A cloudlab profile](https://www.cloudlab.us/p/955539a31b0c7be330933414edd8d4af54f7dbec) that contains the profiles to setup the machines, network topology, and software environments on CloudLab.

3. [A scripts repository](https://github.com/deeptir18/cornflakes-scripts) that contains bash scripts to reproduce the SOSP paper.

## Environment(s) Used for Testing

* CloudLab with nodes of type `c6525-25g` as well as type `c6515`. The nodes run Ubuntu 20.04 LTS (which is specified in the CloudLab profile).

## How The Artifact Supports The Paper

This artifact clearly exceeds expectations and satisfies all badges in the following ways:

1. **Artifact available badge**: All scripts and code are on publicly available Github repositories.

2. **Artifact functional badge**: The artifact is well documented. Following the README, the CloudLab machines and software environments can be easily setup. The code is easy and straightforward to run. I believe this artifact can be easily used by future researchers.

3. **Result reproduced badge**: The evaluation covers all major aspects of the paper. Results for figures 5, 7, 8, and 12 have been reproduced within acceptable margins.


## Additional Notes and Resources

1. The authors provided clear instruction to setup CloudLab, and thus no prior CloudLab experience is required to run the artifact smoothly.

2. Generally, each shell scripts corresponds to one or several figures in the figure. The scripts are well automated -- each script not only starts the experiment, but also processes the results and draws the final figure. 

3. The README is clear in what initial output is expected at each step, and how long the script is expected to take. 

4. Overall, the artifact source and scripts are well tested. 
