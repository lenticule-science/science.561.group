---
description: The pre-effect decision that a candidate work order carries enough settled information and named authority to attempt, distinct from the receiver's later acceptance of what was made.
identity: admission
name: Admission
provenance:
  date-created: 2026-09-04
  authors:
    - emsenn
    - claude-fable-5-1
  sources:
    - /home/emsenn/info/lib/emsenn/services/561-group/services/science-services-section/services/engineering-science-services-section/services/fabrication-science-services-section/content/text/glossary/topics/specification-fabrication.md
    - /home/emsenn/info/lib/emsenn/services/561-group/services/engineering-services-section/services/fabrication-services-section/services/computer-fabrication-services-section/services/computer-code-fabrication-services-section/services/artifact-fabrication-specification-admission-service/README.md
---
Admission is the decision that a candidate work order has enough named authority and settled information for a particular fabrication scope, so that an attempt to realize it may begin. In the Group's code it is a pure function over the candidate: the artifact fabrication specification admission service returns an admitted specification with a digest or a typed refusal, and performs no filesystem, network, clock, or process I/O.

Admission is not acceptance: it authorizes an attempt, it is made before any effect, and it refuses a candidate that carries a blocking open question, while acceptance is a receiver's decision made after the evidence exists. A fabricator must not begin an effect on a work order that has not been admitted, and an admission cannot be upgraded into acceptance by the fabricator's own successful run.
