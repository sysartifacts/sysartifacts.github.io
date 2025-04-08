This document is a guide through the artifact evaluation process for evaluators.

For general questions, contact your artifact evaluation chairs.
For questions about a specific artifact, see below for instructions on asking the authors.

_This guide was originally written by the EuroSys 2022 AE chairs: Natacha Crooks, Solal Pirelli, Salvatore Signorello, and Anjo Vahldiek-Oberwagner._


## Goals

The goal of artifact evaluation is to help science by ensuring that published papers are accompanied by high-quality artifacts that can be reused and extended by others.
Authors are incentivized to participate through the awarding of badges.

Keep in mind that artifact evaluation is a cooperative process.
Artifacts that initially do not meet the requirements for badges can still get badges if the authors make necessary improvements in time, and evaluators should provide actionable feedback to enable this.
Artifacts should only fail to get badges if there was not enough time to reasonably address the evaluators' concerns, or if the authors were unresponsive or unreasonable.

The papers under evaluation have already been accepted by the technical program committee, so you do not need to evaluate their scientific soundness.
However, if you believe you have found a technical flaw in a paper anyway, contact your artifact evaluation chairs.


## Timeline

The **bidding deadline** allows the chairs to distribute artifacts in a way that maximizes evaluator expertise and interest.
Bidding maximizes your chances to evaluate artifacts in domains you know about and are interested in.

The **"kick the tires" period** is when evaluators go through the artifacts to ensure they will be able to properly evaluate them later.
It is important to do this as soon as possible, so that authors have enough time to fix big issues if needed.

The **main evaluation period** is when the bulk of the work happens.
Do not wait for the last day to do your reviews, remember that artifacts may contain errors that authors can correct if they are given time.

There is some time to agree on badges before the final deadline to ensure that there is time for discussion of the artifacts that need it, and to leave time for any extra or late evaluations.
Keep in mind that the final deadline for agreeing on badges is strict, as the rest of the conference depends on it.


## Communicating with authors

Artifact evaluation is single-blind, meaning authors do not and must not know who you are so that you can be frank in your assessment.
To enable this, all communication between authors and reviewers must be done through HotCRP, not by other means such as email.

Make sure that in your HotCRP profile, under "Preferences", the "Send mail" box for "Reviews and comments on authored or reviewed submissions" is checked,
so that you are notified of comments on your assigned artifacts from authors and fellow reviewers.

To add a comment on HotCRP, at the bottom of the artifact page, click on the "Add comment" button to show a form, type your comment, and select the right visibility for your comment.
Discussion with authors must be "Author discussion", while discussion with evaluators must be "Reviewer discussion".
Leave the second option to "about: submission".

You can notify a fellow evaluator with an @-mention in a HotCRP author discussion comment, as on many other platforms.
Type @ and let HotCRP autocomplete the name you want.

Avoid overloading authors with questions and comments, especially given that there are multiple evaluators per artifact.
Use "Reviewer discussion" comments to synchronize with your fellow evaluators before communicating with authors.
For instance, if you must provide your SSH key to the authors so they can give you access to their hardware,
each evaluator can write their key in a reviewer discussion message, and the final one can copy/paste all of them in one single author discussion message.
If you encounter an issue with the artifact, try first asking other evaluators if they have had the same issue,
and if they have not, see how your environments differ as this information can be helpful to help authors fix bugs.


## Evaluation setups

You can evaluate artifacts on various setups, in order of preference:

