---
name: projecting-a-predicate-to-object
description: The query that returns the targets of all object-projection-class morphisms out of a source predicate. Object-projection collapses cells along the diagonal (s, o) ↦ (o, o), extracting a unary predicate depending only on the object coordinate.
---

## What this transformer is

Projecting-a-predicate-to-object is the function $\mathcal{C}, p \mapsto \{q : (p \to q) \in \mathrm{ObjProj}\}$ that returns the object-projection-class targets out of a source predicate. The class acts on fibers by the object-diagonal: the morphism $f : p \to q$ lifts to $f^* : A_q \to A_p$ sending a unary fiber-element $u$ to the binary function $(s, o) \mapsto u(o)$ (the value depends only on $o$).

Together with subject-projection, this class supplies the two ways of collapsing a binary predicate to a unary one — by retaining the subject coordinate or by retaining the object coordinate. The two projection classes are not converse to each other; they are distinct generator classes acting on different diagonals.

## Realization on this platform

1. Validate the predicate-category against its JSON Schema using ajv 2020.
2. Confirm the source predicate is in the category's object-set.
3. Filter the object-projection morphism list to entries with the given source, collecting their targets.
4. Return `{source, class: "object-projection", targets: [...]}`.

## Failure modes

- Schema-violating category throws `TypeError`.
- Source not in the category's object-set throws `RangeError`.
