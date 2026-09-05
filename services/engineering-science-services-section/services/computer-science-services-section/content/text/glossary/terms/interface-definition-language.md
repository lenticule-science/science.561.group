---
description: A contract-first schema language in which a service or data shape is specified independently of any implementation, so server code, client code, and documentation are generated from it. Protocol Buffers, Smithy, TypeSpec, and OpenAPI are the class's current reference members.
identity: interface-definition-language
name: Interface Definition Language
provenance:
  date-created: 2026-09-04
  authors:
    - emsenn
    - claude-fable-5-1
  sources:
    - /home/emsenn/info/lib/emsenn/services/561-group/services/operations-services-section/content/text/glossary/terms/fabrication-friday.md
    - /home/emsenn/info/.claude/skills/dispatch-agents/SKILL.md
references:
  google2008:
    authors:
      - Google
    title: Protocol Buffers Language Guide
    year: 2008
    publisher: Google
---
An interface definition language is a schema language in which a contract for a service or data shape is written first, independent of any implementation language, so that server code, client code, and documentation are all generated from the one schema rather than hand-written to agree with each other (the class spanning Protocol Buffers, Smithy, TypeSpec, and OpenAPI, all contract-first schema languages with code and document generators). This distinguishes an interface definition language from a hand-written API contract expressed only as prose documentation or as one language's own type definitions, where nothing generates the other languages' bindings and nothing detects the two drifting apart. The engineering consequence: the work order's schemas (parameters, return schema, throws) are the org's interface definition language, and the MCP and A2A faces a package exposes are projections of that one schema rather than independently authored surfaces.
