---

introduces: relation
description: "An ordering by specificity: a subsumes b if b is at least as specific as a. The natural ordering on types and feature structures."
aliases: [subsumption ordering, subsumes]
specialization: partial-order
date-created: 2026-03-30
---

Subsumption is an ordering by specificity. $a$ subsumes $b$ (written $a \sqsubseteq b$ or $b \leq a$) if $b$ is at least as specific as $a$ — $b$ has all the information $a$ has and possibly more.

In [typed feature structures](../../../../information/terms/typed-feature-structure.md) (Carpenter 1992), $F_1 \sqsubseteq F_2$ iff every feature-value pair in $F_1$ is present and at least as specific in $F_2$. A feature structure with more specified attributes is more specific.

In type systems, a supertype subsumes a subtype. In ontologies, a general concept subsumes a specific one.

The set of all typed feature structures over a given signature forms a bounded [lattice](./lattice.md) under subsumption. The meet (unification) is the most general structure at least as specific as both inputs. The join (generalization) is the most specific structure subsuming both.
