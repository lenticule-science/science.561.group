---
title: Judgment Type
id: judgment-type
role: structure
status: plan
derived_from:
- acts/type-application
proof_refs: []
---



The **Judgment Type** structure is the inductive type grammar of the internal
judgment calculus.

## Definition
- Base types from `TypeSeed`.
- Type variables from `TypeVariable`.
- Arrow and other type formers from `TypeApplication`.

## Invariants
- Types are built inductively from the earned constructors.
- Well-formedness follows from the generating acts.

## Proof
Derived from the type seed/variable/application acts, yielding the usual
inductive type grammar mirrored by the term structure.
