---
description: Discovering a conformant model from an existing artifact so a model-driven pipeline can transform and regenerate it, rather than authoring the model first. MoDisco (Bruneliere et al., ASE 2010) is the class's generic, extensible reference framework.
identity: model-driven-reverse-engineering
name: Model-Driven Reverse Engineering
date-created: 2026-09-04
provenance:
  authors:
    - emsenn
    - claude-fable-5-1
  sources:
    - /home/emsenn/info/lib/emsenn/services/561-group/services/561-group-services-section/content/text/glossary/terms/fabrication-friday.md
    - /home/emsenn/info/.claude/skills/dispatch-agents/SKILL.md
references:
  bruneliere2010:
    authors:
      - Hugo Bruneliere
      - Jordi Cabot
      - Grégoire Dupé
      - Frédéric Madiot
    title: "MoDisco: a generic and extensible framework for model driven reverse engineering"
    year: 2010
    publication: Proceedings of the IEEE/ACM International Conference on Automated Software Engineering (ASE)
---
Model-driven reverse engineering discovers a conformant model from an existing artifact (source code, a binary, a running system) so that the same model-driven pipeline can transform and regenerate it, rather than requiring the model to be authored first (Hugo Bruneliere, Jordi Cabot, Grégoire Dupé, Frédéric Madiot, "MoDisco: a generic and extensible framework for model driven reverse engineering", ASE 2010). This distinguishes model-driven reverse engineering from plain program comprehension or documentation extraction, whose output is prose or a diagram for a human reader rather than a conformant model a transformation can consume as input. The engineering consequence: the code discoverer that reads an existing script into the fabricator's argument object (name, parameters and their schemas, return schema, throws, imports, body) is a model-driven-reverse-engineering step, and it is what makes the standardization loop close: files to discoverer to arguments to projectors to files.
