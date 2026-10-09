---
type: example
depends-on: [predication-settling, entity-set, predicate-set, four-bilattice, evidence]
instantiates: [predication-settling]
lineage: 2
---

# Relational-database predication settling

The entry point of **Lineage 2** — the strict-regime, multi-entity social-network example chain. Establishes the vocabulary the rest of the lineage carries: $\mathbf{L} = \mathbf{2}$, $E = \{\text{Alice}, \text{Bob}, \text{Carol}\}$, predicates from $\Pi_{\mathrm{soc}} = \{\text{Likes}, \text{LikedBy}, \text{IsHappy}, \text{IsHappyBroadcast}, \text{IsSameAs}\}$, with the predicate category $\mathcal{C}_{\mathrm{soc}}$ carrying the four-generator inventory (specialization, converse, subject-projection, object-projection) on these.

This example introduces the L2 base via the simplest reading: a small relational database with three entities and one binary predicate, illustrating the four bilattice values $\{\bot, \mathbf{t}, \mathbf{f}, \top\}$ of [evidence](../concepts/evidence.md) on declarations.

## Data

- $\mathbf{L} = \mathbf{2}$.
- [Entity set](../objects/entity-set.md) $E = \{\text{Alice}, \text{Bob}, \text{Carol}\}$.
- [Predicate set](../objects/predicate-set.md) $\Pi = \{\text{Likes}\}$ (this example uses only Likes; richer L2 examples introduce the other predicates).
- [Predicate category](../objects/predicate-category.md) $\mathcal{C}$ discrete (no morphisms — this example doesn't exercise the four generators; see [friendship-four-generators](../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../philosophy-services-section/services/logic-services-section/content/text/documents/articles/notes/undated/friendship-four-generators.md) for that).
- [Settling bound](../objects/settling-bound.md) $\lambda = 1$.
- Values in [$\mathbf{FOUR}$](../objects/four-bilattice.md).

## Settling

$v_0(\text{Likes})$ as follows:

| Cell $(s, o)$ | $v_0(\text{Likes})(s, o)$ | Meaning |
|---|---|---|
| (Alice, Bob) | $\mathbf{t}$ | declared positive |
| (Bob, Alice) | $\mathbf{f}$ | declared negative |
| (Alice, Carol) | $\top$ | two sources disagree |
| all other cells | $\bot$ | no declaration |

No closure rules; the settling has a single step.

## Observation

All four epistemic states of $\mathbf{FOUR}$ occur. Classical (two-valued) logic cannot represent the $\top$-cell; even three-valued logics omitting "no information" cannot represent the $\bot$-cells. Only the bilattice-valued representation captures all four cases natively.

## Role

Shows the four states of [evidence](../concepts/evidence.md) in action in the simplest relational setting. Direct bilattice generalization of a classical RDF triple store.

## Position in Lineage 2

L2 builds out the strict-regime / multi-entity social-network case. The vocabulary commitment ($E$ = Alice/Bob/Carol, social predicates) is fixed here and reused throughout. Members of L2:

- (this file) — entry; one predicate, four bilattice values illustrated.
- [friendship-four-generators](../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../philosophy-services-section/services/logic-services-section/content/text/documents/articles/notes/undated/friendship-four-generators.md) — exhibits the four-generator inventory (specialization, converse, subject-projection, object-projection) on social predicates.
- [multi-agent-epistemic-settling](multi-agent-epistemic-settling.md) — three agents/replicas reporting on a disputed Likes claim.
- [three-replica-mayer-vietoris](../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../philosophy-services-section/services/logic-services-section/content/text/documents/articles/notes/undated/three-replica-mayer-vietoris.md) — Mayer-Vietoris computation in the multi-agent setting.
- [two-entity-moduli](two-entity-moduli.md) — moduli stack on the two-entity sub-base.
- [strict-regime-two-cell-curry](strict-regime-two-cell-curry.md) — Curry equivalence on the two-cell case.
- [social-network-hyperdoctrine-adjoints](social-network-hyperdoctrine-adjoints.md) (forthcoming) — quantifier adjoints on the social network.
- [social-network-verdier-dual](../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../philosophy-services-section/services/logic-services-section/content/text/documents/articles/notes/undated/social-network-verdier-dual.md) (forthcoming) — Verdier dual with non-trivial cellular fiber.
- [social-network-strong-mld-orbits](social-network-strong-mld-orbits.md) (forthcoming) — exchange-paired orbit pair.
- [social-network-six-functor-tensor](../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../philosophy-services-section/services/logic-services-section/content/text/documents/articles/notes/undated/social-network-six-functor-tensor.md) (forthcoming) — tensor of two settling sheaves.
- [social-network-meta-classification](../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../philosophy-services-section/services/logic-services-section/content/text/documents/articles/notes/undated/social-network-meta-classification.md) (forthcoming) — meta-classifier of L2 closure rules.
- [social-network-deformation-tangent](../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../philosophy-services-section/services/logic-services-section/content/text/documents/articles/notes/undated/social-network-deformation-tangent.md) (forthcoming) — finite-discrete deformation tangent.

L2's role: provide the *richer-than-trivial-but-still-finite* benchmark. The multi-entity setup gives non-trivial cellular fibers (so Curry / Verdier have substantive content), and the social-network semantics gives natural cases for likes/dislikes ↔ truth-only/falsity-only orbit-pairing under the composed duality.
