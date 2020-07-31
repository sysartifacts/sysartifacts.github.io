---
layout: single
title: Call for Artifacts
sidebar:
    title: 'EuroSys 2021'
    nav: eurosys2021toc
---

[EuroSys 2021](https://2021.eurosys.org/) is the first edition of the EuroSys conference to include an Artifact Evaluation (AE).
In addition to the usual paper, authors may submit an *artifact* for the research work discussed in the paper.
The artifact may include source code, systems, configuration, datasets, models, test suites, benchmarks, and any other material underlying the paper’s contributions.

The goal of AE is to promote the reproducibility of experimental results.
This is done by recognizing authors who invest effort to make their work reusable and reproducible by others, helping the community quickly validate and compare alternative approaches.
This includes authors’ efforts to make their artifact publicly available, documenting and packaging their work in a way that facilitates reuse, and structuring experiments such that they can be repeated and the results reproduced by other researchers.

AE is optional at EuroSys 2021.
Authors of accepted papers have the option of submitting their artifacts shortly after notification of their acceptance, although authors are encouraged to prepare their artifacts in advance as part of the paper authoring process.
Each artifact is reviewed by the Artifact Evaluation Committee (AEC) between the author notification and the camera-ready deadline.
Papers with successfully evaluated artifacts qualify for [badges](badges.html), which the authors can include on the first page of their paper to highlight their efforts towards reproducibility.
The best artifact will be rewarded with a *Best Artifact Award* at EuroSys 2021 (as per the [call for papers](https://2021.eurosys.org/cfp.html#new-eurosys)).

Another new feature of EuroSys 2021 is a [revision stage](https://2021.eurosys.org/cfp.html#new-eurosys), in which authors may be asked to make specific updates to their paper before an accept/reject decision is made.
Papers that are accepted after the revision stage are still eligible for AE, and the AEC will attempt to evaluate these submissions swiftly, but, due to the tight time constraints, it is possible that the evaluation will not be complete before the camera-ready deadline.
Authors can facilitate the process by making their artifacts well-documented and easy to use, as outlined below.

Guidelines for Artifact Submission
----------------------------------

While the EuroSys paper reviewing process is double-blind, AE is single-blind, since it takes place after the paper is already accepted.
Therefore, submitted artifacts do not need to be anonymized.

When submitting your artifact, please specify which of the three badges you are applying for.
For the Artifact Functional and Results Reproduced badges, AEC members will attempt to use your artifact to run the experiments described in your paper.

Please strive to package your artifact in a way that makes it easy for AEC members to use and evaluate.
In particular, it should be made as self-contained as possible by bundling all required dependencies.
In most cases, this can be achieved by producing a bootable VirtualBox VM or a Docker image.
However, we realize that this is not appropriate for all artifacts, therefore we are not mandating one particular format.

If your experiments require large computing resources (e.g., more RAM or disk space than provided by a typical mid-range laptop, significant GPU resources, or a distributed system involving multiple nodes) or infrastructure that is not commonly available (such as particular hardware or proprietary software), we ask that you provide the AEC members with remote access to your systems, for example via SSH, for the duration of the evaluation.
For experiments that can be run on public cloud computing facilities, AEC members may be able to use credits from cloud vendors to evaluate artifacts, but we may need to ask for remote access to your systems as a fallback.

Please provide clear and detailed documentation (e.g., a README file) that describes how your artifact is structured, how to run the experiments described in your paper, and how to obtain and interpret the results.
If you hope to qualify for the “[results reproduced](badges.html)” badge, please provide instructions and scripts that reproduce figures or tables from the paper.
AEC members may contact authors during the evaluation period, for example to ask for help if they are unable to get the artifact to work, and authors are asked to be responsive to such requests.
However, your goal as an author should be to present and document your artifact in a way that AEC members can use it and complete the evaluation successfully with minimal (and ideally no) interaction.
To ensure that your instructions are complete, we suggest that you run through them on a fresh machine (or VM) prior to submission, following exactly the instructions you have provided.

Important Dates
---------------

For papers accepted without revision:

* Author notification date: 20 January 2021
* Artifact submission deadline: 23 January 2021
* Artifact notification date: 23 March 2021
* Camera-ready deadline: 26 March 2021

For papers accepted after a revision stage:

* Author notification date: 3 March 2021
* Artifact submission deadline: 6 March 2021
* Artifact notification date: 30 March 2021
* Camera-ready deadline: 2 April 2021

Submission site
---------------

We will use HotCRP to handle artifact submissions; details will be posted here later.

Artifact Evaluation Committee
-----------------------------

EuroSys 2021 Artifact Evaluation is run by the [Artifact Evaluation Committee](committee.html) (AEC).
For any questions, please [contact the AEC chairs](mailto:aec-2021@eurosys.org).
