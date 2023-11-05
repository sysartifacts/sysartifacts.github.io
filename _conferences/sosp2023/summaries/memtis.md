---
title: "Artifact Review Summary: MEMTIS: Efficient Memory Tiering with Dynamic Page Classification and Page Size Determination"
---

{% include_relative _result-header.html %}

## Description of the Artifact

Artifacts location: [GitHub Repo](https://github.com/cosmoss-jigu/memtis) (Artifacts commit: `174ca88`; Branch: `main`)

## Environment(s) Used for Testing

The evaluation was performed on the author-provided testbed (due to the special hardware requirement, e.g., Optane PMEM). Here are the details of the evaluation environment:

- CPU: Intel(R) Xeon(R) Gold 5218R CPU @ 2.10GHz
- DRAM: ~188 GB
- Optane PMEM: ~234 GB

## Step-By-Step Instructions to Exercise the Artifact

Memtis is developed based on Linux Kernel v5.15.19.
It utilizes the Linux kernel's `compound_page` structure to manage access metadata for huge pages and subpages without additional memory overhead.
The total changed lines of code (LoC) in Linux Kernel is ~5K and can be accessed from [here](https://github.com/cosmoss-jigu/memtis/tree/main/linux).
As we evaluated Memtis on the author-provided testbed, we did not verify the changes during our artifact evaluation.

Memtis is tested on two different tiered memory settings: 1) DRAM + NVM (Optane DCPMM) and 2) DRAM + emulated CXL memory (cross-NUMA DRAM with increased latency).
We used the authors' provided scripts during our evaluation to set up the server for a specific memory tier. Instructions for setting tiered memory systems with Intel DCPMM can be found [here](https://github.com/cosmoss-jigu/memtis#setting-tiered-memory-systems-with-intel-dcpmm).
Finally, we follow the following steps to run benchmark scripts:

