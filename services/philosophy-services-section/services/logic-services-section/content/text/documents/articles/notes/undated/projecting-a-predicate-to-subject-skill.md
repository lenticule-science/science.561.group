---
name: projecting-a-predicate-to-subject
description: The query that returns the targets of all subject-projection-class morphisms out of a source predicate. Subject-projection collapses cells along the diagonal (s, o) ↦ (s, s), extracting a unary predicate depending only on the subject coordinate.
title: projecting-a-predicate-to-subject
---

## What this transformer is

Projecting-a-predicate-to-subject is the function $\mathcal{C}, p \mapsto \{q : (p \to q) \in \mathrm{SubjProj}\}$ that returns the subject-projection-class targets out of a source predicate. The class acts on fibers by the subject-diagonal: the morphism $f : p \to q$ lifts to $f^* : A_q \to A_p$ sending a unary fiber-element $u$ to the binary function $(s, o) \mapsto u(s)$ (the value depends only on $s$).

The target predicate $q$ is unary: its fiber-elements are functions $E \to L \times L$ rather than $E \times E \to L \times L$. The morphism class therefore connects binary and unary predicates in the same category.

## Realization on this platform

1. Validate the predicate-category against its JSON Schema using ajv 2020.
2. Confirm the source predicate is in the category's object-set.
3. Filter the subject-projection morphism list to entries with the given source, collecting their targets.
4. Return `{source, class: "subject-projection", targets: [...]}`.

## Failure modes

- Schema-violating category throws `TypeError`.
- Source not in the category's object-set throws `RangeError`.
