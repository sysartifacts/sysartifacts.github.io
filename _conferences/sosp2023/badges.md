---
title: Badges
order: 40
---

Submitted artifacts can select to be evaluated against the following badges, which are defined in the [ACM Artifact Review and Badging policy v1.1](https://www.acm.org/publications/policies/artifact-review-and-badging-current).

<style>
table th:first-of-type {
    width: 20%;
}
table th:nth-of-type(2) {
    width: 70%;
}
</style>

| Badge | Description |
|:-----:|:-----------:|
| <img src="{{ site.baseurl }}/images/acm_available_1.1.png" alt="Artifacts Available V1.1" width="150px"> | Author-created artifacts relevant to this paper have been placed on a publicly accessible archival repository. A DOI or link to this repository along with a unique identifier for the object is provided.  |
| <img src="{{ site.baseurl }}/images/acm_functional_1.1.png" alt="Artifacts Evaluated - Functional V1.1" width="150px"> | The artifacts associated with the research are found to be documented, consistent, complete, exercisable, and include appropriate evidence of verification and validation. |
| <img src="{{ site.baseurl }}/images/acm_reproduced_1.1.png" alt="Results Reproduced V1.1" width="150px"> | The main results of the paper have been obtained in a subsequent study by a person or team other than the authors, using, in part, artifacts provided by the author. |

## Checklists

Unfortunately, artifacts sometimes miss badges because they were not tested on a clean setup, or not documented enough, or because running experiments is too error-prone due to complex manual steps. Below we provide checklists for authors to minimize the risk of an artifact unnecessarily missing a badge.

### Artifact Available

- The artifact is available on a public website with a specific version such as a git commit.
- The artifact has a “read me” file with a reference to the paper.
- The artifact has an associated license and ideally one that at least allows use for comparison purposes.

Artifacts must meet these criteria *at the time of evaluation*. Promises of future availability, such as artifacts “temporarily” gated behind credentials given to evaluators, are not enough.

### Artifact Evaluated - Functional

- The artifact has a “read me” file with high-level documentation:
  - A description, such as which folders correspond to code, benchmarks, data, …
  - A list of supported environments, including OS, specific hardware if necessary, …
  - Compilation and running instructions, including dependencies and pre-installation steps, with a reasonable degree of automation such as scripts to download and build exotic dependencies.
 - Configuration instructions, such as selecting IP addresses or disks.
 - Usage instructions, such as analyzing a new data set.
 - Instructions for a “minimal working example”.
- The artifact has documentation explaining the high-level organization of modules, and code comments explaining non-obvious code, such that other researchers can fully understand it.
- The artifact contains all components the paper describes using the same terminology as the paper, and no obsolete code/data
- If the artifact includes a container/VM, it must also contain a script to create it from scratch
Artifacts must be usable on other machines than the authors’, though they may require hardware such as specific network cards. Information such as IP addresses must not be hardcoded.

### Results Reproduced

- The artifact has a “read me” file that documents:
  - The exact environment the authors used, including OS version and any special hardware.
  - The exact commands to run to reproduce each claim from the paper.
  - The approximate resources used per claim, such as “5 minutes, 1 GB of disk space”.
  - The scripts to reproduce claims are documented, allowing researchers to ensure they correspond to the claims; merely producing the right output is not enough.
- The artifact’s external dependencies are fetched from well-known sources such as official websites or GitHub repositories.
  - Changes to such dependencies should be clearly separated, such as using a patch file or a repository fork with a clear commit history

The amount of manual work, such as writing configuration files, should be reasonably minimized. In particular, there should be no redundant manual steps such as writing the same configuration values in multiple places, as this inevitably leads to human error.
