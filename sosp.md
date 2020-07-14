---
layout: home
title: SOSP
---

ACM Symposium on Operating Systems Principles (SOSP) was the first system research conference to
introduce artifact evaluation in 2019.

## Artifact Evaluations

{% assign conf = site.conferences | where: 'name', 'SOSP' | first %}
{% assign sorted_ae = (conf.ae | sort: 'year') | reverse %}
{{conf.name}} {% for ae in sorted_ae %}
: [{{ae.year}}]({{ae.location}})
{% endfor %}
