---
type: morphism
realizes: [predicate-category-naturality]
class: morphism
symbol: "f_{\\mathrm{conv}}"
depends-on: [predicate, predicate-category, predication-fiber-algebra]
---

# Predicate converse

A morphism in the [predicate category](../objects/predicate-category.md), denoted $f : p^c \to p$, induced by the swap of the entity-pair index:
$$(s, o) \mapsto (o, s).$$

The induced fiber-algebra map $f^* : A_p \to A_{p^c}$ acts by:

$$f^*(v)(s, o) = v(o, s).$$

A predicate converse encodes the relational converse of $p$: the predicate $p^c$ holds at the pair $(s, o)$ exactly where $p$ holds at $(o, s)$.
