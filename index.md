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

- [Badges and their criteria](/resources/v1/badges)
- [Help for authors](/resources/v1/help-authors)
- [Help for evaluators](/resources/v1/help-evaluators)

_Resources were compiled by Solal Pirelli with input from (in alphabetical order)
Anjo Vahldiek-Oberwagner, Colin Gordon, Hernan Ponce de Leon, Manuel Rigger, Mark Mansi, Romain Jacob, and Sam Grayson._
