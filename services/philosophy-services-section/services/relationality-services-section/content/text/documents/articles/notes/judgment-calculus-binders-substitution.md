---
title: Judgment Calculus Binders and Substitution
keywords:
  - lambda
  - substitution
layer: internal-theorem
status: plan
depends-on:
  - binder-seed
  - binder-transport
  - binder-application
  - substitution-term
description: implement (lambda)-abstraction and capture-avoiding substitution for terms in the judgment calculus in the relational calculus.
---

The acts

- `BinderSeed`,
- `BinderTransport`,
- `BinderApplication`, and
- `SubstitutionTerm`

implement (lambda)-abstraction and capture-avoiding substitution for terms in the
judgment calculus in the relational calculus.

In particular:

- abstractions are witnessed by binder acts over term bodies,
- substitution re-enters evaluation contexts without variable capture,
- the resulting behaviour matches the (beta)-rule of the external
  simply-typed lambda calculus when interpreted via the correspondence theorem.
