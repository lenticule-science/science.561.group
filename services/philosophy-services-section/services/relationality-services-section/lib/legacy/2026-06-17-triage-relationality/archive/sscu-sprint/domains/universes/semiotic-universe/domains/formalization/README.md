---

title: "Semiotic Universe Formalization"
introduces: documentation
date-created: 2026-03-07
tags:
  - lean
  - agda
  - mathematical-universe---

# Formalization of the Semiotic Universe

This directory contains formal verifications of the
[semiotic universe](../semiotic-universe.md) specification in two
proof assistants, each with a different foundational approach.

## Directory structure

```
formalization/
├── lean/    Lean 4 + Mathlib — axiomatic approach
└── agda/    Agda — synthetic approach from Grothendieck universe
```

## Two approaches, one spec

Both formalizations verify the same specification. They differ in
how they relate to the mathematical foundations:

### Lean (axiomatic)

The Lean formalization axiomatizes the algebraic consequences of
the construction: H is postulated to be a Heyting algebra, j a
Lawvere-Tierney topology, G a Heyting-comonadic trace. Properties
like meet-preservation are axioms justified by the spec's prose.

This approach is faster to write and closer to how working
mathematicians use the structures. It verifies that the axiom
system is consistent and the derived lemmas follow.

See [lean/README.md](lean/README.md) for details.

### Agda (synthetic)

The Agda formalization builds the structures from categorical
primitives: Agda's type-theoretic universes stand in for
Grothendieck universes, the category of sign relations is built
with explicit universe levels, Sub(Y) is constructed and proved
to be a Heyting algebra, and j's meet-preservation is a theorem
rather than an axiom.

This approach is more work but leaves no foundational gap between
"we work in a Grothendieck universe" and "therefore H has these
properties."

See [agda/README.md](agda/README.md) for details.

## Relationship to the spec

Both formalizations are subordinate to the specification. If
either reveals that an axiom is inconsistent or a lemma does not
follow, that is a finding about the spec — the spec should be
corrected, not the formalization loosened.

Working in both languages concurrently helps: each formalization
can catch different classes of issues, and translation between
them forces precision about what is axiom vs. theorem.
