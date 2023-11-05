---
title: "Artifact Review Summary: Edna: Disguising and Revealing User Data in Web Applications"
---

{% include_relative _result-header.html %}

## Description of the Artifact

- Location: [https://github.com/tslilyai/edna/tree/artifact](https://github.com/tslilyai/edna/tree/artifact)
- Commit: fb9a9e5
- README: [https://github.com/tslilyai/edna/blob/artifact/README.md](https://github.com/tslilyai/edna/blob/artifact/README.md)

The authors made their source code available on a public GitHub repository, along with CryptDB and Qapla. The artifact includes the Edna library used for concealing and unveiling data, along with case study applications using Edna. To run the benchmark, authors have created a CloudLab profile. The README file contains instructions on how to test Edna on Lobster and WebSubmit.

## Environment(s) Used for Testing

Evaluators ran all experiments on a CloudLab machine using the provided profile. The machine has 16 CPUs and 60 GB RAM, running Ubuntu 20.04.5 LTS, and uses MySQL with the InnoDB storage engine atop a local SSD.

## Step-By-Step Instructions to Excercise the Artifact

1.  Start by initiating a CloudLab machine using the provided profile.  This process involves running the initialization scripts and installing all necessary packages to set up the environment.
2.  Once the machine is set up, execute the benchmark script to replicate all the results.  Compare the generated images with figures 6-10 in the paper to validate the reproducibility of the findings.
3.  For the E2E Lobste. rs case study, follow these steps:
	- Launch the Lobsters server on a Docker container.
	- Access the Lobster website and log in as the admin (using the `test` account).
	- Submit new posts labeled "test" using arbitrary URLs.
	- Open a separate window and sign up for a new user account.
	- Add comments to the admin's posts using the new user account.
	- Finally, delete the user account using the `Disown stories/comments` option, and see how the usernames and comments have transformed into random words.
4.  To run the Websubmit server, adhere to the instructions below:
	- Generate an API key for the admin account and obtain the key from the server log message (which appears as a printed key-value pair).
	- Log in as "tester@admin.edu" to add new lectures and questions.
	- To test the anonymization function, obtain an API key for a user account (e.g., "user@example.com").
	- Log in with the user account and submit answers to existing questions.
	- As the admin account, press the `ANONYMIZE` button in the lecture list to anonymize all answers. The username for each answer is then replaced by arbitrary words.

## How The Artifact Supports The Paper

The artifact supports the claims made in this paper.

### Artifact Available
- The artifact is available on a public website with a specific version such as a git commit.
- The artifact has a README file.
- The artifact lacks an associated license.

### Artifact Functional
- The artifact has modest documentation explaining the high-level organization of module.
- The artifact contains configuration scripts using Docker. It is reasonably automated with scripts to download and build exotic dependencies.
- The artifact does not contain a “minimal working example”; only instructions for running the full system and all experiments and full applications.

### Results Reproduced
- The artifact specifies the exact environment the authors used, including OS version, and the exact commands to run to reproduce each claim from the paper.
- The scripts to reproduce claims are somewhat documented, allowing researchers to ensure they correspond to the claims.
- The artifact’s external dependencies (MySQL) are fetched from well-known sources with clear changes/usage.

As a result, evaluators agreed that all badges (Available, Functional, Reproduced) could be awarded.

## Additional Notes and Resources

The evaluators presented the following suggestions that can improve the artifact:
1. The repository should include a caveat specifying that certain initialization scripts may need to be run twice, along with an explanation of what output to expect. This information would have helped when encountering failures during the first run (e.g., while installing tex, docker-compose, and cargo install).
2. Since Lobsters and Websubmit might not be familiar to all users, including more detailed instructions with relevant screenshots would be helpful. For example, providing step-by-step instructions accompanied by screenshots displaying the expected results would be better.
