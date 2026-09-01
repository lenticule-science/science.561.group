---
type: concept
class: moduli-substratum
depends-on: [coarse-settling-moduli, visible-automorphism-quotient, predicate-generator-exhaustiveness]
---

# Rigid moduli point

A point of the [coarse settling moduli](../objects/coarse-settling-moduli.md) whose natural visible-automorphism group is trivial.

A moduli point $[v] \in |\mathrm{KP}^{\mathrm{vis}}(B)|$ is **rigid** iff

$$\mathrm{Aut}^{\mathrm{vis}}_{\mathrm{nat}}(v) \;=\; \{1\}.$$

The rigid substratum within each regime is

$$|\mathrm{KP}^{\mathrm{vis}}(B)|_X^{\mathrm{rig}} \;:=\; \{[v] \in |\mathrm{KP}^{\mathrm{vis}}(B)|_X \,:\, \mathrm{Aut}^{\mathrm{vis}}_{\mathrm{nat}}(v) = \{1\}\}.$$

By the natural-version of [settling-automorphism decomposition](../theorems/settling-automorphism-decomposition.md) (see the naturality remark there) and [visible automorphism sources](../theorems/visible-automorphism-sources.md), a moduli point is rigid iff every natural automorphism of $v$ is invisible — i.e., fixes every newly-designated cell.

## When rigidity occurs

Typical of settlings whose newly-designated cells are pointwise-distinguishing. The [transfinite-induction settling](../examples/transfinite-induction-settling.md) is a rigid aperiodic point ([transfinite-induction rigidity](../theorems/transfinite-induction-rigidity.md)): every settling-stage designates a unique diagonal cell, so every auto fixes the diagonal pointwise, so visible auto is trivial.

More generally: settlings whose newly-designated-cell set has trivial $\mathrm{Sym}(E)$-stabilizer and no swap-symmetric off-diagonal pairs are rigid.

## Contrast with orbifold

The complement within each regime stratum is the [orbifold moduli point](orbifold-moduli-point.md) substratum, where some natural automorphism source contributes non-trivially to the visible quotient.
