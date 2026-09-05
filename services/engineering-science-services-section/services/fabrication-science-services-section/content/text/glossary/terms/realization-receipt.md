---
description: The record binding a fabricated thing's evidence, one item per projection and acceptance obligation, to the digest of the admitted work order it realized.
identity: realization-receipt
name: Realization receipt
provenance:
  date-created: 2026-09-04
  authors:
    - emsenn
    - claude-fable-5-1
  sources:
    - /home/emsenn/info/lib/emsenn/services/561-group/services/engineering-services-section/services/fabrication-services-section/services/computer-fabrication-services-section/services/computer-code-fabrication-services-section/services/artifact-fabrication-specification-admission-service/README.md
    - /home/emsenn/info/lib/emsenn/services/561-group/services/science-services-section/services/engineering-science-services-section/services/fabrication-science-services-section/content/text/glossary/topics/requirements-to-specification.md
---
A realization receipt is the record that binds a fabricated thing's evidence to the exact admitted work order it realized: the specification digest, one piece of evidence per projection and per acceptance obligation, and the trace from each settled clause to that evidence. In the Group's code the artifact fabrication specification admission service admits it, refusing unknown or missing projection and obligation identifiers.

A realization receipt differs from a realization plan, which covers the same projection and obligation identifiers before any effect and carries no evidence, and from a witness row in a world trace, which records that an act occurred without binding it to an admitted order. A changed artifact does not inherit an earlier receipt merely because it keeps a filename or title, because the receipt is bound to digests and not to names.
