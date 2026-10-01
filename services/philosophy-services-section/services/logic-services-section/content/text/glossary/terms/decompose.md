---
type: theorem
status: proved
depends-on: [predicate-category, predicate-specialization, predicate-converse, predicate-subject-projection, predicate-object-projection, predication-fibration]
name: Finite-limit morphisms decompose as generators
description: Every finite-limit construction morphism in a predicate category $\mathcal{C}$ decomposes as a composition of the four generator classes.
---


Every finite-limit construction morphism in a [predicate category](../../documents/articles/research/2026/07/31/lenticule-import/objects/predicate-category.md) $\mathcal{C}$ decomposes as a composition of the four generator classes.

## Proof

The uniform-fiber-algebra axiom — (A1) of an [predication fibration](../../documents/articles/research/2026/07/31/lenticule-import/objects/predication-fibration.md) — makes every cartesian-structure morphism act on fibers as a trivial [specialization](../../../../../../../information-science-services-section/services/math-services-section/content/text/glossary/terms/predicate-specialization.md) when both source and target have the full sub-support $E \times E$, or as a specific four-generator composition when sub-supports restrict:

- Projections $\pi_i : p \times q \to p$: trivial specialization (identity on fibers).
- Terminal maps $! : p \to \mathbf{1}$: trivial specialization.
- Diagonal $\Delta_p : p \to p \times p$: trivial specialization.
- Pairing $\langle f, g \rangle : r \to p \times q$: composition determined by $f^*$ and $g^*$, which must agree.
- Equalizer map $e : \mathrm{Eq}(f, g) \to p$: specialization to the sub-support where $f^* = g^*$, computable from the generator classes of $f$ and $g$.

$\square$
