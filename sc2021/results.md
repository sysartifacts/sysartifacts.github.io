---
layout: single
title: Results
classes: wide
sidebar:
    title: 'SC 2021'
    nav: sc2021toc
---

**Submissions**: 69 (70% of accepted papers) including 2 major revision rejections

**Evaluation Results**:

* 66 Artifact Available (+2 rejected major revision)
* 52 Artifact Functional (+2 rejected major revision)
* 38 Results Reproduced (+2 rejected major revision)

**SC21 Best Reproducibility Advancement Award Finalists**:

* Weihao Cui, Han Zhao, Quan Chen, Ningxin Zheng, Jingwen Leng, Jieru Zhao, Zhuo
  Song, Tao Ma, Yong Yang, Chao Li, Minyi Guo: *"Enable Simultaneous DNN
  Services Based on Deterministic Operator Overlap and Precise Latency
  Prediction"*
* Ankit Srivastava, Sriram Chockalingam, Maneesha Aluru, Srinivas Aluru: *"Parallel
  Construction of Module Networks"*
* William S. Moses, Valentin Churavy, Ludger Paehler, Jan Hückelheim, Sri Hari Krishna
  Narayanan, Michel Schanen, Johannes Doerfert: *"Reverse-Mode Automatic
  Differentiation and Optimization of GPU Kernels via Enzyme"*
* Sunil Kumar, Akshat Gupta, Vivek Kumar, Sridutt Bhalachandra: *"Cuttlefish: Library
  for Achieving Energy Efficiency in Multicore Parallel Programs"*
* Konstantinos Parasyris, Giorgis Georgakoudis, Harshitha Menon, James
  Diffenderfer, Ignacio Laguna, Daniel Osei-Kuffuor, Markus Schordan: *"HPAC:
  Evaluating Approximate Computing Techniques on HPC OpenMP Applications"*

<table>
  <thead>
    <tr>
      <th>Paper title</th>
      <th>Available</th>
      <th>Functional</th>
      <th>Reproduced</th>
      <th>Artifact</th>
    </tr>
  </thead>
  <tbody>
  {% for artifact in site.data.sc21results.artifacts %}
    <tr>
      <td>
    <a href="{{site.data.sc21results.baseurl}}10.1145/{{artifact.paper_doi}}" target="_blank">{{artifact.title}}</a>
      </td>
      <td>
        {% if artifact.badges contains "available" %}
          {{ site.data.sc21results.available_html }}
        {% endif %}
      </td>
      <td>
        {% if artifact.badges contains "functional" %}
          {{ site.data.sc21results.functional_html }}
        {% endif %}
      </td>
      <td>
        {% if artifact.badges contains "reproduced" %}
          {{ site.data.sc21results.reproduced_html }}
        {% endif %}
      </td>
      <td>
        {% if artifact.award %}
          <b>Distinguished&nbsp;Artifact</b><br>
        {% endif %} {% if artifact.artifact_doi %}
          <a href="https://doi.org/{{artifact.artifact_doi}}" target="_blank">Artifact</a><br>
        {% endif %}
      </td>
    </tr>
    {% endfor %}
  </tbody>
</table>
