---
  type: concept
  class: parameterized-discipline
  parameters: [color-set, ground-distinguished, opacity-rule]
  realizes: [felt-weight, peripheral-uptake]
  see-also: [salience-scarcity, verb-assignment, refusal-list]
  instantiated-by:
    - "theories/five-six-one-design-bible/concepts/color-budget.md"
    - "theories/emsenn-visual-language/concepts/closed-set.md"
    - "theories/emsenn-visual-language/objects/color-palette.md"
  ---

  # Closed palette

  A visual language has a *closed palette* when its color is an enumerated finite set, fixed at the time of the kit, with no value outside the set permitted in any artifact. The palette is closed in the strict sense: not "prefer these," not "use these as a starting point," but *only these*.

  ## Pattern

  The kit names every color it permits. Each color is a named resource with a single value. References to color anywhere in the kit's artifacts cite the resource by name. A color value that does not match any resource is a defect.

  ## Parameters

  - **`color-set`** — the enumerated colors. Typically two structural colors (a ground and an ink) plus a small set of one to three functional or "jewel" colors.
  - **`ground-distinguished`** — whether the ground (paper, page, surface) is itself a member of the palette and named, or whether it is treated as outside the palette.
  - **`opacity-rule`** — whether intermediate opacities of a palette color are permitted, and if so, at what enumerated steps.

  ## Conformance shape

  A conformance check for a closed palette has the form: *enumerate every color value used in the artifact; verify each is a member of the palette set, at a permitted opacity step.* The check can be performed by inspection (small artifacts) or by tooling (any artifact whose source is text).

  ## Lineage

  Closed palettes are the visual analogue of Tuftean information design's commitment to the data-ink ratio: every mark on the page must justify its presence. A closed palette enforces this by removing the option of unmarked decorative color. The lineage also runs through brutalist material discipline: a small number of declared materials, exposed and unfinished. The methodological frame is in [visual-engineering-practices](../texts/visual-engineering-practices.md).

  The discipline supports [felt weight](../terms/felt-weight.md): when the palette is small, each color carries the structural weight assigned to it; expanding the palette dilutes the weight of every member. It supports [peripheral uptake](../terms/peripheral-uptake.md) for the same reason: a reader's peripheral vision can recognize a small palette across a glance, but cannot recognize an open one.

  ## Instances in the corpus

  - The [561 color budget](theories/five-six-one-design-bible/concepts/color-budget.md) instantiates closed-palette with `color-set = {ink, bone, alarm-red, witness-blue}`, `ground-distinguished = bone`, and an additional [salience-scarcity](salience-scarcity.md) layer (the budget percentages).
  - The [emsenn closed set](theories/emsenn-visual-language/concepts/closed-set.md) and [color palette](theories/emsenn-visual-language/objects/color-palette.md) instantiate closed-palette with `color-set = {paper, paper-deep, ink, ink-soft, oxblood, teal, indigo}`, `ground-distinguished = paper`, and a per-artifact [salience-scarcity](salience-scarcity.md) layer (one jewel per artifact).
  