---
layout: single
title: Badges
---

This page contains checklists describing the criteria for each badge in artifact evaluation.


## Artifact Available

- The artifact is available on a public website without authentication
- The artifact has a specific and immutable version whose long-term storage is guaranteed
  - Specifically, the artifact must be hosted on a repository with public backing and a succession plan in place, such as Zenodo
  - Private websites such as GitHub are not enough to guarantee availability in the future,
    but they are enough during the artifact evaluation process
  - Authors may link to a "live" version such as a GitHub repository in their artifact "read me" file
- The artifact has a license that at least allows anyone to use it for comparison purposes
- The artifact has a "read me" file with a short description and a reference to the paper

Artifacts must meet these criteria _at the time of evaluation_.
Promises of future availability, or artifacts "temporarily" gated behind credentials given to the evaluators, do not qualify.


## Artifact Functional

- The artifact has a "read me" file that documents it at a high level, including:
  - A description of the artifact, such as which folders correspond to code, benchmarks, data, …
  - A list of supported environments, including OS, specific hardware if necessary, …
  - An explanation of how to compile and run the artifact, including dependencies and pre-installation steps
  - An explanation of how to configure the artifact, such as selecting IP addresses or disks
  - An explanation of how to use the artifact on new inputs, such as analyzing a new data set
- The code is documented, allowing any software engineer with experience in the given programming language to understand and extend it
- The artifact includes a minimal working example
- The artifact uses the same terminology as the paper, such as the names of code modules
- The artifact is complete with respect to what the paper describes
- The artifact contains only the necessary files, and in particular does not contain obsolete code or data or pregenerated output files
- If the artifact includes a VM or container image, it must also include a script to create this VM or container from scratch

Artifacts must be usable on other machines than the authors', even if they require specific hardware such as network cards.
Artifacts that only work on a specific set of machines because they have hardcoded assumptions do not qualify.


## Results Reproduced

- The artifact has a "read me" file that documents:
  - The exact environment that the authors used, including the OS version, and hardware such as network cards
  - How to verify each claim made in the paper, using a single command per claim
  - An approximation of time and other resources used to verify each claim, such as "5 minutes, 1 GB of disk space" or "10 seconds, 100 MB of network use"
- All scripts to reproduce claims are documented, allowing any researcher with experience in the domain to audit them
- All claims mentioned in the paper can be independently reproduced using the artifact
- All external dependencies, including those used only for evaluation, are fetched from a well-known source such as an official website or GitHub repository
  - Any changes to such dependencies must be done through patch files or scripts that contain patching commands

Claims must be verifiable in a single command, only requiring manual input to configure the artifact at first and run each command.
These commands must make sense to any knowledgeable engineer inspecting the artifact, producing the right number is not enough.
Artifacts that require multiple steps to verify claims, that require manual steps beyond the first configuration, or that cannot be reasonably audited due to code complexity, do not qualify.
