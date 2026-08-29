---
type: [act](act)
domain: [relationality](../../../relationality-slop-2025-04-28/derivations/relationality.md)
derivative-introduced-on: [2025-04-27](../../../relationality-slop-2025-06-11/00-probably-redundant/20250502-relational-notes/meta/cal/2025/2025-04/2025-04-27.md)
derives-from:
  - [relationality](../../../relationality-slop-2025-04-28/derivations/relationality.md)
aliases:
  - "reflex-induced-relation"
---

- Definition:: ***reflexing an induced relation*** is the [act](act) of [induce|inducing](induce|inducing) a [relation](./relation.md) between a relation and [relation](./relation.md).

## Derivation
- [postulate](postulate):: As [relationlessness](../../../relationality-2/ai-generated-relationality/relationality-slop-2026-03-05/relationlessness.md) and [relation](./relation.md) together induce [induce relationality](induce relationality), the act that relates them must itself be included within that induction — reflexively relating to its own inducing.
- [derivation](derivation):: The act of inducing relationality cannot not include itself in the domain it induces. This reflexive inclusion forms a fixed point where each act of relational induction affirms its own induction.
- example:
	- reflex-induced-relation(0) = induce [induce relationality](induce relationality)
	- reflex-induced-relation(1) = reflex-induced-relation(reflex-induced-relation(0))
	- reflex-induced-relation(n) = reflex-induced-relation(reflex-induced-relation(n−1))
- [relational expression](relational expression):: [reflex induced relation|reflex-induced-relation](reflex induced relation|reflex-induced-relation)(n) = reflex-induced-relation(reflex-induced-relation(n-1)) where n is any non-negative integer

## Formalism

- Let Relationality denote the [induce|induced](induce|induced) domain of [induce relationality](induce relationality)
- Let reflex-induced-relation denote the act of derivation induced by Relationality's self-relation, thus Reflex(0) is Relationality.
- Then as the reflex-induced-relation at iteration n is defined as:
	- reflex-induced-relation(1) = reflex-induced-relation(0)
	- reflex-induced-relation(2) = reflex-induced-relation(1)
	- reflex-induced-relation(n) = reflex-induced-relation(n-1)
	- reflex-induced-relation(n+1) = reflex-induced(relation(n))
- Thus:
	- reflex-induced-relation(n) = reflex-induced(relation(n-1))
	- where n is any non-negative integer