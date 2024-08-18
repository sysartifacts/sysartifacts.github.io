---
title: "Artifact Review Summary: Achieving Microsecond-Scale Tail Latency Efficiently with Approximate Optimal Scheduling"
---

{% include_relative _result-header.html %}

## Description of the Artifact

The artifact consists of a git repository publicly hosted on GitHub.

- Artifact location: [https://github.com/m8/concord](https://github.com/m8/concord)
- Artifact README: [https://github.com/m8/concord/blob/master/README.md](https://github.com/m8/concord/blob/master/README.md)

The repository contains the source code for Concord.
In particular:  
  
  a) the two LLVM passes used by Concord to automatically instrument applications.  
  b) implementations of the Concord runtime on two state-of-the-art dataplane OSes
     ([Shinjuku](https://github.com/stanford-mast/shinjuku) and [Persephone](https://github.com/maxdml/psp)).  

It also comprises scripts to: install the required dependencies, build a test environment, compile the prototype and run a minimal example.
In addition, it also provides benchmarking codes and scripts to reproduce four of the paper's figures:  

  a) fig. 1: abstract visualization of the throughput overhead of µ-sec scale scheduling in state-of-the-art datacenter systems.  
  b) fig. 2: comparison of overheads in preemption mechanisms (Concord, Shinjuku, and Compiler Interrupts).  
  c) fig. 5: simulation showing the impact of non-instantaneous preemption on tail latency.  
  d) table 1: overhead and timeliness of Concord's instrumentation for 24 applications, compared to Compiler Interrupts.  

The README instructions indicates:  

  a) the content of the repo.  
  b) steps to setup a test environment.  
  c) steps to compile Concord and run a minimal example.  
  d) steps to run the micro-benchmark scripts and produce figures or tables.  

## Environment(s) Used for Testing

According to the authors, the artifact is exercisable on any Linux server **with root access** running **Ubuntu 18.04**.
Reviewers successfully set up test environments on different CloudLab node types:
`m510`, `c220g1`, `c220g2`, and `c6420`; all running on `Ubuntu 18.04`
(detailed hardware specifications available at: [http://docs.cloudlab.us/hardware.html](http://docs.cloudlab.us/hardware.html)) 

Additional notes:

  - **Table 1** was successfully reproduced only on `m510` & `c6420` node types.
  - **Figure 2** was successfully reproduced only on `c6420` node type.
  - **Table 1** requires large amount of free disk space in the working directory (reviewers found around `100G`).
  - **Figure 2** requires a specific kernel version (`4.4.185-0404185-generic`) that can be obtained through provided scripts.

## Step-By-Step Instructions to Exercise the Artifact

All reviewers used commit [045b19f](https://github.com/m8/concord/tree/045b19fc6dd87b380845126fb981e417b46b9e9a) of the artifact repository,
and simply followed step-by-step instructions in the README.

Here are some complementary steps that were crucial to exercise parts of the artifact.

**Hardware requirements:**  
Reviewers ensured at least `100G` of free disk space in the working directory (required by `Table 1` scripts).

**Getting Started:**  
The `Dune` submodule may fail to be obtained while cloning the repository with the provided command.
This can be ignored, as the submodule is fetched later from a setup script.
Alternatively, reviewers also manually fetched the submodule at this step through:

    $ git clone https://github.com/kkaffes/dune.git concord-shinjuku/deps/dune

**Additional dependencies**  

- Some reviewers reported missing dependencies when running the python plot scripts (`tkinter`, `matplotlib`).
Ensure these are installed with:

       $ sudo apt install python3-matplotlib python3-tk

- Some reviewers also found that scripts for fig.2 & fig.5 needed a properly set DISPLAY environment variable.
When running on a headless server, a workaround is to use [Xvfb](https://www.x.org/releases/X11R7.6/doc/man/man1/Xvfb.1.xhtml).

       $ sudo apt install xvfb
       $ Xvfb & #Start a virtual X session
       $ #Then use `xvfb-run [cmd]` to start a command that needs a graphical server running.

**Figure 2: Installing & Booting the proper kernel version**  
Reviewers only successfully ran fig.2 scripts after ensuring the Linux kernel version specified by the authors (`4.4.185-0404185-generic`) was installed and running.
It can be obtained easily through the provided scripts, as described in the README.

    $ cd scripts/
    $ bash download_kernel.sh shinjuku
    $ bash boot_kernel.sh shinjuku #This will automatically reboot the machine

After rebooting, make sure that the proper kernel version is in use.

    $ uname -r #Should return 4.4.185-0404185-generic

If not, then likely the script did not properly reconfigure the bootloader.

1. Check that the expected kernel is indeed installed.

       $ ls /boot #kernel 4.4.X should be listed here

2. Manually reconfigure the bootloader.
   A simple way is to (re)move unwanted kernels and regenerate the bootloader configuration.
   It is also a good time to check that the `nox2apic` kernel parameter is passed by the bootloader.

       $ #`mv`/`rm` any other kernel listed in /boot
       $ less /etc/default/grub #Check that `nox2apic` is in GRUB_CMDLINE_LINUX_DEFAULT. If not, add it.
       $ sudo grub-mkconfig -o /boot/grub/grub.cfg #Regenerate the bootloader configuration
       $ sudo reboot

3. After rebooting, you can make sure the kernel version is now the right one.

       $ uname -r #Should return 4.4.185-0404185-generic

After that, it is possible to run the benchmark as instructed in the README:

    $ cd figures/fig2/
    $ bash fig2.sh

Some reviewers have noticed this may fail because of insufficient privilege, and successfully ran instead:

    $ sudo bash fig2.sh

It may also fail because of a missing graphical X session, then run in full:

    $ Xvfb & #If not started already
    $ sudo xvfb-run bash fig2.sh 

## How The Artifact Supports The Paper

**Artifact Available**

- ✔ The artifact is available on a public GitHub repository
- ⚠ The artifact has a README file but does not provide a reference to the paper
- ⚠ The artifact does not have a license that allows use for comparison purposes; this is not necessary, but it would be great to have

The artifact contains relevant source codes and can be accessed at a permanent and public URL.  
Therefore, it was labelled with the badge **Available**.  

**Artifact Functional**

- ⚠ The artifact‘s README file is missing some information:
  - ✔ It has a description
  - ✔ It has an overview of the organization of the repository
  - ✔ It has environment setup & compilation instructions
  - ✔ It has instructions to run experiments
  - ❌ It does not have a list of supported environments:
    - ⚠ It misses information on required free disk space
    - ⚠ It misses information on machine specs, OS, kernel version, etc
- ✔ The source code looks good
  - ⚠ It would be beneficial to include more documentation and comments to explain non-obvious codes
- ✔ The artifact includes instructions to run a minimal example and test the setup
- ✔ The artifact includes scripts to run experiments detailed in the paper
  - ✔ It includes an experiment from the Motivation section
  - ✔ It includes a synthetic table from the Evaluation section, that runs the prototype on 24 applications
- ⚠ The artifact contains all major parts described in the paper; it would be good if it included more experiments from the Evaluation section, but this is not mandatory

The artifact contains all relevant prototyping codes and some benchmarking applications.
It includes sufficient instructions to set up a test environment.
It provides very good automation level: almost every step completes with a single script execution.
The instructions to run the experiments lacked some useful information.
However, reviewers successfully ran the experiments to generate Figure 1, Figure 2, Figure 5 and Table 1 of the paper.  
Therefore, the artifact was labelled with the badge **Functional**.

**Artifact Reproduced**  
Not Applicable: the authors did not apply for this badge.
