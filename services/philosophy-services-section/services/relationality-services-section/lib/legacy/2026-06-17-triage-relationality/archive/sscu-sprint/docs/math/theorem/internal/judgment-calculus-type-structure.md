---
form: research
title: Judgment Calculus Type Structure
tags:
  - lambda
  - type
layer: internal-theorem
status: plan
depends-on:
  - type-seed
  - type-variable
  - type-application# Judgment Calculus Type Structure

The acts `TypeSeed`, `TypeVariable`, and `TypeApplication` induce a type
structure mirroring the judgment calculus term structure:

- base types generated from `TypeSeed`,
- type variables from `TypeVariable`,
- arrow and other type formers from `TypeApplication`.

Each syntactic term constructor has a corresponding type constructor, and the
relational calculus therefore carries the usual inductive type grammar for this
internal judgment calculus.
