---
type: question
class: internal
status: open
explores: [settling-associated-sheaf, predicate-category, predicate-category-naturality, predicate-specialization, predicate-converse, predicate-subject-projection, predicate-object-projection, c-naturality-coupling-realizability-refinement, predication-hyperdoctrine]
---

# $\mathcal{C}$-naturality-valued sheaves ($\mathcal{C}$-action-axis cohomology)

The current $\mathbf{Ab}$-valued cohomology loses the [predicate category](../objects/predicate-category.md)'s action structure. The closure operator's [predicate-category naturality](teaching/explanations/predicate-category-naturality.md) and the four-generator-class structure ([specialization](../morphisms/predicate-specialization.md), [converse](../morphisms/predicate-converse.md), [subject-projection](../morphisms/predicate-subject-projection.md), [object-projection](../morphisms/predicate-object-projection.md)) are properties of the closure operator and the site, recovered from naturality squares — not visible in the cohomology values themselves.

Open: replace $\mathbf{Ab}$ with a value category that carries the predicate-category-action directly. This is the *$\mathcal{C}$-naturality-axis slice* of axis-aware cohomology — value-category enrichment that makes the [$\mathcal{C}$-naturality coupling refinement](../theorems/c-naturality-coupling-realizability-refinement.md)'s per-generator-class couplings intrinsic to sections.

## Candidate value categories

- **$\mathbf{Ab}^{\mathcal{C}^{op}}$ — abelian-group-valued $\mathcal{C}$-presheaves.** Sections at each cell carry a $\mathcal{C}$-presheaf structure; restriction along the four predicate-generator classes acts on the $\mathcal{C}$-presheaf data. The closure operator's $\mathcal{C}$-naturality becomes a property of sections (presheaf morphisms) rather than a separate naturality square.
- **Modules over a $\mathcal{C}$-enriched ring.** Build a base ring carrying the four-generator-class action; sheaves of modules over it. More algebraic than the presheaf formulation, possibly cleaner for derived-category computations.
- **Equivariant sheaves for the four-generator-class structure.** Treat the four generators as inducing a (2-)group action and take equivariant sheaves; couplings become equivariance constraints. Closer to representation-theoretic framing.

Each candidate exposes a different aspect of the per-generator-class coupling. Specialization-as-restriction reads cleanly in the presheaf formulation; converse-as-swap reads cleanly in the equivariant formulation; subject- and object-projection-as-diagonal-collapse have natural module-theoretic statements.

Whether these candidates are derived-equivalent (forming coordinate charts of one axis like the bigraded case) or genuinely distinct (forming sub-axes within the $\mathcal{C}$-naturality axis) is itself open. The bigraded axis has Jung–Rivieccio + Priestley as the duality apparatus tying its charts together; the $\mathcal{C}$-naturality axis would need an analogous duality theory developed for its candidates to be tied together as one structure.

## What this gives predication categories

A $\mathcal{C}$-action-axis cohomology would make the per-predicate firing-pattern couplings intrinsic to cohomology classes. Strong-MLD invariants tracking per-predicate structure become statable directly, and the [representation-theory question](representation-theory-skh.md) (what the predication hyperdoctrine is a representation of) becomes tractable from inside the cohomology rather than alongside it.

This question is one slice of a three-axis-aware cohomology program. The companion questions cover the bigraded value-type axis ([bilattice-valued sheaves](bilattice-valued-sheaves.md)) and the rule-language fragment axis ([rule-language-fragment-stratified sheaves](rule-language-stratified-sheaves.md)). Cross-axis combinations are downstream of all three being individually developed.
