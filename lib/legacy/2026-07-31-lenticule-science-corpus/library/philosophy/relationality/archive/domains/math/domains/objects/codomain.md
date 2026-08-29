---
id: codomain
description: "The codomain of a function f: A → B is B — the set into which f maps. The codomain contains the range but may be larger."
defines: Codomain
date-modified: 2026-03-19
params:
  function: relational-universe-morphism
output: relational-universe
ast:
  target-object:
    - function
---

# Codomain

## What this is

The **codomain** of a function f : A → B is B — the set into which f maps its outputs.
The codomain is declared as part of the function's signature: f : A → B says outputs land in B.

The codomain and the range (image) are not the same:
- **Codomain** B: the declared output set — every f(a) lands in B.
- **Range** {f(a) | a ∈ A}: the actual output set — the subset of B that f hits.

A function is surjective (onto) iff range = codomain: every element of B is hit by some input.

In set theory: for f ⊆ A × B, the codomain is B (the second component of the signature).
In type theory: the codomain of f : A → B is the type B — the return type.
In category theory: the codomain (also called *target*) of a morphism f : A → B is the object B.

## Why codomain ≠ range

Declaring a codomain is a *commitment*: f is designed to produce values of type B.
A function f : ℤ → ℝ has codomain ℝ even if every f(n) happens to be rational.
Changing the codomain changes the type of f, even if the rule and range are identical.

## Open questions

