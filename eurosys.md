---
layout: home
title: EuroSys
---

EuroSys conference is organized by European chapter of SIGOPS. Research artifacts were first
evaluated in 2021.

## Artifact Evaluations

{% assign conf = site.conferences | where: 'name', 'EuroSys' | first %}
{% assign sorted_ae = (conf.ae | sort: 'year') | reverse %}
{{conf.name}} {% for ae in sorted_ae %}
: [{{ae.year}}]({{ae.location}})
{% endfor %}