---
title: "Artifact Review Summary: Bagpipe: Accelerating Deep Recommendation Model Training"
---

{% include_relative _result-header.html %}

## Description of the Artifact

The artifact is located on GitHub, at [https://github.com/iidsample/bagpipe_artifacts](https://github.com/iidsample/bagpipe_artifacts) and its README file at [https://github.com/iidsample/bagpipe_artifacts/blob/main/README.md](https://github.com/iidsample/bagpipe_artifacts/blob/main/README.md).
This artifact includes the source code of BagPipe and instructions to reproduce the results.
Furthermore, the authors have also provided AWS resources to assist the reviewers in replicating the results.

## Environment(s) Used for Testing

For evaluation of this artifact the AWS EC2 instances that the authors provided was used by all evaluators

## Step-By-Step Instructions to Exercise the Artifact

The evaluators used the following steps to exercise the artifact in the AWS EC2 environment:
* Access the cloud instance by the given private key;
* Activate the python virtual environment needed;
* Launch the given script which run the experiments with the default DLRM model;
* Parse the collected log files.


## How The Artifact Supports The Paper

All evaluators ran the artifact and succeeded to reproduce the paper's claims. In most cases, the numbers achieved were the same as the paper claimed, with minor exceptions.
In the comparison of BagPipe with other systems (i.e. TorchRec), the claimed advantage was clearly achieved.

The artifact is awarded with the following badges:
* Artifact Available
* Artifact Functional
* Results Reproduced
