---
description: "The governing document of a design set: its identification, conformance posture, stakeholders, viewpoints, decisions, quality requirements and gaps, stating what the set claims and what it owes."
identity: system-architecture-specification
name: System Architecture Specification
aliases:
  - SAS
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
---
A system architecture specification (SAS) is the governing document of a design set. It states what the set claims and what it owes: identification, conformance posture, governance, stakeholders, the viewpoint catalogue, decisions, quality requirements and gaps. It contains by reference the [high-level design](high-level-design.md), the [low-level design](low-level-design.md) and an engineering practices document, and it answers to the [requirements specification](software-requirements-specification.md) ([MetroPlat SAS](../../../../../../../../../engineering-services-section/content/text/documents/articles/notes/2026/07/15/2026-07-15-note-on-system-architecture-specification.md), lines 20-45). Its design language is IEEE 1016: viewpoints frame stated concerns for stated stakeholders, and a view represents the system for one viewpoint. ISO/IEC/IEEE 42010 describes an architecture in the same terms, as stakeholders, concerns, viewpoints, views, correspondence rules and decisions, and the sponge program lists that architecture description and arc42 as separate documents beside the HLD and LLD ([glass-sponge note](../../../../../../../../../engineering-services-section/content/text/documents/articles/notes/2026/08/01/2026-08-01-note-on-the-content-addressed-glass-sponge-semantic-compute-complex.md), lines 1693-1722).

The SAS exists because the other documents argue nothing: the reasoning is held in a decisions register and the obligations are held elsewhere. The MetroPlat set divides the work in four. The HLD says what the parts are. The LLD says what each part is obliged to do, as requirements a test can cite. The practices say how to hold the obligations and what a violation looks like. The SAS governs all three (line 37).

All four MetroPlat documents were reclassified historical on 2026-09-18: they record earlier thinking and impose no implementation obligation, and the checker for the set has been retired. No current set of these documents is held for the fabrication line ([recovery index](../../../../../fabrication-science-services-section/content/text/documents/articles/notes/2026/10/09/2026-10-09-note-recovering-the-fabrication-research.md), section 4 and section 7, step 7).

See also: [MAPE-K](mape-k.md), [SRS](software-requirements-specification.md), [specification fabrication](../../../../../fabrication-science-services-section/content/text/glossary/topics/specification-fabrication.md).
