---
title: Results
order: 40
available_img: "acm_available_1.1.png"
available_name: "Artifacts Available (v1.1)"
functional_img: "acm_functional_1.1.png"
functional_name: "Artifacts Evaluated - Functional (v1.1)"
reproduced_img: "acm_reproduced_1.1.png"
reproduced_name: "Results Reproduced (v1.1)"
artifacts:

  - title: "Verifying concurrent, crash-safe systems with Perennial"
    github_url: "https://github.com/mit-pdos/perennial/tree/master/artifact"
    badges: Available, Functional, Reproduced

  - title: "Risk-based planning for evolving data-center networks"
    github_url: "https://github.com/SiGe/Janus"
    badges: Available, Functional, Reproduced
    award: true

  - title: "Scaling symbolic evaluation for automated verification of systems code with Serval"
    github_url: "https://unsat.cs.washington.edu/projects/serval/"
    badges: Available, Functional, Reproduced
    award: true

  - title: "RECIPE: Converting Concurrent DRAM Indexes to Persistent-Memory Indexes"
    github_url: "https://github.com/utsaslab/RECIPE"
    badges: Available, Functional, Reproduced

  - title: "File Systems Unfit as Distributed Storage Backends: Lessons from 10 Years of Ceph Evolution"
    github_url: "https://github.com/mkuchnik/CephEvolution"
    badges: Available, Functional, Reproduced

  - title: "SplitFS: Reducing Software Overhead in File Systems for Persistent Memory"
    github_url: "https://github.com/utsaslab/SplitFS"
    badges: Available, Functional, Reproduced

  - title: "Lineage Stash: Fault Tolerance Off the Critical Path"
    github_url: "https://github.com/stephanie-wang/ray/tree/lineage-stash"
    badges: Available, Functional, Reproduced
    award: true

  - title: "Verifying Software Network Functions with No Verification Expertise"
    github_url: "https://github.com/vigor-nf/vigor"
    badges: Available, Functional, Reproduced

  - title: "I4: Incremental Inference of Inductive Invariants for Verification of Distributed Protocols"
    github_url: "https://github.com/GLaDOS-Michigan/I4"
    badges: Available, Functional, Reproduced

  - title: "An Analysis of Performance Evolution of Linux's Core Operations"
    github_url: "https://github.com/LinuxPerfStudy/LEBench"
    badges: Available, Functional, Reproduced

  - title: "Optimizing Deep Learning Computation with Automated Generation of Graph Substitutions"
    github_url: "https://github.com/jiazhihao/sosp19ae"
    badges: Available, Functional, Reproduced

  - title: "Efficient and Scalable Thread-Safety Violation Detection --- Finding thousands of concurrency bugs during testing"
    github_url: "https://github.com/SpectrumLi/TSVDExamples"
    badges: Available, Functional

  - title: "Optimizing Data Intensive Computations in Existing Libraries with Split Annotations"
    github_url: "https://github.com/weld-project/split-annotations"
    badges: Available, Functional

  - title: "Parity Models: Erasure-Coded Resilience for Prediction Serving Systems"
    github_url: "https://github.com/Thesys-lab/parity-models"
    badges: Available, Functional

  - title: "Teechain: A Secure Payment Network with Asynchronous Blockchain Access"
    github_url: "https://github.com/lsds/Teechain"
    badges: Available, Functional

  - title: "Scalable and Practical Locking with Shuffling"
    github_url: "https://github.com/sslab-gatech/shfllock"
    badges: Available, Functional

  - title: "Finding Semantic Bugs in File Systems with an Extensible Fuzzing Framework"
    github_url: "https://github.com/sslab-gatech/hydra"
    badges: Available, Functional

  - title: "Generalized Pipeline Parallelism for DNN Training"
    github_url: "https://github.com/msr-fiddle/pipedream"
    badges: Available, Functional

  - title: "AutoMine: Harmonizing High-Level Abstraction and High Performance for Graph Mining"
    badges: Functional, Reproduced

  - title: "ShortCut: Accelerating Mostly-Deterministic Code Regions"
    github_url: "https://github.com/dozenow/shortcut"
    badges: Available

  - title: "Replication in the era of microservices"
    github_url: "https://github.com/GLaDOS-Michigan/Aegean"
    badges: Available

  - title: "Nexus: A GPU Cluster Engine for Accelerating Neural Networks Based Video Analysis"
    github_url: "https://github.com/uwsampl/nexus"
    badges: Available

---

<p>A total of 23 artifacts were submitted (61% of accepted SOSP papers).</p>
<p>Evaluation results: 21 Artifacts Available, 19 Artifacts Functional, 12 Results Reproduced.</p>
<p>Distinguished artifact award recipients: Lineage Stash, Risk-based planning for evolving data-center networks, Scaling Symbolic Evaluation for Automated Verification of Systems Code with Serval.</p>

<table>
  <thead>
    <tr>
      <th>Paper title</th>
      <th>Avail.</th>
      <th>Funct.</th>
      <th>Repro.</th>
      <th>Available At</th>
    </tr>
  </thead>
  <tbody>
  {% for artifact in page.artifacts %}
    <tr>
      <td>
        {% if artifact.doi %}
          <a href="{{page.baseurl}}{{artifact.doi}}">{{artifact.title}}</a>
        {% else %}
          {{ artifact.title }}
        {% endif %}
      </td>
      <td>
        {% if artifact.badges contains "Available" %}
          <img src="{{ site.baseurl }}/images/{{ page.available_img }}" alt="{{ page.available_name }}" width="50px">
        {% endif %}
      </td>
      <td>
        {% if artifact.badges contains "Functional" %}
          <img src="{{ site.baseurl }}/images/{{ page.functional_img }}" alt="{{ page.functional_name }}" width="50px">
        {% endif %}
      </td>
      <td>
        {% if artifact.badges contains "Reproduced" %}
          <img src="{{ site.baseurl }}/images/{{ page.reproduced_img }}" alt="{{ page.reproduced_name }}" width="50px">
        {% endif %}
      </td>
      <td>
        {% if artifact.award %}
          <b>Distinguished&nbsp;Artifact</b><br>
        {% endif %} {% if artifact.github_url %}
          <a href="{{artifact.github_url}}">GitHub</a><br>
        {% endif %} {% if artifact.additional_urls %}
          {% for url in artifact.additional_urls %}
            <a href="{{url}}">Additional&nbsp;Resources</a><br>
          {% endfor %}
        {% endif %}
      </td>
    </tr>
    {% endfor %}
  </tbody>
</table>
