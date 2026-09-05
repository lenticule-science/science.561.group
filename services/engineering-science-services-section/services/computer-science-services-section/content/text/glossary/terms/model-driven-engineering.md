---
description: Engineering discipline in which a model conforming to a declared metamodel, not source code, is the primary artifact, with transformations deriving code and documentation from it. Its industry lineage runs from the OMG's Model Driven Architecture through the Eclipse Modeling Framework and the ATL/QVT transformation languages.
identity: model-driven-engineering
name: Model-Driven Engineering
provenance:
  date-created: 2026-09-04
  authors:
    - emsenn
    - claude-fable-5-1
  sources:
    - /home/emsenn/info/lib/emsenn/services/561-group/services/operations-services-section/content/text/glossary/terms/fabrication-friday.md
    - /home/emsenn/info/.claude/skills/dispatch-agents/SKILL.md
references:
  omg2003:
    authors:
      - Object Management Group
    title: MDA Guide Version 1.0.1
    year: 2003
    publisher: Object Management Group
---
Model-driven engineering treats a model conforming to a declared metamodel as the primary engineering artifact, from which transformations produce code, documentation, and further models (the OMG's Model Driven Architecture, MDA Guide Version 1.0.1, 2003; realized in tooling by the Eclipse Modeling Framework and the ATL and QVT transformation languages). This distinguishes model-driven engineering from code-first development, where the source code itself is the primary artifact and any model is a lossy diagram drawn after the fact rather than a conformant input a transformation reads. The engineering consequence: the org's metamodels are the section form (the services-section shape every topic conforms to) and the operation form (the fabricator's argument object — parameters, return schema, throws, imports, body), and its model repository is the EAVT rows a trace is built from, so a section or an operation is transformed and regenerated rather than hand-edited.
