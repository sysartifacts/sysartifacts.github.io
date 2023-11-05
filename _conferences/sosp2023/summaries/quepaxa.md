---
title: "Artifact Review Summary: QuePaxa: Escaping the tyranny of timeouts in consensus"
---

## Description of the Artifact

This submission contains artifacts to run the SMR protocols: QuePaxa (this submission), EPaxos, Rabia, and RAFT protocols.
The artifact of this paper is publicly available [here](https://github.com/dedis/quepaxa/) and the `docs/` folder contains artefact evaluation instructions.
The artifacts for the related papers provided in this submission are publicly available here:
- https://github.com/dedis/quepaxa-ePaxos-open-loop
- https://github.com/dedis/quepaxa-rabia-open-loop
- https://github.com/dedis/paxos_and_raft
The submitted artifacts are awarded the following badges:
- Artifact Available (v1.1)
- Artifact Evaluated - Functional (v1.1)

## Environment(s) Used for Testing

We used two environments:
1. M1 Macbook, Docker and Visual Studio Code using the Remote-Docker extension
2. AWS Free-tier ubuntu 20.04 vm in us-west1 location
   
## Step-By-Step Instructions to Exercise the Artifact

### Environment 1 - Docker

I used a Docker VM on an M1 Macbook and tested the source code using Visual Studio Code.
My environment was setup as follows:
1. Create a Dockerfile as follows:
   ```
  FROM --platform=linux/amd64 ubuntu:20.04 as base
  RUN apt-get update -y && \
            apt-get install sudo python3 python3-pip wget git -y && \
            python3 -m pip install numpy matplotlib && \
            rm -rf /usr/local/go && \
            wget https://go.dev/dl/go1.19.5.linux-amd64.tar.gz && \
            tar -C /usr/local -xzf go1.19.5.linux-amd64.tar.gz && \
            export PATH=$PATH:/usr/local/go/bin
   ```
2. Using the vscode remote docker extension, open the project in the container.
3. Run the following build commands:
   ```bash
    /bin/bash build.sh
   ```
   
### Environment 2 - VMs

I also managed to successfully build the code on AWS machines.
1. Spawn a t2.micro instance and login to it
2. Run the following commands to setup an environment:
   ```bash
       sudo apt-get install python3 python3-pip wget git -y && \
            python3 -m pip install numpy matplotlib && \
            sudo rm -rf /usr/local/go && \
            wget https://go.dev/dl/go1.19.5.linux-amd64.tar.gz && \
            tar -C /usr/local -xzf go1.19.5.linux-amd64.tar.gz && \
            export PATH=$PATH:/usr/local/go/bin
   ```
3. Obtain the project source code by git cloning the public repositories and run `build.sh`.

## How The Artifact Supports The Paper

We awarded this artifact the following badges:
1. Artifact Available (v1.1) 
   The artifacts are publicly available on Github 
   - https://github.com/dedis/quepaxa/
   - https://github.com/dedis/quepaxa-ePaxos-open-loop
   - https://github.com/dedis/quepaxa-rabia-open-loop
   - https://github.com/dedis/paxos_and_raft
2. Artifact Evaluated - Functional (v1.1)
   The artifacts are functional for the most parts. 
   Some of the tests fail non-deterministically in the Macbook environment and others may experience similar results. If retried sufficiently (around 10-15 times), the tests pass. I also read the code and can roughly confirm its functionality (nothing is out of place).

## Additional Notes and Resources

- The integration tests mentioned in the project documentation were non-deterministic on the M1 macbook environment. It may need several retries before they succeed.
- We did not manage to reproduce the results on AWS due to high cost barriers (~6500CHF). But that does not mean that the artifact cannot reproduce the results.
- The experiments also take a long time, and need to be monitored. If using the free-tier of AWS, monitor the costs to avoid being charged from spawning several machines.

