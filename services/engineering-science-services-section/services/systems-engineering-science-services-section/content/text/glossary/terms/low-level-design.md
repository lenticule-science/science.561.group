---
description: "The design document that states what each part of a system is obliged to do, as numbered testable requirements with the failure each prevents; it is falsified by a behavioural counterexample."
identity: low-level-design
name: Low Level Design
aliases:
  - LLD
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
---
A low-level design (LLD) states what each part of a system is obliged to do. Each obligation is a numbered requirement with a stable identifier cited by tests, reviews and defects, one **shall** statement, and a statement of the concrete failure that occurs if it is dropped. That statement is normative context, because a requirement whose failure cannot be named is first cut under pressure. A requirement is testable or it is not a requirement, and each traces to at least one acceptance scenario. The LLD is falsified by a behavioural counterexample; it states obligations and cites the proof or decision that forces them without arguing them ([MetroPlat LLD](../../../../../../../../../engineering-services-section/content/text/documents/articles/notes/2026/07/15/2026-07-15-note-on-low-level-design.md), lines 20-50). The MetroPlat LLD gave six detailed-design views over 35 design elements.

The LLD takes element placement from the [HLD](high-level-design.md) and is governed by the [SAS](system-architecture-specification.md). In the fabrication chain it is the last document before code: the LLD's exact types, grammar, schemas and refusal algebra are what [codegen](../../../../../fabrication-science-services-section/content/text/glossary/terms/codegen.md) projects and what a [work order](../../../../../fabrication-science-services-section/content/text/glossary/terms/work-order.md) closes over ([glass-sponge note](../../../../../../../../../engineering-services-section/content/text/documents/articles/notes/2026/08/01/2026-08-01-note-on-the-content-addressed-glass-sponge-semantic-compute-complex.md), section 24, item 5).

All four MetroPlat documents were reclassified historical on 2026-09-18: they record earlier thinking and impose no implementation obligation, and the checker for the set has been retired. No current set of these documents is held for the fabrication line ([recovery index](../../../../../fabrication-science-services-section/content/text/documents/articles/notes/2026/10/09/2026-10-09-note-recovering-the-fabrication-research.md), section 4 and section 7, step 7).

See also: [SRS](software-requirements-specification.md), [code fabrication from a specification](../../../../../fabrication-science-services-section/services/computer-fabrication-science-services-section/services/computer-code-fabrication-science-services-section/content/text/documents/articles/specifications/2026-09-04-code-fabrication-from-a-specification.md).
