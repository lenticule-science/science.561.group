---
name: settling-endofunctor
description: "Given a predication-hyperdoctrine E and an increment sequence U = (u_τ)_{τ<λ}, the 2-functor F_U: PrFib(C) → PrFib(C) on the 2-category of predication-fibrations defined by F_U(E)_τ := Cl(E) ∨_k u_τ. The orbit of F_U from the initial state IS the settlement."
symbol: "F_U"
realizes: [closure-drivenness]
depends-on: [closure-2-monad, predication-fibration, predication-hyperdoctrine, increment-sequence, knowledge-order]
derives-from: docs/dev/scraps/settling-endofunctor.md
---

# Settling endofunctor

Given a predication-hyperdoctrine `E` and an increment sequence `U = (u_τ)_{τ<λ}`, the **settling endofunctor**

$$F_U : \mathbf{PrFib}(\mathcal{C}) \to \mathbf{PrFib}(\mathcal{C})$$

on the 2-category of predication-fibrations is defined by

$$F_U(\mathcal{E})_\tau := \mathrm{Cl}(\mathcal{E}) \vee_k u_\tau,$$

where `Cl` is the closure 2-monad (downstream archive item) and `∨_k u_τ` is the fiberwise knowledge-order join with the increment at step `τ`.

## What it does at each step

At each settling step `τ`, the settling endofunctor:

1. **Saturates** under closure — applies `Cl` to derive all consequences of the current state.
2. **Merges** in new external evidence — knowledge-joins with the increment `u_τ`.

The closure step pushes the state to its current local fixed point; the merge step adds new content from outside. The alternation is the operational heart of settling.

## Orbits

The settling orbit of a settling-equipped predication-hyperdoctrine is the orbit of `F_U` from the initial state `v_0 = E`. That orbit IS a `settlement` (sibling object).

The orbit's closure ordinal `κ` (the least `τ` at which `F_U^{τ+1}(E) = F_U^τ(E)`) determines which regime category the settling inhabits, per the four-regime tower.

## Position

`settling/hacking/library/settling-endofunctor/`. Placed at settling tier as the morphism that operationally IS settling.

## Derivation source

Adapted from `predication-categories/morphisms/settling-endofunctor.md`, preserved at `docs/dev/scraps/`.
