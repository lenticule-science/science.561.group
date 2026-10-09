---
type: concept
class: entity
symbol: o
depends-on: [entity, predication-cell]
---

# Object

In predication categories, *object* names the third coordinate of a predication cell — not the category-theoretic notion of "object of a category."
The [entity](entity.md) occupying that coordinate is denoted $o$.
The object of a cell $(s, p, o)$ is the entity *to which* the [subject](subject.md) is being related under the predicate $p$; the cell's value $v(p)(s, o) \in A_p$ records predication categories' epistemic state on the proposition "$p$ holds of $s$ in relation to $o$."

The [predicate object-projection](../../../../../../../../../../../../../../../../../../../content/text/glossary/terms/predicate-object-projection.md) generator class is named for this coordinate: collapsing $E \times E$ along the diagonal $(s, o) \mapsto (o, o)$ extracts a unary predicate that depends only on the object.
Together with the [subject](subject.md) coordinate, the object indexes the entity-pair structure $E \times E$ over which fiber algebras are built.
