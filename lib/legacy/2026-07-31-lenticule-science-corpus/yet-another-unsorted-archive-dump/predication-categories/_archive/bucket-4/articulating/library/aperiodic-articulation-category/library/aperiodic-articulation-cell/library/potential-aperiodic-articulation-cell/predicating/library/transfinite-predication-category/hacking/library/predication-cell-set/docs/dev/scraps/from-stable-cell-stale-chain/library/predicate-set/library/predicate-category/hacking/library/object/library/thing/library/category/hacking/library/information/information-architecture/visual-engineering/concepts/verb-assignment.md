---
  type: concept
  class: parameterized-discipline
  parameters: [marks, verb-binding, default-mark]
  realizes: [glance-direction, orientation-before-interpretation]
  see-also: [closed-palette, register-set, salience-scarcity]
  instantiated-by:
    - "theories/five-six-one-design-bible/concepts/hazard-evidence-pair.md"
    - "theories/emsenn-visual-language/concepts/verb-as-color.md"
  ---

  # Verb assignment

  A visual language uses *verb assignment* when each member of a small set of marks (colors, weights, devices) is bound to a verb — what it does — rather than to a feeling or a mood. A reader who learns the assignment can predict what the mark means in any context.

  ## Pattern

  The kit lists each load-bearing mark and assigns it a verb: *this mark warns; that mark cites; the third mark emphasizes*. The assignment is total inside the kit's domain: a mark assigned a verb is never used decoratively, and a verb that needs a mark is never expressed by an unassigned one. A mark with no verb is the kit's structural ground.

  ## Parameters

  - **`marks`** — the enumerated marks under verb assignment. Typically the kit's jewel colors, but may also include weights, rules, or devices.
  - **`verb-binding`** — the table mapping each mark to its verb. Each verb appears at most once.
  - **`default-mark`** — the mark that carries no verb; the kit's structural ground (typically the ink and the paper).

  ## Conformance shape

  For each verb-bearing mark in the artifact, *check that the span it occupies performs the verb the mark is bound to*. A red span that does not warn is a defect; a blue span that does not cite is a defect. The check is by reading: read each marked span and ask "does this span do the verb?"

  ## Lineage

  Verb assignment is the visual analogue of giving a function a name and a single responsibility. It supports [glance direction](../terms/glance-direction.md): a reader who has learned the assignment can navigate the artifact without reading prose — they can see, at a glance, where the warnings are, where the citations are, where the argument is being emphasized. It supports [orientation before interpretation](../terms/orientation-before-interpretation.md) by making the artifact's structure visible before its content is read.

  ## Instances in the corpus

  - The [561 hazard-evidence pair](theories/five-six-one-design-bible/concepts/hazard-evidence-pair.md) instantiates verb-assignment with `marks = {alarm-red, witness-blue}`, `verb-binding = {alarm-red ↦ warns, witness-blue ↦ cites}`, and `default-mark = ink`.
  - The [emsenn verb-as-color](theories/emsenn-visual-language/concepts/verb-as-color.md) instantiates verb-assignment with `marks = {oxblood, teal, indigo}`, `verb-binding = {oxblood ↦ emphasizes, teal ↦ signals, indigo ↦ cites}`, and `default-mark = ink`.
  