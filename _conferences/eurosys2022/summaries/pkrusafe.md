---
title: "PKRU-Safe: Automatically Locking Down the Heap Between Safe and Unsafe Languages"
---

{% include_relative _result-header.html %}

## Artifact contents

This artifact includes a docker file and source code for reproducing three experiments in the paper PKRU-Safe. The artifact is well documented with clear instructions.

## Environment(s) used for testing

Reviewers used the following processors to evaluate the artifact:

- Intel Xeon Gold 6226 CPU on a local node.
- Intel Xeon Gold 6126 CPU on Chameleon cloud.

All reviewers used Linux systems.

## How the artifact supports the paper

(C1): PKRU-Safe is the first intra-process isolation scheme for heap data in mixed language environments, relying only on developer annotations that operate at the library level. This claim refers to experiment E1.

(C2): PKRU-Safe scales effectively to large projects such as Servo. This claim refers to experiment E2.

(C3): PKRU-Safe maintains relatively low overhead on real world applications. This claim refers to experiment E2.

(C4): PKRU-Safe defends against real world vulnerabilities. This claim refers to experiment E3.

All reviewers were able to reproduce those results, with the only following exception for claim C2, where one evaluation measured that:

	Dromaeo had a negative overhead of -10% (alloc) and -30% (mpk), which is
	drastically different from the numbers reported in the paper.
