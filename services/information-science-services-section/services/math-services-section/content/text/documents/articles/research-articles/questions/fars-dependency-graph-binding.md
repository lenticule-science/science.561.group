---
type: question
class: external
status: open
explores: [dependency-soundness-iff-dag, dag, directed-graph]
depends-on: [dependency-soundness-iff-dag, dag]
---

# FARS dependency-graph binding

How should the FARS toolkit's `depends-on:` graph machinery be *typed against* this directory's [dag](../../../../glossary/terms/dag.md) object and [dependency-soundness-iff-dag](../dependency-soundness-iff-dag.md) theorem? The toolkit currently treats `depends-on:` as an ad-hoc adjacency list — the soundness check is implemented but the implementation does not cite the theorem that justifies it. The question is what the typed binding should look like.

## Decomposition

- **Sub-question A.** Should the toolkit's `depends-on:` graph be a *Lean* object — a `SimpleGraph` or `Quiver` from mathlib — with the soundness check a Lean proof, or should it remain a Python data structure with a documented theorem citation?
- **Sub-question B.** Should the toolkit emit *witnesses* on cycle detection — namely, the offending cycle as a corpus-level diagnostic that points at the cited theorem and the offending notes — rather than a generic "cycle detected" error?
- **Sub-question C.** Should the corpus's `frontmatter-relations` spec carry an explicit `depends-on:` edge to [dag](../../../../glossary/terms/dag.md), formalizing the implicit dependency the spec already has on the DAG concept?

## What is established

- The [dependency-soundness-iff-dag](../dependency-soundness-iff-dag.md) theorem is proved.
- The corpus spec frontmatter-relations already says "a `depends-on:` cycle is a soundness diagnostic", citing no theorem. This question proposes binding that line to the theorem.
- The downstream `depends-on: [directed-graph]` edge added to [partial-order](../../../../glossary/terms/partial-order.md) demonstrates the binding pattern at the note level. The toolkit-level binding is the analogous step.

## What remains open

A concrete proposal for *how* the toolkit cites the theorem: as a docstring reference, as a runtime-checked invariant tied to a Lean module, as a CI-time validator that fails when the theorem is moved or renamed. The choice is operational rather than mathematical, but it is the choice that makes the theorem load-bearing rather than ornamental.

## Why this matters

A theorem that the toolkit *uses* but does not *cite* is a corpus-level diagnostic of its own: the corpus has a load-bearing claim sitting in the source code without a typed link to the proof. Binding the FARS implementation to this directory's theorem closes that gap and demonstrates the corpus's promotion-from-staging discipline at the boundary between mathematics and engineering.
