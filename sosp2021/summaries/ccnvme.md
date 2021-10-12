---
layout: single
title: "Artifact Review Summary: Crash Consistent Non-Volatile Memory Express"
sidebar:
    title: 'SOSP 2021'
    nav: sosp2021toc
---

## Description of the Artifact

The [artifact](https://github.com/thustorage/ccnvme) includes a detailed [guide](https://github.com/thustorage/ccnvme/blob/main/README.md) to building an experimental environment including

- Source code of ccNVME
- Instruction to build and install ccNVMe and MQFS
- Software and hardware requirement for evaluation
  - At least one NVMe SSD with PMR feature is required
  - Alternative: emulating with persistent memory or DRAM, although not tested by the authors
- A set of [scripts](https://github.com/thustorage/ccnvme/tree/main/ae-scripts) to reproduce the evaluation results

## Environment(s) Used for Testing

The evaluators use the server provided by the authors, where all the prerequisites are installed ahead of time (e.g. MQFS, HoraeFS, modified NVMe driver, etc).

- The server is equipped with three following NVMe SSDs (the same set of storage devices used for evaluation in the paper).

~~~shell
/dev/nvme0n1  2E // PMR SSD
/dev/nvme1n1  447.1G // Intel Optane 905P SSD
/dev/nvme2n1  745.2G // Intel Optane P5800X SSD
~~~

- The OS in the testing environment: *CentOS LInux 7.7.1908, with Linux kernel 4.18.20.*
- The Artiface commit used for evaluation: *7940f29*

## Step-By-Step Instructions to Exercise the Artifact

For evaluators, no additional configuration or installation was required as the remote server provided by the authors is already properly set up for reproducing the results; the evaluators also checked the modified kernel contents, the adapted environment and ccNVMe as well.

The evaluators run a set of [scripts](https://github.com/thustorage/ccnvme/tree/main/ae-scripts) provided by the authors, each of which reproduces the results of figures or tables shown in the paper. 

*Example of running script*

```shell
cd fig12/fig12a-varmail/
./run.sh
cat res/overall.out
cd ../fig12b-rocksdb/
./run.sh
cat res/overall.out
```

*Example of the resultant result*

```
// Figure 12 (a) Filebench Varmail
system              dev-A      dev-B
ext4           271348.291 287489.761
horaefs        557431.348 666464.532
ext4-nj        682345.513 772335.186
mqfs           661296.694 736513.583
```

```
// Figure 12 (b) RocksDB fillsync
system              dev-A      dev-B
ext4               105050     125482
horaefs            137218     146250
ext4-nj            140852     156641
mqfs               194167     202305
```

## How The Artifact Supports The Paper

The running scripts and programs are checked and tested by multiple evaluators. Overall, the artifact works well and enables to reproduce the results the author claimed in the paper.

- **Availability**: The source code is available in the GitHub repo.
- **Functionality**: The source code of ccNVMe driver and MQFS modules were successfully compiled; overall, the code runs smoothly without any critical issue.
- **Reproducibility**: At high level, the performance claims made by the authors match with the ones by evaluators; the absolute performance difference is marginal and hence acceptable.
