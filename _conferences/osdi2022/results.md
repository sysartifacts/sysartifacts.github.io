---
title: Results
order: 40
available_img: "usenix_available.svg"
available_name: "Artifacts Available"
functional_img: "usenix_functional.svg"
functional_name: "Artifacts Evaluated"
reproduced_img: "usenix_reproduced.svg"
reproduced_name: "Results Reproduced"
baseurl: "https://www.usenix.org/conference/osdi22/presentation/"
artifacts:

  - title: 'BlockFlex: Enabling Storage Harvesting with Software-Defined Flash in Modern Cloud Platforms'
    id: reidys
    github_url: https://github.com/platformxlab/blockflex
    badges: Available, Functional, Reproduced
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
          <a href="{{page.baseurl}}{{artifact.id}}">{{artifact.title}}</a>
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
    </tr>
    {% endfor %}
  </tbody>
</table>
