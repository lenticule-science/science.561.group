---
description: "The design document that says what the parts of a system are and how they relate, through architecture-level views; it is falsified by a decomposition error."
identity: high-level-design
name: High Level Design
aliases:
  - HLD
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
A high-level design (HLD) says what the parts of a system are and how they relate. It does not say what any part must do. It is falsified by a decomposition error: a duplicated or missing responsibility. The MetroPlat HLD gave seven architecture-level views: context, composition, logical, dependency, information, interface and patterns use. Its claims were numbered `AR-nnn` and binding, with unlabelled claims held as design commitments, and it did not argue, because the reasoning lives in the decisions register of the [SAS](system-architecture-specification.md) ([MetroPlat HLD](../../../../../../../../../engineering-services-section/content/text/documents/articles/notes/2026/07/15/2026-07-15-note-on-high-level-design.md), lines 25-45). Its dependency view fixed what must exist before what, and so where a new capability is forced to sit.

The HLD sits between the SAS and the [LLD](low-level-design.md): element placement is fixed by the HLD and the obligations on each element are the LLD's. In the sponge program the HLD names the kernel, address formation, registry cell, Chu transport, proof forest and projection boundaries ([glass-sponge note](../../../../../../../../../engineering-services-section/content/text/documents/articles/notes/2026/08/01/2026-08-01-note-on-the-content-addressed-glass-sponge-semantic-compute-complex.md), section 24, item 4).

All four MetroPlat documents were reclassified historical on 2026-09-18: they record earlier thinking and impose no implementation obligation, and the checker for the set has been retired. No current set of these documents is held for the fabrication line ([recovery index](../../../../../fabrication-science-services-section/content/text/documents/articles/notes/2026/10/09/2026-10-09-note-recovering-the-fabrication-research.md), section 4 and section 7, step 7).

See also: [SRS](software-requirements-specification.md), [glass sponge](../../../../../../../../../engineering-services-section/content/text/glossary/terms/glass-sponge.md).
