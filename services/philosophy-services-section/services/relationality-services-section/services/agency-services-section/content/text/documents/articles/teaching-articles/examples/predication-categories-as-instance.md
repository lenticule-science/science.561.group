---
type: example
class: gold-standard-instance
status: settled
instantiates:
  - ../objects/validation-rule.md
  - ../objects/fars-lint-as-closure-operator.md
  - ../objects/typed-note-as-predication-cell.md
  - ../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/concepts/closure-rule-system.md
depends-on:
  - ../_index.md
see-also:
  - predicated-computing-as-instance.md
  - ../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/_index.md
title: Predication-categories as instance
description: The predication-categories theory is one of two gold-standard precedents the curation theory takes itself to be generalizing from.
---

# Predication-categories as instance

The [predication-categories](../../research/2026/07/31/lenticule-import/animating/content/humanities/theories/math/theories/categories/theories/predication-categories) theory is one of two gold-standard precedents the curation theory takes itself to be generalizing from. Read in this theory's vocabulary, predication-categories *is an instance* of the discipline: a fully-developed corpus that already carries the [typed-note-as-predication-cell](../../research/2026/07/31/lenticule-import/animating/content/becoming/doing/working/governing/knowing/content/knowledge-science/systems/objects/typed-note-as-predication-cell.md) commitment, the [closure-rule-system](../../research/2026/07/31/lenticule-import/animating/content/humanities/theories/math/theories/categories/theories/predication-categories/concepts/closure-rule-system.md) commitment, and the [FARS lint as closure operator](../../research/2026/07/31/lenticule-import/animating/content/becoming/doing/working/governing/knowing/content/knowledge-science/systems/objects/fars-lint-as-closure-operator.md) commitment, with one additional move (the bilattice) that the curation theory extracts as the generalizable shape.

## What predication-categories already does

Inspecting the predication-categories theory directly:

- **Typed notes.** The theory's `concepts/`, `objects/`, `morphisms/`, `theorems/`, `examples/`, `questions/`, `references/`, and `narratives/` are populated with notes that conform to the per-type spec the curation theory generalises. Each note's frontmatter carries `type:`, the load-bearing `depends-on:` edges, and the appropriate type-specific fields (`realizes:` from definitions to concepts, `instantiates:` from examples to objects, `defines:` from concepts to definitions).
- **Validation rules.** The theory commits to acyclicity of the substantive subgraph (its `depends-on:` chains are DAG-shaped), to edge-resolution (every relative-path reference resolves on disk), and to type-edge well-typedness. These are the same rules the curation theory's closure-rule-system (inherited from [predication-categories' closure-rule-system](../../research/2026/07/31/lenticule-import/animating/content/humanities/theories/math/theories/categories/theories/predication-categories/concepts/closure-rule-system.md)) commits to in general.
- **FARS lint operator.** The predication-categories theory was authored under, and is verified by, the same FARS lint operator the curation theory formalises as [fars-lint-as-closure-operator](../../research/2026/07/31/lenticule-import/animating/content/becoming/doing/working/governing/knowing/content/knowledge-science/systems/objects/fars-lint-as-closure-operator.md). The theory's status as defect-free is what the operator's fixed-point property witnesses.

## What predication-categories adds

Predication-categories adds *one* substantive move beyond what the curation theory itself commits to: it reads each note as a predication cell $(s, p, o, v)$ over the bilattice (see the [predication-categories `_index.md`](../../research/2026/07/31/lenticule-import/animating/content/humanities/theories/math/theories/categories/theories/predication-categories/_index.md) for the bilattice machinery), with the predicate $p$ fixed by the note's type and the bilattice valuation $v$ recovered from the note's body. This is the move that turns "the discipline as a checkable rule system" into "the discipline as a predication-categorical structure with a sound logical interpretation."

The curation theory deliberately *abstracts away* this extra move: the [predicated markdown-vault knowledge system](../../research/2026/07/31/lenticule-import/animating/content/becoming/doing/working/governing/knowing/content/knowledge-science/systems/_index.md) commits to typed-note discipline plus the closure-rule-system, and notes that the bilattice valuation is *one possible specialisation* (the predication-categorical one) but not the only one. A vault that treats its typed notes as predication cells is a *predicated* vault in the predication-categories sense; a vault that treats them only as discipline-conformant typed notes is the more general object the curation theory studies.

