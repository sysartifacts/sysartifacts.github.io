---
layout: home
title: OSDI
---

USENIX Symposium on Operating Systems Design and Implementation introduced artifact evaluation in 2020.

## Artifact Evaluations

{% assign conf = site.conferences | where: 'name', 'OSDI' | first %}
{% assign sorted_ae = (conf.ae | sort: 'year') | reverse %}
{% for ae in sorted_ae %}* [{{ae.year}}]({{ae.location}})
{% endfor %}