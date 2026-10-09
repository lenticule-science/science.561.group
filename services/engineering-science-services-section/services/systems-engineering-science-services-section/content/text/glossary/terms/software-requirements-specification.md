---
description: "The document that baselines the requirements a design set answers to, each stated as a testable shall; the first document in the chain from requirement to code."
identity: software-requirements-specification
name: Software Requirements Specification
aliases:
  - SRS
date-created: 2026-10-09
provenance:
  authors:
    - emsenn
    - bare-cedar-fog-claude
  sources:
    - /home/emsenn/info/lib/emsenn/services/561-group/services/engineering-services-section/content/text/documents/articles/notes/2026/07/15/2026-07-15-note-on-software-requirements-specification.md
    - /home/emsenn/info/lib/emsenn/services/561-group/services/engineering-services-section/content/text/documents/articles/notes/2026/07/15/2026-07-15-note-on-system-architecture-specification.md
    - /home/emsenn/info/lib/emsenn/services/561-group/services/engineering-services-section/content/text/documents/articles/notes/2026/07/15/2026-07-15-note-on-high-level-design.md
    - /home/emsenn/info/lib/emsenn/services/561-group/services/engineering-services-section/content/text/documents/articles/notes/2026/07/15/2026-07-15-note-on-low-level-design.md
    - /home/emsenn/info/lib/emsenn/services/561-group/services/engineering-services-section/content/text/documents/articles/notes/2026/08/01/2026-08-01-note-on-the-content-addressed-glass-sponge-semantic-compute-complex.md
    - /home/emsenn/info/lib/emsenn/services/561-group/services/science-services-section/services/engineering-science-services-section/services/fabrication-science-services-section/content/text/glossary/topics/requirements-to-specification.md
    - /home/emsenn/info/lib/emsenn/services/561-group/services/science-services-section/services/engineering-science-services-section/services/fabrication-science-services-section/content/text/documents/articles/notes/2026/10/09/2026-10-09-note-recovering-the-fabrication-research.md
    - /home/emsenn/info/lib/emsenn/services/561-group/services/engineering-services-section/content/text/documents/articles/notes/2026/07/23/2026-07-23-zeolitic-software-development.md
    - /home/emsenn/info/lib/emsenn/services/561-group/services/561-group-services-section/content/text/glossary/terms/requirement-event.md
---
A software requirements specification (SRS) is the document that baselines the requirements the design documents answer to. Each requirement is a single testable statement; a requirement that cannot be tested or whose failure cannot be named is not a requirement. The information items of an SRS are set by ISO/IEC/IEEE 29148. In the Leader's chain, aligned code is derived from "research papers I can read, specs I can read, SAS, HLD, LLD: etc." ([recovery index](../../../../../fabrication-science-services-section/content/text/documents/articles/notes/2026/10/09/2026-10-09-note-recovering-the-fabrication-research.md), line 61), and the SRS is the first link, the document the [SAS](system-architecture-specification.md) answers to.

The house distinguishes what an SRS may hold. The [requirements to specification](../../../../../fabrication-science-services-section/content/text/glossary/topics/requirements-to-specification.md) topic separates a goal, a requirement, a machine guarantee, an expectation and a decision, after Zave and Jackson, van Lamsweerde and ISO/IEC/IEEE 29148, and states that provenance is not truth. Requirements are distributed, attested or closed by discrete events recorded apart from the requirement, and an audit refuses a body attesting its own work ([requirement event](../../../../../../../../../561-group-services-section/content/text/glossary/terms/requirement-event.md)). The MetroPlat SRS of 2026-07-15 was shaped per the 29148 information items with no conformance claimed; it baselined the constraint-derived requirements and let stakeholder and operational requirements enter by amendment as the concept of operations matured ([MetroPlat SRS](../../../../../../../../../engineering-services-section/content/text/documents/articles/notes/2026/07/15/2026-07-15-note-on-software-requirements-specification.md), lines 20-32). The sponge program names a stakeholder and system requirements specification covering identity stability, deterministic composition, paraconsistent evidence, kinetic availability, authority preservation, migration and receiver-facing acceptance ([glass-sponge note](../../../../../../../../../engineering-services-section/content/text/documents/articles/notes/2026/08/01/2026-08-01-note-on-the-content-addressed-glass-sponge-semantic-compute-complex.md), lines 1693-1700).

All four MetroPlat documents were reclassified historical on 2026-09-18: they record earlier thinking and impose no implementation obligation, and the checker for the set has been retired. No current set of these documents is held for the fabrication line ([recovery index](../../../../../fabrication-science-services-section/content/text/documents/articles/notes/2026/10/09/2026-10-09-note-recovering-the-fabrication-research.md), section 4 and section 7, step 7).

See also: [system architecture specification](system-architecture-specification.md), [high-level design](high-level-design.md), [low-level design](low-level-design.md), [specification](../../../../../technology-science-services-section/services/specification-services-section/content/text/glossary/topics/specification.md), [work order](../../../../../fabrication-science-services-section/content/text/glossary/terms/work-order.md), [codegen](../../../../../fabrication-science-services-section/content/text/glossary/terms/codegen.md).
