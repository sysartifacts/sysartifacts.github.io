---
layout: single
title: Report
sidebar:
    title: 'OSDI 2020'
    nav: osdi2020toc
---

Reposted AE report from [USENIX OSDI
Proceedings](https://www.usenix.org/conference/osdi20/call-for-artifacts).

It is our pleasure to report on the artifact evaluation process conducted as
part of OSDI'20. This year's conference represents the first time that OSDI has
included an artifact evaluation committee (AEC), and it immediately follows the
inaugural year for artifact evaluation at SOSP.

The goal of artifact evaluation is to incentivize authors to invest in the
broader scientific community by producing artifacts that illustrate their
claims, enable others to validate those claims, and accelerate future scientific
progress. A paper with artifacts that have passed the artifact evaluation
process is recognized in two ways: first by badges that appear on the paper's
first page, and second by an appendix that details the artifacts.

## Process

In designing the artifact evaluation process for OSDI, we aimed to bridge the
processes from earlier USENIX conferences (USENIX Security) and the prior effort
from ACM SOSP. USENIX previously used a single-badge process, whereas SOSP used
a system based on the ACM's artifact review and badging policy.  After
deliberation, we decided on a three-badge approach to evaluation. This helps
establish congruence between the processes for SOSP and OSDI, and the finer
granularity of a multi-badge system encourages participation even when full
artifacts cannot be shared or specific results are too challenging for the
committee to reproduce. The three badges that we used for OSDI are:

- **Artifacts Available**: Have the artifacts associated with
  the paper been made available for retrieval, permanently and publicly?
- **Artifacts Functional**: Do the artifacts conform to the
  expectations set by the paper in terms of functionality, usability, and
  relevance?
- **Results Reproduced**: Can the AEC use the submitted
  artifacts to obtain the main results presented in the paper?

The criteria for each badge are independent; for example, an artifact does not
need to be deemed available or functional in order to be considered for the
"Results Reproduced" badge.  The third badge corresponds to the "Results
Replicated" badge at SOSP'19 but differs in name.  The OSDI badge name matches
terminology recommended by the National Information Standards Organization
(NISO).

## Evaluation

To form the artifact evaluation committee, we issued an open invitation to the
systems community for self-nominations. From the self-nominations, we selected
40 early-career researchers and graduate students, based on their levels of
expertise.

After the decisions for OSDI'20 paper submissions were distributed, the authors
of accepted papers were invited to submit artifacts for evaluation. (Thus, the
artifact evaluation process had no effect on which papers were chosen to appear
at OSDI.) Authors had one and a half weeks, until August 28, to respond to the
call for artifacts. At artifact-submission time, authors were required to choose
the badges for which their submission would be considered. The overwhelming
majority of submissions applied for all three badges. Each artifact was
accompanied by the accepted version of its associated paper so that the AEC
could evaluate each artifact against its paper's claims.

A total of 49 artifacts were submitted for evaluation. The AEC members bid on
artifacts, and we assigned two or three reviewers for each submission: three if
the submission applied for the "Results Reproduced" badge, and two otherwise.
After bidding, the AEC had five weeks, until October 9, to make judgments.

Evaluation started with an attempt to build the artifact (where appropriate).
Next, AEC members tried to repeat some or all of the experiments described in
the artifact's paper. AEC members were cognizant that it would be difficult to
reproduce certain reported results, e.g., due to environmental or time limits.
Reviewers were able to communicate with authors and regularly did so for
clarifications and for help in debugging issues, with HotCRP preserving
single-blind reviewing. Along the way, AEC members assessed each artifact's
completeness, documentation, and apparent ease of reuse. After all reviews were
submitted, the AEC held an online discussion to decide, for each artifact, if it
met, exceeded, or fell below the expectations set by its paper.

Overall, the process generated 133 reviews and 1,180 comments with an average of
about 3,000 words of combined review text and comments per artifact.

## Results

OSDI'20 accepted 70 papers; in comparison, SOSP'19 accepted 38.
Correspondingly, we received a greater number of submitted artifacts: 49 versus 23.
We also saw an increase in the fraction of papers that chose to
participate: 70%, up from 61% at SOSP'19. We hope that this trend will continueb
as artifact evaluation becomes a regular part of our community's conferences.

Of the 49 submitted artifacts, the AEC found that 48 met or exceeded
expectations for at least one of the three badges. Per the choices of the
authors, not all artifacts were considered for all badges.

- 47 artifacts received the Artifacts Available badge (96%).
- 46 artifacts received the Artifacts Functional badge (94%).
- 39 artifacts received the Results Reproduced badge (80%).

The papers that describe these artifacts can be easily recognized by the
USENIX artifact evaluation badges that appear on their initial pages.

## Takeaways

**Cloud Resources**: Increasingly, systems papers present experimental results
that depend on large-scale pools of resources for reproduction. Based on
feedback from the SOSP'19 efforts, we sought out resources to evaluate these
types of artifacts, and Microsoft generously donated resource credits for
running artifacts on Azure to help with this issue. Unfortunately, these
resources were hard to leverage for the artifacts for which they would have been
most useful. Several artifacts relied on access to high-end GPU resources:
allocating these resources in Azure requires special approval and quota
increases, which we were not able to secure. In some cases, the authors of these
artifacts were able to provide reviewers with access to pre-existing resources
that the AEC could use for reproduction. In the future, it may make sense to
secure quotas for the use of specialized resources (specific GPUs, for example)
before the start of the artifact evaluation process, based on types of resources
required in the set of accepted papers.

**Single vs. multiple badges**: Of the 48 papers that received badges, 11 papers
received a subset of the three available badges. We believe this is a strong
outcome in favor of the multi-badge badge process we used.  If we had opted to
use a single badge that encompassed all of our evaluation criteria, it is likely
that fewer papers would have received that badge, and consequently, fewer
high-quality systems artifacts would have been recognized and documented.

## Closing

We thank the authors of the 49 submitted artifacts for their hard work in
creating these valuable accompaniments to their papers.  We also thank the 40
AEC members, who collectively spent hundreds of hours evaluating and discussing
these artifacts. Finally, we thank Microsoft for their generous support of the
AEC through Microsoft Azure credits.  Our hope is that the AEC effort has
strengthened the work of the authors who participated, and that it will help
facilitate work that builds on the papers that appear in the OSDI'20
proceedings.

The full results and badging for OSDI'20, as well as reports from other
artifact evaluation processes within the systems community, can be found online
at [sysartifacts.github.io](https://sysartifacts.github.io).

Eric Eide<br>
Ryan Stutsman<br>
Anjo Vahldiek-Oberwagner<br>
The OSDI'20 AEC Chairs<br>