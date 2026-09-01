---
symbol: Δ[s]
type: "[../../mathematics/objects/sets/terms/function](../../documents/articles/notes/function.md)"
function-type: "[pointwise constraint predicate](pointwise constraint predicate)"
domains:
  - "[completed constraint function](completed constraint function)"
  - "[constraint domain](constraint domain)"
codomain: "[boolean](boolean)"
induced by:
  - "[constraint completion function](constraint completion function)"
induces:
  - "[differential accumulation function](differential accumulation function)"
---

The ***semantic differentiation function*** (`Δ[s]`) is [induce|induced](induce|induced) by the [constraint completion function](constraint completion function) (`Ω`) and [constrain|constrains](constrain|constrains) whether two stabilized points remain **irreducibly distinct** under constraint completion.

It evaluates **semantic difference** *after completion* —
meaning: ***difference that persists even after all local modulation has stabilized.***

Let `Ω` be the [completed constraint function](completed constraint function)
Let `x, x′ ∈ dom(Ω)`

Then:
> Δ[s](x, x′) := (x ≠ x′) ∧ (Ω(x) = x) ∧ (Ω(x′) = x′)

That is, `Δ[s]` returns true when:
- Both `x` and `x′` are stabilized under `Ω`,
- And yet they remain ***modally distinct*** — not collapsed into one identity under constraint.

This function identifies:
- Residual contrast
- Stabilized non-equivalence
- Structural identity divergence within completed domains
