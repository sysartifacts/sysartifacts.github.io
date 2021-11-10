---
layout: single
title: SC
---

The [International Conference for High Performance Computing, Networking,
Storage, and Analysis (SuperComputing/SC)](http://www.supercomputing.org)
introduced artifact evaluation in 2021.

## Artifact Evaluations

{% assign conf = site.conferences | where: 'name', 'SC' | first %}
{% assign sorted_ae = conf.ae | sort: 'year' | reverse %}
{% for ae in sorted_ae %}* [{{ae.year}}]({{ae.location}})
{% endfor %}
