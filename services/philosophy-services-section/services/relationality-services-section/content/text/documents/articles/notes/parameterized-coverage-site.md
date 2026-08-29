---
title: Parameterized Coverage Site
id: parameterized-coverage-site
role: structure
status: plan
derived_from: math/structure/coverage-site
proof_refs: []
---


# Parameterized Coverage Site

Lift of the [Coverage Site](./coverage-site.md)
that pins down computational parameters: index sets for covers, overlap
resolution, and explicit restriction maps suitable for executable flows.

## Definition
- Parameters: finite index sets for covers, overlap computation rules, and
  datatype representations of sections.
- Components: concrete cover tables, restriction functions, and explicit overlap
  constructors that can be iterated in evaluation contexts.
- Base-change hooks: algorithms for pulling a cover back along a morphism and
  simplifying the resulting family.

## Invariants
- Parameter soundness: chosen index sets and overlap rules respect the abstract
  coverage axioms and do not omit required refinements.
- Total restriction: every cover arrow carries an executable restriction map that
  composes correctly when arrows are composed.
- Glue readiness: outputs matching-family data in a format consumed by sheaf
  gluing lifts and path-composition lifts.

## Proof
- Derived from: [Coverage Site](./coverage-site.md) by
  instantiating covers/restrictions with explicit indices and computational
  overlap rules.
- Shows that: the abstract coverage can be executed with explicit indices,
  enabling system-level distributions and machine-level runtime representations.
