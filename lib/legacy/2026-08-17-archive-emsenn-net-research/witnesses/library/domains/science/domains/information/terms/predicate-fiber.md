---

introduces: fiber
description: "The collection of all subject-object pairs sharing a predicate, together with their epistemic values. The basic unit of the fiber functor."
aliases: [predicate fiber, predicate fibers, fiber, feature fiber]
indexed-by: predicate
collects: subject-predicate-object
values-in: epistemic-state
algebra: bilattice
pointwise-operations: [truth-meet, truth-join, knowledge-meet, knowledge-join]
distributive: true
functor-assignment: "p ↦ A_p"
functor-is: contravariant
functor-target: distributive-bilattice
adjunction-on-fiber: "⊙ ⊣ ⇒"
in-fca-terms: "column of a formal context"
in-feature-structure-terms: "all entities' values for a single attribute"
pattern: hyperdoctrine
date-created: 2026-03-30
---

A predicate fiber is the collection of all [subject-predicate-object](./subject-predicate-object.md) triples sharing a given predicate, together with their values.

For a predicate $p$ in a system of SPO triples $\mathcal{S}$:

$$\mathrm{Fib}(p) = \{ \langle s, o, v \rangle : \langle s, p, o \rangle \in \mathcal{S} \text{ with value } v \}$$

When values are drawn from the four-valued [bilattice](../../math/domains/algebra/terms/bilattice.md), the fiber inherits bilattice algebra pointwise: the operations $\odot$ (extending) and $\Rightarrow$ (restricting) from the Busaniche-Cignoli [residuation](../../math/domains/algebra/terms/residuated-lattice.md) apply to each entry in the fiber.

The assignment $p \mapsto \mathrm{Fib}(p)$ is a [functor](../../math/domains/categories/domains/ordinary-categories/terms/functor.md) — the **fiber functor** — from the category of predicates to distributive bilattices. This makes any SPO system a [hyperdoctrine](../../math/domains/categories/domains/ordinary-categories/terms/hyperdoctrine.md) with bilattice fibers.

In [formal concept analysis](../../math/domains/logic/terms/formal-context.md) terms, a predicate fiber is the column of a formal context: all objects' values for a single attribute. In [typed feature structure](./typed-feature-structure.md) terms, it is all entities' values for a single feature.
