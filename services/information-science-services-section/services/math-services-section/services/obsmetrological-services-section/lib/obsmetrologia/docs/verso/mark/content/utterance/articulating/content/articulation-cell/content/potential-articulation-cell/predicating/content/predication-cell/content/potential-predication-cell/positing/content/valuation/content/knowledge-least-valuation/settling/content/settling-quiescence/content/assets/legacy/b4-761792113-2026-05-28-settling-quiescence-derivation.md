---
title: "Settling quiescence derivation, from the predication-categories archive"
date: 2026-05-28
draws-from: "docs/dev/scraps/settling-quiescence.md"
---

## What settling is doing when it quiesces

A predication settling `v = (v_τ)_{τ < λ}` is **quiescent at τ\*** when for every predicate `p` and every `τ` with `τ* ≤ τ < λ`,

$$v_τ(p) \;=\; v_{τ^*}(p).$$

That is: the settling stops changing at step `τ*` and remains identical to its `τ*`-value through the rest of the settling bound `λ`. The closure operator has reached a fixed point at `τ*`.

This is the formal definition of "settled."

## Why settling-quiescence is settling's own predicate

Settling is the morphism that takes a posit-cell and closes it toward a fixed point. The act terminates exactly when quiescence is reached. Settling-quiescence is therefore NOT a downstream concept that settling produces — it IS what settling is doing, internally, by definition.

In current grammar, the finite-step regime (`finite-settlement-algebra`, κ < ω) is the regime where quiescence is reached in finitely many steps. The Scott-continuous regime (the level immediately above) reaches quiescence at step ω. The transfinite-bounded regime reaches it at some ω < κ < ω₁. The aperiodic regime never reaches it. The four-regime tower is exactly the stratification by *when settling quiesces*.

## Realization in the Lakotaean content

The settling-tier Lakotaean concept `wicozani-as-quiescence` (now at `…/finite-settlement-algebra/hacking/library/wicozani-as-quiescence/`) names the *cultural* realization of this mathematical condition: wicozani is the well-being state of relational cells that have reached quiescence. The mathematical concept and the Lakotaean concept refer to the same structure at different levels of description — the mathematical concept is the formal definition; the Lakotaean concept is the lived form the definition takes in the Lakotaean tradition.

## Move log

- `settling-quiescence.md` preserved at `docs/dev/scraps/settling-quiescence.md`. Its `depends-on: [predication-settling, settling-bound]` — both are downstream archive items.
- The archive lived at `predication-categories/concepts/settling-quiescence.md` as a generic concept. In current grammar, settling-quiescence is internal to the act of settling itself, so it lives at the `settling/` morphism level rather than under a generic concepts directory.
