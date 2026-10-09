---
description: "The practice of building a system-family generator — a program whose input is a specification and whose output is a concrete system — rather than hand-authoring each system member. Czarnecki and Eisenecker's Generative Programming: Methods, Tools, and Applications (Addison-Wesley, 2000) is its founding treatment."
identity: generative-programming
name: Generative Programming
date-created: 2026-09-04
provenance:
  authors:
    - emsenn
    - claude-fable-5-1
  sources:
    - /home/emsenn/info/lib/emsenn/services/561-group/services/561-group-services-section/content/text/glossary/terms/fabrication-friday.md
    - /home/emsenn/info/.claude/skills/dispatch-agents/SKILL.md
references:
  czarnecki2000:
    authors:
      - Krzysztof Czarnecki
      - Ulrich W. Eisenecker
    title: "Generative Programming: Methods, Tools, and Applications"
    year: 2000
    publisher: Addison-Wesley
---
Generative programming is the practice of building a system-family generator — a program whose input is a specification of a system's variable and fixed parts and whose output is a concrete member of that family — rather than an engineer hand-authoring each member (Czarnecki & Eisenecker, Generative Programming: Methods, Tools, and Applications, Addison-Wesley, 2000). This distinguishes generative programming from a hand-written framework, where variability is filled in by a human at each inheritance or configuration point rather than derived whole by a generator from one compact specification. The engineering consequence: the org's fabrication line (`fabricate_jsnode_operation_package`) is a generative-programming generator whose specification is the work order — the code, name, parameters with their schemas, return schema, throws, imports, and body — and every other artifact (JSDoc, export, command guard, README, tests, manifest, tool face) is projected from that one specification, never separately authored.
