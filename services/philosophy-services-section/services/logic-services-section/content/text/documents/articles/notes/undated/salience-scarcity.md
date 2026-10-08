---
title: Salience scarcity
description: A visual language uses salience scarcity when the most attentionally weighty marks are the rarest.
---
---
  type: concept
  class: parameterized-discipline
  parameters: [scarce-marks, quota-form, quota-value]
  realizes: [felt-weight, glance-direction]
  see-also: [closed-palette, verb-assignment, refusal-list]
  instantiated-by:
    - "theories/five-six-one-design-bible/concepts/color-budget.md"
    - "theories/emsenn-visual-language/concepts/closed-set.md"
    - "theories/emsenn-visual-language/theorems/one-jewel-per-artifact.md"
  ---

  # Salience scarcity

  A visual language uses *salience scarcity* when the most attentionally weighty marks are the rarest. Salience is a function of contrast against the rest of the artifact; rarity sustains contrast. The kit states the scarcity as a quota: either a maximum coverage (percentage of inked area) or a maximum count (instances per artifact).

  ## Pattern

  For each mark the kit identifies as high-salience, the kit names a quota the artifact must not exceed. The quota is checkable at proof time. A mark used outside its quota loses its salience and is therefore the wrong tool for the job — the discipline protects the mark from itself.

  ## Parameters

  - **`scarce-marks`** — the enumerated marks under quota. Typically the kit's jewel colors and any large-scale display elements.
  - **`quota-form`** — `coverage` (percentage of artifact area) or `count` (instances per artifact).
  - **`quota-value`** — the numeric quota, per mark.

  ## Conformance shape

  For `quota-form = coverage`: sum the bounding boxes of each scarce mark, divide by the artifact's trim area, and verify the ratio does not exceed the quota.

  For `quota-form = count`: count each scarce mark's instances and verify the count does not exceed the quota.

  The check must be runnable by a person at the layout table without specialized tooling — a calculator, a ruler, or a glance is the maximum tooling permitted.

  ## Lineage

  Salience scarcity is the discipline that operationalizes [felt weight](../../../../../../../../../engineering-science-services-section/services/design-engineering-science-services-section/services/visual-engineering-services-section/content/text/glossary/terms/felt-weight.md): a mark carries weight precisely because it is rare. It also supports [glance direction](../../research/2026/07/31/lenticule-import/yet-another-unsorted-archive-dump/predication-categories/_archive/bucket-4/articulating/library/aperiodic-articulation-category/library/aperiodic-articulation-cell/library/potential-aperiodic-articulation-cell/predicating/library/transfinite-predication-category/hacking/library/predication-cell-set/docs/dev/scraps/from-stable-cell-stale-chain/library/predicate-set/library/predicate-category/hacking/library/object/library/thing/library/category/hacking/library/information/information-architecture/visual-engineering/terms/glance-direction.md) by making each scarce mark a confident waypoint for a reader's eye. Without scarcity, the marks compete and the reader's attention scatters.

  The lineage runs through Tuftean small-multiples honesty (no decorative inflation) and constructivist agitprop (every red on the page is a load-bearing red).

  ## Instances in the corpus

  - The [561 color budget](../../../../../../../../../../../561-group-services-section/services/561-group-content-design-services-section/content/text/glossary/terms/color-budget.md) instantiates salience-scarcity with `scarce-marks = {alarm-red, witness-blue}`, `quota-form = coverage`, `quota-value = {alarm-red ↦ 6%, witness-blue ↦ 3%}`.
  - The [emsenn one-jewel-per-artifact theorem](../../research/2026/07/31/lenticule-import/yet-another-unsorted-archive-dump/predication-categories/_archive/bucket-4/articulating/library/aperiodic-articulation-category/library/aperiodic-articulation-cell/library/potential-aperiodic-articulation-cell/predicating/library/transfinite-predication-category/hacking/library/predication-cell-set/docs/dev/scraps/from-stable-cell-stale-chain/library/predicate-set/library/predicate-category/hacking/library/object/library/thing/library/category/hacking/library/information/information-architecture/visual-engineering/concepts/theories/emsenn-visual-language/theorems/one-jewel-per-artifact.md) instantiates salience-scarcity with `scarce-marks = {oxblood, teal, indigo}`, `quota-form = count`, `quota-value = 1 jewel total per artifact`.
  