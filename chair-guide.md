Do you want to start an Artifact Evaluation (AE) process in an existing venue?
Did you get named AE chair but have no idea where to start?
This guide is for you!

This guide provides a detailed list of tasks grouped by deadline.
Some tasks can be done earlier than their corresponding deadline, such as preparing a feedback form early.

The goal of this guide is to enable you to spend your time trying out new things and improving the process, rather than reinventing each wheel as you discover the need for it.
And once you do improve things, submit a pull request to this guide so others can benefit from those improvements!

At the end of this guide are email templates for some of the tasks.

_This guide was compiled by Solal Pirelli based on experience co-chairing the [EuroSys'22 AE](https://sysartifacts.github.io/eurosys2022/index), with contributions from Anjo Vahldiek-Oberwagner._


# As early as possible


## Contact the previous AE chairs

If you are chair for a venue that has had an AE already, send an email to the previous chairs to ask for any informal feedback from the previous iteration.
If you are doing the first AE for a venue, you can still contact the chairs of a previous AE in a similar area.


## Contact the PC chairs

Ask for the expected number of accepted papers, which will determine how many evaluations need to be performed and thus the size of the AE committee.

This is also a great opportunity to suggest AE-related changes to the call for papers if you have any,
which can be as simple as "remind authors to prepare their artifact and ask for permission if they need to share hardware well in advance".


## Contact the general chairs

Ask (1) what restrictions there are on picking an AE committee, if any;
(2) how many awards the AE committee is allowed to give, of which kind, and under which conditions;
and (3) how to get a submission system up and running for the AE.

Typically you will give awards for best artifacts, possibly best reviewers, and potentially some form of "honorable mentions" for both categories.
You may need to form an explicit committee to decide on awards.


## Contact the publication chairs

Ask what information they need from the AE process and in what format, such as DOIs for artifacts, lists of badges,
whether paper authors need to put the badges in their camera-ready PDFs themselves, and so on.
Artifacts are typically handled differently from papers by publishers, thus the publication chairs themselves may not know and will have to ask, which takes time.


## Create a timeline

Create a timeline of activities and how they related to the general paper deadlines (e.g., acceptance notification, camera-ready).
Below is a template timeline:

- Submission: 2 weeks after paper acceptance
- Bidding: 3 days after submission
- Early "kick the tires" phase: 2 weeks after bidding
- Reviews due: 1 week before decisions are due
- Decisions: 1 week before the hard deadline of the venue for artifact decisions


## Create an evaluator self-nomination form

Ask at a minimum for:
- Email address
- Name
- Affiliation
- Whether they've done AE before (if you want to try and have at least one "senior" evaluator per artifact)
- Confirmation that they'll be available during the evaluation period

There is an infinite number of other questions you could ask on topics such as demographics or motivation,
but keep in mind that you need a large number of evaluators to spread the load, so you do not have to "weed out" applicants, quite the opposite.

The form must include the expected timeline, the evaluation workload, and general expectations from the evaluators.
This makes sure that they understand the commitment they make.

Aim for 4 evaluators per artifact, using the estimation for the number of artifacts you made earlier.
4 is a good number because even if one evaluator cannot do it in time, you will have 3 reviews to make a decision, and thus there will be a majority opinion rather than a possible tie.

For venues that already did artifact evaluation, use past data to estimate the fraction of papers that will submit artifacts;
for venues that are doing artifact valuation for the first time, heavily overestimate and consider that at least 50% of papers will submit an artifact.

Each evaluator should receive at most 2 papers requiring a full evaluation. Past experience has shown that any higher number typically leads to low quality reviews or overworked evaluators.


## Set up a website

Use an existing website if possible, such as [sysartifacts.github.io](https://sysartifacts.github.io/) for systems. Look at previous AEs in the same field, as you can likely copy/paste most of the pages.
You will need
(1) an introduction, i.e., what is AE and why should people care;
(2) a list of badges you will award and at least a rough description for each;
(3) a call for artifacts with specific deadlines;
(4) submission instructions including a contact email for questions;
(5) a list of committee members, which at this point is the list of chairs;
and (6) a call for artifact evaluators, including the registration form link and specific internal AE deadlines.

The public deadlines will likely include
(1) artifact submission,
(2) an early "kick the tires" evaluation phase during which evaluators double-check they have everything necessary to evaluate,
and (3) author notification.

The internal deadlines will likely include
(1) artifact bidding,
(2) the same early evaluation,
(3) reviewing,
and (4) badge decisions through discussion between evaluators.


## Publicize your call for evaluators

Send it to Slack workspaces such as "[CS Research & Practice](https://twitter.com/vj_chidambaram/status/1223076894431531008)",
lists of previous evaluators if you can get them from past chairs, Twitter, and any other place that has a lot of PhD students and early-career academics.

Monitor form submissions counts over time and ensure that you have enough to fill the committee with qualified members. Send reminders if needed.

See the email template for past evaluators.

_If you have the time, you could do the "guide for evaluators" task below now, to give a clearer picture of what AE is like to applicants._


## Set up instant messaging for the committee

The easiest option is a private Slack channel on the venue's workspace if it has one, or on an existing workspace.
You may also want another channel only for the chairs. IM is particularly useful for evaluators to talk about general issues,
or ask for help in a way that reaches everyone rather than comments on the submission system that most people will not see.


## Set up academic cloud/testbed projects

Two academic clouds are in common use for artifact evaluation: CloudLab and Chameleon Cloud.
Both are free to use.

For CloudLab, apply to a start a project [here](https://cloudlab.us/signup.php),
see the tips regarding AEC use [here](https://docs.cloudlab.us/repeatable-research.html#%28part._aec%29),
and contact [Robert Ricci](https://ricci.io/) if you have questions.

For Chameleon, follow the steps [here](https://www.chameleoncloud.org/blog/2021/11/22/using-chameleon-for-artifact-evaluation/),
and contact [Kate Keahey](https://www.mcs.anl.gov/~keahey/) if you have questions.

Evaluators can be invited to join the project once they have created an account in the system.

Additionally, the [Fabric](https://portal.fabric-testbed.net/) programmable network infrastructure can be
used for artifacts with networking needs, and connects to a variety of research infrastructures including
HPC centers. See Fabric's [reproducibility documentation](https://learn.fabric-testbed.net/knowledge-base/reproducibility/)
and [sign up](https://portal.fabric-testbed.net/signup/1) for a free account. 

## Define the additional information needed from authors

Past AEs have successfully used an "artifact appendix" model, in which authors submit a short document describing their artifact
when submitting the artifact itself, which is then used as an appendix in the camera-ready version of the paper.

Depending on what the PC chairs think, some information could also be required to be in the paper's main body.

Regardless of what model you use, camera-ready versions of papers that have an artifact should include
at least a link to an immutable version of the artifact, typically a DOI but possibly a Git commit.

Readers of the papers should then be able to easily obtain, either from the paper body, its appendix,
or the artifact documentation, instructions on how to use the artifact, how it relates to the paper,
which major claims are supported by the artifact, and so on depending on the badges obtained and their criteria.


## Set up a submission system

Past artifact evaluations have successfully used HotCRP.

Follow the instructions form your general chairs to set it up, as your venue likely has a deal with HotCRP.

Your submission form should include
(1) the title of the paper as it was submitted;
(2) the PDF of the paper as it was submitted;
(3) a link to the artifact, such as a GitHub repository;
(4) an artifact appendix if you require one;
and (5) any additional comments, such as specific hardware that the evaluators need, or credentials for exotic hardware provided by the authors.

While you could offer a "submit artifact as a ZIP" option, this is in practice so rarely used that authors who need it could submit a private sharing link
if their artifact is not publicly available, or a private code repository with credentials provided in the additional comments.

**Important**: Review all HotCRP settings, and in particular ensure that
(1) authors can see reviews,
(2) authors can exchange comments with reviewers,
and (3) authors can view reviews as soon as they are posted.


# At most a week before artifact submission


## Pick evaluators

See the self-nomination task above for advice on numbers.

If you do have to select evaluators because too many people self-nominated, keep in mind that artifact evaluation partly serves to introduce new folks to the broad research community,
and thus it is not a good idea to select only for experience or well-known affiliations.
Keep in mind that some venues have requirements for committees, you may need to get approval that the selected AEC is appropriately diverse.
See the email template.


## Notify evaluator candidates who were not chosen

See the email template.


## Write the checklist for badges

Each badge that evaluators can grant should have a clear checklist of goals, some of which may be optional.
While the final decision is up to the evaluators and can be more nuanced than yes/no for each checklist item,
a checklist provides a solid base for decisions and explanations. This checklist should be communicated as early as possible to authors as well.

See [the EuroSys'22 one](https://sysartifacts.github.io/eurosys2022/badges#checklists) for an example, the first such checklist, which evaluators found very useful according to their feedback.


## Write a guide for evaluators

Start from an existing one.
The guide should include at least the major points of [the EuroSys'22 one](https://sysartifacts.github.io/eurosys2022/guide):
(1) the goal;
(2) a reminder that the process is collaborative, and that evaluating the papers themselves is a non-goal;
(3) a description of each internal deadline;
(4) an explanation of how communication with authors works;
(5) a description of what setups are recommended and allowed to evaluate artifacts;
(6) a description of the reviewing process itself;
(7) information about the academic clouds available and how to register for them;
and (8) an example review following the checklist for badges.


## Finalize the website

You need pages or links for
(1) the badges with their checklists;
(2) a finalized call for artifacts, with emphasis on anything that is new compared to previous AEs for the same venue;
(3) a finalized submission instructions page including the link to the submission system;
(4) the guide for evaluators;
(5) a finalized committee page including all evaluators with their affiliation;
 and optionally (6) some "tips" pages for authors with good practices and examples of good artifacts from previous AEs.

Depending on what clouds you have available, you may want to explicitly restrict or forbid the use of commercial clouds and author-provided hardware,
especially based on who pays for the commercial clouds.


# Once papers have been accepted by the PC


## Remind authors to submit

Get a list of the authors of accepted papers from the PC, and email them reminding them to submit their artifact.
You can also ask the PC chairs to do it in the paper acceptance email itself.
See the email template.


# Artifact submission deadline


## Start the bidding process

You will likely want evaluators to bid on artifacts, so that they can review artifacts based on technologies they are familiar with. See the email template.


## Set up a review form

You need
(1) a "yes / no / not requested" choice for each badge;
(2) a "yes / no" choice for nominating for the best artifact award if you have one;
(3) a text field for comments to authors, encouraging evaluators to use the badge checklists directly and to add any remarks they deem necessary;
and (4) a text field for comments to evaluators.

While you could ask for a lot more than this, the utility of additional details is questionable.
There is little need to "strongly" or "weakly" grant a badge.


## Assign papers to chairs

Divide the papers into as many piles as there are chairs, and assign each chair a pile, such as using HotCRP tags. This way, tasks about artifacts can be parallelized.


## Optional: Ask authors who did not submit

You could ask authors that did not submit an artifact why they made that choice,
which doubles as a last-minute reminder them that it is still possible to register an artifact even if chairs have to manually create a submission.
See the email template.


# Bidding deadline


## Assign artifacts

Try to spread the load across evaluators. Double-check that no evaluator gets assigned only to "low workload" badges such as "artifacts available".


## Notify evaluators

Notify all evaluators that the early "kick the tires" phase has started and tell them what is expected of them at this stage.
See the email template.


# During early evaluation


## Check that evaluators are active

Each chair checks their assigned artifacts for problems.
This includes evaluators pointing out problems but not receiving author responses, and evaluators not having started their work.


# Early evaluation deadline


## Notify evaluators

Notify all evaluators that the early "kick the tires" phase has ended, and tell them what is expected of them at this stage.
See the email template.


# A few times during the reviewing period


## Check that evaluation is going well

Each chair checks their assigned artifacts for problems, such as unresponsive authors or reviewers, and reacts accordingly, such as a "ping" comment for specific people.


# Reviewing deadline


## Assign discussion leads

Each chair assigns one discussion lead for each of their artifacts.
The lead is in charge of getting everyone to agree on the final decisions.
If you want a public summary of reviews, the lead will be in charge if that as well.
Try to pick particularly active evaluators.
Avoid assigning the same evaluator as discussion lead of more than one artifact.

Once you have assigned leads, notify them.
See the email template.

This is also a good opportunity to make a shortlist for a "best reviewer award" if you have one.


# Decision deadline


## Finalize evaluation decisions

Besides having final decisions for each badge, what to do here heavily depends on what the publications chair asked from you.


## Send an evaluator feedback form

Help improve the general artifact evaluation process by asking evaluators for their feedback.
For instance, was the call for evaluators clear? Did they have enough guidance? Did the process go smoothly? How was the workload? Do they have any other comments?

You can use this step to validate any specific improvements you made during the process.

Remember that the more questions you ask, the fewer people will complete the form,
and the sooner you send the feedback form once evaluation decisions are made, the more people will complete the form.


# Notification deadline


## Send an author feedback form

Just as you asked feedback from evaluators, you can ask feedback from authors:
was the call for artifacts clear? Did the process go smoothly? Were the final reviews helpful? Do they have any other comments?

The same remarks on number of questions and promptness apply.


## Finalize award decisions

Be liberal in the number of awards, especially if you have "best reviewer" awards as they are a great way to integrate newcomers into the research community.


## Communicate Decisions to Publicizer

Based on the initial communication with the publication chair or the publicizer, send the required information.
The requested information can range from an Excel table with paper names and badges (keep in mind that some papers change names between submission of AE and camera-ready deadline)
or metadata required to add to the ACM Digital Library.

(Repository to build metadata for ACM DIgital Library at your own risk: [https://github.com/vahldiek/acmdl_artifact_metadata](https://github.com/vahldiek/acmdl_artifact_metadata))


## Write a report

Add a public "chairs' report" to the website, including statistics about badges awarded, what you think went well,
what you think future chairs should improve, and anything else you'd like to say.
This is your time to voice your opinion!


# Appendix: Email templates

These emails include `ALL_CAPS_PLACEHOLDERS`, and some make references to specifics that may or may not be applicable to your venue such as specific badge names.


## Asking past evaluators if they're interested

```
Dear TITLE_RELATED_TO_CONTEXT,

We are putting together an artifact evaluation committee for VENUE,
and we thought you might be interested since REASON.

If you would like to help make science reproducible and learn more about good artifact practices along the way,
please sign up at LINK before DATE!

If you know anyone else who might be interested, feel free to forward them this email.

Best regards,

The VENUE artifact evaluation chairs (AE_CHAIRS_NAMES)
```


## Notifying accepted evaluators

```
Dear NAME,

We are delighted to inform you that your application for the VENUE artifact evaluation committee has been accepted!

You will soon receive an email from the submission system with credentials.

If you do not receive such an email, please contact the artifact evaluation chairs at AE_CHAIRS_EMAIL.

Please fill your profile, especially your conflicts, before DATE, using the VENUE rules for conflicts at LINK.

We will also be using PLATFORM for informal discussion of issues not directly related to a particular artifact.
Please join it at LINK.

Best regards,

The VENUE artifact evaluation chairs (AE_CHAIRS_NAMES)
```

## Notifying rejected evaluators

```
Dear NAME,

We are sorry to inform you that your application for the VENUE artifact evaluation committee has been rejected.

Unfortunately, as we received more applications than we had spots on the committee, we had to reject some applicants.

This does not mean anything about you as a person, and we encourage you to apply to future artifact evaluations.

Best regards,

The VENUE artifact evaluation chairs (AE_CHAIRS_NAMES)
```


## Reminding authors to submit

```
Dear VENUE author,

Congratulations on your accepted OR_UNDER_REVISION paper!

We would like to invite you to submit the artifact of your paper for optional evaluation.
VENUE strongly believes that the dissemination of research artifacts encourages replication and reproduction,
enables scientists to extend previous work, and increases the impact of your work.
Papers whose artifact has passed the artifact evaluation process are recognized by one or more badges appearing on the paper's first page.
In the unlikely case where your artifact does not receive badges, your paper will not be affected.

To register your artifact, please fill the submission form no later than DATE (TIMEZONE) on SUBMISSION_LINK.
Please read the call for artifacts (CFA_LINK) for more details about the submission and the evaluation process.

If you have any questions or concerns regarding artifact evaluation,
please do not hesitate to contact us at AE_CHAIRS_EMAIL.

Best regards,

The VENUE artifact evaluation chairs (AE_CHAIRS_NAMES)
```


## Asking evaluators to bid

```
Dear VENUE artifact evaluator,

Artifacts have been registered for evaluation and now it is time for you to bid.
Bidding means expressing your preferences about which artifacts you would be more positively inclined to review.
You can check the full list of registered submissions, find some instructions and express your preferences at this link:

BIDDING_LINK

While bidding is optional, we highly encourage you to do it.
Bidding is a great opportunity to maximize your chances of getting assigned to artifacts you are more interested in reviewing.
For example, you may express preferences based on some research you are familiar with or you would like to learn more about.
Likewise, bidding may prevent you from ending up reviewing some artifacts you may not feel comfortable with,
because, for example, of extreme unfamiliarity with some hardware environment.

When bidding, please try to express more positive preferences (e.g., assigning at least 5 positive scores),
since this would give the automatic algorithm more choices to assign every reviewer artifacts they would like to review.

The bidding deadline is DATE (TIMEZONE), so please be sure to express your preferences by that date.

Best regards,

AE_CHAIRS_NAMES
```

## Asking authors who did not submit for feedback

```
Dear VENUE author,

Congratulations once more on accepted OR_UNDER_REVISION.

We have seen that you have not registered your artifact for evaluation and we would like to understand your decision better.
To that aim, we would really appreciate if you could let us know why you chose not to submit an artifact.
Our primary goal is to understand what, as a committee and as a community,
we could have done differently to better assist you in the process of submitting your artifact for evaluation.

If you simply missed the artifact registration deadline, but you are still interested in applying for artifact evaluation, please let us know.

Best regards,

AE_CHAIRS_NAMES
```


## Notifying evaluators that evaluation has started

```
Dear VENUE artifact evaluator,

Reviews for the submitted artifacts have been assigned to all the members,
so the early "kick the tires" phase of the artifact evaluation process has officially started.

This phase will last until DATE and its purpose is to let you determine whether you have everything you need
for a full review of the artifact assigned to you, e.g., the artifact itself, documentation,
any necessary hardware or other dependencies, and so on.
If you realize that is not the case, please discuss any issues with your fellow evaluators
and inform the authors as soon as possible, so that they have enough time to fix those.

Reviewers of each artifact should agree and post a single comment visible to authors including:

- Whether you have everything you need for the evaluation, and if not, what is missing
- A list of which results you will reproduce for each claim
- In case of shared hardware, a time frame of who will run experiments when

We have prepared a document with guidance about this phase and the whole process of artifact evaluation: LINK

Best regards,

AE_CHAIRS_NAMES
```


## Notifying evaluators that the early evaluation phase is over

```
Dear VENUE artifact evaluator,

It is now time to fully evaluate the artifacts and publish reviews.
Some evaluators have even already published reviews; these can still be edited and improved until the artifact decisions.

You are still able to, and are encouraged to, discuss with the authors if you cannot reproduce claims or if you encounter any issues with the artifacts.
Please do so in a constructive and structured form explaining what you were able to achieve while providing details such as error messages.

Your reviews should explain at least why an artifact deserves which badges, based on the badge checklists: LINK

Also use your own judgment.
If an artifact meets all checklist criteria for a badge, or if there is a good reason for the unmet criteria to not be deal-breakers,
the badge should be awarded. You can also include additional suggestions for the authors to improve their artifacts if you have any. 

We include an example review in the guide for evaluators: LINK

Regarding "Artifact Available" badges, artifacts do not need to have an immutable version before the end of evaluation.
Only a publicly available version of the artifact is needed.

Remember that the Artifacts Functional and Results Reproduced badges require not only running the code but also auditing it to ensure that
(for Artifacts Functional) the code is documented and understandable, and (for Results Reproduced) the code actually does what the paper states it does.
Merely reproducing similar output as the paper, such as performance metrics, is not enough, the artifact must actually do what it claims to do.

You are not expected to understand every single line of code immediately,
but you should be confident that the artifact overall matches the paper's description.

Reviews are due by DATE (TIMEZONE).

Thank you once again for helping make science reproducible!

Best regards,

AE_CHAIRS_NAMES
```


## Notifying discussion leads, incl. asking for a summary

```
Dear NAME,

Thank you again for your hard work.

We have assigned discussion leads to each artifact.
Discussion leads are tasked with getting all reviewers to agree on the final decision, via author discussion.

To provide the highest possible transparency, we are asking you to report an evaluation result as part of the results page on our website.
We will not only publish the awarded badges but also a report of the evaluation for each artifact receiving a reproducible badge.
The aim of this report is to describe what was exactly done to reproduce the claims of the paper
and to which extent the artifact evaluation was able to reproduce them.
The report should focus on the final state of the artifact instead of the entire process;
initial hiccups are not necessary to report if they were fixed. Therefore, the report should not include specific instructions to reproduce results.
That said, reports should highlight great reproducibility as well as limitations of your evaluations,
e.g., only being able to reproduce the results on a certain piece of hardware that does not allow the scaling of an experiment beyond 100 nodes.

We ask discussion leads of each artifact evaluation to start such a report and work on it together with your fellow reviewers.
If it helps, please feel free to create shared Google Docs to iterate the text, before making available the final text to us via a comment.

We have prepared a suggested structure to help you prepare the report below.
Please do not change the headlines (##). We cannot include figures at this stage. The text can include markdown for tables and lists.

If possible, please finish the reports before DATE.

Alternatively, please finish them as soon as possible. 

Best regards,

AE_CHAIRS_NAMES

Suggested structure:

## Artifact contents

Summary of the contents of the artifact. What major components and capabilities does this artifact provide?
No need to reference the artifact itself as its location will be added automatically; assume that the reader has access to the repository and readme files.

## Environment(s) used for testing

What setup(s) did the evaluators use? Their own hardware? Academic clouds? The authors' hardware?
Also, any noteworthy remarks, e.g., if only some environments could reproduce all results.

Include detailed hardware and software versions when possible.

## How the artifact supports the paper

Which claims does the artifact support?
Which were the exact experiments run and the results reproduced during evaluation?
Did the obtained results differ from the ones reported in the paper or were those generally the same?
If not, did reviewers observe at least similar trends?
Were all reviewers able to reproduce those results?
If not, which were the related issues? Are there any other limitations to reproducing those results?

## Additional notes (optional)

Additional comments about the artifact and its usage that may help others;
no need to write instructions that already exist in the artifact's documentation or appendix.
```


## Asking evaluators for feedback

```
Dear NAME,

Thank you once again making science more reproducible by evaluating artifacts for VENUE.

After NUMBER reviews and over NUMBER comments, totaling over NUMBER words, we're done.
It could literally not have happened without you.

We hope that this was an enjoyable and smooth process, we'd like to make it even better next time, and you can help!

Please take 5 minutes to fill our feedback survey: LINK

Thank you for your help!

AE_CHAIRS_NAMES
```


## Asking authors for feedback

```
Dear NAME,

Thank you once again for submitting your VENUE artifact for evaluation and making science more reproducible.

After NUMBER reviews and around NUMBER comments, totaling over NUMBER words, we're done.

We hope that the process went smoothly for you, we'd like to make it even better next time, and you can help!

Please take 5 minutes to fill our feedback survey: LINK

Thank you for your help!

AE_CHAIRS_NAMES
```
