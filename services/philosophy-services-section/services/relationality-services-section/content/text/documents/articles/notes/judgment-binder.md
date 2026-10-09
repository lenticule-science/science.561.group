---
title: Judgment Binder
id: judgment-binder
role: structure
status: plan
proof_refs: []
derives-from:
  - acts/binder-seed
description: Binder/abstraction structure for the judgment calculus, earned by binder acts over term bodies.
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
