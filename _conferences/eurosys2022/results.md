---
title: Results
order: 70
available_img: "acm_available_1.1.png"
available_name: "Artifacts Available (v1.1)"
functional_img: "acm_functional_1.1.png"
functional_name: "Artifacts Evaluated - Functional (v1.1)"
reproduced_img: "acm_reproduced_1.1.png"
reproduced_name: "Results Reproduced (v1.1)"
baseurl: "https://dl.acm.org/doi/"
artifacts:
# Sample
#  - title: ""
#    github_url: ""
#    additional_urls:
#      - "URL"
#    jupyter_url: "URL"
#    vm_url: ""
#    proof_url: ""
#    web_url: ""
#    bitbucket_url: ""
#    data_url: ""
#    cloudlab_url: ""
#    scripts_url: ""
#    badges: Available, Functional, Reproduced
#    summary: filename
#    doi: "10.1145/####.###"
#    award: "yes/no"
---

<table>
  <thead>
    <tr>
      <th>Paper title</th>
      <th>Avail.</th>
      <th>Funct.</th>
      <th>Repro.</th>
      <th>Available At</th>
      <th>Review Summary</th>
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
        {% if artifact.award %}
          <b>Distinguished&nbsp;Artifact</b><br>
        {% endif %} {% if artifact.web_url %}
          <a href="{{artifact.web_url}}">Web</a><br>
        {% endif %} {% if artifact.github_url %}
          <a href="{{artifact.github_url}}">GitHub</a><br>
        {% endif %} {% if artifact.bitbucket_url %}
          <a href="{{artifact.bitbucket_url}}">Bitbucket</a><br>
        {% endif %} {% if artifact.data_url %}
          <a href="{{artifact.data_url}}">Data</a><br>
        {% endif %} {% if artifact.jupyter_url %}
          <a href="{{artifact.jupyter_url}}">Jupyter&nbsp;Notebook</a><br>
        {% endif %} {% if artifact.proof_url %}
          <a href="{{artifact.proof_url}}">Proofs</a><br>
        {% endif %} {% if artifact.vm_url %}
          <a href="{{artifact.vm_url}}">VM&nbsp;Image</a><br>
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
      <td>
        {% if artifact.summary %}
          <a href="summaries/{{ artifact.summary }}.html">Summary</a>
        {% else %}
          <em>To be posted</em>
        {% endif %}
      </td>
    </tr>
    {% endfor %}
  </tbody>
</table>
