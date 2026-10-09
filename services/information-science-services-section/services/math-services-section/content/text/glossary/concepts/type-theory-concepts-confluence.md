---
type: concept
class: rewriting-property
status: current
depends-on: [beta-reduction]
title: Confluence
description: Confluence (also called the Church-Rosser property) is the property of a rewriting system that any two reductions of the same term can be brought back together.
---

# Confluence

*Confluence* (also called the *Church-Rosser property*) is the property of a rewriting system that any two reductions of the same term can be brought back together. Formally, $\to$ is confluent iff whenever $M \to^* M_1$ and $M \to^* M_2$, there exists $M'$ with $M_1 \to^* M'$ and $M_2 \to^* M'$.

For the [untyped-lambda-calculus](../../documents/articles/research/2026/07/31/lenticule-import/objects/untyped-lambda-calculus.md) under [beta-reduction](../terms/beta-reduction.md), confluence is the [church-rosser](../../documents/articles/research-articles/church-rosser.md) theorem. Its immediate corollary is that [beta-normal forms](../../documents/articles/research/2026/07/31/lenticule-import/_archive/normalization.md) are unique up to [alpha-equivalence](../terms/alpha-equivalence.md): a term has at most one normal form, regardless of which reduction strategy reaches it.

## Position

Confluence is what makes the equivalence relation $=_\beta$ well-behaved: $M =_\beta N$ iff $M$ and $N$ reduce to a common term. Confluence is *independent* of [normalization](../../documents/articles/research/2026/07/31/lenticule-import/_archive/normalization.md): the untyped calculus is confluent but not normalizing; a typed calculus is typically both. Loss of confluence usually indicates that the rewrite system is ambiguous about which redex to fire — a problem that becomes acute when adding [eta-equivalence](../terms/eta-equivalence.md) or pattern-matching reductions. Reference: [Barendregt 1984](../../documents/articles/research/2026/07/31/lenticule-import/_archive/references/barendregt1984.md) §3.2, [Sørensen & Urzyczyn 2006](../../documents/articles/bibliographies/sorensen-urzyczyn2006.md) §1.5.
