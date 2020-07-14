---
layout: home
title: Systems Research Artifacts
---
Goal of artifact evaluation (AE) is to recognize the authors who have put in the effort to release
usable software systems as well as to validate the results of the accepted papers.

sysartifacts gathers artifact evaluation results from CS system conferences.

## Conference Artifact Evaluations

{% assign sorted_conferences = site.conferences | sort: 'name' %}
{% for c in sorted_conferences %}
{{c.name}} {% assign sorted_ae = c.ae | sort: 'year' | reverse %}{% for ae in sorted_ae %}
: [{{ae.year}}]({{ae.location}})
  {% endfor %}
{% endfor %}
