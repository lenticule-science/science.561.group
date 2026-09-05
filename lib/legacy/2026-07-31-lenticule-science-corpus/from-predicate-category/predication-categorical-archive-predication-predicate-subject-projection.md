---
type: morphism
realizes: [predicate-category-naturality]
class: morphism
symbol: "f_{\\mathrm{sp}}"
depends-on: [predicate, predicate-category, predication-fiber-algebra]
---

# Predicate subject-projection

A morphism in the [predicate category](../objects/predicate-category.md), denoted $f : q \to p$, induced by the collapse of the entity-pair index to the subject-diagonal:
$$(s, o) \mapsto (s, s).$$

The induced fiber-algebra map $f^* : A_p \to A_q$ acts by:

$$f^*(v)(s, o) = v(s, s).$$

A predicate subject-projection encodes the construction of a binary predicate $q$ by broadcasting $p$'s subject-diagonal content across all object coordinates: the value of $q$ at $(s, o)$ depends only on $p$'s value at $(s, s)$.
