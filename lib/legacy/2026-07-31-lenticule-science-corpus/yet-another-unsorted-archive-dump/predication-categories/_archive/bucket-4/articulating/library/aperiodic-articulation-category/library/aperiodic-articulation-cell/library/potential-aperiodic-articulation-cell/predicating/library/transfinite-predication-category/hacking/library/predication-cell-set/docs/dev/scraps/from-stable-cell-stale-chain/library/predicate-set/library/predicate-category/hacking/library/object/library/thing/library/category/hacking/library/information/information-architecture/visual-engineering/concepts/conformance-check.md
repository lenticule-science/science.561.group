---
  type: concept
  class: parameterized-discipline
  parameters: [checks, runnable-by, when-run]
  realizes: [orientation-before-interpretation, memetic-repeatability]
  see-also: [refusal-list, earned-addition]
  instantiated-by:
    - "theories/five-six-one-design-bible/theorems/_index.md"
    - "theories/emsenn-visual-language/theorems/_index.md"
  ---

  # Conformance check

  A visual language uses *conformance checks* when every constraint it states carries a procedure that can be run on a candidate artifact to decide pass or fail. A constraint without a check is a hedge.

  ## Pattern

  For each constraint the kit makes — a closed palette, a verb assignment, a quota, a refusal — the kit specifies the check that decides conformance. The check states what to measure or look at, what tool is required (often none), and what threshold separates pass from fail. Checks are written so that two contributors running them on the same artifact reach the same verdict.

  ## Parameters

  - **`checks`** — the enumerated checks the kit ships. Typically one per theorem and one per refusal.
  - **`runnable-by`** — who can run the check. Typical values: `a layout artist`, `an editor`, `a printer`, `a build script`.
  - **`when-run`** — at what point in the artifact's life the check is run. Typical values: `at proof time`, `at composition`, `at publishing`.

  ## Conformance shape

  The conformance-check concept is itself the *meta-check*: for each constraint in the kit, verify the constraint declares a check, the check is reproducible across contributors, and the check is run before publishing.

  ## Lineage

  The discipline derives from engineering practice broadly — a constraint without a test is unenforceable. In visual languages it derives from working print traditions where the printer's proofing procedure is the artifact's last gate. The discipline supports [orientation before interpretation](../terms/orientation-before-interpretation.md) by giving the kit's contributors a shared method for deciding when an artifact orients its reader correctly, and [memetic repeatability](../terms/memetic-repeatability.md) by guaranteeing that conformance is reproducible across contributors and across kits.

  ## Instances in the corpus

  - The [561 theorems register](theories/five-six-one-design-bible/theorems/_index.md) instantiates conformance-check by structuring every theorem as refusal + check, with the check runnable by a layout artist or editor at proof time.
  - The [emsenn theorems register](theories/emsenn-visual-language/theorems/_index.md) instantiates conformance-check with checks runnable by a layout artist, an editor, or a build script (since the kit's source is text).
  