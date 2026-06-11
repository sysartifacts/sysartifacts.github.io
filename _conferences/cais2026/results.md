---
title: Results
order: 70
available_img: "acm_available_1.1.png"
available_name: "Artifacts Available (v1.1)"
functional_img: "acm_functional_1.1.png"
functional_name: "Artifacts Evaluated - Functional (v1.1)"
reproduced_img: "acm_reproduced_1.1.png"
reproduced_name: "Results Reproduced (v1.1)"

artifacts:
  - title: "AI Realtor: Towards Grounded Persuasive Language Generation for Automated Copywriting"
    artifact_url: "https://github.com/yangalan123/AI-Realtor-Codebase"
    badges: "available,functional"

  - title: "Robust Batch-Level Query Routing for Large Language Models under Cost and Capacity Constraints"
    artifact_url: "https://github.com/CoreAI-Optimization/robust-llm-router"
    badges: "available,functional"

  - title: "CAMI: Cost-Aware Agent-Guided Multi-Indexing for Semantic Retrieval"
    artifact_url: "n/a"
    badges: "available,functional"

  - title: "Glia: A Human-Inspired AI for Automated Systems Design and Optimization"
    artifact_url: "https://github.com/mit-nms/Engram"
    badges: "available,functional"

  - title: "OpaqueToolsBench: Learning Nuances of Tool Behavior Through Interaction"
    artifact_url: "https://github.com/shallinan1/OpaqueToolsBench/"
    badges: "available,functional"

  - title: "Robust Agent Compensation (RAC): Teaching AI Agents to Compensate"
    artifact_url: "https://zenodo.org/records/19753969"
    badges: "available,functional"

  - title: "ViBench: A Benchmark on Vibe Coding"
    artifact_url: "https://zenodo.org/records/19881536"
    badges: "available,functional"

  - title: "AgentStop: Terminating Local AI Agents Early to Save Energy in Consumer Devices"
    artifact_url: "https://github.com/brave-experiments/AgentStop"
    badges: "available,functional,reproduced"

  - title: "Context, Reasoning, and Hierarchy: A Cost–Performance Study of Compound LLM Agent Design in an Adversarial POMDP"
    artifact_url: "https://github.com/isbogdanov/agent-design-study"
    badges: "available,functional,reproduced"

  - title: "Do Agents Need to Plan Step-by-Step? Rethinking Planning Horizon in Data-Centric Tool Calling"
    artifact_url: "https://github.com/megagonlabs/cais26-planning-horizon"
    badges: "available,functional,reproduced"

  - title: "Exploring and Developing a Pre-Model Safeguard with Draft Models"
    artifact_url: "https://github.com/standbyme/proj-jailbreak-sandbox"
    badges: "available,functional,reproduced"

  - title: "FORGE: Self-Evolving Agent Memory With No Weight Updates via Population Broadcast"
    artifact_url: "https://github.com/isbogdanov/forge-protocol"
    badges: "available,functional,reproduced"

  - title: "How To Steer Your Multi-Agent System: Human-LLM Collaborative Planning"
    artifact_url: "https://github.com/megagonlabs/ambipom"
    badges: "available,functional,reproduced"

  - title: "Improving Coherence and Persistence in Agentic AI for System Optimization"
    artifact_url: "https://github.com/mit-nms/Engram"
    badges: "available,functional,reproduced"

  - title: "Learning from Supervision with Semantic and Episodic Memory: A Reflective Approach to Agent Adaptation"
    artifact_url: "https://github.com/megagonlabs/critique-learning"
    badges: "available,functional,reproduced"

  - title: "optimize_anything: Unified Text Optimization can Outperform Specialized Systems"
    artifact_url: "github.com/lukeleeai/optimize_anything_artifact"
    badges: "available,functional,reproduced"

  - title: "Retrieval-Augmented LLMs for Security Incident Analysis"
    artifact_url: "https://github.com/neu-nds2/llm-sec-incident-analysis"
    badges: "available,functional,reproduced"

  - title: "Securing Agents With Tracked Capabilities"
    artifact_url: "https://github.com/lampepfl/tacit"
    badges: "available,functional,reproduced"

  - title: "Securing the Agent: Vendor-Neutral, Multitenant Enterprise Retrieval and Tool Use"
    artifact_url: "https://github.com/varshaprasad96/ogx-evals"
    badges: "available,functional,reproduced"

  - title: "Vista: Verifier-in-the-Loop Agentic Reinforcement Learning for Quantum Program Synthesis"
    artifact_url: "https://github.com/benyucong/rl-quantum"
    badges: "available,functional,reproduced"

  - title: "Who Decides the Trade-off? Resolution Policy as Delegation Governance in Autonomous Agents"
    artifact_url: "https://doi.org/10.5281/zenodo.20043263"
    badges: "available,functional,reproduced"
---

**Evaluation Results**:

* 14 Artifact Available, Functional, and Results Reproduced
* 7 Artifact Available and Functional
* 0 Artifact Functional and Results Reproduced

<table>
  <thead>
    <tr>
      <th>Title</th>
      <th>Available</th>
      <th>Functional</th>
      <th>Reproduced</th>
      <th>Available at</th>
    </tr>
  </thead>
  <tbody>
  {% for artifact in page.artifacts %}
    <tr>
      <td>
        {% if artifact.paper_url %}
          <a href="{{artifact.paper_url}}" target="_blank">{{artifact.title}}</a>
        {% else %}
          {{ artifact.title }}
        {% endif %}
      </td>
      <td>
        {% if artifact.badges contains "available" %}
          <img src="{{ site.baseurl }}/images/{{ page.available_img }}" alt="{{ page.available_name }}" width="50px">
        {% endif %}
      </td>
      <td>
        {% if artifact.badges contains "functional" %}
          <img src="{{ site.baseurl }}/images/{{ page.functional_img }}" alt="{{ page.functional_name }}" width="50px">
        {% endif %}
      </td>
      <td>
        {% if artifact.badges contains "reproduced" %}
          <img src="{{ site.baseurl }}/images/{{ page.reproduced_img }}" alt="{{ page.reproduced_name }}" width="50px">
        {% endif %}
      </td>
      <td>
        {% if artifact.award %}
          <b>{{ artifact.award }}</b><br>
        {% endif %} {% if artifact.artifact_url %}
          <a href="{{artifact.artifact_url}}" target="_blank">Artifact</a><br>
        {% endif %}
      </td>
    </tr>
    {% endfor %}
  </tbody>
</table>
