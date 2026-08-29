---
title: Judgment Binder
role: structure
derived_from:
- acts/binder-seed
proof_refs: []
introduces: structure
part-of: relational-computer
computer-system-type: primitive
---



Binder/abstraction structure for the judgment calculus, earned by binder acts
over term bodies.

## Components

- Binder seed introducing a binding for a term body.
- Transport of binders across contexts/terms.
- Application of binders to arguments (abstraction over term bodies).

## Proof

Sketch: `BinderSeed` introduces a binding; `BinderTransport` moves it through
contexts; `BinderApplication` applies it to arguments, yielding the abstraction
constructor for judgment terms.
