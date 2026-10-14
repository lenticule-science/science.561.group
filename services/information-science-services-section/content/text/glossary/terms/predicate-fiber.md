---

introduces: fiber
description: "The collection of all subject-object pairs sharing a predicate, together with their epistemic values. The basic unit of the fiber functor."
aliases: [ predicate fiber, predicate fibers, fiber, feature fiber, Predicate fiber ]
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
date-updated: 2026-10-14
---

A predicate fiber is the collection of all [subject-predicate-object](./subject-predicate-object.md) triples sharing a given predicate, together with their values.

For a predicate $p$ in a system of SPO triples $\mathcal{S}$:

$$\mathrm{Fib}(p) = \{ \langle s, o, v \rangle : \langle s, p, o \rangle \in \mathcal{S} \text{ with value } v \}$$

When values are drawn from the four-valued [bilattice](../../math/domains/algebra/terms/bilattice.md), the fiber inherits bilattice algebra pointwise: the operations $\odot$ (extending) and $\Rightarrow$ (restricting) from the Busaniche-Cignoli [residuation](../../math/domains/algebra/terms/residuated-lattice.md) apply to each entry in the fiber.

The pointwise knowledge and truth operations on FOUR-valued cells are well-defined once the predicate `p` and each typed cell's value are fixed. The value-domain residual `⊙ ⊣ ⇒` is the **truth-order** twist-product operation where its premises hold; it does not automatically supply noncommutative subject/object relational composition or arrows between different predicates.

A mapping `p ↦ Fib(p)` becomes a **functor** only after the category of predicates, legitimate reindexing morphisms, their action on fibers, and identity/composition preservation are stated. It becomes a **hyperdoctrine** only after supplying the required indexed-order/fibration, quantifier adjoints and compatibility laws. Those are substantive obligations, not consequences of writing an SPO tuple. The particular proven formal carriers and hypotheses are in [Obsmetrologia's predication hyperdoctrine](https://github.com/lenticule-science/obsmetrologia/blob/main/Obsmetrologia/Language/Predicating/Hyperdoctrine.lean) and [relation residuation](https://github.com/lenticule-science/obsmetrologia/blob/main/Obsmetrologia/Language/Predicating/Residuation.lean).

For [formal concept analysis](formal-concept-analysis.md) a predicate fiber is **not automatically a Boolean context column**. A chosen positive incidence reads the positive evidence bit of `v(s,p,o)` and includes **both** the positive-only and positive-plus-negative FOUR values. A chosen negative incidence reads the negative bit independently. The selected subject/object carrier, typed incidence and versioned evidence must be fixed before FCA closure is applied. In [typed feature structure](./typed-feature-structure.md) analysis, the analogous fiber collects values for one feature, again only under an admitted feature interpretation.