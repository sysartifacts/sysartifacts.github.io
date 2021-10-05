---
layout: single
title: "Artifact Review Summary: Understanding and Detecting Software Upgrade Failures in Distributed Systems"
sidebar:
    title: 'SOSP 2021'
    nav: sosp2021toc
---

## Description of the Artifact

This paper presents three key artifacts listed all under <https://github.com/zlab-purdue/ds-upgrade>:

### Study
The authors provided a link to the Github repository.  <https://github.com/jwjwyoung/RecentUpgradeFailureStudy>.
It contains the dataset of 123 recent upgrade failures and a jupyter notebook python script to analyze the dataset. The repo contains `README` on how to run the script. The authors also provide a virtual environment for users who do not have Jupiter notebook set up on their local machine. 

### DUPChecker
The static checker is available through <https://github.com/jwjwyoung/DUPChecker>.
The checker is implemented in Python. The `README` covers 1)the purpose of DUPChecker, 2) the prerequisite, 3) the instructions on how to use checkers, 4) the instructions on how to reproduce the experiments in the paper.  

### DUPTester
The tester is available through <https://gitlab.dsrg.utoronto.ca/zhuqi/DUPTester> implemented in Python. The `README` explains the purpose of each directory of the repo and gives detailed instructions to reproduce the results in the paper. 

## Environment(s) Used for Testing

### Study

You can install jupyter notebook on your local machine, or use the provided link <https://mybinder.org/v2/gh/jwjwyoung/RecentUpgradeFailureStudy/85fd3e055c8d690744ac450e0a15e21ba2fde010>.

### DUPChecker
You can use Ubuntu 18.04 with python 3.7, 4G RAM, 20G disk and manually install their dependencies.


### DUPTester
The author provided a virtual machine image to reproduce results for DUPTester <http://nas.dsrg.utoronto.ca:8080/share.cgi?ssid=0Sa7AQ1&fbclid=IwAR2XxgwGi34aP7m-LgnevZBrN4PBW9KRcnTItEtWTNX0s2XpUVP2m3PZykY>.
* User account: sosp21
* Password: 111111




## Step-By-Step Instructions to Exercise the Artifact


### The study 
The Jupiter notebook script contains the mapping between the output to the paper. It checks out with the paper's claims. 

### DUPTester and DUPChecker 
There are instructions provided by the authors to run DUPChecker and DUPTester on the VM images.

For DUPChecker:
```
cd ~/DUPChecker
python3 run_experiment.py
python3 export.py
```
For DUPTester:
```
cd ~/DUPTester/src
sudo python3 reproduce_upgrade_bugs.py
Select Option A to reproduce all cases
```

You can also download DUPTester and DUPChecker on a local machine and was able to successfully run them after installing the dependencies. 

The output of DUPChecker and DUPTester checks out with the paper's claim (Table 5 and 6)


## How The Artifact Supports The Paper

The artifact supports the key results and claims presented in the paper.

Availability: The artifact is available on GitHub. <https://github.com/zlab-purdue/ds-upgrade>

Functional: All three parts of the artifacts are functional with the help of clear instruction. We were able to download DUPChecker and DUPTester from GitHub, and were able to run them on a private machine. The accompanying Readme and documentation were helpful in setting up the dependencies and run these tools.

Reproducibility: The Jupyter notebook included in the artifact makes it easy to analyze the study of 123 upgrade failures and stepwise reproduce Tables 1 to 4 and support the key findings from Sections 3 to 5. Tables 5 and 6 were reproduced through the evaluation of DUPTester and DUPChecker respectively. We were able to reproduce all 20 detected failures with DUPTester. DUPChecker can also automatically find all the errors and warnings with minimum manual effort. We visited the corresponding ticket numbers on JIRA for checking the bug confirmation from developers in Table 5. The numbers were consistent with the paper results.




## Additional Notes and Resources
The instructions to reproduce the results of the paper on the github repo were clear and we did not have any problems following them.

