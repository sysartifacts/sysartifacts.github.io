---
layout: single
classes: wide
title: Submission instructions
sidebar:
    title: 'EuroSys 2022'
    nav: eurosys2022toc
---

Artifacts must be packaged to ease evaluation and use, including [instructions](#instructions) for the artifact and an [artifact appendix](#artifact-appendix).
Packaging is not only about evaluation but about future use of the artifact by other researchers who may want to build on top of it or use it as a baseline.

If you have any questions about how best to package your artifact, contact the AEC chairs at [aec-2022@eurosys.org](mailto:aec-2022@eurosys.org).

*Note*: Some artifacts may attempt to perform malicious or destructive operations by design.
These cases should be boldly and explicitly flagged in detail at artifact submission time so the AEC can take appropriate precautions before installing and running
these artifacts. Please contact the AEC chairs if you believe that your artifacts fall into this category.


## Formats

Authors should consider one of the following methods to package the software components of their artifacts
(although the AEC is open to other reasonable formats as well):

- *Source code:* If your artifact has few dependencies and can be installed easily on several operating systems,
  you may submit source code and build scripts. However, if your artifact has a long list of dependencies, please use one of the other formats below.

- *Container/virtual machine:* We recommend using a format that is easy for evaluators to work with, such as Docker images or OVF.
  An AWS EC2 instance is also possible. In any case, the Dockerfile or script used to initialize the virtual machine should be available.
  A Docker image or virtual machine should already be set up with the right toolchain and runtime environment. For example:
    - For raw data, the container/VM would contain the data and the analysis scripts.
    - For mechanized proofs, the container/VM would contain the right version of the relevant theorem prover
    - For a mobile phone application, the VM would have a phone emulator installed

- *Live instance on the web:* Ensure that it is available during the artifact evaluation process.

- *Internet-accessible hardware:* If your artifact requires special hardware (e.g., SGX or another trusted execution environment),
  or if your artifact is actually a piece of hardware, please make sure that evaluators can access the device. VPN-based access to the device might be an option.

- *Screencast:* A detailed screencast of the tool along with the results can be an option if one of the following special cases applies:
   - The artifact needs proprietary/commercial software or proprietary data that is not easily available or cannot be distributed to the committee.
   - The artifact requires significant computation resources (e.g., more than 24 hours of execution time to produce the results) or requires huge data sets.
   - The artifact requires specific hardware or software that is not generally available in a typical lab and where no access can be provided in a reasonable way.


## Tools

[GitHub](https://github.com) and [GitLab](https://gitlab.com) are good options to host a Git repository for your artifact.
[Zenodo](https://zenodo.org) provides long-term storage and DOI for a specific version, which is useful once your artifact has been evaluated.
[Docker](https://docs.docker.com/get-started/overview/) allows you to create a lightweight container with all of your artifact's dependencies,
and even write scripts to manage multiple containers locally instead of using a cloud provider.

Please see our [tips](tips) page for specific tips.

There are also a growing number of tools and mechanisms that are designed specifically to meet the needs of research reproducibility;
authors may want to consider using such tools when appropriate. A partial list includes:
- *[Popper](https://getpopper.io/):* A container-native system for automating workflow
- *[CloudLab Profiles](https://docs.cloudlab.us/repeatable-research.html):* A mechanism for encapsulating and sharing research environments on the [CloudLab](https://cloudlab.us) facility
- *[Chameleon Jupyter Notebooks](https://www.chameleoncloud.org/blog/2020/10/20/tips-and-tricks-packaging-experiments-reproducibility/):*
  Mechanisms for sharing research run on the [Chameleon Cloud](https://www.chameleoncloud.org/) facility
- *[Expo](http://expo.gforge.inria.fr/):* Experiment management language for use on the [Grid5000](https://www.grid5000.fr) testbed


## Instructions

Your artifact package must include an obvious "read me" document containing suitable instructions and documentation.
A tool without a quick tutorial is generally very difficult to use. Similarly, a dataset is useless without some explanation on how to browse the data.
Please see the [badges](badges) page for more details on what the instructions should contain


## Artifact Appendix

The artifact appendix is a self-contained document which describes a roadmap for evaluators.
This particularly includes a description of the hardware, software, and configuration requirements,
as well as the major claims made by the paper and how to reproduce each claim through your artifact.
Linking the claims of the paper to the artifact is a necessary step that ultimately allows artifact evaluators to reproduce your results.
It is of foremost importance that you state your paper's key results and claims clearly.
This is especially important if you think that these claims differ from the expectations set up by your paper.
The AEC is still going to evaluate your artifacts relatively to your paper, but your explanation can help to set expectations up front,
especially in cases that might frustrate the evaluators without prior notice.
In addition, an artifact appendix must provide details on the time and hardware resources (e.g., storage) required to run the experiments in your paper.
If possible, the appendix should also describe how to compare the results of a reproduced experiment to the ones found in the paper (e.g., by providing access to the underlying dataset of the results).

The intention for the artifact appendix is to be published in conjunction with your artifact.
A template for the artifact appendix can be found here: [LaTeX Template](appendix/EuroSys22_ArtifactAppendix_template.tex)
and [PDF Example](appendix/EuroSys22_ArtifactAppendix_template.pdf).

**Artifact Appendices are limited to 2 pages.**
