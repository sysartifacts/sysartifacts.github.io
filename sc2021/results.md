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
