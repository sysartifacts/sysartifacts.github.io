---
title: Artifact Packaging
order: 30
---

Artifacts must be packaged to ease evaluation and use, including [instructions](#instructions) for the artifact and an [artifact appendix](#artifact-appendix).
Packaging is not only about evaluation but about future use of the artifact by other researchers who may want to build on top of it or use it as a baseline.

We provide a few guidelines about packaging the artifact below.
If you have further questions about how best to package your artifact, contact the AEC chairs at [aec-2025@eurosys.org](mailto:aec-2025@eurosys.org).

*Note*: Some artifacts may attempt to perform malicious or destructive operations by design.
These cases should be boldly and explicitly flagged in detail at submission time (in the artifact instructions and appendix) so the AEC can take appropriate precautions before installing and running these artifacts. Please contact the AEC chairs if you believe that your artifacts fall into this category.


## Instructions

Your artifact package must include an obvious "read me" document containing suitable instructions and documentation.
A tool without a quick tutorial is generally very difficult to use. Similarly, a dataset is useless without some explanation on how to browse the data.
Please see the [badges](badges) page for more details on what the instructions should contain.


## Artifact Appendix

The artifact appendix is a self-contained document which describes a roadmap for evaluators. This particularly includes a description of the hardware, software, and configuration requirements, as well as the **list of major claims** made by the paper that can be reproduced through your artifact.


Linking the claims of the paper to the artifact is a **necessary step** that allows artifact evaluators to reproduce your results.
*It is of foremost importance that you state your paper's key results and claims clearly.*
Also, make your claims about your artifacts **concrete**.
This is especially important if you think that these claims differ from the expectations set up by your paper.
The AEC will still evaluate your artifacts relatively to your paper, but your explanation can help to set expectations up front, especially in cases that might frustrate the evaluators without prior notice.
For example, tell the AEC about difficulties they might encounter in using the artifact or its maturity relative to the content of the paper.

An artifact appendix must provide details on the time and hardware resources (e.g., storage) required to run the experiments in your paper.
If possible, the appendix should also describe how to compare the results of a reproduced experiment to the ones found in the paper (e.g., by providing access to the underlying dataset of the results).

The intention for the artifact appendix is to be published in conjunction with your artifact.
A template for the artifact appendix can be found here: [LaTeX Template](appendix/EuroSys25_ArtifactAppendix_template.tex) (to be used in conjuction with the EuroSys'25 template for research papers).

**Artifact Appendices are limited to 2 pages.**

## Formats

Authors should consider one of the following methods to package the software components of their artifacts
(although the AEC is open to other reasonable formats as well):

- *Container/virtual machine:* This is the preferred method. We recommend using a format that is easy for evaluators to work with, such as Docker images or an OVF virtual machine (e.g., to run in VirtualBox).
  An AWS EC2 instance is also possible. In any case, the Dockerfile or script used to initialize the virtual machine should be available.
  A Docker image or virtual machine should already be set up with the right toolchain and runtime environment. For example:
    - For raw data, the container/VM would contain the data and the analysis scripts.
    - For mechanized proofs, the container/VM would contain the right version of the relevant theorem prover
    - For a mobile phone application, the VM would have a phone emulator installed

- *Source code:* If your artifact has few dependencies and can be installed easily on several operating systems,
  you may submit source code and build scripts. However, if your artifact has a long list of dependencies, please use one of the other formats below.

- *Live instance on the web:* Ensure that it is available during the artifact evaluation process.

- *Internet-accessible hardware:* If your artifact requires special hardware (e.g., SGX or another trusted execution environment), or if your artifact is actually a piece of hardware, please make sure that evaluators can access the device. SSH or VPN-based access to the device might be an option.

- *Screencast:* A detailed screencast of the tool along with the results can be an option if one of the following special cases applies:
   - The artifact needs proprietary/commercial software or proprietary data that is not easily available or cannot be distributed to the committee.
   - The artifact requires significant computation resources (e.g., more than 24 hours of execution time to produce the results) or requires huge data sets.
   - The artifact requires specific hardware or software that is not generally available in a typical lab and where no access can be provided in a reasonable way.
   - If your artifact falls in this category please contact the AEC chairs at [aec-2025@eurosys.org](mailto:aec-2025@eurosys.org) as soon as possible.



## Tools

[GitHub](https://github.com) and [GitLab](https://gitlab.com) are good options to host a Git repository for your artifact.
[Zenodo](https://zenodo.org) provides long-term storage and DOI for a specific version, which is useful once your artifact has been evaluated.
[Docker](https://docs.docker.com/get-started/overview/) allows you to create a lightweight container with all of your artifact's dependencies, and even write scripts to manage multiple containers locally instead of using a cloud provider.

Please see the [tips](#tips) section for specific tips.

There are also a growing number of tools and mechanisms that are designed specifically to meet the needs of research reproducibility; authors may want to consider using such tools when appropriate. A partial list includes:
- *[Popper](https://getpopper.io/):* A container-native system for automating workflow
- *[CloudLab Profiles](https://docs.cloudlab.us/repeatable-research.html):* A mechanism for encapsulating and sharing research environments on the [CloudLab](https://cloudlab.us) facility (please **contact the AEC Chairs beforehand** if you plan to use CloudLab)
- *[Chameleon Jupyter Notebooks](https://www.chameleoncloud.org/blog/2020/10/20/tips-and-tricks-packaging-experiments-reproducibility/):*
  Mechanisms for sharing research run on the [Chameleon Cloud](https://www.chameleoncloud.org/) facility  (please **contact the AEC Chairs beforehand** if you plan to use Chameleon Cloud)

## Tips

*We thank the EuroSys'22 AEC chairs for the materials below.*

The following guides will be useful when preparing your artifact:
- [HOWTO for AEC Submitters](https://docs.google.com/document/d/1pqzPtLVIvwLwJsZwCb2r7yzWMaifudHe1Xvn42T4CcA/edit),  
  by Dan Barowy, Charlie Curtsinger, Emma Tosch, John Vilk, and Emery Berger
- [Artifact Evaluation: Tips for Authors](https://blog.padhye.org/Artifact-Evaluation-Tips-for-Authors/),  
  by Rohan Padhye

You may also find these examples of past artifacts useful:
- [Bundler](https://github.com/bundler-project/evaluation), a middlebox and its multi-machine benchmarks (EuroSys'21)
- [Serval](https://unsat.cs.washington.edu/projects/serval/sosp19-artifact.html), a verification tool with correct and buggy code to test it (SOSP'19)
- [TinyNF](https://github.com/dslab-epfl/tinynf), a network driver with low-level multi-machine benchmarks (OSDI'20)


Here are some general tips to make life easier for both artifact authors and evaluators:

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
