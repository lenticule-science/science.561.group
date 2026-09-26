---
description: "A function on a partially ordered set that is extensive, monotone, and idempotent — the canonical way to complete or close a structure under a set of rules."
aliases: [ closure operator, closure operators, hull operator, Kuratowski closure operator, Closure operator ]
specialization: monotone
properties: [extensive, monotone, idempotent]
requires: [partial-order]
strongest-on: complete-lattice
existence-theorem: knaster-tarski
traditions: [kuratowski-1922, ore-1943, birkhoff-1967, davey-priestley-2002]
date-created: 2026-04-05

type: morphism
realizes:
  - adjudication
  - closure-drivenness
  - scott-continuous-closure
class: operator
symbol: \mathrm{cl}
lean: PredicationCategories.Homebrew.Settling.Closure.ClosureOperator
closes: predication-fiber-algebra
depends-on:
  - predicate-category
  - predication-fiber-algebra
  - predication-fiber-functor
  - knowledge-order
---

A **closure operator** on a [partially ordered](./partial-order.md) set $(P, \leq)$ is a function $c : P \to P$ satisfying three conditions:

1. **Extensive** (inflationary): $x \leq c(x)$. The output is at least as large as the input.
2. **[Monotone](./monotone.md)**: $x \leq y \implies c(x) \leq c(y)$. Larger inputs produce larger outputs.
3. **Idempotent**: $c(c(x)) = c(x)$. Applying the operator to an already-closed element changes nothing.

An element $x$ with $c(x) = x$ is called **closed** or **stable**. The set of closed elements, $\operatorname{Fix}(c)$, is the image of the operator. On a [complete lattice](../../../../services/obsmetrological-services-section/lib/obsmetrologia/docs/verso/mark/content/utterance/articulating/content/articulation-cell/content/potential-articulation-cell/predicating/content/predication-cell/content/potential-predication-cell/positing/content/valuation/content/knowledge-least-valuation/settling/content/preorder/content/order/content/lattice/content/complete-lattice/complete-lattice.md), $\operatorname{Fix}(c)$ is itself a complete lattice under the inherited order — this is a theorem of Garrett Birkhoff (*Lattice Theory*, 3rd ed., 1967).

Kazimierz Kuratowski introduced the axioms for topological closure operators in 1922, characterizing topology entirely through the closure function rather than through open sets. Oystein Ore generalized the concept to arbitrary lattices in 1943, showing that closure operators on a lattice $L$ correspond bijectively to closure systems (families of subsets of $L$ closed under arbitrary intersection). This correspondence — between operators and their fixed-point sets — is one of the central structural results in order theory.

The pattern is always the same: start with an incomplete structure, apply rules that add what is missing, stop when nothing new appears. Topological closure adds limit points. Transitive closure adds reachable paths. Deductive closure adds derivable theorems. Span adds linear combinations. In each case, the closure operator is the function that produces the smallest structure satisfying the relevant completeness condition.

When the operator acts on a [complete lattice](../../../../services/obsmetrological-services-section/lib/obsmetrologia/docs/verso/mark/content/utterance/articulating/content/articulation-cell/content/potential-articulation-cell/predicating/content/predication-cell/content/potential-predication-cell/positing/content/valuation/content/knowledge-least-valuation/settling/content/preorder/content/order/content/lattice/content/complete-lattice/complete-lattice.md), the Knaster-Tarski [fixpoint](./fixpoint.md) theorem guarantees existence: every [monotone](./monotone.md) function on a complete lattice has a least fixpoint and a greatest fixpoint. For a closure operator (which is both monotone and extensive), the least fixpoint is the bottom of the closed-element lattice — the minimal stable structure.

Closure operators compose, but the composition of two idempotent operators is not generally idempotent. When multiple closure operators act on the same lattice, the standard technique is to iterate the composite to its least fixpoint. This is the algebraic backbone of staged closure — applying recognition, production, and verification rules in sequence until the system stabilizes.

## Fibered closure and settling

On the predication fiber functor $F : \mathcal{C}^{\mathrm{op}} \to \mathbf{DBiLat}(\mathbf{L})$, a closure operator is a family $\mathrm{cl} = (\mathrm{cl}_p)_{p \in \mathcal{C}}$, one map $\mathrm{cl}_p : A_p \to A_p$ on each [predication fiber algebra](./predication-fiber-algebra.md), satisfying:

