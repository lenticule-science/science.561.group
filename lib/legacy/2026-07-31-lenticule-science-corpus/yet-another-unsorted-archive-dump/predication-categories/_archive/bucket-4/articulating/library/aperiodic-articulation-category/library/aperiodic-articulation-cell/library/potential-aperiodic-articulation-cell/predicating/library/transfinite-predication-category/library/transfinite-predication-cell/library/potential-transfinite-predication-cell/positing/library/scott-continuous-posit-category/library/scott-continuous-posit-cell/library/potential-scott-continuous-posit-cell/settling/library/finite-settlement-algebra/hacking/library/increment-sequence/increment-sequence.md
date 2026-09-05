---
name: increment-sequence
description: "A family U = (u_τ)_{τ<λ} indexed by a settling-bound, where each u_τ is a C-natural predication-valuation. The input data driving a closure-driven settlement: each u_τ supplies new evidence introduced at settling step τ."
symbol: "U"
realizes: [evidence]
depends-on: [predication-valuation, settling-bound, predicate-category]
derives-from: docs/dev/scraps/increment-sequence.md
---

# Increment sequence

A family `U = (u_τ)_{τ<λ}` indexed by a settling-bound `λ`, where each `u_τ` is a predication-valuation that is **`C`-natural** — that is,

$$f^*(u_\tau(p)) = u_\tau(q)$$

for every morphism `f: q → p` in the predicate-category `C`.

## What it drives

The increment sequence is the **input data** driving a closure-driven settlement. Each `u_τ` supplies the new evidence introduced at settling step `τ`, joined into the previous settling state and then closed under the closure operator:

$$v_{\tau+1}(p) = \mathrm{cl}_p\bigl(v_\tau(p) \vee_k u_{\tau+1}(p)\bigr).$$

## Why this is positing-tier

Each `u_τ` is a posit: it is an externally-issued claim about cell values that gets injected into the settling. The increment-sequence is the *time-indexed sequence of posits* that drives a settling. Positing tier is therefore its operational home: positing IS the act of issuing increments.

The settling-tier closure-operator THEN takes the posited increments and closes them. The split between positing-side (`u_τ`) and settling-side (`cl_p`) is the operational division at this stage of the chain.

## Position

`scott-continuous-posit-category/hacking/library/increment-sequence/`. Positing tier.

## Derivation source

Adapted from `predication-categories/objects/increment-sequence.md`, preserved at `docs/dev/scraps/`.
