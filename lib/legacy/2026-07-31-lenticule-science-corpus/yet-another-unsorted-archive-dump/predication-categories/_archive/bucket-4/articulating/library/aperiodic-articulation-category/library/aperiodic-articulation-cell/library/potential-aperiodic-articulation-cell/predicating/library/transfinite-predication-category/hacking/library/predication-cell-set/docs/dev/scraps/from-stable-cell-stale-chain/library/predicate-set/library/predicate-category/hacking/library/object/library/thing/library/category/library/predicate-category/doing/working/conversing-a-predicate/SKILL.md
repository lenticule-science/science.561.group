---
name: conversing-a-predicate
description: The query that returns the targets of all converse-class morphisms out of a source predicate in a predicate category. Converse is the morphism that sends a predicate's "(s p o)" interpretation to its "(o p s)" interpretation; the class is involutive at the morphism level.
---

## What this transformer is

Conversing-a-predicate is the function $\mathcal{C}, p \mapsto \{q : (p \to q) \in \mathrm{Conv}\}$ that returns the converse-class targets out of a given source predicate. The converse class is involutive: if $f : p \to q$ is in the class then so is its inverse $f^{-1} : q \to p$, and $f^{-1} \circ f = \mathrm{id}_p$ on the morphism level. Applying the query at $q$ should therefore return a list containing $p$ whenever the query at $p$ returned $q$.

Converse acts on fibers by the entity-pair swap: the morphism $f : p \to q$ lifts to $f^* : A_q \to A_p$ sending $v$ to the function $(s, o) \mapsto v(o, s)$. The swap is itself involutive: applied twice it is the identity on $A_p$.

## Realization on this platform

1. Validate the predicate-category against its JSON Schema using ajv 2020.
2. Confirm the source predicate is in the category's object-set.
3. Filter the converse morphism list to entries with the given source, collecting their targets.
4. Return `{source, class: "converse", targets: [...]}`.

## Failure modes

- Schema-violating category throws `TypeError`.
- Source not in the category's object-set throws `RangeError`.
- The involutivity property is the verifier's check, not this query's: running the query twice (at source and at each returned target) should produce a result containing the original source.
