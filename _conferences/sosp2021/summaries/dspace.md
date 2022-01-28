---
title: "Artifact Review Summary: dSpace: Composable Abstractions for Smart Spaces"
---

{% include_relative _result-header.html %}

## Description of the Artifact

Artifact location: <https://github.com/digi-project/sosp21-artifact>

Artifact README: <https://github.com/digi-project/sosp21-artifact>

The authors provided a GitHub repo with the source code and example scenarios for testing dSpace. Specifically, the artifact consists of different examples to simulate various scenarios described in the paper. The artifact also includes Mock devices/scenarios so that evaluators can test the framework without physical IoT devices. In addition, the artifact also has a benchmarks section to reproduce results of a few charts presented in the paper.

The instructions are relatively clear to follow. The system can be easily deployed with minikube.

## Environment(s) Used for Testing

The environment used for evaluation by evaluators.

- **Evaluator-1**: Physical machine, Ubuntu 18.04.5 LTS, minikube v1.23.0, python 3.8.0
- **Evaluator-2**: CloudLab profile provided by the AEC chair which pre-installs Kubernetes (v2.16) on the top of CloudLab's standard Ubuntu 18.04 image. Python 3.7 and 3.8 are both used, but most of the tests were conducted on 3.7.
- **Evaluator-3**: CloudLab with k8s profile for evaluation, which include three nodes.
  - OS env: Ubuntu 18.04.1 LTS (kernel: 4.15.0-147-generic).
  - Python: Python 3.7.12
  - Gcc: gcc (Ubuntu 7.5.0-3ubuntu1~18.04) 7.5.0
  - golang: go version go1.17 linux/amd64
- **Evaluator-4**: K8s single node configuration provided by CloudLab, Ubuntu 18.04, Python3.7, and minikube1.13
- **Evaluator-5**: Local desktop machine
  - OS: Ubuntu 20.04 LTS
  - Python: 3.8.10
  - minikube: v1.23.1
  - kubectl: v1.22



## Step-By-Step Instructions to Excercise the Artifact

Although evaluators faced problems regarding setting up environment—e.g., version of `python` and other dependent libraries, configuration (`.yaml` files), and docker images—most of the issues have been addressed by the authors during the artifact evaluation process. Thus, most people would be able to simply follow the the author's instructions to test dSpace.



Special notes to excercise the artifact:

- In the QuickStart part, `pip install -e` . should be in runtime/driver, instead of runtime/driver/digi/
- Python version should be `>= 3.7`.
- You may need `sudo apt-get install python3.7-dev` if you miss some python headers
- Use `make gen KIND=tv` instead of `make gen KIND=TV` in QuickStart. It seems that the script is case-sensitive.
- It's strongly suggested to use local repo, or manually copy your docker images into minikube.
- To run benchmarks, do not forget modify the `REPO` in `benchmarks/digis/Makefile` (if you use your own docker repo)
- In mocks/lamp/deploy/cr.yaml, the value for brightness should be map like `intent: 0.8`, and the value for power should be `intent: "off"`
- Use old version of kopf, i.e., `pip install kopf==0.28.3`
- In benchmarks/digis/measure/deploy/cr.yaml, should use "name: \{\{ .Values.name \}\}" instead of name: "\\\{\\\{ .Values.name \\\}\\\}"

## How The Artifact Supports The Paper

The artifact supports the claims (functionalities) made in this paper. The framework is programmable and working for several scenarios.

Specifically, the following is the claims listed in the paper and how the AE supports them.

**Performance Claims**

The performance results are presented in Figure-7, which give the FPT, BPT, and DT costs for three scenarios, i.e., Lamp, Room-Lamp, and  Scene-Room.

A significant result is that the costs of dSpace (FPT+BPT) are much less than device costs.

The AE provides lamp and room-lamp benchmark cases (based on emulated dev).

The results are shown in below (Note: the results are produced by the environment of Evaluator-3).

**lamp**

    lamp-test
    python lamp.py
    warmed up
    {'backward_leaf': 1631604503.1615288,
      'forward_leaf': 1631604502.9493866,
     'start': 1631604502.9408576}
     {'bpt': 0.004289388656616211,
       'dt': 0.2121422290802002,
       'fpt': 0.008528947830200195,
     'ttf': 0.2249605655670166}

**room_lamp**

    lamp-test
    python room_lamp.py
    warmed up
    {'backward_leaf': 1631605331.3310592,
      'forward_leaf': 1631605331.1202724,
      'start': 1631605331.0724647}
     {'bpt': 0.008245706558227539,
       'dt': 0.2107868194580078,
       'fpt': 0.04780769348144531,
      'ttf': 0.26684021949768066}

In Lamp, the (BPT+FPT)/DT=6%, and in ROOM_LAMP, the value is 26%.
The results are basically match 20% and 45% in the paper as the emulated env may lead to less propagation time.

**Programmability Claims**

A significant new contribution of dspace is to ease the programming efforts for smart-home applications. The AE well supports this.

Specifically, it provide cases:

* Build and run a single digi app (i.e., the TV demo) which allow users to edit the intent, e.g., power
* Compose two digis: a lamp digi is shown to be mounted to a room digi, and I can use kubectl to editi room's brightness
* Policy: the AE also gives example with yield policy, which is a case for scenario-10 in the paper (delegation of control)

As a result, evaluators agree the AE for availability and functionality badeges.



## Additional Notes and Resources

The evaluators presented the following suggestions that can improve the artifcat.

- It should provide an example about dynamically mounting a device to different parent devices.
- It should provide more diverse example scenarios. In addition, it would be awesome if users can connect dSpace to IoT device simulators, so that they demonstrate their deployment scenario in a more intuitive way.

- Prepare a list of supported real devices and give demo for those devices.
