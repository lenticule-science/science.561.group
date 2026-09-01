---
title: Derivation
aliases:
  - compare-induced-relation
date-created: "2026-03-04T00:00:00"
type: "[../../../../../slop/relationality/human-draft-7/system/acts/act](../../../../../slop/relationality/human-draft-7/system/acts/act)"
domain: "[../../../../../tags/Relationality](../../relationality-slop-2025-04-28/derivations/relationality.md)"
derivative-introduced-on: "[../../../../relations/2025-04-28](../../relationality-slop-2025-04-28/2025-04-28.md)"
derives-from:
  - [select-induced-relation](select-induced-relation)
---


- [definition](../../../../../../../../information-science-services-section/services/knowledge-services-section/services/research-services-section/content/text/glossary/terms/definition.md):: ***comparing induced relations*** is the [relational act](relational act) of [../../../../../slop/relationality/ai-generated-relationality/relationality-slop-2026-03-02/acts/relate|relating](../../../../../slop/relationality/ai-generated-relationality/relationality-slop-2026-03-02/acts/relate|relating) two selected [reflex induced relation|reflexed induced relations](reflex induced relation|reflexed induced relations) to derive their difference.

## Derivation

- [postulate](postulate):: As [select induced relation|selecting a reflexed induced relation](select induced relation|selecting a reflexed induced relation) allows the [isolation](isolation) of specific [reflex induced relation|reflexed induced relations](reflex induced relation|reflexed induced relations) within a [reflected induced relational form](reflected induced relational form), it must be derived that these selected relations, once isolated, may themselves be **related** — to determine their positional or structural equivalence.
- [derivation](derivation):: Any act of **selection** implies the availability of two or more distinguishable reflex-induced relations. To relate any two such selections is to compare them — determining whether their reflexive structure is the same (structural identity), or different (structural variance). The act of comparing is thus a derivative of both the compositional ordering of reflect-induced structures and the isolating act of selection.
- example:
	- compare(select(1, reflect(p, n)), select(2, reflect(p, n)))
	- compare(select(i, r), select(j, r)) where r is reflect(p, n)
	- compare(x, x) = true
	- compare(x, y) = false when x ≠ y
- [relational expression](relational expression):: compare-induced-relation(i, j, r) = (select(i, r) == select(j, r)) where ​r is reflect-induced-relation(p, n), and i and j are valid positional integers such that 1 ≤ i, j ≤ p
## Formalism
- Let r = reflect-induced-relation(p, n), where p is the number of reflex-induced components and n is reflexive depth
- Let select(i, r) return the i-th reflex-induced relation from the structure
- Then the comparison between two selections is defined as:
	- compare-induced-relation(i, j, r) :=
		- true, if select(i, r) ≡ select(j, r)
		- false, otherwise
- Thus:
	- compare-induced-relation(i, j, r) =
		- select-induced-relation(i, r) == select-induced-relation(j, reflect-induced-relation(p, n))
	- where i and j are any independent non-neutral integer and 1 ≤ i, j ≤ p
