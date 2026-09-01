---
  type: concept
  class: parameterized-discipline
  parameters: [refusals, check-shape, attractor-of-each]
  realizes: [orientation-before-interpretation, premature-closure]
  see-also: [conformance-check, closed-palette, verb-assignment]
  instantiated-by:
    - "theories/five-six-one-design-bible/concepts/refusal-as-design-method.md"
    - "theories/emsenn-visual-language/theorems/closed-palette.md"
    - "theories/emsenn-visual-language/theorems/contrast-aaa.md"
  ---

  # Refusal list

  A visual language uses a *refusal list* when refusal is a load-bearing operator: the kit names a list of things it will not do, each refusal carrying a falsifiable check that decides whether the artifact has drifted into the refused shape.

  ## Pattern

  The kit identifies the visual attractors that pull artifacts away from its discipline — the registers it could collapse into, the conventions it could absorb, the shortcuts it could take. For each attractor, the kit writes a refusal: a name, the shape being refused, the reason the kit refuses it, and the check that decides whether an artifact has drifted into it.

  ## Parameters

  - **`refusals`** — the enumerated refusals. Typically named with a leading "no-": `no-philanthropic-language`, `no-third-party-on-web`, `no-decorative-color`.
  - **`check-shape`** — the form a refusal's check takes. Typical shapes: a visual comparison ("does this read as X?"), a numerical bound ("does any color exceed N coverage?"), a structural test ("is there a mark in the clearspace?").
  - **`attractor-of-each`** — for each refusal, the visual or rhetorical attractor it protects against.

  ## Conformance shape

  The refusal list is itself a [conformance check](conformance-check.md): for each refusal, run its check on the artifact and verify the artifact does not match the refused shape. A failed refusal is a defect that blocks publishing.

  ## Lineage

  Refusal as a load-bearing operator derives from negative-space disciplines (Loos, Tufte) and from political-typography traditions where the kit's discipline is partly defined by what the kit will *not* set. The discipline supports [orientation before interpretation](../terms/orientation-before-interpretation.md) by guaranteeing the artifact will not present a shape that misorients the reader, and [premature closure](../terms/premature-closure.md) by preventing the artifact from collapsing into the wrong familiar register.

  ## Instances in the corpus

  - The [561 refusal-as-design-method](theories/five-six-one-design-bible/concepts/refusal-as-design-method.md) instantiates refusal-list with seven named refusals (the § 09 list), each with its check, plus the load-bearing tests carried in earlier sections.
  - The [emsenn closed-palette theorem](theories/emsenn-visual-language/theorems/closed-palette.md) and [contrast-aaa theorem](theories/emsenn-visual-language/theorems/contrast-aaa.md) are members of the kit's refusal list, with checks stated as resource-graph traversals.
  