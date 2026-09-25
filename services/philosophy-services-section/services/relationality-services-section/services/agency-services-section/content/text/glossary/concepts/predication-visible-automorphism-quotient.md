---
type: concept
class: quotient-group
symbol: "\\mathrm{Aut}^{\\mathrm{vis}}(v)"
depends-on: [invisible-automorphism-subgroup, settling-automorphism-1-truncation, settling-associated-sheaf]
title: Visible automorphism quotient
description: For a settling $v$ with settling-automorphism group $\mathrm{Aut}^\simeq(v)$ and invisible subgroup $N(v)$, the visible automorphism quotient is
---

# Visible automorphism quotient

For a settling $v$ with [settling-automorphism](../../documents/articles/notes/undated/settling-automorphism-1-truncation.md) group $\mathrm{Aut}^\simeq(v)$ and [invisible subgroup](../../../../../../../logic-services-section/content/text/glossary/concepts/invisible-automorphism-subgroup.md) $N(v)$, the **visible automorphism quotient** is

$$\mathrm{Aut}^{\mathrm{vis}}(v) \;:=\; \mathrm{Aut}^\simeq(v) / N(v).$$

This is the group of automorphisms modulo those that act trivially on the [settling-associated sheaf](../../../../../../../../../../../engineering-services-section/services/computer-engineering-services-section/services/computer-systems-engineering-services-section/services/agent-computer-system-engineering-services-section/apps/agentic-relation-engine/lib/relating/docs/settling-associated-sheaf.md) — equivalently, the group of automorphism-induced actions on $\mathcal{F}_U$ itself.

## Why singled out

The cohomological invariants — including the [aperiodic classifying invariant](../../documents/articles/research/2026/07/31/lenticule-import/animating/content/becoming/doing/working/governing/knowing/content/spatiotemporal-knowledge-presheaf/content/settling-fiber-groupoid/content/invisible-automorphism-subgroup/content/visible-automorphism-quotient/objects/aperiodic-classifying-invariant.md) — are $N$-invariant by construction, hence well-defined on the quotient. But the visible quotient matters more than this: the [visible settling fiber groupoid](../../documents/articles/notes/undated/visible-settling-fiber-groupoid.md) used as the primary moduli object has $\mathrm{Aut}^{\mathrm{vis}}(v)$ at each point rather than the full $\mathrm{Aut}^\simeq(v)$, giving simpler automorphism groups for stack-theoretic purposes.

The fine moduli — retaining the full $\mathrm{Aut}^\simeq(v)$ including the large invisible subgroup — is recorded as a secondary structure.

## What contributes

Under the naturality hypothesis, the [visible automorphism sources theorem](../../../../../../../logic-services-section/content/text/glossary/concepts/visible-automorphism-sources.md) characterizes which sources of automorphisms contribute non-trivially to $\mathrm{Aut}^{\mathrm{vis}}(v)$: gauge never contributes (it fixes cell positions), while fiber-swap, entity-permutation, and predicate-automorphism contribute exactly when they both stabilize $v$ and permute newly-designated cells non-trivially.

For [rigid moduli points](rigid-moduli-point.md), $\mathrm{Aut}^{\mathrm{vis}}_\mathrm{nat}(v) = \{1\}$. For [orbifold moduli points](orbifold-moduli-point.md), it is non-trivial. Both cases occur in concrete examples.
