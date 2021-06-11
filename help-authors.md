---
layout: single
title: Help for authors
---

This page contains helpful tips about what to do and not to do,
a list of helpful tools,
and an introduction to packaging artifacts with Docker.


## Dos and Don'ts

- *Do* ensure your artifact meets [the checklists](/badges) for each badge you want to obtain.
- *Do* try out your own artifact in a blank VM/container to ensure everything works.
- *Do not* assume that because it works on your own machine, or for a new user of an existing machine, it will work everywhere.

- *Do* print log statements that may indicate problems, such as an optional but recommended library not being present.
- *Do* print log statements to indicate success, ensuring users know something happened.
- *Do* explain in the "read me" file any unusual output, such as unit tests being skipped due to a third-party bug.
- *Do not* print log statements that may confuse users, such as failures when failures are expected.
- *Do not* print “verbose” log statements by default, as they obscure what is going on.

- *Do* provide a container or VM image if the artifact requires a specific environment, to make this environment easy to obtain.
- *Do* use environment variables such as the number of processors when it makes sense to do so.
- *Do* allow users to input configuration such as which disks or network cards to use.
- *Do not* rely on implicit environment features, such as the exact IP assignments of some cloud provider.

- *Do* fail fast if input data is missing or nonsensical, instead of confusing users by generating garbage output.
- *Do not* leave partial outputs behind if a problem arises in the middle of computation, as this can be confused for real output especially if users don't notice one of many attempts failed in a run.
- *Do not* leave old outputs in the artfact repository, as they too can lead to confusion.


## Helpful tools

On Linux:
- `/usr/bin/time -v` measures the time and memory used by a command (this is _not_ the `time` built-in available in some shells)
- `mpstat`, `iostat`, `vmstat`, and `ifstat` can measure CPU, I/O, memory, and network use respectively
- `lscpu` and `lspci` can display information about the CPU and PCI devices


## Docker basics

[Docker](https://www.docker.com/) allows you to package your artifact in a _container_, which runs using the same kernel as your host machine,
unlike virtual machines which include an entire operating system.

It's a good way to package artifacts because it allows anyone to use the artifact without having to install dependencies on their own machine.
From the authors' point of view, providing a Docker container also saves time debugging issues on other people's machines.

Docker is easier to use than virtual machines because it is lightweight, provides a built-in way to interact with the container without having to install tools in the guest,
and because it forces the authors to write a "Dockerfile" containing the exact commands necessary to install the artifact,
which also serves as documentation for anyone wanting to install the artifact on their own machine.

You should consider providing a Docker container for your artifact unless it has no dependencies beyond common ones such as Python, or it has complex hardware dependencies that are hard to use
within a Docker container.

### Writing a Dockerfile

Create a file named `Dockerfile`. While there are [many commands available](https://docs.docker.com/engine/reference/builder/), the main ones are:
- `FROM <image>` selects the base image
- `RUN <command>` runs a command
- `ENV <key>=<value>` sets an environment variable
- `COPY <src> <dst>` copies a local file into the container
- `# ...` denotes comments
- `\` can be used within commands to break lines

Here is an example:

```
FROM ubuntu:20.04

# Install dependencies
RUN apt-get update && \
    apt-get install -y git build-essential

# Install the artifact, add some configuration, and build it
RUN git clone https://example.com/artifact
COPY artifact.config /artifact/artifact.config
RUN make -C artifact

# Add the artifact to the PATH
ENV PATH=/artifact/bin:$PATH

# Remove apt-get's cache to minimize the container image's size
RUN rm -rf /var/lib/apt/lists/*
```

From the directory containing this `Dockerfile` (and the `artifact.config` file used in the `COPY` command),
one can run `docker build -t artifact .` to create an image with the name `artifact`,
then `docker run -it artifact` to run a container using this image in an `i`nteractive way with a `t`erminal.
You may need to run these commands with `sudo`, if you have not [given Docker privileges to your user](https://docs.docker.com/engine/install/linux-postinstall/#manage-docker-as-a-non-root-user).


### Simulating networks

You can create multiple Docker containers to simulate a set of machines running on the same network, and even add network delays.

Docker lets you [configure complex networks](https://docs.docker.com/network/) if you need to,
but you can use the default network without additional configuration.

To add delays, first pass `--cap-add=NET_ADMIN` to `docker run`, then use `tc` within the container from the Ubuntu `iproute2` package,
for instance `tc qdisc add dev eth0 root netem delay 5ms` to add a 5ms delay to the `eth0` interface.

Use the `--cpuset-cpus` parameter of `docker run` to pin containers to cores, avoiding interference between containers.


### Dockerfile tips

All commands within a Dockerfile must be non-interactive. This means, for instance, passing `-y` to `apt-get` so it will not ask for confirmation.

By default, a Docker Ubuntu image only contains the `root` user, and uses the root path `/` as its working directory.
You can change the working directory with Docker's [`WORKDIR` command](https://docs.docker.com/engine/reference/builder/#workdir),
and you may need to install the `sudo` package if your artifact uses it, allowing scripts to work both within and outside of Docker.
You could also [create and use a non-root user](https://docs.docker.com/engine/reference/builder/#user), though this is not necessary.

OS images within Docker are typically more bare-bones than their client counterparts, so you may need more dependencies than you think
because some dependencies that came built-in your OS are not installed by default in the equivalent OS in Docker.

Some Debian/Ubuntu packages prompt the user for input during installation, notably `tzdata` asking for the user's geographical location.
This will cause installation to fail within Docker.
To avoid this, prepend `DEBIAN_FRONTEND=noninteractive` to your `apt-get install` commands.

You can grant Linux capabilities to a container when running it using [`--cap-add`](https://docs.docker.com/engine/reference/run/#runtime-privilege-and-linux-capabilities),
or even root privileges using `--privileged`.
This allows you to package artifacts that require root privileges to run, at the cost of losing Docker's runtime isolation benefits.
