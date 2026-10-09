---
type: definition
class: substrate-realization
status: settled
depends-on:
  - teaching/explanations/note.md
  - teaching/explanations/note-type.md
  - teaching/explanations/frontmatter-relation.md
  - ../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/concepts/predication-cell.md
  - ../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/predication-fibration.md
  - ../../../../predicated-knowledge-systems/objects/predicated-knowledge-system.md
realizes:
  - teaching/explanations/note.md
see-also:
  - relation-graph.md
name: Typed note as predication cell
description: The formal identification of a typed note with a predication-cell on the substrate.
---


The formal identification of a typed [note](../../documents/articles/research/2026/07/31/lenticule-import/animating/content/becoming/doing/working/governing/knowing/content/knowledge-science/systems/archive/teaching/explanations/note.md) with a [predication-cell](../../documents/articles/research/2026/07/31/lenticule-import/animating/content/humanities/theories/math/theories/categories/theories/predication-categories/concepts/predication-cell.md) on the substrate. Under this identification a markdown-vault knowledge system is a [predicated knowledge system](../../documents/articles/research/2026/07/31/lenticule-import/animating/content/becoming/doing/working/governing/knowing/predicated-knowledge-systems/objects/predicated-knowledge-system.md) whose substrate entities are file-system paths and whose predicate vocabulary is the established frontmatter-relation set.

## Definition

Let $N$ be the set of typed notes in a vault. For each note $n \in N$ with [slug](../../documents/articles/research/2026/07/31/lenticule-import/animating/content/becoming/doing/working/governing/knowing/content/knowledge-science/systems/archive/teaching/explanations/slug.md) $\sigma(n)$, [note-type](../../documents/articles/research/2026/07/31/lenticule-import/animating/content/becoming/doing/working/governing/knowing/content/knowledge-science/systems/archive/teaching/explanations/note-type.md) $\tau(n) \in T$, and frontmatter-relation participation $R(n) = \{(p_i, t_i)\}_i$ (relation key $p_i$, target slug $t_i$), the **typed-note-as-predication-cell** at $n$ is the family of cells:

$$\big\{\, (\sigma(n), p_i, \sigma(t_i)) \,:\, (p_i, t_i) \in R(n) \,\big\} \;\cup\; \big\{\, (\sigma(n), \mathrm{type}, \tau(n)) \,\big\}$$

valued in the bilattice $\mathbf{2} \otimes \mathbf{2}$ at $(\mathbf{1}, \mathbf{0}) = t$ for each declared cell, with the note's `status:` field grading the valuation toward $\bot$ (`pending`), $t$ (`settled`), or partial states for `sketch` / `draft`.

The fibration over the predicate category — whose objects are the established frontmatter-relations and whose morphisms are the typing rules between them — has fibers indexed by `(subject-slug, predicate-key)` and values in the bilattice. The vault's [relation-graph](../../documents/articles/research/2026/07/31/lenticule-import/animating/content/becoming/doing/working/governing/knowing/content/knowledge-science/systems/archive/relation-graph.md) is the substrate's [predication-fibration](../../documents/articles/research/2026/07/31/lenticule-import/animating/content/humanities/theories/math/theories/categories/theories/predication-categories/objects/predication-fibration.md) restricted to the frontmatter-relation predicate vocabulary.

## Required correspondences

The identification commits to four correspondences:

1. **Note ↔ entity.** A note's slug is the entity's identity at the substrate; two notes with the same slug in the same directory are one entity (filesystem prevents the conflict); two notes with the same slug in different directories are two entities that the substrate's [identity-by-relations](../../documents/articles/research/2026/07/31/lenticule-import/animating/content/engineering/theories/tech/theories/computing/theories/predicated-computing/concepts/identity-by-relations.md) discipline may identify as one if their relation participation aligns (the corpus's slug-collision resolution).
2. **Frontmatter-key ↔ predicate.** A frontmatter relation key (`depends-on`, `realizes`, `see-also`, ...) is a predicate in the substrate's predicate category. The typing rules on relation endpoints (`realizes:` requires concept target, etc.) are typing rules on the predicate category's morphisms.
3. **Status ↔ bilattice value.** A note's `status:` field grades the cell's valuation: `settled` ↔ $t$ on the positive channel; `sketch` ↔ partial positive; `pending` ↔ $\bot$; `draft` ↔ asserted-but-unwitnessed (positive channel valued, witness-edge to a reference still missing).
4. **Validation defect ↔ closure-rule failure.** A defect surfaced by the corpus's validation pass (dangling target, type-mismatched edge, cycle in `depends-on`) is the failure of a closure rule on the predicate category. The validation pass is the substrate's [closure-driven settling](../../documents/articles/research/2026/07/31/lenticule-import/animating/content/humanities/theories/math/theories/categories/theories/predication-categories/objects/predication-settling.md) restricted to the markdown-vault substrate's relation predicates.

## Invariants

- **One cell per (slug, predicate-key, target).** No duplicate edges. The renderer collapses duplicates; the substrate counts them once.
- **Edge-type-conformance.** Every cell satisfies the predicate-category's typing rules. Violations are defects, not silent acceptances.
- **Status-monotonicity.** A note's `status:` advances along the chain `pending → sketch → draft → settled` under explicit edits; it does not regress without a captain decision recorded as a curation note.