- Your own machine, if the artifact supports it
   - Even if the artifact requires a particular OS or multiple machines, you may be able to run it locally via Docker
     (e.g. see [this repo](https://github.com/SolalPirelli/docker-artifact-eval)) or using virtual machines such as with VirtualBox
- Any machines with beefy/special hardware you may have access to, for artifacts that could benefit from this
- Research clouds, if provided for your artifact evaluation, for artifacts that require more hardware than you have available
- The artifact authors' machines, accessed via SSH or such, for artifacts that cannot run anywhere else due to hardware dependencies
- Commercial clouds such as AWS or Azure, but only if absolutely necessary and the authors are willing to pay for it.
  - In that case, please agree with the authors on a protocol in which you agree to spawn and tear down machines to minimize unnecessary costs.

_Note on anonymization_: If you have to SSH to the authors' machines, make sure your public SSH key does not identify you (remove the `user@host` part at the end).
If you believe you could be identified through other means, such as because of your IP address, contact your artifact evaluation chairs.


## Initial "kick the tires" phase

Once you have been assigned artifacts comes the initial "kick the tires" period.
The goal of this period is to quickly determine whether you have everything you need for a full review:
the artifact itself, any necessary hardware or other dependencies, and a plan on how you will evaluate the artifact.
If that is not the case, you must discuss with your fellow evaluators and let the authors know of any problems as soon as possible, so that they have enough time to fix issues.

Double-check which badges the authors requested in their artifact submission.
You do not need to evaluate the artifact for badges that were not requested.
If you believe an artifact already meets the requirements for a badge the authors did not request, ask the authors, they may have forgotten to request that badge.

Carefully read the artifact documentation.
In particular, check the software and hardware dependencies to make sure you have all you need.
You are allowed to use your own judgment when making decisions, for instance to evaluate reasons why some artifacts may not be able to reproduce everything their paper contains.

Discuss with your fellow evaluators, in reviewer discussion comments, so that you all agree on:
- Whether you have everything you need to do the evaluation, and if not, what is missing including:
   - Access to the necessary hardware owned by you, by the authors or academic clouds
   - If relevant, documentation, full source code, and whether the code compiles
   - If relevant, scripts to run the experiments and generate figures
- A plan on how you will evaluate the artifact during the review period:
   - Which results will be reproduced to verify which claims
   - Time frames of when experiments will be run in case hardware is shared

Post one author discussion comment with these points once all evaluators have agreed on them.
This is a commitment to the authors, which you should only change later if you have a good reason.


## Reviewing artifacts

For each artifact you are assigned to, you will produce one review explaining which badges you believe should be awarded and why or why not.
You will work with the authors to produce your review, as this is a cooperative process.
Authors are a resource you can use, exclusively through HotCRP, if you have trouble with an artifact or if you need more details about specific portions of an artifact.

First, (re-)read the description of the badges for your artifact evaluation, including any checklists.
Checklists are particularly important: artifacts that meet these requirements should get the corresponding badges, while artifacts that do not should not.

**Merely running the code is not enough**, you must also read it to ensure you are confident that it does what the paper states it does.
Merely reproducing similar output as the paper, such as performance metrics, is not enough, the artifact must actually do what it claims to do.
You are not expected to understand every single line of code, but you should be confident that the artifact overall matches the paper's description.

**Most of your time should be spent auditing artifacts, not debugging them**.
If you run into issues such as missing dependencies, try to quickly work around them,
such as by finding the right package containing the dependency for your operating system and letting the authors know they have to fix their instructions.
However, it is the authors' responsibility to make their artifacts work, not yours.
You do not need to spend hours trying to debug and fix complex issues.
If you encounter a non-trivial error, first ask your fellow evaluators if they encountered it too or if they know how to fix it, then ask the authors to fix it.

**It is acceptable to deny badges if artifacts require unreasonable effort**, especially if such effort could be avoided through automation.
For instance, if reproducing a claim requires 50 points of data, and the artifact requires you to manually edit 5 config files then
run 4 commands on 3 machines for each data point, you do not need to actually perform hundreds of manual steps.
Instead, ask the authors to automate this, or even write a script yourself if you have the time that you can then share with the authors.

Once you are finished evaluating an artifact, fill in the review form and submit it.
Your review must explain in detail why the artifact should or should not get each of the badges that the authors requested.
You can also include additional suggestions for the authors to improve their artifacts if you have any.

**Unlike most reviewing processes, artifact evaluation reviews are immediately sent to authors**, so make sure your review is polished before you submit it.

Remember that the artifact evaluation process is cooperative, not adversarial.
Give authors a chance to fix issues by discussing through HotCRP comments before deciding that their artifact should not get a badge.
However, you are allowed to edit your review until the deadline, so if authors are being unresponsive or unreasonable,
feel free to submit an early review denying a badge and listing the actionable steps the authors should take to get the badge.

HotCRP allows you to rate your fellow evaluators' reviews.
If you think a review is well done, add a positive vote!
If you think a review could use improvement, leave a negative vote and a reviewer discussion comment explaining your thoughts.


## Information about academic clouds

Your artifact evaluation chairs may give you access to one or more of the following academic clouds.
They will let you know how to request such access if it is available.

### Chameleon Cloud

[Chameleon](http://www.chameleoncloud.org) is a large-scale, deeply-reconfigurable (bare metal) testbed for systems research based on enhanced OpenStack.
Users get full control of the software stack including root privileges, kernel customization, console access,
as well as the ability to experiment with software-defined networking and
different types of powerful GPUs, FPGAs, storage hierarchy nodes with a mix of HDDs, SDDs, and NVMe, high-bandwidth I/O storage, SDN-enabled networking hardware, and Infiniband.

Resources:
- [Webinar](https://www.youtube.com/watch?v=2ORKQ9WhJPA&t=1379s)
- [Getting started](https://chameleoncloud.readthedocs.io/en/latest/getting-started/index.html)
- [Finding out what resources there are and when they are available](https://www.chameleoncloud.org/hardware/)
- [Asking for help](https://www.chameleoncloud.org/user/help/)

### CloudLab

[CloudLab](https://cloudlab.us) is a facility that provides bare-metal access to about 2,000 servers at 5 locations.
Users have full 'root' access, and most infrastructure is not shared, making it a good choice for experiments that require low-level access to hardware, and/or a non-shared environment for repeatable performance.
Processors available on CloudLab include many generations of Intel, AMD, ARM, and IBM POWER architectures, as well as several varieties of GPUs.
Networks include both Ethernet (up to 100Gbit) and Inifiband. The full list of CloudLab hardware is available in its manual.

Resources:
- [Webinar](https://www.youtube.com/watch?v=2ORKQ9WhJPA&t=2517s)
