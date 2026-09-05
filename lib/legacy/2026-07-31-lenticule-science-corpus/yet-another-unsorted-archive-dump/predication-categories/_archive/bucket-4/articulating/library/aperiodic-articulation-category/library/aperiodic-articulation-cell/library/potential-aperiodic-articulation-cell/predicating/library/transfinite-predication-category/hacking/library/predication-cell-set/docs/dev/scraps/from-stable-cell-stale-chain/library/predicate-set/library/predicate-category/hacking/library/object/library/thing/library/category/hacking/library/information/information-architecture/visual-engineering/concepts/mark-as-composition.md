---
  type: concept
  class: parameterized-discipline
  parameters: [primitives, mark-form, lockup-rules]
  realizes: [memetic-repeatability, peripheral-uptake]
  see-also: [type-role-discipline, closed-palette]
  instantiated-by:
    - "theories/five-six-one-design-bible/concepts/mark-as-numeral.md"
    - "theories/emsenn-visual-language/objects/wordmark.md"
  ---

  # Mark as composition

  A visual language uses *mark-as-composition* when the identifying mark is composed from primitives the language already uses — type, rule, color — rather than drawn as a separate object that the language must additionally maintain.

  ## Pattern

  The kit's mark is set from one of the kit's type families at one of the kit's permitted weights, optionally with one of the kit's permitted devices (a rule, a beam) as accompaniment. The mark is reproducible without specialized tooling: a contributor with the kit's resources can set the mark from scratch.

  ## Parameters

  - **`primitives`** — the kit primitives the mark uses (typically a type family + weight, optionally a rule or beam).
  - **`mark-form`** — the rule for forming the mark (e.g. "the lowercase wordmark in Plex Sans 600", "the numeral 561 in Space Grotesk 700").
  - **`lockup-rules`** — the permitted lockups (vertical, inline, foot) and the clearspace rule.

  ## Conformance shape

  For each instance of the mark, verify it is set from `primitives` according to `mark-form`, that the lockup is one of `lockup-rules`, and that the clearspace is honored.

  ## Lineage

  The discipline derives from working print traditions where the printer set marks from existing type rather than commissioning custom plates, and from modernist identity programs that rejected the "bespoke logo" model. It supports [memetic repeatability](../terms/memetic-repeatability.md) by guaranteeing the mark survives any reproduction surface the kit's type survives, and [peripheral uptake](../terms/peripheral-uptake.md) by making the mark visually continuous with the kit's other typography.

  ## Instances in the corpus

  - The [561 mark-as-numeral](theories/five-six-one-design-bible/concepts/mark-as-numeral.md) instantiates mark-as-composition with `primitives = {Space Grotesk 700, bracket rule}`, `mark-form = "the numeral 561 with one bracket rule above"`, three lockups + H-cap-height clearspace.
  - The [emsenn wordmark](theories/emsenn-visual-language/objects/wordmark.md) instantiates mark-as-composition with `primitives = {Plex Sans 600, hairline rule}`, `mark-form = "the lowercase word emsenn with one underline rule"`, two lockups + half-x-height clearspace.
  