---
type: morphism
realizes: [predicate-category-naturality]
class: morphism
symbol: "f_{\\mathrm{op}}"
depends-on: [predicate, predicate-category, predication-fiber-algebra]
---

# Predicate object-projection

A morphism in the [predicate category](../objects/predicate-category.md), denoted $f : q \to p$, induced by the collapse of the entity-pair index to the object-diagonal:
$$(s, o) \mapsto (o, o).$$

The induced fiber-algebra map $f^* : A_p \to A_q$ acts by:

$$f^*(v)(s, o) = v(o, o).$$

A predicate object-projection is the dual of [predicate subject-projection](predicate-subject-projection.md): the value of $q$ at $(s, o)$ depends only on $p$'s value at $(o, o)$, broadcasting from the object-diagonal.
