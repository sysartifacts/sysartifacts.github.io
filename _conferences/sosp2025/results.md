---
title: Results
order: 50
available_img: "acm_available_1.1.png"
available_name: "Artifacts Available (v1.1)"
functional_img: "acm_functional_1.1.png"
functional_name: "Artifacts Evaluated - Functional (v1.1)"
reproduced_img: "acm_reproduced_1.1.png"
reproduced_name: "Results Reproduced (v1.1)"
baseurl: "https://dl.acm.org/doi/"
artifacts:
- title: ""
  repository_url: ""
  badges: Available, Functional, Reproduced
  doi: ""
---

<table>
  <thead>
    <tr>
      <th>Paper title</th>
      <th>Avail.</th>
      <th>Funct.</th>
      <th>Repro.</th>
      <th>Available At</th>
    </tr>
  </thead>
  <tbody>
  {% for artifact in page.artifacts %}
    <tr>
      <td>
        {% if artifact.url %}
          [{{artifact.title}}]({{artifact.url}})
        {% elsif artifact.doi %}
          <a href="{{page.baseurl}}{{artifact.doi}}">{{artifact.title}}</a>
        {% else %}
          {{ artifact.title }}
        {% endif %}
      </td>
      <td>
        {% if artifact.badges contains "Available" %}
          <img src="{{ site.baseurl }}/images/{{ page.available_img }}" alt="{{ page.available_name }}" width="50px">
        {% endif %}
      </td>
      <td>
        {% if artifact.badges contains "Functional" %}
          <img src="{{ site.baseurl }}/images/{{ page.functional_img }}" alt="{{ page.functional_name }}" width="50px">
        {% endif %}
      </td>
      <td>
        {% if artifact.badges contains "Reproduced" %}
          <img src="{{ site.baseurl }}/images/{{ page.reproduced_img }}" alt="{{ page.reproduced_name }}" width="50px">
        {% endif %}
      </td>
      <td>
        {% if artifact.repository_url %}
          <a href="{{artifact.repository_url}}">GitHub</a><br>
        {% endif %} {% if artifact.cloudlab_url %}
          <a href="{{artifact.cloudlab_url}}">CloudLab&nbsp;Profile</a><br>
        {% endif %} {% if artifact.scripts_url %}
          <a href="{{artifact.scripts_url}}">Scripts</a><br>
        {% endif %} {% if artifact.additional_urls %}
          {% for url in artifact.additional_urls %}
            <a href="{{url}}">Additional&nbsp;Resources</a><br>
          {% endfor %}
        {% endif %}
      </td>
    </tr>
    {% endfor %}
  </tbody>
</table>
