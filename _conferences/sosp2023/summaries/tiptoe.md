---
title: "Artifact Review Summary: Private web search with Tiptoe"
---

{% include_relative _result-header.html %}

## Description of the Artifact

The authors provide a GitHub repository that contains the reference implementation of Tiptoe, accompanying the paper ["Private Web Search with Tiptoe"](https://doi.org/10.1145/3600006.3613134) by Alexandra Henzinger, Emma Dauterman, Henry Corrigan-Gibbs, and Nickolai Zeldovich (SOSP 2023).

The implementation of Tiptoe's cryptosystem is available at [github.com/ahenzinger/underhood](https://github.com/ahenzinger/underhood).
The artifact comes along with a comprehensive `README` document, the core modules of the Tiptoe system—embedding and indexing—alongside the private client/server search protocol and workflow.

The version of Tiptoe that was artifact evaluated is tagged as [v0](https://github.com/ahenzinger/tiptoe/tree/076b9ae2f226427302c5fc6ecd3e361b3eaedaa5), which includes the datasets and scripts that are used to reproduce the experimental results in the paper.
Specifically, the authors furnish scripts for system setup, the download of the pre-prepared corpus, and the execution of various tests. Ultimately, the authors supply scripts to replicate the latency and throughput experiment results, as well as other tables and figures shown in the paper.


## Environment(s) Used for Testing

The evaluators used a 45-node cluster on AWS (provided by the authors), each of which is an `r5.xlarge` instance running Tiptoe servers and the coordinator and an `r5.8xlarge` instance running the Tiptoe client. Each instance in the cluster is a Ubuntu 22.04 instance connected over the same subnet.


## Step-By-Step Instructions to Exercise the Artifact

The evaluators first followed the setup [instructions](https://github.com/ahenzinger/tiptoe/blob/main/README.md#setup) and no issues were found during installation of the dependencies.
The required dependencies, `go (v1.19)`, `python3 (v3.10)`, and `gcc (v11.3.0)` are installed using the necessary apt (Python3, GCC) or extracting the `tar` files (Go lang) followed by cloning the repository.
In the directory of the repository, the requirements were installed using the `pip install` command and the provided dependency file `requirements.txt` and was followed by executing the `fake_corpus_test.sh` from the `search/protocol/` directory (for unit tests).

Due to the lack of access to AWS credentials and the necessary budgets for evaluation, the remaining steps for evaluation were performed on the 45-node experimental cluster provided to the evaluators by the authors. With the servers/coordinator/clients set up by the authors, the evaluators were able to follow the [instructions](https://github.com/ahenzinger/tiptoe#reproducing-results-from-the-paper) provided by the author and reproduce the claimed results from the paper.

The evaluators ran (1) the latency experiment, (2) the throughput experiments, and (3) copied all the experiment logs back to their local machines.
Then the evaluators ran the [code](https://github.com/ahenzinger/tiptoe/blob/main/README.md#reproducing-table-6) to reproduce the tables 6 and 7 and figures 4, 8, 9 from the logs on the local machine.

Specifically, the evaluators ran the following commands (which took roughly 4 to 6 hours):

```
cd tiptoe/search
./wan.sh
go run . client-latency $coordinator-ip | tee 40-4-2-latency.log
./wan-reset.sh
go run . client-tput-embed $coordinator-ip | tee 40-4-2-tput-embed.log
go run . client-tput-url $coordinator-ip | tee 40-4-2-tput-url.log
cd ../..

cd tiptoe/cluster/kmeans
python3 search.py ../../quality-eval/config/basic.json > $OUTPUT_PATH/basic.log
python3 search.py ../../quality-eval/config/basic_url_random.json > $OUTPUT_PATH/basic_url_random.log
python3 search.py ../../quality-eval/config/basic_url_cluster.json > $OUTPUT_PATH/basic_url_cluster.log
python3 search.py ../../quality-eval/config/boundary_url_cluster.json > $OUTPUT_PATH/boundary_url_cluster.log
python3 search.py ../../quality-eval/config/boundary_url_cluster_pca.json > $OUTPUT_PATH/boundary_url_cluster_pca.log
```

This outputs the required log files `40-4-2-latency.log`, `40-4-2-tput-embed.log`, and `40-4-2-tput-url.log` which are used to generate the results presented in the paper in the form of tables, and figures.
The search quality evaluations were performed by executing the `search.py` script with various configurations and logging the results to respective files. Figure 9 can be reproduced using the generated `mrr.json` and the associated `.log` files.


## How The Artifact Supports The Paper

Overall the artifact meets the standard for all three badges. With the clusters and servers/clients set up by the authors, the evaluators did not find any omissions in the artifact, and the results matched the claims in the paper.

### Availability of Artifacts

Yes. The artifacts are available and hosted on GitHub. The artifacts include a comprehensive `README` file that contains references to the paper.

### Functionality

The artifact has a `README` file with high-level documentation:
- A description, such as which folders correspond to code, scripts, and data
- A list of supported environments, including OS, suggested environments, and libraries
- Usage instructions
- Instructions for a “minimal working example” (unit tests and e2e tests)
- The artifact has basic documentation explaining the high-level organization of modules and code comments

Following the instructions provided in the `README` file, the evaluators successfully executed the unit tests. The artifacts are well-documented and user-friendly. The artifacts also offer scripts to facilitate the setup of both the Tiptoe client and server, as well as the ability to download the prepared corpus and conduct multiple tests.

- Reproduction of Results

The artifact has a `README` file that documents:
- The exact environment the authors used (an AWS cluster provided by the authors).
- The exact commands to run to reproduce each claim from the paper.
- The approximate resources and evaluation duration used per claim.
- The scripts to reproduce claims are documented well.

The artifacts supply scripts to replicate the results of latency and throughput experiments, as well as other tables and figures mentioned in the paper. Based on the evaluators' reproduction, the results of the latency and throughput experiments, along with search quality evaluation, align with the assertions made in the paper.

In the end, all evaluators support granting three badges to this paper.

## Additional Notes and Resources

N/A
