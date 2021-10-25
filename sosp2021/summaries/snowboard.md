---
layout: single
title: "Artifact Review Summary: Paper [Snowboard: Finding Kernel Concurrency Bugs through Systematic Inter-thread Communication Analysis"
sidebar:
    title: 'SOSP 2021'
    nav: sosp2021toc
---

{% include_relative _result-header.html %}

## Description of the Artifact

The artefact is publicly available here: <https://github.com/rssys/snowboard>.
A part of the artefact is hosted at data.cs.purdue.edu.

The artifact contains the source code and some documentation for *Snowboard (or Geminio)* - the tool proposed in the associated paper. The paper proposed using Snowboard for finding concurrency bugs in the Linux kernel.
The source code for the Snowboard hypervisor is released under the GLPv2 license, while other Snowboard scripts are released under the Apache 2 license. There are scripts for downloading dependencies (especially from data.cs.purdue.edu), setting up necessary tools, building Snowboard and analysing the results. The artifact also includes private bug reproducers that demonstrate issues discovered in the Linux kernel, as detailed in the paper.



## Environment(s) Used for Testing

The artifact was successfully evaluated on the following systems:

- A single 32-core machine with 128GB of RAM, running Ubuntu 18.04 with 200GB storage.
- A single node with 20 x Intel(R) Xeon(R) CPU E5-2640 v4 @ 2.40GHz, 64GB RAM running Ubuntu 18.04 with 200GB storage.
- Some reviewers reported requiring (>10TB storage disk space and >500GB RAM) for large workloads.



## Step-By-Step Instructions to Exercise the Artifact

1. Setup where to store test and results
	```
	mkdir -p storage/snowboard-tmp/ && cd $_
	export SNOWBOARD_STORAGE=$PWD
	```

2. Download Snowboard, the testsuite and artifact data, then build Snowboard
	```
	git clone https://github.com/rssys/snowboard.git
	cd snowboard; export ARTIFACT_HOME=$PWD
	cd scripts
	sudo -s
	source ./setup.sh $SNOWBOARD_STORAGE
	```

3. Launch the Sequential test

	To run for test betwen 100 and 200. *Accepted range is [2,129876]*
    ```
    cd $ARTIFACT_HOME/scripts/test
    ./run-all.sh 100 200
    ```

4. Check the Sequential test analysis
	```
	cd $SNOWBOARD_STORAGE
	find -name "sequential-analysis-*" -type d
	ll sequential-analysis-XXXX
	ll sequential-analysis-XXXX/PMC-XXXX
	```

	For instance to analyse *ins-pair*:
    ```
    head -n 100 ./sequential-analysis-XXXX/PMC-XXXX/uncommon-ins-pair.txt > top-100-ins-pair.txt
    $ARTIFACT_HOME/scripts/analysis/ins-pair-analysis.py top-100-ins-pair.txt
    ```

5. Generate and run concurrent tests:
   The Generator instance and each Worker instance have to be run separately. (e.g. Opened another ssh session for instance)
	- Confirm that Redis is running and well set up by view the queue
        ```
        rq info --url redis://:snowboard-testing@localhost:6380
        export REDIS_URL=redis://:snowboard-testing@localhost:6380
        ```

	- Launch the Generator instance
        ```
        cd $ARTIFACT_HOME/scripts/test`
        python3 ./generator.py $SNOWBOARD_STORAGE/sequential-analysis-XXXX/
        ```
		You are offered an option to choose the cluster strategy you want to base the input on.
		You will later launch a "Worker" for each chosen strategy.
		For all the strategies: `1 2 3 4 5 6 7`

	- (Optional) Check the queue status again
		`rq info --url REDIS_URL`

	- NOTE: Launch each Worker instance to start the concurrency tests.
	  Since these are in different shells, you may have to re-export the environment variables.
	- e.g. To launch a Worker instance for the M-CH (channel) clustering strategy. 
		```
		cd $ARTIFACT_HOME/scripts/test
		rq worker --url REDIS_URL channel
		```
		See the Readme for the rest clustering strategies.

	- To stop either the Worker or the Generator: `ctrl+c`

6. Inspect the Concurrency tests
	- Guest kernel console output and Data Race result
        ```
        cd $SNOWBOARD_STORAGE; ll
        cd concurrent-test-XXXXX
        find -name "console*" | xargs cat
        find -name "*race_detect*"
        ```
	- Analyze the detection result 
        ```
        cd $ARTIFACT_HOME/scripts/analysis
        ./data-race.sh $SNOWBOARD_STORAGE/concurrent-test-XXXXX
        ```
		- See the content of xxx_forkall_race_detector.txt.source.

	- Check the analysis for each cluster strategy
		```
		cd $SNOWBOARD_STORAGE
		find -name "sequential-analysis-*" -type d
		ll sequential-analysis-XXXX
		ll sequential-analysis-XXXX/PMC-XXXX
		```
		- For instance to analyse `ins-pair`
			```
			head -n 100 ./sequential-analysis-XXXX/PMC-XXXX/uncommon-ins-pair.txt > top-100-ins-pair.txt
			$ARTIFACT_HOME/scripts/analysis/ins-pair-analysis.py top-100-ins-pair.txt
			```
7. Reproduce Bugs
	- Locate the generated concurrency input based on each strategy that is launched:
	    ```
	    cd $SNOWBOARD_STORAGE
	    find -name "generator-log-*"
	    cd generator-log-XXXXX
	    ll

	    #e.g. to view one of the inputs for channel strategy
	    head -n 1 channel-*
	    ```
	- Reproduce a bug for a failure-inducing concurrent input.

	  The input which is the same format as the output of the last step above (details in the ReadMe) is stored in a file and passed into the *reproduce.py* script.

	  e.g.:
	  ```
	  cd $SNOWBOARD_STORAGE/scripts/reproduce
	  echo "0xc1234567 0xc1234567 0xe2222e77 0xcb100005 0xce0000b5 0xc1111110 4 1 33333 555555" > ID-12

	  #reproduce the bug induced by the above input
	  ./reproduce.py ID-12
	  ```


## How The Artifact Supports The Paper

We evaluated the artifact for “Available” and “Function” badges. In line with our experience in evaluating this artifact, we award the badges:

- **Available:** 
The artifact can be retrieved from GitHub: <https://github.com/rssys/snowboard>. It contains scripts for retrieving other parts of the artifact hosted at data.cs.purdue.edu
- **Functional:** 
    The authors provide details about their evaluation and experimental setup in section 5 of their paper. We followed the readme included in the artifact for our evaluation. We were able to validate the functional claims in the paper.

    We could generate and run both the sequential and concurrent test cases. We validated the PMC cluster size numbers as stated in Table 2 of the paper, except for “M-FULL”. According to the readme, “M-FULL” PMC clusters were left out due to disk space requirement. We were also able to generate the bug reports and performance measurements mentioned in the paper.


## Additional Notes and Resources

- Running larger workloads requires significant more resources (>10TB disk space and >500GB RAM).
- Some of the worloads may take upto 3 days to run.
