---
title: Artifact Packaging
order: 30
---

Artifacts must be packaged to ease evaluation and use, including [instructions](#instructions) for the artifact and an [artifact appendix](#artifact-appendix).
Packaging is not only about evaluation but about future use of the artifact by other researchers who may want to build on top of it or use it as a baseline.

If you have further questions about how best to package your artifact, contact the AEC chairs at [aec-2026@eurosys.org](mailto:aec-2026@eurosys.org).


## Instructions

Follow the packaging guide for artifact authors [here](/packaging-guide).

Also see the [badges](badges) page for more details on what the instructions should contain.


## Artifact Appendix

The artifact appendix is a self-contained document which describes a roadmap for evaluators. This particularly includes a description of the hardware, software, and configuration requirements, as well as the **list of major claims** made by the paper that can be reproduced through your artifact.


Linking the claims of the paper to the artifact is a **necessary step** that allows artifact evaluators to reproduce your results.
*It is of foremost importance that you state your paper's key results and claims clearly.*
Also, make your claims about your artifacts **concrete**.
This is especially important if you think that these claims differ from the expectations set up by your paper.
The AEC will still evaluate your artifacts relatively to your paper, but your explanation can help to set expectations up front, especially in cases that might frustrate the evaluators without prior notice.
For example, tell the AEC about difficulties they might encounter in using the artifact or its maturity relative to the content of the paper.

An artifact appendix must provide details on the time and hardware resources (e.g., storage) required to run the experiments in your paper.
If possible, the appendix should also describe how to compare the results of a reproduced experiment to the ones found in the paper (e.g., by providing access to the underlying dataset of the results).

The intention for the artifact appendix is to be published in conjunction with your artifact.
A template for the artifact appendix can be found here: [LaTeX Template](appendix/EuroSys26_ArtifactAppendix_template.tex) (to be used in conjuction with the EuroSys'26 template for research papers).

**Artifact Appendices are limited to 2 pages.**
