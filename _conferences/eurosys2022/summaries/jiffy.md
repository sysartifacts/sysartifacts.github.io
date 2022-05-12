---
title: "Jiffy: Elastic Far-Memory for Stateful Serverless Analytics."
---

{% include_relative _result-header.html %}

## Artifact contents

The artifact provides four directories with scripts to build, deploy, run, and plot the four major experiments in the paper.

## Environment(s) used for testing

Results were reproduced using AWS services. Hardware and software provisioning was done by the authors; artifact evaluators were unaware of the software versions used.

With the exception of the Pocket experiments, the evaluators were able to deploy, build, and run the experiments without the author's intervention. In order to run the Pocket baseline, the authors built and deployed the system, and the evaluators ran the experiment script.

## How the artifact supports the paper

As part of the artifact evaluation, the evaluators have been able to reproduce all the figures included in the paper with the exception of the figure on the controller's throughput scaling. The authors did not include instructions to reproduce this result.

In general, the results obtained are similar to the ones included in the paper, and validate the claims therein.

## Additional notes

Even though results have been successfully reproduced and the badges awarded, the evaluators make the observation that the results have little statistical significance, as each data point is the result of one single experiment run. The evaluators encourage the authors to provide statistically significant results.