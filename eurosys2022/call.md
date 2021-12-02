---
layout: single
title: Call for Artifacts
sidebar:
sidebar:
    title: 'EuroSys 2022'
    nav: eurosys2022toc
---

# EuroSys '22 Call for Artifacts

## Overview

A scientific paper consists of a constellation of artifacts that extend beyond
the document itself: software, hardware, evaluation data and documentation, raw
survey results, mechanized proofs, models, test suites, benchmarks, and so on.
In some cases, the quality of these artifacts is as important as that of the
document itself, yet many of our conferences offer no formal means to submit and
evaluate anything but the paper. To address this shortcoming, EuroSys runs an
artifact evaluation process.

The artifact evaluation process will consider the availability and functionality
of artifacts associated with their corresponding papers, along with the
reproducibility of the paper's key results and claims with these artifacts.
Artifact evaluation is single blind. Artifacts will be held in confidence by the
evaluation committee. While the committee strongly encourages the authors of
EuroSys’22 papers to make their artifacts publicly available, the artifact
evaluation process is open to artifacts that are not.

All **accepted and revision** EuroSys’22 papers are encouraged to participate in
artifact evaluation. See [Submitting an Artifact](#submitting-an-artifact) for
details on the submission process.

Questions about the process can be directed to
[aec-2022@eurosys.org](mailto:aec-2022@eurosys.org).

## Important Dates

*All AEC deadlines are at Anywhere on Earth (AOE)*

- Acceptance notification to paper authors: **January 20, 2022**
- Artifact intent registration deadline: **January 26, 2022**
- Artifact submission deadline: **February 1st, 2022**
- Kick-the-tires response period: **February 2nd - 11th, 2022**
- Artifact decisions announced: **March 19, 2022**
- EuroSys final papers deadline: **March 19, 2022**

*Note*: For an artifact to be considered, at least one contact author for the
submission must be reachable via email and respond to questions in a timely
manner during the evaluation period.

## Benefits and Goals

The dissemination of artifacts benefits our science and engineering as a whole.
Their availability encourages replicability and reproducibility and enables
authors to build on top of each others' work. It can also help more
unambiguously resolve questions about cases not considered by the original
authors. It also confers direct and indirect benefits to the authors themselves.

The goal of artifact evaluation is to incentivize authors to invest in their
broader scientific community by producing artifacts that illustrate their
claims, enable others to validate those claims, and accelerate future scientific
progress by providing a functional and well-documented platform for others to start from. A paper with artifacts that have passed the artifact evaluation process is recognized in two
ways: first by badges that appear on the paper's first page, and second by an
appendix that details the artifacts.

Eventually, the assessment of a paper's accompanying artifacts may guide the
decision-making about papers: that is, the Artifact Evaluation Committee (AEC)
would inform and advise the Program Committee (PC). **At EuroSys’22, Artifact
evaluation will begin only after paper acceptance decisions have already been
made.**

## Criteria

Each paper sets up certain expectations and claims of its artifacts based on its
content. The AEC will read the paper and then judge whether the artifacts match
those criteria. Thus, the AEC's decision will be that the artifacts do or do not
"conform to the expectations set by the paper." Ultimately, the AEC expects that
high-quality artifacts will be:

* consistent with the paper,
* as complete as possible,
* documented well,
* easy to reuse, facilitating further research.

## Process

Authors will be invited to submit their artifacts after their papers have been
accepted for publication or are in revision at EuroSys’22. Because the time between
paper acceptance and artifact submission is short, the AEC chairs encourage
authors to start preparing their artifacts for evaluation while their papers are
still under consideration by the EuroSys Program Committee. See the [guidelines
for packaging artifacts](#packaging-artifacts) later in this document.

At artifact-submission time, authors  will choose the criteria by which their
artifacts will be evaluated. The criteria correspond to three separate badges
that can be awarded to a paper, as defined by the [ACM Artifact Review and
Badging policy v1.1](https://www.acm.org/publications/policies/artifact-review-and-badging-current).
An artifact can meet the criteria of one, two, or all three of the
badges. We describe [criteria of badges](badges.html) separately.

After the artifact submission deadline, members of the AEC will download each
artifact package, read the accepted paper, install the artifacts (where
relevant), and finally evaluate the artifacts. AEC members may communicate with
artifact authors—through HotCRP to maintain the evaluators' anonymity—to resolve
minor issues and ask clarifying questions. Authors must respond to messages from
the AEC in a timely manner for their artifacts to be effectively considered.

The artifact evaluation will start with a kick-the-tires phase. In this phase the AEC creates a plan to evaluate your artifact against the applied badges. This may involve steps like  gaining access to evaluation hardware, performing the required set-up, trying simple examples, and in case of results reproduced badges deciding on the major claims of the paper to reproduce. To this end **this year** the TPC will provide a list of **major claims** for each accepted paper to the AEC. The AEC will use this list during the artifact evaluation to ensure that the major claims the TPC deemed important correspond to what the authors indicate in their artifact appendix (see section Submitting an Artifact) and can be reproduced. At the end of this phase the artifact appendix will  represent a contract about the artifact evaluation between the AEC and the paper authors.

The AEC will complete its evaluation and notify authors of the outcomes. This is
intended to allow authors to include the feedback from the AEC, at their option.

## Artifact Details

The AEC will try to accept any kind of digital artifact that authors wish to
submit: software, data sets, survey results, test suites, mechanized proofs,
etc. Paper proofs will not be accepted, because the AEC lacks the time and often
the expertise to carefully review paper proofs. Physical objects, e.g., computer
hardware, cannot be accepted due to the difficulty of making the objects
available to members of the AEC.

The submission of an artifact does not give the AEC permission to make its
content public. AEC members may not publicize any part of your artifact during
or after completing evaluation, nor may they retain any part of it after
evaluation. Thus, you are free to include models, data files, proprietary
binaries, etc. in your artifact. Participating in artifact evaluation does not
require you to later publish your artifacts (although it is highly encouraged).

Please keep in mind that the AEC can only evaluate on hardware to which it has some
access; to the extent possible, make sure that your artifact can run on
commonly-available hardware, or hardware in community research testbeds such as
[Emulab](https://www.emulab.net), [CloudLab](https://cloudlab.us), and
[Chameleon Cloud](https://www.chameleoncloud.org/). Make sure to clearly
document any special hardware requirements in your artifact appendix. If your artifact cannot run on
common or community hardware, consider whether there is a way to make the
hardware you used remotely available to AEC members. If your artifact requires
the use of a public cloud, the AEC will make every reasonable effort to evaluate
it, but do keep in mind that budget constraints may be a limiting factor.

Some artifacts may attempt to perform malicious or destructive operations by
design. These cases should be boldly and explicitly flagged in detail at artifact submission time so the AEC can take appropriate precautions before installing and running
these artifacts. Please contact
[aec-2022@eurosys.org](mailto:aec-2022@eurosys.org) if you believe that your
artifacts fall into this category.

## Review and Anonymity

Artifact evaluation is "single blind." The identities of artifact authors will
be known to members of the AEC, but authors will not know which members of the
AEC have reviewed their artifacts.

To maintain the anonymity of artifact evaluators, the authors of artifacts
should not embed any analytics or other tracking tools in the websites for their
artifacts for the duration of the artifact-evaluation period. If you cannot
control this, please do not access this data. This is important to maintain the
confidentiality of the evaluators. In cases where tracing is unavoidable,
authors should notify the AEC chairs in advance so that AEC members can take
adequate safeguards.

## Submitting an Artifact

### Registration and Submission

Please submit your artifacts of accepted Eurosys’22 papers to [HotCRP](#) and
follow the two step process.

1. *Registration:* Register your accepted EuroSys paper for artifact evaluation
   by providing the paper’s abstract and PDF.

2. *Submission:* Submit your artifact for evaluation by selecting which artifact
   badges you apply for , providing a URL or uploading the packaged artifact,
   and uploading an artifact appendix as described in the next sections.

### What to submit?

The goal of the Artifact Evaluation Committee is to judge whether the artifacts
that you submit conform to the expectations set by your paper in the context of
the criteria associated with the badges you have selected. The effort that you
put into packaging your artifacts has a direct impact on the committee's ability
to make well-informed decisions. Please package your artifacts with care to make
it as straightforward and easy as possible for the AEC to understand and
evaluate their quality.

A complete artifact package must contain:

* the accepted version of your EuroSys paper,
* the artifact appendix,
* the artifact itself,
* instructions.

### Artifact Appendix

The artifact appendix is a self-contained document which describes a roadmap for the evaluator. This particularly includes a description of the hardware, software, and configuration requirements as well as the major claims made by the paper and how to reproduce each claim through your artifact. Linking the claims of the paper to the artifact is a necessary step that ultimately allows artifact evaluators to reproduce your results.  It is of foremost importance that you state your paper’s key results and claims clearly . This is especially
important if you think that these claims differ from the expectations set up by
your paper. The AEC is still going to evaluate your artifacts relatively to your
paper, but your explanation can help to set expectations up front, especially in
cases that might frustrate the evaluators without prior notice. In addition, an artifact appendix must provide details on the time and hardware resources (e.g., storage) required to run the experiments in your paper. If possible, such a  document should also describe how to compare the results of  a reproduced experiment to the ones found in the paper (e.g., by providing access to the underlying dataset of the results).

The intention for the artifact appendix is to be published in conjunction with
your artifact. A template for the artifact appendix can be found here: [Latex
Template](appendix/EuroSys22_ArtifactAppendix_template.tex) and [PDF
Example](appendix/EuroSys22_ArtifactAppendix_template.pdf)

**Artifact Appendices are limited to 2 pages.**

### Packaging artifacts

Authors should consider one of the following methods to package the software
components of their artifacts (although the AEC is open to other reasonable
formats as well):

* *Source code:* If your artifact has few dependencies and can be installed
  easily on several operating systems, you may submit source code and build
  scripts. However, if your artifact has a long list of dependencies, please use
  one of the other formats below.
* *Virtual machine/container:* We recommend using a format that is easy for AEC members to work with, such as OVF or Docker images. An AWS EC2 instance is also possible. A virtual machine or Docker image should contain the
  software application already set up with the right toolchain and intended
  runtime environment. For example:
    * For raw data, the VM would contain the data and the scripts used to
      analyze it.
    * For a mobile phone application, the VM would have a phone emulator
      installed.
    * For mechanized proofs, the VM would contain the right version of the
      relevant theorem prover.
* *Binary installer:* Indicate exactly which platform and other run-time
  dependencies your artifact requires.
* *Live instance on the web:* Ensure that it is available for the duration of
  the artifact evaluation process.
* *Internet-accessible hardware:* If your artifact requires special hardware
  (e.g., SGX or another trusted execution environment), or if your artifact is
  actually a piece of hardware, please make sure that AEC members can somehow
  access the device. VPN-based access to the device might be an option.
* *Screencast:* A detailed screencast of the tool along with the results,
  especially if one of the following special cases applies:
   * The artifact needs proprietary/commercial software or proprietary data that
     is not easily available or cannot be distributed to the committee.
   * The artifact requires significant computation resources (e.g., more than 24
     hours of execution time to produce the results) or requires huge data sets.
   * The artifact requires specific hardware or software that is not generally
     available in a typical lab and where no access can be provided in a
     reasonable way.

There are a growing number of tools and mechanisms that are designed
specifically to meet the needs of research reproducibility; authors may want to
consider using such tools when appropriate. A partial list includes:

* *[Popper](https://getpopper.io/):* A container-native system for automating
  workflow
* *[CloudLab Profiles](https://docs.cloudlab.us/repeatable-research.html):* A
  mechanism for encapsulating and sharing research environments on the
  [CloudLab](https://cloudlab.us) facility
* *[Chameleon Jupyter
  Notebooks](https://www.chameleoncloud.org/blog/2020/10/20/tips-and-tricks-packaging-experiments-reproducibility/):*
  Mechanisms for sharing research run on the [Chameleon
  Cloud](https://www.chameleoncloud.org/) facility
* *[Expo](http://expo.gforge.inria.fr/):* Experiment management language for use
  on the [Grid5000](https://www.grid5000.fr) testbed

### Instructions

Your artifact package must include an obvious "README". The README should contain or
point to suitable instructions and documentation, to save committee members the
burden of reverse-engineering the authors' intentions. (A tool without a quick
tutorial is generally very difficult to use. Similarly, a dataset is useless
without some explanation on how to browse the data.) For software artifacts, the
README should—at a minimum—provide instructions for installing and running the
software on relevant inputs. For other types of artifacts, describe your
artifact and detail how to "use" it in a meaningful way.

## Further Advice

There are several sources of good advice about preparing artifacts for
evaluation. These two are particularly noteworthy:

* [HOWTO for AEC
  Submitters](https://docs.google.com/document/d/1pqzPtLVIvwLwJsZwCb2r7yzWMaifudHe1Xvn42T4CcA/edit),
  by Dan Borowy, Charlie Cursinger, Emma Tosch, John Vilk, and Emery Berger
* [Artifact Evaluation: Tips for
  Authors](https://blog.padhye.org/Artifact-Evaluation-Tips-for-Authors/), by
  Rohan Padhye

If you have any questions about how best to package your artifact, contact
[aec-2022@eurosys.org](mailto:aec-2022@eurosys.org).