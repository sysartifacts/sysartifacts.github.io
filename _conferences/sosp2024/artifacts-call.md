---
title: Call for Artifacts
order: 10
---

## Overview

A scientific paper consists of a constellation of artifacts that extend beyond the document itself: software, hardware, evaluation data and documentation, raw survey results, mechanized proofs, models, test suites, benchmarks, and so on. In some cases, the quality of these artifacts is as important as that of the document itself.
Based on the success of artifact evaluation from SOSP’19, SOSP’21 and SOSP’23, SOSP’24 will run an **optional** artifact evaluation process. All papers accepted at SOSP’24 are encouraged to participate in the artifact evaluation process.

The artifact evaluation process will consider the availability and functionality of artifacts associated with their corresponding papers, along with the reproducibility of the paper’s key results and claims with these artifacts. Artifact evaluation is single blind. Artifacts will be held in confidence by the evaluation committee. While the committee strongly encourages the authors of SOSP papers to make their artifacts publicly available, the artifact evaluation process is open to artifacts that are not.

All accepted SOSP papers are encouraged to participate in artifact evaluation. 
See [Submitting an Artifact](#submitting-an-artifact) for details on the submission process.

Questions about the process can be directed to [sosp24-aec-chairs@cs.wisc.edu](mailto:sosp24-aec-chairs@cs.wisc.edu).

## Important Dates

*All AEC deadlines are at 6 PM EDT*

- Notification for paper authors:         *August 05, 2024*
- Artifact intent registration deadline:  *August 16, 2024*
- Artifact submission deadline:           *August 21, 2024*
- Kick-the-tires response period:         *August 22 – September 01, 2024*
- Artifact decisions announced:           *September 19, 2024*
- SOSP final papers deadline:             *September 23, 2024*


*Note:* For an artifact to be considered, at least one contact author for the submission must be reachable via email and respond to questions in a timely manner during the kick-the-tires period.

## Benefits and Goals

The dissemination of artifacts benefits our science and engineering as a whole. Their availability encourages replicability and reproducibility and enables authors to build on top of each others’ work. It can also help more unambiguously resolve questions about cases not considered by the original authors. It also confers direct and indirect benefits to the authors themselves.

The goal of artifact evaluation is to incentivize authors to invest in their broader scientific community by producing artifacts that illustrate their claims, enable others to validate those claims, and accelerate future scientific progress by providing a platform for others to start from. A paper with artifacts that have passed the artifact evaluation process is recognized in two ways: first by badges that appear on the paper’s first page, and second by an appendix that details the artifacts.

Eventually, the assessment of a paper’s accompanying artifacts may guide the decision-making about papers: that is, the Artifact Evaluation Committee (AEC) would inform and advise the Program Committee (PC). This year, artifact evaluation will begin only after paper acceptance decisions have already been made. Artifact evaluation is optional, although we hope all papers will participate.

## Criteria

Each paper sets up certain expectations and claims of its artifacts based on its content. The AEC will read the paper and then judge whether the artifacts match those criteria. Thus, the AEC’s decision will be that the artifacts do or do not "conform to the expectations set by the paper." Ultimately, the AEC expects that high-quality artifacts will be:

- consistent with the paper
- as complete as possible
- documented well
- easy to reuse, facilitating further research

## Process

Authors will be invited to submit their artifacts after their papers have been accepted for publication at SOSP. Because the time between paper acceptance and artifact submission is short, the AEC chairs encourage authors to start preparing their artifacts for evaluation while their papers are still under consideration by the SOSP Program Committee. See the [guidelines for packaging artifacts later in this document](#packaging-artifacts).

At artifact-submission time, a submitter will choose the criteria by which their artifacts will be evaluated. The criteria correspond to three separate badges that can be awarded to a paper, as defined by the [ACM Artifact Review and Badging policy v1.1](https://www.acm.org/publications/policies/artifact-review-and-badging-current). An artifact can meet the criteria of one, two, or all three of the following badges:

- *Artifacts Available* - Author-created artifacts relevant to this paper have been placed on a publically accessible archival repository. A DOI or link to this repository along with a unique identifier for the object is provided.
- *Artifacts Evaluated - Functional* - The artifacts associated with the research are found to be documented, consistent, complete, exercisable, and include appropriate evidence of verification and validation.
- *Results Reproduced* - The main results of the paper have been obtained in a subsequent study by a person or team other than the authors, using, in part, artifacts provided by the author.

After the artifact submission deadline, members of the AEC will download each artifact package, read the accepted paper, install the artifacts (where relevant), and finally evaluate the artifacts. AEC members may communicate with artifact authors, through HotCRP to maintain the evaluators’ anonymity, to resolve minor issues and ask clarifying questions. Authors must respond to messages from the AEC in a timely manner for their artifacts to be effectively considered.

The AEC will complete its evaluation and notify authors of the outcomes. Authors can use the time between notification and the camera-ready deadline to incorporate feedback and artifact details into the camera-ready versions of their papers. This is intended to allow authors to include the feedback from the AEC, at their option.

## Artifact Details

The AEC will try to accept any kind of digital artifact that authors wish to submit: software, data sets, survey results, test suites, mechanized proofs, etc. Paper proofs will not be accepted, because the AEC lacks the time and often the expertise to carefully review paper proofs. Physical objects, e.g., computer hardware, cannot be accepted due to the difficulty of making the objects available to members of the AEC.

The submission of an artifact does not give the AEC permission to make its content public. AEC members may not publicize any part of your artifact during or after completing evaluation, nor may they retain any part of it after evaluation. Thus, you are free to include models, data files, proprietary binaries, etc. in your artifact. Participating in artifact evaluation does not require you to later publish your artifacts (although it is encouraged).

Please keep in mind that the AEC can only evaluate on hardware to which it has access; to the extent possible, make sure that your artifact can run on commonly-available hardware, or hardware in community research testbeds such as [CloudLab](https://cloudlab.us/). Make sure to clearly document any special hardware requirements. If your artifact cannot run on common or community hardware, consider whether there is a way to make the hardware you used remotely available to AEC members. If your artifact requires the use of a public cloud, the AEC will make every reasonable effort to evaluate it, but do keep in mind that budget constraints may be a limiting factor.

Some artifacts may attempt to perform malicious or destructive operations by design. These cases should be boldly and explicitly flagged in detail in the README so the AEC can take appropriate precautions before installing and running these artifacts. Please contact AEC chairs if you believe that your artifacts fall into this category.


## Review and Anonymity

Artifact evaluation is “single blind.” The identities of artifact authors will be known to members of the AEC, but authors will not know which members of the AEC have reviewed their artifacts.

To maintain the anonymity of artifact evaluators, the authors of artifacts should not embed any analytics or other tracking in the websites for their artifacts for the duration of the artifact-evaluation period. If you cannot control this, do not access this data. This is important to maintain the confidentiality of the evaluators. In cases where tracing is unavoidable, authors should notify the AEC chairs in advance so that AEC members can take adequate safeguards.

## Submitting an Artifact

### Registration and Submission

Submitting the artifacts associated with your accepted SOSP paper is a two-step process.

1. *Registration:* By the artifact registration deadline, submit the abstract and PDF of your accepted SOSP paper, as well as topics, conflicts, and any “optional bidding instructions” for potential evaluators via the artifact submission site: [https://sosp24ae.hotcrp.com/](https://sosp24ae.hotcrp.com/)

2. *Submission:* By the artifact submission deadline, provide a stable URL or (if that is not possible) upload an archive of your artifacts. If the URL is access-protected, provide the credentials needed to access it. Select the criteria/badges that the AEC should consider while evaluating your artifacts. You will not be able to change the URL, archive, or badge selections after the artifact submission deadline. Finally, for your artifact to be considered, check the “ready for review” box before the submission deadline.


The AEC recommends that you create a single web page at a stable URL that contains your artifact package. The AEC may contact you with questions about your artifacts if your submitted materials are unclear.

### Packaging Artifacts

The goal of the Artifact Evaluation Committee is to judge whether the artifacts that you submit conform to the expectations set by your paper in the context of the criteria associated with the badges you have selected. The effort that you put into packaging your artifacts has a direct impact on the committee’s ability to make well-informed decisions. Please package your artifacts with care to make it as straightforward and easy as possible for the AEC to understand and evaluate their quality.

A complete artifact package must contain:

- the accepted version of your SOSP paper
- the artifact itself
- instructions

Your artifact package must include an obvious “README” that describes your artifact and provides a road map for evaluation. The README should contain or point to suitable instructions and documentation, to save committee members the burden of reverse-engineering the authors’ intentions. (A tool without a quick tutorial is generally very difficult to use. Similarly, a dataset is useless without some explanation on how to browse the data.) For software artifacts, the README should, at a minimum, provide instructions for installing and running the software on relevant inputs. For other types of artifacts, describe your artifact and detail how to “use” it in a meaningful way.

Importantly, make your claims about your artifacts concrete. This is especially important if you think that these claims differ from the expectations set up by your paper. The AEC is still going to evaluate your artifacts relative to your paper, but your explanation can help to set expectations up front, especially in cases that might frustrate the evaluators without prior notice. For example, tell the AEC about difficulties they might encounter in using the artifact, or its maturity relative to the content of the paper.

Authors should consider one of the following methods to package the software components of their artifacts (although the AEC is open to other reasonable formats as well):

- Source code: If your artifact has few dependencies and can be installed easily on several operating systems, you may submit source code and build scripts. However, if your artifact has a long list of dependencies, please use one of the other formats below.
- Virtual machine/container:
A virtual machine or Docker image containing the software application already set up with the right toolchain and intended runtime environment. For example:
  - For raw data, the VM would contain the data and the scripts used to analyze it.
  - For a mobile phone application, the VM would have a phone emulator installed.
  - For mechanized proofs, the VM would contain the right version of the relevant theorem prover.
  - We recommend using a format that is easy for AEC members to work with, such as OVF or Docker images. An AWS EC2 instance is also possible.
- Binary installer: Indicate exactly which platform and other run-time dependencies your artifact requires.
- Live instance on the web: Ensure that it is available for the duration of the artifact evaluation process.
- Internet-accessible hardware: If your artifact requires special hardware (e.g., SGX or another trusted execution environment), or if your artifact is actually a piece of hardware, please make sure that AEC members can somehow access the device. VPN-based access to the device might be an option.
- Screencast:
A detailed screencast of the tool along with the results, especially if one of the following special cases applies:
  - The artifact needs proprietary/commercial software or proprietary data that is not easily available or cannot be distributed to the committee.
  - The artifact requires significant computation resources (e.g., more than 24 hours of execution time to produce the results) or requires huge data sets.
  - The artifact requires specific hardware or software that is not generally available in a typical lab and where no access can be provided in a reasonable way.

As previously described, in all cases, artifacts must be provided in a manner that is appropriate for single-blind review by members of the AEC (i.e., anonymous reviewers).

There are a growing number of tools and mechanisms that are designed specifically to meet the needs of research reproducibility; authors may want to consider using such tools when appropriate. A partial list includes:
- [CloudLab Profiles](https://docs.cloudlab.us/repeatable-research.html): A mechanism for encapsulating and sharing research environments on the CloudLab facility.




## Further Advice

There are several sources of good advice about preparing artifacts for evaluation. These two are particularly noteworthy:

- [HOWTO for AEC Submitters](https://docs.google.com/document/d/1pqzPtLVIvwLwJsZwCb2r7yzWMaifudHe1Xvn42T4CcA/edit), by Dan Borowy, Charlie Cursinger, Emma Tosch, John Vilk, and Emery Berger
- [Artifact Evaluation: Tips for Authors](https://blog.padhye.org/Artifact-Evaluation-Tips-for-Authors/), by Rohan Padhye

If you have any questions about how best to package your artifact, contact [AEC chairs](organizers).
