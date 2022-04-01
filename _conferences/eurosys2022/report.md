---
title: Report
order: 80
---

We are happy to report on the success of the EuroSys'22 artifact evaluation process, the second in EuroSys history.
Once again, accepted papers could apply for [ACM badges](https://www.acm.org/publications/policies/artifact-review-and-badging-current) certifying
that their artifacts are available to the public, that their code is functional for others to use, and that their results can be reproduced with their artifacts.

The committee received 33 artifact submissions and awarded 33 "Artifacts Available" badges, 79% of the 42 papers; 27 "Artifacts Functional" badges, 64%;
and 20 "Results Reproduced" badges, 48%. This is a considerable improvement over EuroSys'21 when those percentages were 55%, 47%, and 37% respectively.
Not all artifacts applied for the functional and reproduced badges.

The 65 evaluators in the committee wrote 116 reviews and ~1,000 comments, totaling ~120,000 words.
We aimed for 4 reviews per artifact except for those which only applied for the "Artifacts Available" badge, and 2 reviews per evaluator at most.
Committee members self-nominated via a public form. They came from 54 different affiliations, mostly universities in Northern America, Europe, and Asia; and a small fraction from industry.

To further evaluate the artifact evaluation process this year, we asked authors of submitted artifacts, authors who did not submit artifacts, and evaluators for anonymous feedback.
We summarize these results as well as our own observations.

# Process

The evaluation consisted of five phases: (1) authors submitted their artifact and documentation, (2) evaluators bid for artifacts,
(3) a "kick the tires" preparatory phase, (4) the full evaluation, and (5) discussion to reach consensus among the evaluators.

Authors could submit their artifacts as either a link to a repository or a file, though in the end everyone used a public repository.
We also asked them to provide an "Artifact Appendix" detailing the relationship between paper and artifacts using a [detailed template](https://sysartifacts.github.io/eurosys2022/instructions#artifact-appendix).

We provided [a guide document](https://sysartifacts.github.io/eurosys2022/guide) about the workflow to evaluators.
First, evaluators bid for artifacts they had expertise in with the goal of improving review quality.
Next came a preparatory phase where evaluators ensured that they could access the artifacts and that they had the necessary hardware and software for the evaluation.
For some artifacts, evaluators also received a list of claims that the Technical Program Committee summarized for the corresponding papers, to help evaluate whether artifacts reproduced the main claims of their paper.
In the preliminary phase, we also asked evaluators to plan the rest of the evaluation, such as a schedule for access to shared hardware if necessary.

Evaluators could evaluate the submitted artifacts on their machine, the [Chameleon](https://www.chameleoncloud.org/) and [CloudLab](https://www.cloudlab.us/) academic clouds, or the authors' machines.
Many authors chose to provide access to their hardware, especially for artifacts that needed non-standard hardware such as persistent memory.

The full evaluation phase was the bulk of the overall evaluation and asked evaluators to review their assigned artifacts for all badges requested by the artifact authors.
Evaluators used single-blind conversation with authors through HotCRP to resolve issues that arose.
Authors were allowed and encouraged to improve their artifact during the evaluation period,
such as fixing bugs and adding documentation. Evaluators updated their reviews in consequence.
At the end of the evaluation phase, we assigned one discussion lead per artifact to resolve possible disagreements regarding which badges should be awarded and write a public summary of the reviews.

# Successes

Artifact evaluation was overall a positive experience. In several instances evaluation improved both the paper and the artifact,
thanks to evaluators finding areas for improvement such as minor bugs and documentation clarifications.
Authors had time to fix these for the camera-ready paper versions.

This year, we provided [detailed checklists](https://sysartifacts.github.io/eurosys2022/badges#checklists) for the badges, a first for a systems conference, with the goal of helping both authors and evaluators.
Feedback from the evaluators was very positive, with many calling them "helpful" and one "a major advancement" compared to previous artifact evaluations.

According to feedback from authors and evaluators, the [instructions](https://sysartifacts.github.io/eurosys2022/) in the call for artifacts and call for evaluators were clear.
Since they are on [sysartifacts.github.io](http://sysartifacts.github.io), the website for artifact evaluation in systems, we hope that they can be reused by future conferences, not only EuroSys.
In particular, the badge checklists made evaluation easier according to evaluators, as mentioned above. Most reviews used our suggested template of indicating which of the checklist elements were met, partially met, or unmet.

Our choice of explicitly requiring a list of major claims in the Artifact Appendix was a success, with many evaluators noting this helped focus their evaluation.
We generally had a more detailed appendix template than previous systems artifact evaluations. Evaluators felt that the TPC major claims helped them to finalize and ascertain the list of major claims to reproduce.

Our choice of a large evaluation committee was a success, with the workload being reasonable according to feedback from the evaluators.
We encouraged evaluators to use private comments on HotCRP to coordinate in order to avoid flooding authors with messages, which led to many issues being resolved by other evaluators without having to ask the authors.

The use of Chameleon and CloudLab as cloud environments was useful for many artifacts, with some authors even choosing to include specific instructions to run their experiments on one or both of these clouds.
Generally speaking, the use of academic clouds eases the reproducibility of experiments and the reusability of artifacts. We did not have to pay for commercial cloud services.

We successfully asked authors to create a DOI for their artifact so it could be linked to the paper in the ACM DL, which makes finding artifacts easy.
Authors did not have issues doing so, in part thanks to the easy integration between GitHub and Zenodo.

# Areas for improvement

Our instructions improved upon previous years but could be improved.
Feedback from evaluators suggests future committees should in particular provide more details about how authors can prepare their artifacts for academic clouds and how evaluators can use such clouds.

Some evaluators felt that the badges were too "binary", especially "Results Reproduced".
The goal of this badge is to certify that the main results are reproduced, but readers may get the impression that every single claim was 100% reproduced when that is not the case.
We hope that our use of review summaries for the artifacts will help alleviate this issue.

It was not always easy for evaluators to match the claims in the Artifact Appendix to the paper and artifact, as well as to the claims shared by the Technical Program Committee.
We believe that this issue could be addressed by requiring authors to clearly identify their claims/contributions in the main body of their paper submissions.
This is something many successful papers already do, and making it explicit could help authors who are not aware of this part of the "hidden curriculum".
The appendix itself could also be shortened to only include information that is not already in the paper or the artifact documentation.
This also allows the validation of major claims made by the paper without requiring additional interactions between the TPC and the AEC.

Not all artifacts could be run on publicly available hardware such as evaluators' machines and academic clouds.
Some artifacts could only run on machines provided by the authors, and some were only designed for paid cloud services.
While functionality is independent of the hardware setup, and we did allow results to be reproduced on authors' hardware, this may cause reproducibility issues for the general public.
We believe that this is an issue that needs to be addressed early in the process. The use of commercial clouds in evaluations should be limited to services that have no academic counterparts.
The use of author hardware in artifact evaluation should be allowed only for artifacts that strictly require hardware not available in academic clouds.

Some of the papers that EuroSys had accepted conditional to revisions did not register for the artifact evaluation process until their revisions had been accepted,
which did not leave enough time for a full evaluation process.
In general, artifact evaluation being concurrent with the preparation of camera-ready versions means some new experiments may be left out of the public artifact or not evaluated.
Future committees should consider extending the evaluation deadline for revision papers so that authors can focus on their revision and their artifact separately,
even if this means awarding badges later than to other papers. Perhaps to the point where papers could apply to be evaluated after the conference.

12 of the 45 papers opted to not submit an artifact.
We asked their authors for feedback, and the responses were all factors external to our process, either (1) authors lacking time to properly prepare an artifact,
or (2) hardware, code, or data that the authors were not allowed to publicly share. The first problem is another argument for extended artifact evaluation deadlines.


The EuroSys'22 artifact evaluation chairs:  
[Natacha Crooks](https://nacrooks.github.io/) (UC Berkeley),  
[Solal Pirelli](https://dslab.epfl.ch/people/pirelli/) (EPFL),  
[Salvatore Signorello](https://ciencias.ulisboa.pt/perfil/ssignorello) (University of Lisbon),  
[Anjo Vahldiek-Oberwagner](https://vahldiek.github.io/) (Intel Labs)
