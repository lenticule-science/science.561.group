---
title: Register set
description: A visual language uses a register set when its imagery, voice, or treatment is partitioned into a small set of named registers, each with its own discipline.
---
---
  type: concept
  class: parameterized-discipline
  parameters: [registers, partition-rule, treatment-per-register]
  realizes: [glance-direction, premature-closure]
  see-also: [verb-assignment, refusal-list]
  instantiated-by:
    - "theories/five-six-one-design-bible/concepts/two-registers.md"
    - "theories/emsenn-visual-language/concepts/verb-as-color.md"
  ---

  # Register set

  A visual language uses a *register set* when its imagery, voice, or treatment is partitioned into a small set of named registers, each with its own discipline. Each artifact element belongs to exactly one register; the kit specifies the discipline (typography, color, treatment) per register.

  ## Pattern

  The kit names a small set of registers — typically two or three — and assigns each register a domain (e.g. "human imagery vs. documentary imagery", or "exposition vs. citation vs. emphasis"). Each register has its own typographic, chromatic, or compositional treatment. Mixing registers within a single element is forbidden.

  ## Parameters

  - **`registers`** — the enumerated registers.
  - **`partition-rule`** — the rule for assigning an element to a register; should be unambiguous.
  - **`treatment-per-register`** — the per-register specification of family, color, weight, position, or other treatment.

  ## Conformance shape

  For each artifact element under register discipline, identify which register it belongs to and verify its treatment matches `treatment-per-register[register]`. An element belonging to two registers, or to none, is a defect.

  ## Lineage

  Register sets are the visual analogue of editorial style discipline: a paper may have a "news voice" and an "editorial voice" with different conventions; a kit may have a "human register" and a "documentary register" with different treatments. The discipline supports [glance direction](../../research/2026/07/31/lenticule-import/yet-another-unsorted-archive-dump/predication-categories/_archive/bucket-4/articulating/library/aperiodic-articulation-category/library/aperiodic-articulation-cell/library/potential-aperiodic-articulation-cell/predicating/library/transfinite-predication-category/hacking/library/predication-cell-set/docs/dev/scraps/from-stable-cell-stale-chain/library/predicate-set/library/predicate-category/hacking/library/object/library/thing/library/category/hacking/library/information/information-architecture/visual-engineering/terms/glance-direction.md) by making the artifact's argumentative structure visible without reading, and [premature closure](../../../../../../../../../engineering-science-services-section/services/design-engineering-science-services-section/services/visual-engineering-services-section/content/text/glossary/terms/premature-closure.md) by preventing the artifact from collapsing distinct argumentative moves into one undifferentiated visual treatment.

  ## Instances in the corpus

  - The [561 two registers](../../../../../../../../../../../561-group-services-section/services/561-group-content-design-services-section/content/text/glossary/terms/two-registers.md) instantiates register-set with `registers = {human, documentary}`, `partition-rule = "people are human; evidence is documentary"`, `treatment-per-register = {human ↦ commissioned artwork, documentary ↦ photography-as-evidence}`.
  - The [emsenn verb-as-color](../../research/2026/07/31/lenticule-import/yet-another-unsorted-archive-dump/predication-categories/_archive/bucket-4/articulating/library/aperiodic-articulation-category/library/aperiodic-articulation-cell/library/potential-aperiodic-articulation-cell/predicating/library/transfinite-predication-category/hacking/library/predication-cell-set/docs/dev/scraps/from-stable-cell-stale-chain/library/predicate-set/library/predicate-category/hacking/library/object/library/thing/library/category/hacking/library/information/information-architecture/visual-engineering/concepts/theories/emsenn-visual-language/concepts/verb-as-color.md) instantiates register-set with `registers = {emphasize, signal, cite}`, `partition-rule = "what does this span do?"`, `treatment-per-register = {emphasize ↦ oxblood, signal ↦ teal, cite ↦ indigo}`.
  