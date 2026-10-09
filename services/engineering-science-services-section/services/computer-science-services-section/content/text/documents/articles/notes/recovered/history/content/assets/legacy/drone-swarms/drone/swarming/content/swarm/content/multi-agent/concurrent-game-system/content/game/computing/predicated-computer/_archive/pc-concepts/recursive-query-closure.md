---
type: concept
class: substrate
status: sketch
depends-on: [closure-rule, closure-rule-system, predication-fiber-algebra, abiteboul-hull-vianu1995, fitting2006]
see-also: [settlement, settling-as-computation, paraconsistency-as-substrate-discipline]
---

# Recursive-query closure as substrate operator

The substrate's settling operation is, structurally, the bilattice-valued generalization of recursive-query evaluation in the Datalog tradition. Rather than treating recursive query as a specialized application running over a substrate, the substrate makes the recursive-query computation its primitive operator — every closure-rule application is one step of a Datalog-style fixed-point evaluation, with the value-domain generalized from $\mathbf{2}$ to the four-valued bilattice.

Three structural identifications make the relationship precise:

- **Closure rule as Horn clause.** A [closure rule](closure-rule.md) is a Horn clause: a positive antecedent (a predication pattern that must match) implying a consequent (a predication that follows). Per [Abiteboul–Hull–Vianu (1995)](references/abiteboul-hull-vianu1995.md) Datalog is exactly the function-free Horn fragment of first-order logic with the least-fixed-point semantics over the potential domain. The substrate's closure-rule system is a Datalog program whose rules range over the [predication-graph store](../objects/predication-graph-store.md)'s active domain.
- **Settling as least-fixed-point evaluation.** The substrate's [settle](../morphisms/settle.md) operator iterates closure-rule application until quiescence. Per [Fitting (2006)](references/fitting2006.md), the bilattice-valued analog of Datalog's least-fixed-point evaluation lifts the same machinery to a bilattice value-domain: the iteration converges to a fixed point in the knowledge order $\leq_k$, with stratification rules ensuring that negation-as-failure-style reasoning produces a well-defined fixed point even in the presence of recursive negation.
- **Stratified negation as paraconsistency-as-discipline.** The substrate's two-closure ($\sigma$/$\Delta$) architecture, per [paraconsistency-as-substrate-discipline](../theorems/paraconsistency-as-substrate-discipline.md), is the engineering analog of Datalog's stratified-negation discipline lifted to the bilattice. Where Datalog stratifies to recover well-founded semantics, the substrate stratifies into knowledge-monotone closure (which fires on $\leq_k$-monotone antecedents) and truth-monotone closure (which fires on $\leq_t$-monotone antecedents); the two compose without exploding on contradictions because the value-domain has $\top$ rather than $\bot$ at contested cells.

The substrate gains over published Datalog implementations:

- **Bilattice value-domain at the storage layer.** Datalog stores facts in $\mathbf{2}$; the substrate stores predications in the four-valued bilattice. Contested predications across federated peers become $\top$ rather than producing query non-determinism.
- **Closure rules as substrate content.** Datalog programs are external code consuming a database; substrate closure rules are predication-graph entities, queryable, editable, and witnessed through the substrate's same operators per [self-representation](self-representation.md).
- **Provenance and witnessing built in.** Datalog systems with provenance support add it as an annotation layer (per [Green–Karvounarakis–Tannen (2007)](references/green-et-al2007.md)); the substrate carries provenance natively in the [witness](witness.md) chain — see [provenance-semiring-witness](provenance-semiring-witness.md).

The concept is *sketch* status: it names the relationship between the substrate's settling and the Datalog tradition so the [upstream-predication-logic](teaching/explanations/upstream-predication-logic.md) narrative has an atomized referent. A theorem-level statement of the equivalence (in particular: "the substrate's settling at a $\mathbf{2}$-valued sub-region with quantifier-free closure rules is, byte-equivalent to Datalog evaluation") is left for follow-up work; the [settlement-via-closure-2-monad](../theorems/settlement-via-closure-2-monad.md) theorem covers the categorical statement.
