---
layout: single
title: "Artifact Review Summary: Geometric Partitioning: Explore the Boundary of Optimal Erasure Code Repair"
sidebar:
    title: 'SOSP 2021'
    nav: sosp2021toc
---

## Description of the Artifact
RCStor is open-sourced at <https://github.com/rcstor/rcstor>

The artifact, written in Golang, is a distributed object store prototype with REST API support. This prototype uses the erasure code repair design described in the paper.

## Environment(s) Used for Testing

All reviewers are using [CloudLab](https://cloudlab.us/), Ubuntu 18, with 16 machines of `c6525-100g`, 16 machines of `c6525-25g`, or 16 machines of `c6320`. The detailed machine setup can be found in <https://docs.cloudlab.us/hardware.html>

## Step-By-Step Instructions to Exercise the Artifact

1. Setup the 16 instances in CloudLabs. They have IP addresses `10.10.1.1` to `10.10.1.16`.

2. Run the following commands on each machine and then restart the instance.

```
sudo su
wget https://dl.google.com/go/go1.14.10.linux-amd64.tar.gz
tar -xvf go1.14.10.linux-amd64.tar.gz -C /usr/local/
echo 'export GOROOT=/usr/local/go' >> ~/.profile
echo 'export GOPATH=$HOME/go' >> ~/.profile
echo 'export PATH=$GOPATH/bin:$GOROOT/bin:/usr/local/bin:$PATH' >> ~/.profile
source ~/.profile
apt update
apt install openssh-client openssh-server -y
systemctl start sshd
ssh-keygen
echo 'root   soft    nofile      1048576' >> /etc/security/limits.conf
echo 'root   hard    nofile      1048576' >> /etc/security/limits.conf
```

(It is necessary to increase the limit of the number of opened files, because the artifact opens many connections.)

3. Run `sudo su` on all the instances after restarting.

4. On the first server, run:

```
git clone https://github.com/rcstor/rcstor.git
cd rcstor
make install
```

5. Run the following commands on each machine to copy the SSH keys:

```
ssh-copy-id root@10.10.1.1 -o StrictHostKeyChecking=no
...
ssh-copy-id root@10.10.1.16 -o StrictHostKeyChecking=no
```


6. Mount the storage on each machine:

```
apt install xfsprogs -y
mkfs -t xfs /dev/sda4
mkdir /mnt/geop
mount /dev/sda4 /mnt/geop
```


7. Create the following JSON file following the instructions.

```
{
  "VolumeName": "Geometric-1M",
  "Servers" : [
    {
      "IP" : "10.10.1.1",
      "Dir" : [
        "/mnt/geop"
      ]
    },
    ...
    {
      "IP" : "10.10.1.16",
      "Dir" : [
        "/mnt/geop"
      ]
    }
  ],
  "VolumeParameter" : {
    "nPG" : 200,
    "Layout" : "Geometric",
    "K" : 10,
    "Redundancy" : 4,
    "MinBlockSize" : 1048576,
    "MaxBlockSize" : 268435456,
    "GeometricBase" : 2,
    "IsSSD" : false,
    "HTTPPort" : 8080
  }
}
```

8. Start the service using this new JSON file.

9. Use the `README.md` to test the PUT/GET method of the storage server.

10. Use the genParity method to generate the parity, and then test the DGET method.

11. Test the recovery.

12. Drop the volume.

## How The Artifact Supports The Paper

The artifact is submitted for and is awarded the Available and Functional badges. 

The reviewers are able to:
- build the artifact following the instructions
- create a volume
- use put/get operations to store a file and retrieve it
- generate the parity
- run degraded read and recovery

It supports the paper by showing that the proposed optimal erasure code repair is functional. 

## Additional Notes and Resources

In our test environment, a few reviewers saw the messages "Not responding, begin to ping." The current prototype may be opening too many connections. 
