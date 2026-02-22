---
title: Badges
order: 10
---

<style>
img { width: 4em; }
</style>

CAIS is an ACM conference and thus uses [ACM's badges](https://www.acm.org/publications/policies/artifact-review-and-badging-current). Authors can apply for, and be awarded, one of following three badge combinations:

| ![Available](/images/acm_available_1.1.png) ![Functional](/images/acm_functional_1.1.png) ![Reproduced](/images/acm_reproduced_1.1.png)<br>**Available, Functional, and Reproduced** | For the vast majority of software artifacts,<br>and for hardware artifacts whenever possible.  |
| ![Available](/images/acm_available_1.1.png) ![Functional](/images/acm_functional_1.1.png)<br>**Available and Functional** | For data sets,<br>as well as artifacts that require custom environments authors can't give access to. |
| ![Functional](/images/acm_functional_1.1.png) ![Reproduced](/images/acm_reproduced_1.1.png)<br>**Functional and Reproduced** | For software and hardware artifacts that the authors cannot make public. |

Artifacts submitted for the first target may be awarded one of the other two if availability or reproducibility evaluations fail, respectively. Authors cannot apply for other combinations of badges as these make little sense (e.g., an artifact that is not public, does not appear functional, but outputs the expected measurements).


## Checklists

To provide a fair evaluation across artifacts, help authors prepare, and enable evaluators to work efficiently, each badge has an associated checklist.

### "Available" checklist

- The artifact is available on a **public archive with irrevocable versioning and long-term storage**, such as Zenodo but not GitHub
- The artifact has a **license that allows comparison and extension**, such as the [CC-BY](https://creativecommons.org/licenses/by/4.0/) or [MIT](https://opensource.org/license/mit/) licenses
- The artifact has a **"read me" file referencing the paper**

Note that these criteria must be met *at the time artifact evaluation finishes*, but development may take place on a platform like GitHub. Authors only need to save their artifact to long-term storage once evaluators are otherwise satisfied. However, promises of future availability are *not* acceptable, such as uploading the artifact to a private repository with the goal of "eventually" making it public.

### "Functional" checklist

- The artifact has a **"read me" file** with:
  - A description of each artifact component and how it relates to the paper
  - A description of the exact environment the authors used, such as OS version and hardware
  - If the artifact includes code that deliberately performs malicious or destructive operations, appropriate warnings and context
- The artifact includes **all code and data relevant to the paper**, and only those
  - The artifact must not include obsolete or unrelated code nor data
  - If existing code or data has been modified, the artifact should clearly separate the modifications from the original
  - If the paper makes soundness claims, such as proofs, there should be simple scripts to verify these, such as listing proof assumptions
  - If the paper makes quantifiable claims, such as code size per module, there should be simple scripts to output these
- For data, **modifications made to the raw data are documented**
  - For instance, whether parts of the raw data were anonymized or discarded
- For executable artifacts, the "read me" file also contains **documentation** to:
  - Run and extend a "minimal working example"
  - Compile and execute the artifact, including pre-installation steps
  - Configure the artifact, such as selecting IP addresses or disks
  - Know the expected resource use per kind of experiment, such as "5 minutes, 10 GB of disk space"
  - Know what unusual behavior to expect, such as warning messages emitted by another system used as baseline for experiments
- For executable artifacts, the artifact includes a **precise list of dependencies**:
  - Whenever possible, it should be usable by a package manager
  - Exotic dependencies must have associated automation to download and build them
  - OS-level dependencies must involve a VM/container, accompanied by a script to generate the VM/container
  - Proprietary dependencies must have associated instructions to obtain them along with "mock" versions to demonstrate their use
- The artifact includes an **example input and configuration for each kind of experiment** in the paper
  - Authors are encouraged, but not required, to provide inputs, configurations, and outputs for all experiments described in the paper

Manual work such as writing configuration files must be minimized. There must be no redundant manual steps such as writing the same configuration values in multiple places, as this inevitably leads to human error. Also, artifacts must be usable on other environments than the authors', though software may require specific hardware (e.g., a particular network card, a specific GPU, etc.).

### "Reproduced" checklist

- The artifact includes a **single script to run each experiment** and output results, given the necessary input and configuration
  - The scripts must be documented, allowing researchers to ensure they correspond to the claims, merely producing the right output is not enough
  - The scripts must handle common edge cases in a reasonable fashion, such as forgetting arguments or running the same script twice
- The artifact includes a **script to convert each experiment's results into human-readable ones** as close to the paper presentation as possible
  - For simple results presentation such as tables, this and the previous script can be merged into one
  - The artifact may contain separate installation steps for the dependencies of plotting scripts, subject to the same criteria

The expected workflow for an evaluator or a researcher looking to reuse the artifact is to install the artifact using a handful of commands, run experiments with minimal effort (ideally running a single script per experiment or group of experiments), and display experimental data as necessary. In absence of issues requiring in-depth debugging, active time must not exceed a few minutes.
