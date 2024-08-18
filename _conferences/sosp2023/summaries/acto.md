---
title: "Artifact Review Summary: Acto: Automatic End-to-End Testing for Operation Correctness of Cloud System Management"
---

{% include_relative _result-header.html %}

## Description of the Artifact

The paper introduces Acto, an automatic, state-based testing scheme that targets cloud operator software. The artifacts for Acto are hosted in [this](https://github.com/xlab-uiuc/acto/tree/sosp-ae) public Github repository.

The repository contains the test system, as well as automated scripts that reproduce 56 bugs described in the paper.
All the instructions on how to use Acto can be found in the README file at repository root. The first part of the   README file includes provisioning instructions on pre-configured Cloudlab profiles as well as step-by-step instructions to provision test server machines from scratch. The second part of the README file provides directions to run test scripts and the expected output from the scripts. The README file also provides information on how to access the detailed environment logs gathered by Acto as well as how to intrepet them.

The test system and evaluation scripts are implemented in Python and Golang. Various README files are provided to explain the operations and usage of the system. According to authors' instructions, the entire artifact process can take around 2 hours if run with a concurrency of 16 workers or about 17 hours if running sequentially (with no concurrent worker).

Acto is implemented primarily for Kubernetes. It constantly generates new operations during testing and uses oracles to ensure the system correctly transitions from its current state to the desired state, sounding an alarm if discrepancies arise. Apart from identifying bugs that compromise operation correctness, Acto also detects vulnerabilities leading to explicit error states. Specifically, it automatically creates minimized end-to-end test code for every detected issue, facilitating reliable reproduction of bugs or vulnerabilities. Acto is fully automatic, requires no manual intervention, and operates in two modes: blackbox and whitebox. The former needs only operator deployment and state declaration details, while the latter additionally requiring the operator's source code. The provided artifacts evaluate 11 popular Kubernetes operators and identify 56 new operator bugs, (40 confirmed, 28 fixed) with only a 0.19% false positive rate. Notably, Acto can be deployed to assist nightly builds/testing, making it practical for commercial cloud systems.


## Environment(s) Used for Testing

Acto artifacts target Linux machines with Docker and Kubernetes support.
To reproduce Acto's results, the pre-configured Cloudlab profiles can be used to start server machines with all the required dependencies installed. Alternatively, step-by-step provisioning instructions are provided by the authors to install the dependencies. The pre-configured profiles target c6420 and c8220 machines on Cloudlab. All the pre-requisite software is already installed in these profiles, therefore users can quickly jump to [running the evaluation scripts](https://github.com/xlab-uiuc/acto/tree/sosp-ae#3-kick-the-tire-instructions-10-minutes) after loading a Cloudlab profile.
Users who prefer to deploy Acto on their own testbed can follow the istructions in [Setting up a local environment](https://github.com/xlab-uiuc/acto/tree/sosp-ae#setting-up-local-environment-skip-this-if-using-the-cloudlab-profile) section in the README file. These users must ensure that they successfully install *Golang*, *Docker*, *Kind*, *Kubectl*, and all the Python requirements.


## Step-By-Step Instructions to Exercise the Artifact

To run Acto, users must first install all the dependencies that are needed to reproduce the bugs in Cloud operator software (or use pre-configured Cloudlab profiles). Then, users will run automated Python scripts to create various testing scenarios.

### Provisioning the testing environment

To access the provided Cloudlab profiles, users can use either [c6420](https://www.cloudlab.us/instantiate.php?project=Sieve-Acto&profile=acto-cloudlab&refspec=refs/heads/main) or [c8220](https://www.cloudlab.us/p/Sieve-Acto/acto-cloudlab?refspec=refs/heads/c8220) links. The servers take around 15 minutes to provision. After that, Acto can be found installed in `$HOME/workdir/acto`.

Alternatively, users can follow these steps to setup a Linux server:

1. Access a Linux system with Docker support.
2. Install Python 3.8 or newer.
3. Install pip3 by running `sudo apt install python3-pip`.
4. Install the following binaries using Docker's installation manual: `docker-ce, docker-ce-cli, containerd.io, docker-buildx-plugin, docker-compose-plugin`.
5. Ensure that the Linux user is in `docker` group.
6. Install Golang (we used 1.21.0).
7. Ensure that `GOPATH` environment variable points to Go's `/bin` directory. Also ensure that go binary is in the *PATH*.
8. Clone the Acto repository recursively by running `git clone --recursive --branch sosp-ae https://github.com/xlab-uiuc/acto.git`.
9. Install Python dependencies by running `pip3 install -r requirements.txt` in the cloned repository root.
10. Install Kind by running go install `sigs.k8s.io/kind@v0.20.0`.
11. Install Kubectl by running `curl -LO https://dl.k8s.io/release/v1.22.9/bin/linux/amd64/kubectl` and `sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl`.
12. Configure inotify limits after each reboot by running `sudo sysctl fs.inotify.max_user_instances=1024` and `sudo sysctl fs.inotify.max_user_watches=1048576`.

### Running Acto scripts
1. One quick way to test Acto's functionality is to follow the [Kick The Tires Instructions](https://github.com/xlab-uiuc/acto/tree/sosp-ae#3-kick-the-tire-instructions-10-minutes). To this end, users can run:
```bash
cd ~/workdir/acto/
make
python3 reproduce_bugs.py --bug-id rdoptwo-287
```
This will reproduce the *OCK-RedisOp-287* bug in about 10 minutes.

2. To reproduce tables 5, 6, and 7 of the paper, run:
```bash
cd ~/workdir/acto/
make
python3 reproduce_bugs.py -n <NUM_WORKERS>
```
This will take around 2 hours to complete on suggested Cloudlab machines.

3. Table 8 results can be reproduced by running `python3 collect_number_of_ops.py`. This scripts uses the **existing** experiment data in the repository since producing all those data takesaround 1920 machine hours according to the authors.

4. To run all the test campaigns, [this](https://github.com/xlab-uiuc/acto/blob/sosp-ae/test_campaign.md) README file is provided in the repository. All the test data can be produced by following this file.

5. Acto tests produce a large number of log files that track the state of the cluster. [These instructions](https://github.com/xlab-uiuc/acto/tree/sosp-ae#interpreting-the-test-results-optional) are helpful to interpret Acto's output.

## How The Artifact Supports The Paper

The authors packaged Acto as an artifact, providing automation and detailed steps about installing, building and replicating the main results of the paper. The artifact evaluation committee, awarded all three badges to Acto.

### Artifact Available (✅):
- The source is made publicly available at Github as well as public Cloudlab profiles.

- The artifact includes a license permissive enough to allow use for comparison purposes.

- The artifact references the original paper in the root README file.

All three criteria are met for the *Artifact Available* badge.

### Artifact Functional (✅):
- The artifact contains a README file which provides a comprehensive usage documentation for Acto: a summary of the artifact, installation steps, guidelines on how to replicate key experiments. The authors further provide details on how users can run individual "test campaigns" from scratch.

- The artifact contains a "minimal working example" for triggering the rdoptwo-287 bug. The authors provide a script that indicates whether or not the bug was triggered as well as which category it belongs to.

- The artifact contains all components/modules of Acto and uses the same terminology as the original paper.

The provided instructions are sufficient to build a test environment from scratch, build Acto, and run various test campaigns. The artifact evaluation committee believes that the criteria for the *Artifact Functional* badge is met.

### Results Reproduced (✅):

- The environment for reproducing paper's results and the time it takes to run the scripts are provided in the README file.

- Following the workflow and using the toolset provided in the artifact, users can successfully replicate the results of tables 5 through 8, and match them exactly to the numbers in the paper.

- Additionally, the authors communicated details about the structure and format of Acto's output which greatly helps in using Acto for future testing purposes.

The provided documentation and sources follow the paper's claims and similar results can be extracted from the evaluators' environments. Therefore, the evaluation committee grants the *Results Reproduced* badge.

## Additional Notes and Resources

Acto is a great example of systems research artifacts as it includes detailed, step-by-step instructions on how to use the system and what kins of output is expected from the system. Additionally, the authors of Acto cooperated with the artifact evaluation comittee to improve the artifacts during the evaluation process, which is greatly appreciated.