1. **Monotone in $\leq_k$:** $v \leq_k v' \Rightarrow \mathrm{cl}_p(v) \leq_k \mathrm{cl}_p(v')$ in the [knowledge order](../../../../../../../philosophy-services-section/services/relationality-services-section/services/agency-services-section/content/text/glossary/concepts/knowledge-order.md).
2. **Inflationary:** $v \leq_k \mathrm{cl}_p(v)$.
3. **Idempotent:** $\mathrm{cl}_p \circ \mathrm{cl}_p = \mathrm{cl}_p$.
4. **Natural in $\mathcal{C}$:** for every morphism $f : q \to p$ in the [predicate category](./predicate-category.md), $f^* \circ \mathrm{cl}_p = \mathrm{cl}_q \circ f^*$.

Conditions (1)–(3) make each $\mathrm{cl}_p$ a closure operator on the knowledge-order lattice $(A_p, \leq_k)$ in the classical sense. Condition (4) is what the family adds: closing then reindexing equals reindexing then closing, so the closures at distinct predicates cohere.

$\mathrm{cl}_p(v)$ is the consequence closure of the valuation $v$ under the inference rules $\mathrm{cl}$ encodes. For logic-programming-style settling, $\mathrm{cl}$ is Fitting's fixed-point operator per fiber (Fitting 1991); for description-logic-style settling, TBox-driven inference. Any family satisfying the four axioms is admissible.

A closure operator can be given syntactically by a closure-rule system: a family of positive $\Pi_1$-schemas in the signature on $(\mathbf{L}, \mathcal{C}, E)$, generating the least operator that satisfies every rule consequent whenever its antecedent holds. The rules show the operator's Scott-continuity: quantifier-free antecedents generate Scott-continuous closures; $\forall$-blocks over infinite domains generate closures that are not.

[Settling](./settlement.md) is iteration of $\mathrm{cl}$. From a base valuation $v_0$, the family $v_\tau := \mathrm{cl}^\tau(v_0)$ traces inquiry through the knowledge order, and [settling monotonicity](./settling-monotonicity.md) follows from axioms (1)–(2). The closure decides what counts as inference at each step.

## Interior operators

The dual of a closure operator is an **interior operator** $o : P \to P$: deflationary ($o(x) \leq x$), monotone, and idempotent. Its fixed points are the **open** elements. Closure and interior play the roles of possibility and necessity in S4 ([modal logic](./modal-logic.md)).

Relationality calls closure *close*, the stabilizing move that secures what has been established, and interior *open*, the move that keeps what remains available for refinement. It calls a closure–interior pair *balanced* when neither disturbs the other, $\operatorname{cl}(o(x)) = \operatorname{cl}(x)$ and $o(\operatorname{cl}(x)) = o(x)$; this holds for some pairs, not for every pair.

## See also

- [Closure](./closure.md) — the result of applying a closure operator
- [Fixpoint](./fixpoint.md) — the convergence state where an operator produces no change
- [Monotone](./monotone.md) — the order-preservation property that makes fixpoints exist
- [Complete lattice](../../../../services/obsmetrological-services-section/lib/obsmetrologia/docs/verso/mark/content/utterance/articulating/content/articulation-cell/content/potential-articulation-cell/predicating/content/predication-cell/content/potential-predication-cell/positing/content/valuation/content/knowledge-least-valuation/settling/content/preorder/content/order/content/lattice/content/complete-lattice/complete-lattice.md) — the structure on which Knaster-Tarski guarantees convergence
- [Galois connection](./galois-connection.md) — every Galois connection induces a closure operator on each side
- [Predication fiber algebra](./predication-fiber-algebra.md) — the algebra each $\mathrm{cl}_p$ acts on
- [Knowledge order](../../../../../../../philosophy-services-section/services/relationality-services-section/services/agency-services-section/content/text/glossary/concepts/knowledge-order.md) — the order along which $\mathrm{cl}$ is monotone and inflationary
- [Settling monotonicity](./settling-monotonicity.md) — what iterating $\mathrm{cl}$ guarantees
- [Spatiotemporal knowledge presheaf](./spatiotemporal-knowledge-presheaf.md) — the structure $\mathrm{cl}$-iteration generates
