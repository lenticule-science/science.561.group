---
type: "[pointwise closure operator](pointwise closure operator)"
domains:
  - "[constraint function](constraint function)"
  - "[stabilization set](stabilization set)"
codomain: "[completed constraint function](completed constraint function)"
aliases:
  - Ω
induced by:
  - "[recursive constraint closure predicate](recursive constraint closure predicate)"
induces:
  - "[constraint geodesic function](constraint geodesic function)"
  - "[symbolic desire resolution function](symbolic desire resolution function)"
---

The ***constraint completion function*** (`Ω`) is [induce|induced](induce|induced) by the [recursive constraint closure predicate](recursive constraint closure predicate) (`∈_S`) and [constrain|constrains](constrain|constrains) the [maximal extension](maximal extension) of a [constraint function](constraint function) consistent with a [stabilization set](stabilization set) (`S`).

> Let `C` be a [constraint function](constraint function) defined over a [constraint domain](constraint domain) `D`.
> Let `S ⊆ D` be the [stabilization set](stabilization set):
>  `S := { x ∈ D | C(x) = x }`
> Define:
>  `C′ ∈_S ⇔ ∀ x ∈ S: C′(x) = C(x)`
> Then:
>  `Ω := ⋃ { C′ | C′ ∈_S }`
>    `:=` the least upper bound (LUB) of all `C′` consistent with `C` over `S`
> Such that:
> - ∀ x ∈ S: `Ω(x) = C(x)`
> - ∀ x ∉ S: `Ω(x) = lim_{ε→0} sup { C′(x) | C′ ∈_S ∧ x ∈ dom(C′) }`

That is, `Ω` is the [constraint completion function|maximally extended constraint function](constraint completion function|maximally extended constraint function)
that remains [recursive consistency|recursively consistent](recursive consistency|recursively consistent) with all [constraint behavior](constraint behavior) on the [stabilization set](stabilization set) `S`.
