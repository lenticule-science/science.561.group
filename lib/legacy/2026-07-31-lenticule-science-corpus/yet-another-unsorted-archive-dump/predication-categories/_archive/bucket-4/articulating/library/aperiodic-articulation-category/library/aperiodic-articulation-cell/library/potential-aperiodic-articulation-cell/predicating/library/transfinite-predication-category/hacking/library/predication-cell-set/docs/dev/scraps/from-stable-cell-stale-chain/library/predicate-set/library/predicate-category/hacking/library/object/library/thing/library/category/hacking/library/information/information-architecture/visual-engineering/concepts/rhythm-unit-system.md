---
  type: concept
  class: parameterized-discipline
  parameters: [base-unit, scale-steps, baseline-grid]
  realizes: [felt-weight, peripheral-uptake]
  see-also: [type-role-discipline, closed-geometry-set]
  instantiated-by:
    - "theories/five-six-one-design-bible/concepts/baseline-grid.md"
    - "theories/emsenn-visual-language/objects/spacing-scale.md"
  ---

  # Rhythm unit system

  A visual language uses a *rhythm unit system* when every spatial measurement in the artifact — margins, gutters, padding, spacing between elements, line-height — derives from a single base unit. The artifact has rhythm because the unit is shared; a reader's eye finds repetition without being told to look for it.

  ## Pattern

  The kit names one base unit (typically a small pixel or point measurement that is also the basis of the type's leading). All other spacing values are stated as integer multiples or named fractional steps of the base. Arbitrary spacing values that do not derive from the base are forbidden.

  ## Parameters

  - **`base-unit`** — the single base measurement. Typical values: 8 px (screen), 12 pt (print), the body type's leading.
  - **`scale-steps`** — the enumerated multipliers permitted (e.g. 1, 2, 3, 4, 6, 8, 12, 16).
  - **`baseline-grid`** — whether text-bearing matter snaps to a baseline grid derived from the base unit, and which kinds of matter are exempt (typically photographs are exempt; captions are not).

  ## Conformance shape

  For each spacing measurement in the artifact, verify it is a member of `scale-steps` (multiplied by `base-unit`). For each text run, verify its baseline aligns to the grid (where the rule applies).

  ## Lineage

  The lineage runs through Swiss modernist typography (Müller-Brockmann's grid systems, Ruder's typographie) and the typesetting tradition that derives every measurement from the body's leading. The discipline supports [felt weight](../terms/felt-weight.md) by giving the artifact a coherent rhythm at the structural level, and [peripheral uptake](../terms/peripheral-uptake.md) by making the artifact's spatial structure recognizable in the periphery.

  ## Instances in the corpus

  - The [561 baseline grid](theories/five-six-one-design-bible/concepts/baseline-grid.md) instantiates rhythm-unit-system with `base-unit = body leading`, `scale-steps = integer multiples`, `baseline-grid = true (photographs exempt; captions snap)`.
  - The [emsenn spacing scale](theories/emsenn-visual-language/objects/spacing-scale.md) instantiates rhythm-unit-system with `base-unit = 8 px`, `scale-steps = {0.5, 1, 1.5, 2, 3, 4, 6, 8}`, `baseline-grid = optional per density mode`.
  