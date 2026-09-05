---
name: specializing-a-predicate
description: The query that returns the targets of all specialization-class morphisms out of a source predicate in a predicate category. Specialization is one of the four canonical morphism classes; a specialization morphism refines its source to a more-specific target predicate.
---

## What this transformer is

Specializing-a-predicate is the function $\mathcal{C}, p \mapsto \{q : (p \to q) \in \mathrm{Spec}\}$ that returns the set of specialization-class targets out of a given source predicate. The query is the restriction of the specialization-morphism relation to its action at a single source.

The specialization class is reflexive (every predicate specializes to itself when reflexivity is included), transitive (composition of specializations is a specialization), and induces a bilattice homomorphism between fiber algebras: the morphism $f : p \to q$ in the specialization class lifts to $f^* : A_q \to A_p$ on fibers, preserving $\sqcap_t, \sqcup_t, \sqcap_k, \sqcup_k, \sim$ pointwise.

## Realization on this platform

1. Validate the predicate-category against its JSON Schema using ajv 2020.
2. Confirm the source predicate is in the category's object-set.
3. Filter the specialization morphism list to entries with the given source, collecting their targets.
4. Return `{source, class: "specialization", targets: [...]}`.

## Failure modes

- Schema-violating category throws `TypeError`.
- Source not in the category's object-set throws `RangeError`.
- An empty targets list means no specializations from source are declared in this category; the query succeeds with an empty result.
