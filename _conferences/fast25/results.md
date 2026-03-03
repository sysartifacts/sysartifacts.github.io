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
  - title: "LeapGNN: Accelerating Distributed GNN Training Leveraging Feature-Centric Model Migration"
    paper_url: "https://www.usenix.org/system/files/fast25-chen-weijian-leap.pdf"
    badges: "available,functional,reproduced"

  - title: "GPHash: An Efficient Hash Index for GPU with Byte-Granularity Persistent Memory"
    paper_url: "https://www.usenix.org/system/files/fast25-chen-menglei.pdf"
    badges: "available"

  - title: "AegonKV: A High Bandwidth, Low Tail Latency, and Low Storage Cost KV-Separated LSM Store with SmartSSD-based GC Offloading"
    paper_url: "https://www.usenix.org/system/files/fast25-duan.pdf"
    badges: "available,functional"

  - title: "Revisiting Network Coding for Warm Blob Storage"
    paper_url: "https://www.usenix.org/system/files/fast25-gan.pdf"
    badges: "available"

  - title: "ShiftLock: Mitigate One-sided RDMA Lock Contention via Handover"
    paper_url: "https://www.usenix.org/system/files/fast25-gao.pdf"
    badges: "available,functional,reproduced"

  - title: "Silhouette: Leveraging Consistency Mechanisms to Detect Bugs in Persistent Memory-Based File Systems"
    paper_url: "https://www.usenix.org/system/files/fast25-jiao.pdf"
    badges: "available,functional,reproduced"

  - title: "OPIMQ: Order Preserving IO stack for Multi-Queue Block Device"
    paper_url: "https://www.usenix.org/system/files/fast25-kim-jieun.pdf"
    badges: "available,functional,reproduced"

  - title: "D2FS: Device-Driven Filesystem Garbage Collection"
    paper_url: "https://www.usenix.org/system/files/fast25-kim-juwon.pdf"
    badges: "available,functional,reproduced"

  - title: "Selective On-Device Execution of Data-Dependent Read I/Os"
    paper_url: "https://www.usenix.org/system/files/fast25-park.pdf"
    badges: "available,functional"

  - title: "Don't Maintain Twice, It's Alright: Merged Metadata Management in Deduplication File System with GogetaFS"
    paper_url: "https://www.usenix.org/system/files/fast25-pan.pdf"
    badges: "available,functional,reproduced"

  - title: "PolyStore: Exploiting Combined Capabilities of Heterogeneous Storage"
    paper_url: "https://www.usenix.org/system/files/fast25-ren.pdf"
    badges: "available,functional,reproduced"

  - title: "Cloudscape: A Study of Storage Services in Modern Cloud Architectures"
    paper_url: "https://www.usenix.org/system/files/fast25-satija.pdf"
    badges: "available,functional,reproduced"

  - title: "VectorCDC: Accelerating Data Deduplication with Vector Instructions"
    paper_url: "https://www.usenix.org/system/files/fast25-udayashankar.pdf"
    badges: "available,functional,reproduced"

  - title: "Boosting File Systems Elegantly: A Transparent NVM Write-ahead Log for Disk File Systems"
    paper_url: "https://www.usenix.org/system/files/fast25-wang.pdf"
    badges: "available,functional"

  - title: "Oasis: An Out-of-core Approximate Graph System via All-Distances Sketches"
    paper_url: "https://www.usenix.org/system/files/fast25-yang.pdf"
    badges: "available"

  - title: "Rethinking the Request-to-IO Transformation Process of File Systems for Full Utilization of High-Bandwidth SSDs"
    paper_url: "https://www.usenix.org/system/files/fast25-zhan.pdf"
    badges: "available"

  - title: "3L-Cache: Low Overhead and Precise Learning-based Eviction Policy for Caches"
    paper_url: "https://www.usenix.org/system/files/fast25-zhou-wenbin.pdf"
    badges: "available,functional"

  - title: "HiDPU: A DPU-Oriented Hybrid Indexing Scheme for Disaggregated Storage Systems"
    paper_url: "https://www.usenix.org/system/files/fast25-zhu.pdf"
    badges: "available,functional"
---

**Evaluation Results**:

* 18 Artifacts Available
* 14 Artifacts Functional
* 9 Results Reproduced

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
