---
layout: single
title: Systems Research Artifacts
---

The goal of artifact evaluation (AE) is to recognize the authors who have put in the effort to release
usable software systems as well as to validate the results of the accepted papers.

This website collects resources and results around artifact evaluation for computer systems conferences.


## Conference Artifact Evaluations

{% assign sorted_conferences = site.conferences | sort: 'name' %}
{% for c in sorted_conferences %}
**{{c.name}}**: {% assign sorted_ae = c.ae | sort: 'year' | reverse %}
[{{sorted_ae[0].year}}]({{sorted_ae[0].location}}){% for ae in sorted_ae offset:1 %}, [{{ae.year}}]({{ae.location}}){% endfor %}
{% endfor %}


## Resources

- [Badges and their criteria](/badges)
- [Help for authors](/help-authors)
- [Help for evaluators](/help-evaluators)
