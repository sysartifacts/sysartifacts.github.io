---
layout: single
title: Results
classes: wide
sidebar:
    title: 'EuroSys 2022'
    nav: eurosys2022toc
---

<table>
  <thead>
    <tr>
      <th>Paper title</th>
      <th>Avail.</th>
      <th>Funct.</th>
      <th>Repro.</th>
      <th>Available At</th>
      <th>Review Summary</th>
    </tr>
  </thead>
  <tbody>
  {% for artifact in site.data.eurosys22results.artifacts %}
    <tr>
      <td>
        {% if artifact.url %}
          [{{artifact.title}}]({{artifact.url}})
        {% elsif artifact.doi %}
          <a href="{{site.data.sosp21results.baseurl}}{{artifact.doi}}">{{artifact.title}}</a>
        {% else %}
          {{ artifact.title }}
        {% endif %}
      </td>
      <td>
        {% if artifact.badges contains "Available" %}
          {{ site.data.sosp21results.available_html }}
        {% endif %}
      </td>
      <td>
        {% if artifact.badges contains "Functional" %}
          {{ site.data.sosp21results.functional_html }}
        {% endif %}
      </td>
      <td>
        {% if artifact.badges contains "Reproduced" %}
          {{ site.data.sosp21results.reproduced_html }}
        {% endif %}
      </td>
      <td>
        {% if artifact.award %}
          <b>Distinguished&nbsp;Artifact</b><br>
        {% endif %} {% if artifact.web_url %}
          <a href="{{artifact.web_url}}">Web</a><br>
        {% endif %} {% if artifact.github_url %}
          <a href="{{artifact.github_url}}">GitHub</a><br>
        {% endif %} {% if artifact.bitbucket_url %}
          <a href="{{artifact.bitbucket_url}}">Bitbucket</a><br>
        {% endif %} {% if artifact.data_url %}
          <a href="{{artifact.data_url}}">Data</a><br>
        {% endif %} {% if artifact.jupyter_url %}
          <a href="{{artifact.jupyter_url}}">Jupyter&nbsp;Notebook</a><br>
        {% endif %} {% if artifact.proof_url %}
          <a href="{{artifact.proof_url}}">Proofs</a><br>
        {% endif %} {% if artifact.vm_url %}
          <a href="{{artifact.vm_url}}">VM&nbsp;Image</a><br>
        {% endif %} {% if artifact.cloudlab_url %}
          <a href="{{artifact.cloudlab_url}}">CloudLab&nbsp;Profile</a><br>
        {% endif %} {% if artifact.scripts_url %}
          <a href="{{artifact.scripts_url}}">Scripts</a><br>
        {% endif %} {% if artifact.additional_urls %}
          {% for url in artifact.additional_urls %}
            <a href="{{url}}">Additional&nbsp;Resources</a><br>
          {% endfor %}
        {% endif %}
      </td>
      <td>
        {% if artifact.summary %}
          <a href="summaries/{{ artifact.summary }}.html">Summary</a>
        {% else %}
          <em>To be posted</em>
        {% endif %}
      </td>
    </tr>
    {% endfor %}
  </tbody>
</table>
