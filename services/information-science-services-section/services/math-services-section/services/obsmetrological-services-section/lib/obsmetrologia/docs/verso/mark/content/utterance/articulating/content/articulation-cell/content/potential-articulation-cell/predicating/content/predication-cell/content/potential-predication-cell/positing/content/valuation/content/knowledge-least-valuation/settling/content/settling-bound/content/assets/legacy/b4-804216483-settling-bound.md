---
name: settling-bound
description: "An ordinal λ that bounds the settling index of a family of predication-valuations. Settling steps τ range over τ < λ. The operational parameter that, together with the closure-ordinal κ, determines which regime a settlement lives in: κ < λ means the orbit quiesces strictly before the bound; κ ≥ λ means the orbit hits the bound without quiescing."
symbol: "λ"
derives-from: docs/dev/scraps/settling-bound.md
---

# Settling-bound

An ordinal `λ` that bounds the settling index of a family of predication-valuations. Settling steps `τ` range over `τ < λ`.

The bound provides a **size-theoretic ceiling** for the substrate: without it, a settlement is a proper class indexed by all ordinals, which complicates type-theoretic and computational handling. Fixing `λ` restricts the orbit to set-theoretic data while retaining flexibility for transfinite settlements.

## Typical choices

**`λ = ω`** — countable settlements indexed by the natural numbers. The natural setting for **Scott-continuous regimes**: every step is a finite ordinal, and the only limit ordinal is `ω` itself. Most concrete computational substrate work uses `λ = ω`.

**`λ = ω + 1`** — countable settlement with the `ω`-limit available as a settled-state index. Useful for distinguishing the limit-step value `v_ω` from successor values `v_n`. The bound is enough to ask "does the orbit quiesce at `ω`?" — a yes/no question that's `λ = ω`'s scope doesn't include since `ω ∉ {0, 1, 2, …}`.

**`λ` arbitrary fixed ordinal** — for transfinite-bounded settlings. The bound can be any countable ordinal `< ω₁` (for the transfinite-bounded regime) or any specific ordinal one wants the orbit to fit inside.

**`λ` unbounded** — for the aperiodic regime, where no countable `λ` is sufficient. Formally one takes `λ` large enough that the closure ordinal `κ` of the orbit is `< λ`; this requires `λ ≥ ω₁`. In practice for aperiodic settlements one fixes `λ = ω₁` (the smallest uncountable ordinal) — but the orbit doesn't quiesce within it; the bound just exists to make the settlement a set rather than a proper class.

## The interplay with closure-ordinal

The settlement's closure-ordinal `κ` (the least `τ` at which `F_U^{τ+1} = F_U^τ`) determines its regime; the settling-bound `λ` determines whether the orbit fits inside the substrate's typed index.

| Relationship | Meaning |
|---|---|
| `κ < λ` | orbit quiesces strictly inside the bound; settlement is well-defined and finished |
| `κ = λ` | orbit quiesces exactly at the bound; settlement is well-defined but the last step is the quiescent one |
| `κ > λ` | orbit hits the bound without quiescing; settlement is the truncated orbit; `v_{λ−1}` (or `lim_{τ<λ} v_τ`) is *not* a fixed point of the closure |

For a substrate to compute a meaningful settlement, one needs `κ ≤ λ` — the orbit must fit. For application work in the strict-finite regime, one typically picks `λ = ω` and trusts `κ < ω` from the rule-language fragment. For aperiodic work, `λ` must be at least `ω₁` and the orbit is treated as a partially-observed settlement (only finitely many steps are computed concretely).

## Position in the four-regime grammar

The bound's relation to `κ` is the **operational parameter** that places a settlement in its regime:

| Regime | Closure ordinal `κ` | Typical settling-bound `λ` |
|---|---|---|
| strict-finite | `κ < ω` | `λ = ω` (orbit quiesces well before bound) |
| Scott-continuous | `κ = ω` | `λ = ω + 1` (so `v_ω` is the quiescent step) |
| transfinite-bounded | `ω < κ < ω₁` | `λ = κ + 1` (smallest containing the orbit) |
| aperiodic | `κ ≥ ω₁` | `λ ≥ ω₁` (no orbit ever fits in a smaller bound) |

## Size-theoretic role

Without bounding by `λ`, the family `(v_τ)_τ` would be indexed by the proper class of all ordinals. The collection would not be a set; it would not have a domain type one can quantify over; and substrate operations like "the family is settling-monotone" or "settling-quiescence at `τ*`" would become quantification over a proper class — outside the substrate's set-theoretic discipline.

By fixing `λ`, the settlement family `(v_τ)_{τ<λ}` is a set: a function from the ordinal `λ` (a set) to the set of predication-valuations. All settlement operations are typed over this set.

The cost is that orbits with `κ > λ` are truncated. For the aperiodic regime, this is unavoidable: the orbit is genuinely larger than any set, and concrete substrate work only ever sees a `λ`-prefix.

## Position

`settling/hacking/library/settling-bound/`. Settling tier — the bound is a settling-tier parameter; every settlement is parameterized by `(L, C, E, λ)` with `λ` as one component.

## Derivation source

Adapted from `predication-categories/objects/settling-bound.md`, preserved at `docs/dev/scraps/`.
