---
name: transforming
description: The operation of applying a transformer — given a transformer with a domain structure and codomain structure, and an instance of the domain, producing an instance of the codomain while satisfying the transformer's preservation conditions.
title: transforming
---

## Mathematical grounding

In category theory, applying a morphism f : A → B to an element a : A produces an element f(a) : B. The operation is:
1. Verify a is a valid instance of A (satisfies A's signature and invariants).
2. Apply f's mapping.
3. Verify the result satisfies B's signature and invariants.
4. Confirm that f's preservation conditions hold for this application.

For morphisms in predication categories, "applying" often means: apply to a settling state, producing a new settling state. The positing morphism `posit_{(φ,q)}` applied to a settling `v` produces `v ∨_k δ_{φ,q}` — the knowledge-join of the original state with a point-mass at cell φ at value q. The preservation condition is that the result is a valid settling (respects the closure fixed-point conditions).

## What this file is

This file names the operation itself — the meta-level act of applying any transformer to its domain. It is not a specific transformer; it is the general operation that all specific transformers instantiate.
