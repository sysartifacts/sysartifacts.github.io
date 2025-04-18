Artifacts must be packaged to ease not only evaluation but also future use of the artifact by other researchers who may want to build on top of it or use it as a baseline.

This guide provides general instructions on packaging artifacts.
If you have further questions about how best to package your artifact, contact the chairs of the AEC for the venue you are publishing in.

_This guide is based on many calls for artifacts and packaging instructions from conferences that hosted their AEs on sysartifacts. Thanks to all the AE chairs across many years._


## Instructions

All artifacts should contain a "read me" file documenting the artifact and explaining how to use it.
Consult your venue's call for artifacts to know the exact requirements on "read me" files.


## Formats

First, a note about artifacts that attempt to perform malicious or destructive operations by design, such as for security research.
Any such artifact must be boldly and explicitly flagged, both at submission time and in the artifact's instructions, so that evaluators and researchers can take appropriate precautions before installing and running these artifacts.
Please contact the AEC chairs if you believe that your artifact falls into this category.

AECs will try to accept any kind of digital artifact that authors wish to submit: software, data sets, survey results, test suites, mechanized proofs, etc.
Paper proofs are not accepted, because AECs lacks the time and often the expertise to carefully review paper proofs.

Consider one of the following methods to package the software components of their artifacts:
- **Source code:**
  For artifacts with few dependencies that can be installed easily on several operating systems,
  such as depending only on a mainstream language runtime and some packages obtainable with that language's package manager,
  source code and build scripts are acceptable.
  However, artifacts with long lists of dependencies including OS-level or proprietary dependencies should use one of the other formats below.
- **Container/virtual machine:**
  This is the preferred method for artifacts with nontrivial dependencies.
  Use a format that is easy for others to work with, such as Docker images or an OVF virtual machine.
  In any case, the Dockerfile or script used to initialize the virtual machine should be available.
  The Docker image or virtual machine should already be set up with the right toolchain and runtime environment. For example:
    - For raw data, the container/VM contains the data and the analysis scripts.
    - For mechanized proofs, the container/VM contains the right version of the relevant theorem prover
    - For a mobile phone application, the VM has a phone emulator installed
- **Live instance on the web:**
  This can be a companion to source code as a way to make usage easier, or a replacement for source code for artifacts that cannot be made public.
  It can be a custom site or use public clouds such as the ones mentioned in "tools" below.
  Ensure that it is available during the artifact evaluation process.
- **Internet-accessible hardware:**
  If your artifact requires special hardware (e.g., SGX or another trusted execution environment), or if your artifact is actually a piece of hardware, please make sure that evaluators can access the device.
  SSH or VPN-based access to the device might be an option.
  Authors must ensure anonymity of the reviewers while evaluating the artifacts.
  Web forms or access requests that require the reviewers' personal details are _not_ an acceptable way for giving access to remote infrastructure.
  An example approach for SSH access is to create users on the target machine and then collect reviewers' SSH keys to grant access.
- **Screencast:**
  A detailed screencast of the tool along with the results can be an option if one of the following special cases applies:
   - The artifact needs proprietary software or data that is not easily available and cannot be distributed even to an artifact evaluation committee.
   - The artifact requires extreme computational resources, e.g., more than 24 hours of execution time to produce the results, or requires particularly huge data sets.
   - The artifact requires specific hardware or software that is not generally available and for which no access can reasonably be provided to an artifact evaluation committee.

If you believe you need another format, please contact the AEC chairs of your venue as early as possible.


## Confidentiality

The submission of an artifact does not give the AEC permission to make its contents public.
AEC members may not publicize any part of your artifact during or after completing evaluation, nor may they retain any part of the submitted artifact after evaluation.
Thus, you are free to include models, data files, proprietary binaries, etc., in your artifact.
Only artifacts that are granted an "available" badge must have a public final version which satisfies the AEC.
Intermediate versions are confidential compared to published versions in the same way submitted paper contents are confidential compared to camera-ready papers.

To maintain the anonymity of artifact evaluators, artifact authors must not embed any analytics or other tracking in the websites for their artifacts for the duration of the artifact evaluation period.
This is important to maintain the confidentiality of the evaluators.
In cases where tracing is unavoidable, such as because it is outside the authors' control, authors should notify the AEC chairs in advance so that AEC members can take adequate safeguards.


## Tools and tips

The following tools are commonly used in artifact packaging and distribution:
- [GitHub](https://github.com) and [GitLab](https://gitlab.com), good options to host a Git repository for your artifact during evaluation, since they allow you to easily push updates in response to reviewer concerns
- [Zenodo](https://zenodo.org), to provide long-term storage and a DOI, ensuring the final version of your artifact can be archived permanently
- [Docker](https://docs.docker.com/get-started/overview/), to create a lightweight container with all of your artifact's dependencies, and even write scripts to manage multiple containers locally instead of using a cloud provider

Other useful tools include:
- [Popper](https://getpopper.io/), a container-native system for automating workflows
- [CloudLab Profiles](https://docs.cloudlab.us/repeatable-research.html), a mechanism for encapsulating and sharing research environments on the [CloudLab](https://cloudlab.us) facility
- [Chameleon Trovi](https://chameleoncloud.readthedocs.io/en/latest/technical/sharing.html), a mechanism for sharing research run on the [Chameleon Cloud](https://www.chameleoncloud.org/) facility

The following guides are useful when preparing an artifact:
- [HOWTO for AEC Submitters](http://bit.ly/HOWTO-AEC) by Dan Barowy, Charlie Curtsinger, Emma Tosch, John Vilk, and Emery Berger
- [Artifact Evaluation: Tips for Authors](https://blog.padhye.org/Artifact-Evaluation-Tips-for-Authors/) by Rohan Padhye
- "How Are Award-winning Systems Research Artifacts Prepared", [part 1](https://www.sigops.org/2021/how-are-award-winning-systems-research-artifacts-prepared-part-1/)
  and [part 2](https://www.sigops.org/2021/how-are-award-winning-systems-research-artifacts-prepared-part-2/) on the SIGOPS blog

Some good examples of past artifacts:
- [Bundler](https://github.com/bundler-project/evaluation), a middlebox and its multi-machine benchmarks (EuroSys'21)
- [Serval](https://unsat.cs.washington.edu/projects/serval/sosp19-artifact.html), a verification tool with correct and buggy code to test it (SOSP'19)
- [TinyNF](https://github.com/dslab-epfl/tinynf), a network driver with low-level multi-machine benchmarks (OSDI'20)

Some general tips to make life easier for everyone:
- **Automate as much as possible**, you will save a lot of time in the end from not having to re-run experiments that suffered from human error.
  This is feasible even for artifacts that need multiple nodes or to replicate configuration in multiple places.
  See [this repository](https://github.com/SolalPirelli/docker-artifact-eval) for an example of artifact automation with Docker.
- **Try out your own artifact on a blank environment**, following the steps you documented.
  One lightweight way to do this is to create a Docker container from a base OS image, such as `ubuntu:latest`.
  You can also use a virtual machine or even provision a real machine if you have the infrastructure to do so.
- **Log both successes and failures**, so that users know that something happened.
  Avoid logging unnecessary or confusing information, such as verbose output or failures that are actually expected.
  Log potential issues, such as an optional but recommended library not being present.
- **Measure resource use** using tools such as `mpstat`, `iostat`, `vmstat`, and `ifstat` to measure CPU, I/O, memory, and network use respectively on Linux,
  or `/usr/bin/time -v` to measures the time and memory used by a command also on Linux.
  This lets users know what to expect.
