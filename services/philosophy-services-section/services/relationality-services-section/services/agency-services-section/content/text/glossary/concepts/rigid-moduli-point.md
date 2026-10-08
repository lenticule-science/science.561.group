---
type: concept
class: moduli-substratum
depends-on: [coarse-settling-moduli, visible-automorphism-quotient, predicate-generator-exhaustiveness]
title: Rigid moduli point
description: A point of the coarse settling moduli whose natural visible-automorphism group is trivial.
---

# Rigid moduli point

A point of the [coarse settling moduli](../../documents/articles/notes/undated/coarse-settling-moduli.md) whose natural visible-automorphism group is trivial.

A moduli point $[v] \in |\mathrm{KP}^{\mathrm{vis}}(B)|$ is **rigid** iff

$$\mathrm{Aut}^{\mathrm{vis}}_{\mathrm{nat}}(v) \;=\; \{1\}.$$

The rigid substratum within each regime is

$$|\mathrm{KP}^{\mathrm{vis}}(B)|_X^{\mathrm{rig}} \;:=\; \{[v] \in |\mathrm{KP}^{\mathrm{vis}}(B)|_X \,:\, \mathrm{Aut}^{\mathrm{vis}}_{\mathrm{nat}}(v) = \{1\}\}.$$

By the natural-version of [settling-automorphism decomposition](../../documents/articles/notes/undated/settling-automorphism-decomposition.md) (see the naturality remark there) and [visible automorphism sources](../../../../../../../logic-services-section/content/text/glossary/concepts/visible-automorphism-sources.md), a moduli point is rigid iff every natural automorphism of $v$ is invisible — i.e., fixes every newly-designated cell.

## When rigidity occurs

Typical of settlings whose newly-designated cells are pointwise-distinguishing.
The [transfinite-induction settling](../../documents/articles/research/2026/07/31/lenticule-import/animating/content/becoming/doing/working/governing/knowing/content/spatiotemporal-knowledge-presheaf/content/settling-fiber-groupoid/content/visible-settling-fiber-groupoid/content/coarse-settling-moduli/content/examples/transfinite-induction-settling.md) is a rigid aperiodic point ([transfinite-induction rigidity](../../../../../../../../../information-science-services-section/services/math-services-section/services/obsmetrological-services-section/lib/obsmetrologia/docs/verso/mark/content/utterance/articulating/content/articulation-cell/content/potential-articulation-cell/predicating/content/predication-cell/content/potential-predication-cell/positing/content/valuation/content/knowledge-least-valuation/settling/references/transfinite-induction-rigidity.md)): every settling-stage designates a unique diagonal cell, so every auto fixes the diagonal pointwise, so visible auto is trivial.

More generally: settlings whose newly-designated-cell set has trivial $\mathrm{Sym}(E)$-stabilizer and no swap-symmetric off-diagonal pairs are rigid.

## Contrast with orbifold

The complement within each regime stratum is the [orbifold moduli point](orbifold-moduli-point.md) substratum, where some natural automorphism source contributes non-trivially to the visible quotient.
