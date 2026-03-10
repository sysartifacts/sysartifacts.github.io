---
title: Results
order: 50
available_img: "usenix_available.svg"
available_name: "Artifacts Available"
functional_img: "usenix_functional.svg"
functional_name: "Artifacts Evaluated - Functional"
reproduced_img: "usenix_reproduced.svg"
reproduced_name: "Results Reproduced"

artifacts:
  - title: "RFUSE: Modernizing Userspace Filesystem Framework through Scalable Kernel-Userspace Communication"
    paper_url: "https://www.usenix.org/system/files/fast24-cho.pdf"
    badges: "available,functional,reproduced"

  - title: "The Design and Implementation of a Capacity-Variant Storage System"
    paper_url: "https://www.usenix.org/system/files/fast24-jiao.pdf"
    badges: "available,functional"

  - title: "I/O Passthru: Upstreaming a flexible and efficient I/O Path in Linux"
    paper_url: "https://www.usenix.org/system/files/fast24-joshi.pdf"
    badges: "available,functional"

  - title: "Symbiosis: The Art of Application and Kernel Cache Cooperation"
    paper_url: "https://www.usenix.org/system/files/fast24-dai.pdf"
    badges: "available,functional"

  - title: "We Ain't Afraid of No File Fragmentation: Causes and Prevention of Its Performance Impact on Modern Flash SSDs"
    paper_url: "https://www.usenix.org/system/files/fast24-jun.pdf"
    badges: "available,functional,reproduced"

  - title: "Physical vs. Logical Indexing with IDEA: Inverted Deduplication-Aware Index"
    paper_url: "https://www.usenix.org/system/files/fast24-levi.pdf"
    badges: "available,functional,reproduced"

  - title: "MinFlow: High-performance and Cost-efficient Data Passing for I/O-intensive Stateful Serverless Analytics"
    paper_url: "https://www.usenix.org/system/files/fast24-li.pdf"
    badges: "available"

  - title: "Metis: File System Model Checking via Versatile Input and State Exploration"
    paper_url: "https://www.usenix.org/system/files/fast24-liu-yifei.pdf"
    badges: "available,functional,reproduced"

  - title: "MIDAS: Minimizing Write Amplification in Log-Structured Systems through Adaptive Group Number and Size Configuration"
    paper_url: "https://www.usenix.org/system/files/fast24-oh.pdf"
    badges: "available,functional"

  - title: "Combining Buffered I/O and Direct I/O in Distributed File Systems"
    paper_url: "https://www.usenix.org/system/files/fast24-qian.pdf"
    badges: "available"

  - title: "ELECT: Enabling Erasure Coding Tiering for LSM-tree-based Storage"
    paper_url: "https://www.usenix.org/system/files/fast24-ren.pdf"
    badges: "available,functional,reproduced"

  - title: "Kosmo: Efficient Online Miss Ratio Curve Generation for Eviction Policy Evaluation"
    paper_url: "https://www.usenix.org/system/files/fast24-shakiba.pdf"
    badges: "available,functional"

  - title: "Baleen: ML Admission & Prefetching for Flash Caches"
    paper_url: "https://www.usenix.org/system/files/fast24-wong.pdf"
    badges: "available,functional,reproduced"

  - title: "TeRM: Extending RDMA-Attached Memory with SSD"
    paper_url: "https://www.usenix.org/system/files/fast24-yang-zhe.pdf"
    badges: "available,functional,reproduced"

  - title: "COLE: A Column-based Learned Storage for Blockchain Systems"
    paper_url: "https://www.usenix.org/system/files/fast24-zhang_ce.pdf"
    badges: "available,functional"

  - title: "OmniCache: Collaborative Caching for Near-storage Accelerators"
    paper_url: "https://www.usenix.org/system/files/fast24-zhang-jian.pdf"
    badges: "available,functional"

  - title: "In-Memory Key-Value Store Live Migration with NetMigrate"
    paper_url: "https://www.usenix.org/system/files/fast24-zhu.pdf"
    badges: "available,functional,reproduced"
---

**Evaluation Results**:

* 17 Artifacts Available
* 15 Artifacts Functional
* 8 Results Reproduced

<table>
  <thead>
    <tr>
      <th>Paper title</th>
      <th>Avail.</th>
      <th>Funct.</th>
      <th>Repro.</th>
    </tr>
  </thead>
  <tbody>
  {% for artifact in page.artifacts %}
    <tr>
      <td>
        {% if artifact.paper_url %}
          <a href="{{artifact.paper_url}}" target="_blank">{{artifact.title}}</a>
        {% else %}
          {{ artifact.title }}
        {% endif %}
      </td>
      <td>
        {% if artifact.badges contains "available" %}
          <img src="{{ site.baseurl }}/images/{{ page.available_img }}" alt="{{ page.available_name }}" width="50px">
        {% endif %}
      </td>
      <td>
        {% if artifact.badges contains "functional" %}
          <img src="{{ site.baseurl }}/images/{{ page.functional_img }}" alt="{{ page.functional_name }}" width="50px">
        {% endif %}
      </td>
      <td>
        {% if artifact.badges contains "reproduced" %}
          <img src="{{ site.baseurl }}/images/{{ page.reproduced_img }}" alt="{{ page.reproduced_name }}" width="50px">
        {% endif %}
      </td>
    </tr>
  {% endfor %}
  </tbody>
</table>
