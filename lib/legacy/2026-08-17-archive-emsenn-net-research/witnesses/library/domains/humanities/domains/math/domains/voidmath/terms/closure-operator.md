---
name: "Closure operator"
description: "A family of monotone, inflationary, idempotent, and naturally-coherent maps on the predication fiber algebras — one per predicate — implementing consequence-closure under inference rules. The operator-theoretic engine of settling: each settling step takes a valuation to its closure."
symbol: "\\mathrm{cl}"
date-created: 2026-04-29
---

A **closure operator** on the predication fiber functor $F : \mathcal{C}^{\mathrm{op}} \to \mathbf{DBiLat}(\mathbf{L})$ is a family of maps $\mathrm{cl} = (\mathrm{cl}_p)_{p \in \mathcal{C}}$, one per predicate, with $\mathrm{cl}_p : A_p \to A_p$ on each [predication fiber algebra](predication-fiber-algebra.md), satisfying four axioms:

1. **Monotone in $\leq_k$:** $v \leq_k v' \Rightarrow \mathrm{cl}_p(v) \leq_k \mathrm{cl}_p(v')$ in the [knowledge order](knowledge-order.md).
2. **Inflationary:** $v \leq_k \mathrm{cl}_p(v)$.
3. **Idempotent:** $\mathrm{cl}_p \circ \mathrm{cl}_p = \mathrm{cl}_p$.
4. **Natural in $\mathcal{C}$:** for every morphism $f : q \to p$ in the [predicate category](predicate-category.md) $\mathcal{C}$,
$$f^* \circ \mathrm{cl}_p = \mathrm{cl}_q \circ f^*.$$

Conditions (1)–(3) are the classical lattice-theoretic closure axioms applied per fiber: each $\mathrm{cl}_p$ is a closure operator on the knowledge-order lattice $(A_p, \leq_k)$ in the standard sense. Condition (4) is the additional content imposed by the family structure: the closures at distinct predicates are *coherent* under reindexing — closing then reindexing equals reindexing then closing.

## Interpretation

The closure $\mathrm{cl}_p(v)$ is the *consequence closure* of the valuation $v$ under the inference rules encoded in $\mathrm{cl}$. Different applications choose different closures:

- For a logic-programming-style settling, $\mathrm{cl}$ implements Fitting's fixed-point operator per fiber.
- For a description-logic-style settling, $\mathrm{cl}$ implements TBox-driven inference.
- For the framework's general settling regime, any closure operator satisfying the four axioms is admissible.

The [spatiotemporal knowledge presheaf](spatiotemporal-knowledge-presheaf.md) definition is closure-agnostic; applications choose $\mathrm{cl}$ to suit.

## Generators

A closure operator can be specified syntactically by a closure-rule system — a family of positive $\Pi_1$-schemas in the inherited signature on $(\mathbf{L}, \mathcal{C}, E)$. The generated closure is the least operator satisfying every rule consequent whenever the corresponding antecedent holds. The rule-level syntactic structure is what makes the operator's Scott-continuity (and hence the settling regime it produces) visible: rules with quantifier-free antecedents generate Scott-continuous closures; rules with $\forall$-blocks over infinite domains generate non-Scott-continuous closures.

## Role in settling

Settling, as the framework's evolution mechanism, is iteration of $\mathrm{cl}$. Starting from a base valuation $v_0$, the family $v_\tau := \mathrm{cl}^\tau(v_0)$ traces the inquiry's progress through the knowledge order; settling monotonicity is automatic from axioms (1)–(2). The closure determines *what counts as inference* at each step; the framework supplies the rest of the structure (the bilattice, the predicate category, the fibration) within which that inference operates.

## See also

- [Predication fiber algebra](predication-fiber-algebra.md) — the algebra each $\mathrm{cl}_p$ acts on.
- [Predicate category](predicate-category.md) — the base category whose morphisms must be respected by $\mathrm{cl}$ (axiom 4).
- [Knowledge order](knowledge-order.md) — the order along which $\mathrm{cl}$ is monotone and inflationary.
- [Settling monotonicity](settling-monotonicity.md) — the automatic consequence of $\mathrm{cl}$'s axioms when iterated.
- [Spatiotemporal knowledge presheaf](spatiotemporal-knowledge-presheaf.md) — the structure $\mathrm{cl}$-iteration generates.
