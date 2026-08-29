---
title: Normalise Admissible Morphism
id: normalise-admissible
role: operator
status: plan
derived_from:
- acts/normalize-strongly
inputs: []
outputs: []
transformation:
- return
- value
proof_refs: []
---


# Normalise Admissible Morphism

Operator `N∞ : Adm → Adm` mapping admissible morphisms to canonical normal
forms as defined in [`Admissible Normal Form`](docs/math/structure/admissible-normal-form.md).

## Statement

- Termination: every `f ∈ Adm` rewrites to `N∞(f)` under the earned rewrite relation.
- Confluence: normal form is unique up to coherent cells.
- Factorisation: `f_nf = m* ∘ e*` with maximal generative part `e*` and minimal
  observational part `m*`, no further rewrites apply.

## Proof

Sketch: follows from the earned strong normalization/reducibility acts; define
`N∞` by normalising and collapsing via the admissible normal-form structure.
