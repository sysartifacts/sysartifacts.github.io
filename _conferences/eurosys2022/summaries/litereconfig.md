---
title: "LiteReconfig: Cost and Content Aware Reconfiguration of Video Object Detection Systems for Mobile GPUs"
---

{% include_relative _result-header.html %}

## Artifact contents

The artifact consists of:

Source code for LiteReconfig,
Example scripts and source code for experiments,
Documentation and instructions for the artifact,
Environment files to configure dependencies.

## Environment(s) used for testing

The authors provided access to their embedded devices equipped with the following boards.

NVIDIA Jetson TX2,
NVIDIA Jetson AGX Xavier.

## How the artifact supports the paper

The paper made four main claims (C1-C4), which are supported by the artifacts as follows.

	C1: LiteReconfig achieves 45.4% mAP accuracy at 30 fps on the NVIDIA TX2
    board under no resource contention for a video object detection task.

This claim is supported by running LiteReconfig on two different embedded devices provided by the authors. The AEC evaluators verified the accuracy and latency results by reproducing experiments on both boards. For NVIDIA TX2, the expected accuracy was 45.4% and latency was less than 33.3 ms (95.5 percentile). While using the Xavier board, the accuracy remains 46.4% mAP and latency remains less than 20.0 ms (95 percentile).

	C2: LiteReconfig improves the accuracy 1.8% to 3.5% mean average precision
	(mAP) over the state-of-the-art (SOTA) adaptive object detection systems.

The evaluators measured improvement over the state-of-the-art (SOTA) by first running LiteConfig with 100 ms latency SLA and compared it with SOTA. They confirmed that LiteReconfig shows an improvement of 3.5% mAP under no contention, when used with 50% GPU contention, LiteConfig beats SOTA by 1.8% mAP.

	C3: LiteReconfig is 74.9X, 30.5X, and 20.0X faster than SELSA, MEGA, and
	REPP on the Jetson TX2 board.

The evaluators compared latency for LiteReconfig on TX2 against SLSA, MEGA and REPP. They confirmed that LiteReconfig improves over baselines by 74.9X, 30.5X, and 20.0X respectively.

	C4: LiteReconfig is 1.0% and 2.2% mAP better than
	LiteReconfig-MaxContent-ResNet given (0% contention, 33.3 ms latency SLA)
	and (50% contention, 50.0 ms latency SLA) cases.

The evaluators ran different variants of LiteReconfig on TX2 under no contention and 50% contention of GPU, and the comparison proved that LiteReconfig is 1.0% and 2.2% mAP better than the other variant (i.e., LiteReconfig-MaxContent-ResNet).