---
title: Artifact Submission
order: 11
---

## Process

Authors will be invited to submit their artifacts after their papers have been accepted for publication at FAST. Because the time between paper acceptance and artifact submission is short, the AEC chairs encourage authors to start preparing their artifacts for evaluation while their papers are still under consideration by the FAST Program Committee. See the [guidelines for packaging artifacts](https://sysartifacts.github.io/fast2024/author-submission-guide#submitting-an-artifact) later in this document.

At artifact submission time, a submitter will choose the criteria by which their artifacts will be evaluated. The criteria correspond to three badges that can be awarded to a paper. An artifact can meet the criteria of one, two, or all three of the following badges:


### Artifacts Available

To earn this badge, the AEC must judge that the artifacts associated with the paper have been made available for retrieval, permanently and publicly. We encourage authors to use [ChameleonCloud Trovi](https://chameleoncloud.readthedocs.io/en/latest/technical/sharing.html), [Zenodo](https://zenodo.org/), a publicly-funded long-term storage platform that also assigns a DOI for your artifact. Other valid hosting options include institutional repositories and third-party digital repositories (e.g., [FigShare](https://figshare.com/), [Dryad](https://datadryad.org/stash/), [Software Heritage](https://archive.softwareheritage.org/), [GitHub](https://github.com/), or [GitLab](https://about.gitlab.com/))—not personal webpages. Besides making the artifacts available, this badge does not mandate any further requirements on functionality, correctness, or documentation.


### Artifacts Functional

To earn this badge, the AEC must judge that the artifacts conform to the expectations set by the paper regarding functionality, usability, and relevance. In short, do the artifacts work, and are they useful for producing outcomes associated with the paper? The AEC will consider three aspects of the artifacts in particular.

1. **Documentation:** are the artifacts sufficiently documented to enable them to be exercised by readers of the paper?
2. **Completeness:** do the submitted artifacts include all of the key components described in the paper?
3. **Exercisability:** do the submitted artifacts include the scripts and data needed to run the experiments described in the paper, and can the software be successfully executed?
4. **Demonstration video (optional):** do the submitted artifacts include a link to a short online video (e.g. hosted on YouTube, Google Drive, or Box) that demonstrates how the artifacts should be run and shows the results, such as the graphs published in the paper? Check some video examples [here](https://zenodo.org/record/4032401) and [here](https://zenodo.org/record/4005705).


### Results Reproduced

To earn this badge, the AEC must judge that they can use the submitted artifacts to obtain the main results presented in the paper. In short, is it possible for the AEC to independently repeat the experiments and obtain results that support the claims made by the paper? The goal of this effort is not to reproduce the results exactly but instead to generate results independently within an allowed tolerance such that the main claims of the paper are validated.


### Review process

After the artifact submission deadline, members of the AEC will download each artifact package, read the accepted paper, install the artifacts (where relevant), and evaluate the artifacts. AEC members may communicate with artifact authors—through HotCRP to maintain the evaluators' anonymity—to resolve minor issues and ask clarifying questions. Authors must respond to messages from the AEC in a timely manner for their artifacts to be effectively considered.

The AEC will complete its evaluation and notify the authors of the outcomes. Authors can use the time between notification and the final paper deadline to incorporate feedback and artifact details into the final versions of their papers. This is intended to allow authors to include the feedback from the AEC at their option.

When the AEC judges that an artifact meets the criteria for one or more of the badges listed above, those will appear on the final version of the associated paper. In addition, the authors of the paper should add an Artifact Appendix of up to two pages to their publication. The goal of the appendix is to describe and document the artifact in a standard format. The template for the appendix is available [here](https://www.usenix.org/sites/default/files/fast24_ae_appendix_template.zip).



## Artifact Details

The AEC will try to accept any kind of digital artifact that authors wish to submit: software, data sets, survey results, test suites, mechanized proofs, etc. Paper proofs will not be accepted because the AEC lacks the time and often the expertise to review paper proofs carefully. Physical objects, e.g., computer hardware, cannot be accepted due to the difficulty of making the objects available to members of the AEC. (If your artifact requires special hardware, consider if/how you can make it available to evaluators, e.g., by providing ssh access.)

The submission of an artifact does not give the AEC permission to publicize its content. AEC members may not publicize any part of your artifact during or after completing an evaluation, nor may they retain any part of it after evaluation. Thus, you can include models, data files, proprietary binaries, etc., in your artifact. Participating in artifact evaluation does not require you to publish your artifacts later (although it is encouraged).

Some artifacts may attempt to perform malicious or destructive operations by design. These cases should be boldly and explicitly flagged in detail in the README so the AEC can take appropriate precautions before installing and running these artifacts. Please contact [fast24aec@usenix.org](mailto:fast24aec@usenix.org) if you believe that your artifacts fall into this category.



## Review and Anonymity

Artifact evaluation is **"single-blind."** The identities of artifact authors will be known to members of the AEC, but authors will not know which members of the AEC have reviewed their artifacts.

To maintain the anonymity of artifact evaluators, the authors of artifacts should not embed any analytics or other tracking in the websites for their artifacts for the duration of the artifact-evaluation period. This is important to maintain the confidentiality of the evaluators. In cases where tracing is unavoidable, authors should notify the AEC chairs in advance so that AEC members can take adequate safeguards.



## Submitting an Artifact

### Registration and Submission

Submitting the artifacts associated with your accepted FAST paper is a two-step process.

1. **Registration:** By the artifact registration deadline, submit the abstract and PDF of your accepted USENIX FAST paper, as well as topics, conflicts, and any "optional bidding instructions" for potential evaluators via the artifact submission site on HotCRP, which will be available here soon.
2. **Submission:** By the artifact submission deadline, provide a stable URL or (if impossible) upload an archive of your artifacts. If the URL is access-protected, provide the credentials needed to access it. Select the criteria/badges that the AEC should consider while evaluating your artifacts. You will not be able to change the URL, archive, or badge selections after the artifact submission deadline. Finally, for your artifact to be considered, check the "ready for review" box before the submission deadline.

The AEC recommends that you create a single web page at a stable URL that contains your artifact package. The AEC may contact you with questions about your artifacts if your submitted materials are unclear.


### Evaluation Period

During this phase (within two weeks after the artifact submission deadline), reviewers will check for any obvious problems that prevent the artifact from being fully reviewed. Such problems include invalid download links, broken virtual machine images, missing dependencies, or failures when applying the artifact to a "Hello world"-sized example. Authors can respond to issues and provide an updated version of their artifact during a response period. Then, reviewers will fully evaluate the artifact.


### Packaging Artifacts

The goal of the Artifact Evaluation Committee is to judge whether the artifacts you submit conform to the expectations set by your paper in the context of the criteria associated with the badges you have selected. The effort that you put into packaging your artifacts has a direct impact on the committee's ability to make well-informed decisions. Please package your artifacts with care to make them as straightforward as possible for the AEC to understand and evaluate their quality.

A complete artifact package must contain the following:

- the accepted version of your FAST paper
- the artifact itself
- README instructions

#### README instructions

Your artifact package must include a clearly written "README" file that describes your artifact and provides a road map for evaluation. The README must consist of two sections. A "Getting Started Instructions" section should help reviewers check the basic functionality of the artifact within a short time frame (e.g., within 30 minutes). Such instructions could, for example, be on how to build a system and apply it to a "Hello world"-sized example. The purpose of this section is to allow reviewers to detect obvious problems during the kick-the-tires phase (e.g., a broken virtual machine image). A "Detailed Instructions" section should provide suitable instructions and documentation to evaluate the artifact fully.

#### Artifact claims

Importantly, make your claims about your artifacts concrete. This is especially important if you think that these claims differ from the expectations set up by your paper. The AEC is still going to evaluate your artifacts relative to your paper. Still, your explanation can help to set expectations up front, especially in cases that might frustrate the evaluators without prior notice. For example, tell the AEC about difficulties they might encounter in using the artifact or its maturity relative to the content of the paper. We encourage authors to list the questions their paper answers at the start of the "Evaluation" section, and then convert the questions into statements as "Claims" in the artifact appendix, so that the connection is explicit for the reviewers.

#### Artifact format

Authors should consider one of the following methods to package the software components of their artifacts (although the AEC is open to other reasonable formats as well):

- **Source code:** If your artifact has few dependencies and can be installed easily on several operating systems, you may submit source code and build scripts. However, if your artifact has a long list of dependencies, please use one of the other formats below.
- **Virtual machine/container:** A virtual machine or Docker image containing the software application already set up with the right toolchain and intended runtime environment. For example:
  - For raw data, the VM would contain the data and the scripts used to analyze it.
  - For a mobile phone application, the VM would have a phone emulator installed.
  - For mechanized proofs, the VM would contain the right version of the relevant theorem prover. We recommend using a format that is easy for AEC members to work with, such as OVF or Docker images. An AWS EC2 instance is also possible.
- **Binary installer:** Indicate exactly which platform and other run-time dependencies your artifact requires.
- **Live instance on the web:** Ensure it is available during the artifact evaluation process.
- **Internet-accessible hardware:** If your artifact requires special hardware (e.g., SGX or another trusted execution environment), or if your artifact is a piece of hardware, please ensure that AEC members can somehow access the device. VPN-based access to the device might be an option.
- **End-to-end packaged experiments on a public cloud (most ideal):** such as Chameleon Trovi.
- **Screencast:** A detailed screencast of the tool along with the results, especially if one of the following special cases applies:
  - The artifact needs proprietary/commercial software or proprietary data that is not easily available or cannot be distributed to the committee.
  - The artifact requires significant computation resources (e.g., more than 24 hours of execution time to produce the results) or huge data sets.
  - The artifact requires specific hardware or software that is not generally available in a typical lab and where no access can be provided reasonably.

As previously described, in all cases, artifacts must be provided in a manner that is appropriate for single-blind review by members of the AEC (i.e., anonymous reviewers).



## Further Advice

There are several sources of good advice about preparing artifacts for evaluation. These two are particularly noteworthy:

- [HOWTO for AEC Submitters](https://docs.google.com/document/d/1pqzPtLVIvwLwJsZwCb2r7yzWMaifudHe1Xvn42T4CcA/edit), by Dan Barowy, Charlie Curtsinger, Emma Tosch, John Vilk, and Emery Berger
- [Artifact Evaluation: Tips for Authors](https://www.youtube.com/watch?v=grUOrKkiYuQ), by Rohan Padhy
- Samples of Best Practices:
  - Packaged experiments on Chameleon Trovi and the Demonstration Video
  
Considering the short window between the acceptance notification and the artifact submission deadline, we strongly encourage that authors have the AE requirement in mind in their development and evaluation if interested in participation. It is also highly recommended that a fellow researcher who has not been involved in the experiments is invited to test the AE process in finalizing your submission.

If you have any questions about how best to package your artifact, contact [fast24aec@usenix.org](mailto:fast24aec@usenix.org).
