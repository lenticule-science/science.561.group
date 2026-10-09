---
kind: morphism
realizes: [adjudication, closure-drivenness, scott-continuous-closure]
type: operator
symbol: "\\mathrm{cl}"
lean: SpatiotemporalKnowledgeSystem.Homebrew.Settling.Closure.ClosureOperator
closes: predication-fiber-algebra
depends-on: [predicate-category, predication-fiber-algebra, predication-fiber-functor, knowledge-order]
---

# Closure operator

A **closure operator** on the [predication fiber functor](../../references/predication-fiber-functor.md) $F : \mathcal{C}^{\mathrm{op}} \to \mathbf{DBiLat}(\mathbf{L})$ is a family of maps $\mathrm{cl} = (\mathrm{cl}_p)_{p \in \mathcal{C}}$ with $\mathrm{cl}_p : A_p \to A_p$ on each [predication fiber algebra](../objects/predication-fiber-algebra.md) such that:

1. **Monotone in $\leq_k$:** $v \leq_k v' \Rightarrow \mathrm{cl}_p(v) \leq_k \mathrm{cl}_p(v')$ in the [knowledge order](../concepts/knowledge-order.md).
2. **Inflationary:** $v \leq_k \mathrm{cl}_p(v)$.
3. **Idempotent:** $\mathrm{cl}_p \circ \mathrm{cl}_p = \mathrm{cl}_p$.
4. **Natural in $\mathcal{C}$:** for every morphism $f : q \to p$ in the [predicate category](../objects/predicate-category.md) $\mathcal{C}$,
$$f^* \circ \mathrm{cl}_p = \mathrm{cl}_q \circ f^*.$$

Conditions (1)–(3) are the classical lattice-theoretic closure axioms; (4) says closure commutes with the predicate-category base change.

## Remark

Each component $\mathrm{cl}_p$ is, by axioms (1)–(3) alone, a closure operator on the knowledge-order lattice $(A_p, \leq_k)$ in the classical sense. Axiom (4) is the additional content imposed by the family structure: the closures at distinct predicates are coherent under reindexing.

## Interpretation

The closure $\mathrm{cl}_p(v)$ is the *consequence closure* of the valuation $v$ under the inference rules encoded in $\mathrm{cl}$. For a logic-programming-style settling, $\mathrm{cl}$ implements [@fitting1991]'s fixed-point operator per fiber. For a description-logic-style settling, $\mathrm{cl}$ implements TBox-driven inference. The knowledge presheaf definition is closure-agnostic: any closure operator satisfying the four axioms above is admissible; applications choose $\mathrm{cl}$ to suit.

## Generators

A closure operator can be specified syntactically by a [closure-rule system](../concepts/closure-rule.md) — a finite or countable family of positive $\Pi_1$-schemas in the inherited signature on $(\mathbf{L}, \mathcal{C}, E)$. The generated closure operator is the least operator satisfying every rule consequent whenever the corresponding antecedent holds. The rule-level syntactic structure is what makes the operator's Scott-continuity (and hence the settling's regime) visible: rules with quantifier-free antecedents generate Scott-continuous closures; rules with $\forall$-blocks over infinite domains generate non-Scott-continuous closures.
