---
layout: single
title: Results
sidebar:
    title: 'SOSP 2021'
    nav: sosp2021toc
---

| Paper title | Avail. | Funct. | Repro. | Available At | Review Summary |
|:-----------:|:--------------:|:------------:|:--------------:|
{%- for artifact in site.data.sosp21results.artifacts %}
| {%- if artifact.url -%}
    [{{artifact.title}}]({{artifact.url}})
  {%- else -%}
    {{- artifact.title -}}
  {%- endif -%}
| {%- if artifact.badges contains "Available" -%}
    {{- site.data.sosp21results.available_html -}}
  {%- endif -%}
| {%- if artifact.badges contains "Functional" -%}
    {{- site.data.sosp21results.functional_html -}}
  {%- endif -%}
| {%- if artifact.badges contains "Reproduced" -%}
    {{- site.data.sosp21results.reproduced_html -}}
    {%- endif -%}
| {%- if artifact.web_url -%}
      [Web]({{artifact.web_url}})<br>
  {%- endif %} {% if artifact.github_url -%}
      [GitHub]({{artifact.github_url}})<br>
  {%- endif %} {% if artifact.bitbucket_url -%}
      [Bitbucket]({{artifact.bitbucket_url}})<br>
  {%- endif %} {% if artifact.data_url -%}
      [Data]({{artifact.data_url}})<br>
  {%- endif %} {% if artifact.jupyter_url -%}
      [Jupyter&nbsp;Notebook]({{artifact.jupyter_url}})<br>
  {%- endif %} {% if artifact.proof_url -%}
      [Proofs]({{artifact.proof_url}})<br>
  {%- endif %} {% if artifact.vm_url -%}
      [VM&nbsp;Image]({{artifact.vm_url}})<br>
  {%- endif %} {% if artifact.cloudlab_url -%}
      [CloudLab&nbsp;Profile]({{artifact.cloudlab_url}})<br>
  {%- endif %} {% if artifact.scripts_url -%}
      [Scripts]({{artifact.scripts_url}})<br>
  {%- endif %} {% if artifact.additional_urls -%}
      {%- for url in artifact.additional_urls -%}
          [Additional&nbsp;Resources]({{url}})<br>
      {%- endfor -%}
  {%- endif -%}
| {%- if artifact.summary -%}
  {%- else -%}
    *To be posted*
  {%- endif -%}
|
{%- endfor %}
