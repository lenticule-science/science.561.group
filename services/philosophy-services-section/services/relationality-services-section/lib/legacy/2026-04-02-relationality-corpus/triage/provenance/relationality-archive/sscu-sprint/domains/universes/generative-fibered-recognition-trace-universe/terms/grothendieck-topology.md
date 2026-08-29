---

name: grothendieck-topology
  - "grothendieck topology"
  - "Grothendieck topology"
  - "Grothendieck topologies"
date-created: 2025-12-26
introduces: term
tags: []
defines:
  - "Grothendieck Topology"
  - "Grothendieck topologies"
---

A Grothendieck topology J on a [category](../../../categories/ordinary-categories/terms/category.md) C assigns to each object U a collection J(U) of covering sieves — families of [morphisms](../../../categories/ordinary-categories/terms/morphism.md) into U that together "cover" it. A Grothendieck topology must satisfy three axioms: the maximal sieve (all [morphisms](../../../categories/ordinary-categories/terms/morphism.md) into U) is a cover, covers are stable under pullback, and covers of covers are covers (transitivity).

A category equipped with a Grothendieck topology is a [site](../../../../disciplines/sheaf-theory/terms/site.md). The Grothendieck topology determines what "local" means for that site: a [presheaf](../../../../disciplines/sheaf-theory/terms/presheaf.md) is a [sheaf](../../../../disciplines/sheaf-theory/terms/sheaf.md) if compatible data on each cover [glues](../../../../disciplines/sheaf-theory/terms/glue.md) uniquely. The category of sheaves on a site is a Grothendieck topos.

In the [GFRTU](../generative-fibered-recognition-trace-universe.md), the Grothendieck topology on the [trace site](./trace-site.md) specifies which families of trace refinements constitute covers. This determines how local recognition data at individual [traces](./trace.md) assembles into global sections of the [sheaf universe](./sheaf-universe.md). A [Lawvere-Tierney topology](../../../../disciplines/higher-topos-theory/terms/lawvere-tierney-topology.md) on the [subobject classifier](../../../../disciplines/higher-topos-theory/terms/subobject-classifier.md) of the sheaf topos internalizes this notion of covering within the topos itself.
