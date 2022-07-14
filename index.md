---
title: Systems Research Artifacts
---

The goal of artifact evaluation (AE) is to recognize the authors who have put in the effort to release
usable software systems as well as to validate the results of the accepted papers.

This website collects artifact evaluation results for computer systems conferences.

This website also collects resources for artifact evaluation:
- [Guide for AE chairs](chair-guide.md)
- ... your contribution is welcome!


## Conference Artifact Evaluations

{% for p in site.conferences %}
  {% assign depth = p.path | split:"/" | size %}
  {% if depth == 2 %}

  {% assign conf_base_path = p.path | remove:p.ext %}
  {% assign years = site.conferences | where_exp:"conf","conf.path contains p.slug" | where_exp:"conf","conf != p" | group_by_exp:"conf","conf.path | remove:conf.slug | remove:conf.ext" | sort:"name" | reverse %}

**{{ p.title }}**:
{% for year in years %}
  {%- assign year_depth = year.name | split:"/" | size -%}
  {%- if year_depth == 2 -%}
  {%- assign year_number = year.name | remove:conf_base_path | remove:"/" -%}
    [{{ year_number }}]({{ conf_base_path | remove:"_conferences" | append:year_number | relative_url }})&nbsp;
  {%- endif -%}
{% endfor %}

  {% endif %}
{% endfor %}
