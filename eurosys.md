---
layout: single
title: EuroSys
---

The [EuroSys conference](http://www.eurosys.org/conferences) is organized by the
European chapter of [ACM SIGOPS](https://www.sigops.org/).
Research artifacts were first evaluated in 2021.

## Artifact Evaluations

{% assign conf = site.conferences | where: 'name', 'EuroSys' | first %}
{% assign sorted_ae = conf.ae | sort: 'year' | reverse %}
{% for ae in sorted_ae %}* [{{ae.year}}]({{ae.location}})
{% endfor %}
