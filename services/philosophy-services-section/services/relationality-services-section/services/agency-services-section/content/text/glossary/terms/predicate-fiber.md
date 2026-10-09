---
name: "emsenn.net"
type: "fiber"
date-created: 2026-03-30
description: The collection of all subject-object pairs sharing a predicate, together with their epistemic values.
---

The collection of all subject-object pairs sharing a predicate, together with their epistemic values. The basic unit of the fiber functor.

A predicate fiber is the collection of all [subject-predicate-object](../../../../../../../../../information-science-services-section/content/text/glossary/terms/subject-predicate-object.md) triples sharing a given predicate, together with their values.

For a predicate $p$ in a system of SPO triples $\mathcal{S}$:

Fib(p)={⟨s,o,v⟩:⟨s,p,o⟩∈S with value v}\mathrm{Fib}(p) = \{ \langle s, o, v \rangle : \langle s, p, o \rangle \in \mathcal{S} \text{ with value } v \}

When values are drawn from the four-valued [bilattice](../../documents/articles/research/2026/07/31/lenticule-import/animating/content/becoming/doing/working/governing/knowing/content/knowledge-science/math/domains/algebra/terms/bilattice.md), the fiber inherits bilattice algebra pointwise: the operations ⊙\odot (extending) and $\Rightarrow$ (restricting) from the Busaniche-Cignoli [residuation](../../documents/articles/research/2026/07/31/lenticule-import/animating/content/becoming/doing/working/governing/knowing/content/knowledge-science/math/domains/algebra/terms/residuated-lattice.md) apply to each entry in the fiber.

The assignment $p \mapsto \mathrm{Fib}(p)$ is a [functor](../../documents/articles/research/2026/07/31/lenticule-import/animating/content/becoming/doing/working/governing/knowing/content/knowledge-science/math/domains/categories/domains/ordinary-categories/terms/functor.md) — the **fiber functor** — from the category of predicates to distributive bilattices. This makes any SPO system a [hyperdoctrine](../../../../../../../../../information-science-services-section/services/math-services-section/content/text/glossary/terms/hyperdoctrine.md) with bilattice fibers.

In [formal concept analysis](../../documents/articles/research/2026/07/31/lenticule-import/animating/content/becoming/doing/working/governing/knowing/content/knowledge-science/math/domains/logic/terms/formal-context.md) terms, a predicate fiber is the column of a formal context: all objects&rsquo; values for a single attribute. In [typed feature structure](../../../../../../../../../information-science-services-section/content/text/glossary/terms/typed-feature-structure.md) terms, it is all entities&rsquo; values for a single feature.
