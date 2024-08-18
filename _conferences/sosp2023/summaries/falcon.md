---
title: "Artifact Review Summary: Falcon: Fast OLTP Engine for Persistent Cache and Non-Volatile Memory"
---

{% include_relative _result-header.html %}

## Description of the Artifact

The artifact is located on GitHub, at [https://github.com/madsys-dev/Falcon](https://github.com/madsys-dev/Falcon) and its README file at [https://github.com/madsys-dev/Falcon/blob/main/README.md](https://github.com/madsys-dev/Falcon/blob/main/README.md).
This artifact includes the source code of Falcon and instructions to reproduce the results.

## Environment(s) Used for Testing

For evaluation of this artifact the following environments were used:
* Environment provided by the authors
	* CPU: Intel(R) Xeon(R) Gold 5320 CPU @ 2.20GHz
	* DRAM: 512GB
	* NVM: 1TB
* Physical rack server with two 3rd Gen Intel Xeon Gold Processors and 4xIntel Optane 200 series persisent memory DIMMs with eADR support


## Step-By-Step Instructions to Exercise the Artifact

The evaluators used the provided scripts to automatically run all the tests mentioned in the paper and parse the results:
* Run benchmark by the provided script (e.g., run_test.py), which has already configured all the tests. Used the default configuration values provided in configure.py.
* Collect benchmark results by running the script collect.py. Results are saved in result.csv.
* Generate evaluation figures by copying data from result.csv to the appropriate location in the provided template (result.xlsx)


## How The Artifact Supports The Paper

All evaluators agreed that he authors managed to provide a functional and reproducible artifact. Therefore, claims made in the paper are reflected in the submitted artifacts.