---
identity: cognitive-eroei
name: Cognitive EROEI
aliases:
  - cognitive energy return on energy invested
description: A proposed, explicitly bounded account of whether costly inference leaves more future usable cognition than it consumes; it borrows EROEI's net-return question without inheriting physical-energy units or results.
relations:
  derives-from:
    - energy-return-on-investment
date-created: 2026-09-07
provenance:
  sources:
    - lib/emsenn/services/561-group/services/engineering-services-section/content/text/documents/articles/notes/2026/08/01/2026-08-01-note-on-the-content-addressed-glass-sponge-semantic-compute-complex.md#19-cognitive-eroei-and-metabolic-criticality
    - lib/emsenn/services/561-group/services/science-services-section/services/social-science-services-section/services/economics-and-business-science-services-section/services/economics-science-services-section/content/text/glossary/terms/energy-return-on-investment.md
    - lib/emsenn/services/561-group/services/science-services-section/services/information-science-services-section/services/math-services-section/services/obsmetrological-services-section/lib/obsmetrologia/Obsmetrologia/Cohomology/AttentionAllocation.lean
---

Cognitive EROEI is a proposed account of whether a bounded inference process
creates more future usable cognition than it consumes. It takes its net-return
question from [energy return on investment](./energy-return-on-investment.md),
whose **derives-from** relation states the source model, while keeping the
physical account separate.

It is not physical EROEI. A cognitive account has no value until it declares an
inference-cost unit, yield unit, time horizon, accounting boundary, and
validation path. The source architecture note states the same limit: expensive
inference must create future usable cognition, while the expected yield of
clearing an obstruction must exceed the cost of discovering and repairing it.
Neither statement supplies a joule conversion, a hardware benchmark, or an
allocation policy.

The existing formal support is narrower and useful: `AttentionAllocation.lean`
models a finite budget, obstruction costs and benefits, monotonically consumed
spend, downward-closed feasibility, and residual benefit. Those theorems prove
properties of that abstract selection model. They do not prove that an
inference run has positive cognitive EROEI, nor do they identify persistent or
ephemeral compute as an economic class. A future allocator may use this term
only after its measurements make that distinction explicit and auditable.