1. Download and prepare the artifact in the ae server.
2. Configure the NVM-based tiered memory setup (using the authors' provided script not included in the project).
3. Run benchmark on NVM-based tiered memory architecture
   * $ cd /home/sospae/memtis/memtis-userspace/
   * $ sudo ./run-all-nvm.sh > run-all-nvm.out
   * $ sudo ./run-all-nvm-fig7.sh > un-all-nvm-fig7.out
   * $ sudo ./run-fig5-6-10.sh > run-fig5-6-10.out
   * $ sudo ./run-fig7.sh > run-fig7.out
   * $ sudo ./run-fig8-9.sh > run-fig8-9.out
4. Configure the CXL-based tiered memory setup (using the authors' provided script not included in the project).
5. Run benchmark on CXL-based mode
   * $ cd /home/sospae/memtis/memtis-userspace/
   * sudo ./run-all-cxl.sh > run-all-cxl.out
   * $ sudo ./run-fig11.sh > run-fig11.out
6. Parse results:
   * $ sudo ./parse-results.sh > parse-results.out

After running all the benchmarks, we checked the following files to get and compare results:
1. Fig.5: memtis-perf.dat
2. Fig.6: results/${BENCH}/memtis-all/[Memory config.]/hotness_stat.txt
3. Fig.7: memtis-scalability.dat
4. Fig.8: memtis-stat.dat
5. Fig.9: results/[btree or silo]/memtis-all/1:8/throughput.out
6. Fig.10: memtis-hitratio.dat
7. Fig.11: memtis-cxl.dat

## How The Artifact Supports The Paper

The artifact provides scripts to reproduce the `Memtis` performance described in the paper.
Particularly, we have tried to reproduce the following results:

1. Fig.5: The performance of Memtis under various tiering settings (fast tier vs. capacity tier = 1:2, 1:8, 1:16) was reproduced on the `memtis-perf.dat` file. Several results are different from what is claimed in the paper. For example,
   a. Paper claimed Memtis performed slightly better than the baseline (all on capacity tier) in `Silo.` However, we observed one order of magnitude performance degradation.
   b. Paper claimed Memtis performed up to 11x better than the baseline (all on capacity tier) in `654.roms`. However, we observed up to 3.57x performance, worse than several competitors' performance reported in the paper (e.g., Tiring-0.8 8.75x, TPP 8.5x).
2. Fig.6: The amount of hot, warm, and cold data identified by Memtis in different tiering settings were reproduced in `results/${BENCH}/memtis-all/[Memory config.]/hotness_stat.txt` files. However, we could not confirm the results as they are provided in text format, which is hard to visualize.
3. Fig.7: The performance of Memtis under varying memory sizes was reported in the `memtis-scalability.dat` file. However, `memtis` results were missing there.
4. Fig.8: Normalized performance and memory migration traffic should be reported in the `memtis-stat.dat` file. However, one of the two results was reported in the file (unsure which result is reported).
5. Fig.9: Performance of Silo and Btree over time has been reproduced in the `results/[btree or silo]/memtis-all/1:8/throughput.out` files. However, no visualization was provided, and confirming this result from text files is hard.
6. Fig.10: No results found in the `memtis-hitratio.dat` file.
7. Fig.11: Performance comparison between Memtis and TPP using (emulated) CXL memory has been reported in the `memtis-cxl.dat` file. Noticed performance improvement achieved by Memtis compared to the baseline (all-cxl).

`Available` and `Functional` badges have been awarded to this artifact. Here is our detailed checklist that supports these badges:
### Badge: Artifact Available
* $\checkmark$ The artifact is available on a public website with a specific version such as a git commit.
* $\checkmark$ The artifact has a "read me" file with a reference to the paper.
   * **Reviewer's comment:** Paper is not referenced in the readme.
* $\checkmark$ The artifact has an associated license and ideally one that at least allows use for comparison purposes.

### Badge: Artifact Evaluated - Functional
* The artifact has a "read me" file with high-level documentation:
   * $\times$ A description, such as which folders correspond to code, benchmarks, data, …
      * **Reviewer's comment:** A brief description is embedded in the instruction set. But, a High-level description of the overall artifact repo structure is missing.
   * $\times$ A list of supported environments, including OS, specific hardware if necessary, …
      * **Reviewer's comment:** Software requirements (to build and run code) are missing.
   * $\checkmark$ Compilation and running instructions, including dependencies and pre-installation steps, with a reasonable degree of automation such as scripts to download and build exotic dependencies.
* $\times$ Configuration instructions, such as selecting IP addresses or disks.
   * **Reviewer's comment:** Instruction for CXL setup is missing.
* $\times$ Usage instructions, such as analyzing a new data set.
* $\times$ Instructions for a "minimal working example".
* $\times$ The artifact has documentation explaining the high-level organization of modules, and code comments explaining non-obvious code, such that other researchers can fully understand it.
* $\checkmark$ The artifact contains all components the paper describes using the same terminology as the paper, and no obsolete code/data
* ~~If the artifact includes a container/VM, it must also contain a script to create it from scratch Artifacts must be usable on other machines than the authors', though they may require hardware such as specific network cards. Information such as IP addresses must not be hardcoded.~~
   * **Reviewer's comment:** This artifact does not require any container/VM

## Additional Notes and Resources

The artifact is well documented and will be helpful for others to evaluate and compare results with Memtis in the future.
Based on our evaluation, we further recommend the following updates that can greatly improve the usability of this artifact.
For example,
1. Issues with benchmark directory preparation
   * The instruction to download `graph500` is wrong.
   * `Liblinear-V2.45-1` is removed from the source. We can download `V2.47` now. Please provide a persistent link if it requires the older version (`V2.45-1`).
   * Applying `git patch` might become broken due to version changes in the source. It is better to mention which version/release/last-commit-id of the original source repository is intended to apply the patch.
2. A description of the artifact repository needs to be included. We recommended providing this so the user can understand which folders correspond to code, benchmarks, data, etc.
3. The description of the software requirement (to build the artifact) needs to be added to the README page.
4. The instructions for new dataset integration and testing are recommended to be included. Users might find it hard to integrate and test on new datasets.
5. Several issues with the reproduced result analysis:
   * Lack of competitors' results to compare. Reproducing at least one competitor's performance for comparative analysis would be better.
   * Lack of visualization, as some results (e.g., Fig. 6, Fig. 9) are hard to understand/compare from text results.
   * Finally, missing the list of major claims the user should expect/compare after retrieving the reproduced results. For example,
      * Claim 1: Memtis achieves $A\times∼B\times$ better performance (on average) compared to the baseline (all in the capacity tire) (ref. Fig. 5).
      * Claim 2: ...
