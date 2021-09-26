---
layout: single
title: Report
sidebar:
    title: 'SOSP 2021'
    nav: sosp2021toc
---

## Letter From the AEC Chairs

We would like to thank all of the AEC members and all artifact authors for their hard work!

This year, [40 papers (74% of accepted papers) submitted artifacts](results.html). Of those, 39 (98% of artifacts, 72% of papers) received the Available badge, 38 (95% of artifacts, 70% of papers) were awarded the Functional badge, and 27 (68% of artifacts, 50% of papers) were Reproduced. These numbers demonstrate a remarkable uptake of the artifact process - only in its second iteration at SOSP - by our community. This is all the more extraordinary for the size and complexity of artifacts we produce, and we think it shows a commendable commitment to open research and reproducible results.

We approached this as a collaborative process, both within the AEC and with the artifact authors: our goals were to get high-quality artifacts out to the community and to recognize authors for their work. Two thirds of the artifacts were improved in some tangible way through this process. These enhancements ranged from small changes to documentation all the way up to development of better automation and release of additional datasets and proofs. In many cases, authors were able to fix problems with their artifacts that might have otherwise kept them from earning badges.

We discussed each artifact among the reviewers to come to a consensus, and as a result are confident in our badging decisions. We will be posting public summaries of the reviews on the [results section of this website](results.html) to detail what we did with each artifact, explain our basis for awarding badges, and provide additional information for those who would like to try the artifacts for themselves.

The members of the AEC were collected via a self-nomination process. We cast a wide net, and in the end had a total of [91 reviewers](organizers.html). This allowed us to keep the review load low (one or two reviews per AEC member) while producing a large number of reviews for each artifact (two to five, with an average of 4.3). It also allowed us to ensure that every artifact was assigned a review by at least one person with prior experience (either on an AEC or as an artifact author), while also giving many people who were first-timers to the process a new, and we hope, valuable experience.

The quantity and quality of activity on the AEC was tremendous. Overall, AEC members produced 171 reviews and together, reviewers and authors exchanged 1,613 messages - the average artifact had 40 messages, and two went as high as 130. Together, these reviews and comments contain nearly a quarter-million words of text. Even with many of these words being the output from artifacts, this is truly an overwhelming number. We owe a debt of gratitude to [Eddie Kohler](http://read.seas.harvard.edu/~kohler/), whose excellent [HotCRP](http://www.read.seas.harvard.edu/~kohler/hotcrp/) platform handled this volume flawlessly and gave us the set of tools we needed to enable this cooperation.

We gave authors a [wide range of options for packaging their artifacts](call.html#packaging-artifacts) and thus, there were a wide range of environments used for running them. We made sure that AEC members could access public infrastructure for research ([CloudLab](https://cloudlab.us), [Chameleon Cloud](https://www.chameleoncloud.org/), [Grid’5000](https://www.grid5000.fr/)) and public clouds [AWS](https://aws.amazon.com), [Azure](https://azure.com)). These were popular ways of running artifacts, with 24 artifacts being evaluated on CloudLab, six on AWS, two on Chameleon, and one on Grid’5000. Of course, many reviewers use their own desktops, laptops, or lab machines: eleven artifacts were evaluated this way. We also allowed authors to provide pre-configured resources in their own labs or public clouds - this was intended primarily to support artifacts that had special hardware requirements - and 21 did so. Many artifacts were evaluated in more than one environment, which is why the numbers in this paragraph sum to more than 40 - for example, of the 21 artifacts that were evaluated on author-provided resources, nine were evaluated on other systems as well.

Our takeaways from the SOSP AEC this year are:

* **Collaboration improves artifacts.** We set up the AEC to enable and encourage AEC members to communicate with each other and with authors. They did so with great zeal, and authors responded promptly and positively. We attribute the high fraction of badges awarded in large part to this process, as it gave artifact authors the chance to get their artifacts up to the standards required. 90% of submitted artifacts were awarded all badges they applied for.
* **Low reviewing load produces high-quality reviews.** AEC members had no more than two artifacts to review, and nearly five weeks in which to complete their reviews.  As many AECs do, we divided the review period into two parts, a “kick the tires” portion and a “reviewing” portion - this helped encourage reviewers to start engaging with the artifacts early on. As with most TPCs, we had AEC members bid on artifacts, ensuring that they were reviewing artifacts they were interested in and had the technical expertise to review. The result of these practices were reviews that we believe are particularly high quality, with great attention to detail and rigorous application of the badging standards.
* **Access to suitable test environments makes a big difference.** We also attribute the high rate of badges awarded to the availability of public platforms for systems research. For instance, reviewers used more than 11,000 node-hours on CloudLab. Two-thirds of Functional and Reproduced evaluations used public environments or the evaluators’ own resources, giving us confidence that others in the community can do the same. We think there is still room for improvement here, by more strongly encouraging software-only artifacts to be runnable “from scratch” and by expanding the range of specialized hardware in the public testbeds.
* **An AEC can be a great learning experience for everyone.** Our members came from a variety of backgrounds, some with extensive publishing and artifact experience, and others with little or none. We believe that this was a great chance for junior members to gain hands-on experience with research code and to start developing a good understanding of what should be expected from their own artifacts. At the same time, while some authors have experience releasing and packaging software, many do not, and our experience suggests that having so many “eyes” on their artifacts helped them to understand the needs of the users of those artifacts.
* **Evaluated artifacts have already become the norm in our community.** In just its second instance of an AEC, fully half of the papers in SOSP were reproduced, and seventy percent could be exercised by people beyond the original authors. With comparable rates of AEC participation in other systems conferences, it’s clear that submitting artifacts has already become the default option.

We again want to express our appreciation for all participants - we hope to see your artifacts, and to see you on AECs - again!

### SOSP 2021 AEC Chairs
* Robert Ricci (University of Utah)
* Ivo Jimenez (UC Santa Cruz, CROSS, University of Sonora)
* Dan Ports (Microsoft Research, University of Washington)


