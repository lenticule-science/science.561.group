---
type: theorem
status: proved
depends-on: [untyped-lambda-calculus, beta-reduction, confluence, beta-reduction-step]
title: Church-Rosser theorem
description: "In the untyped-lambda-calculus under beta-reduction, $\\to\\beta$ is confluent: whenever $M \\to\\beta^ M1$ and $M \\to\\beta^ M2$, there exists a term $M'$ with $M1 \\to\\beta^ M'$ and $M2 \\to\\beta^ M'$."
---

# Church-Rosser theorem

In the [untyped-lambda-calculus](../../documents/articles/research/2026/07/31/lenticule-import/objects/untyped-lambda-calculus.md) under [beta-reduction](../terms/beta-reduction.md), [$\to_\beta$](../terms/beta-reduction-step.md) is *confluent*: whenever $M \to_\beta^* M_1$ and $M \to_\beta^* M_2$, there exists a term $M'$ with $M_1 \to_\beta^* M'$ and $M_2 \to_\beta^* M'$.

## Proof sketch

The standard proof is via the *Tait–Martin-Löf parallel reduction* relation $\Rightarrow$ which contracts any set of disjoint redexes simultaneously. Three lemmas suffice:

1. $M \to_\beta N \Rightarrow M \Rightarrow N$ and $M \Rightarrow N \Rightarrow M \to_\beta^* N$ — so $\Rightarrow^* = \to_\beta^*$.
2. $\Rightarrow$ has the *diamond property*: if $M \Rightarrow M_1$ and $M \Rightarrow M_2$, there is $M'$ with $M_1 \Rightarrow M'$ and $M_2 \Rightarrow M'$, by contracting in $M_1$ the residuals of the redexes contracted to reach $M_2$.
3. The diamond property of $\Rightarrow$ lifts to confluence of $\Rightarrow^* = \to_\beta^*$.

Combining gives confluence of $\to_\beta$. $\square$

## Corollaries

- *Uniqueness of normal forms*: if a term has a [β-normal form](../../documents/articles/research/2026/07/31/lenticule-import/_archive/teaching/explanations/normalization.md), it is unique up to [alpha-equivalence](../terms/alpha-equivalence.md).
- *Soundness of $=_\beta$*: $M =_\beta N$ iff $M$ and $N$ have a common reduct, so β-equivalence is decidable for normalizing terms.
- *Independence of reduction strategy*: every reduction order that reaches a normal form reaches the *same* one.

## Remarks

Church-Rosser is the structural result that makes the [untyped-lambda-calculus](../../documents/articles/research/2026/07/31/lenticule-import/objects/untyped-lambda-calculus.md) usable as a model of computation despite its lack of [normalization](../../documents/articles/research/2026/07/31/lenticule-import/_archive/teaching/explanations/normalization.md): even when reduction may diverge, *whatever* answer is reached is canonical. Confluence alone is not enough for decidable equality (you need normalization too), but it is enough to rule out the calculus as ambiguous about results. Reference: [Barendregt 1984](../../documents/articles/research/2026/07/31/lenticule-import/_archive/references/barendregt1984.md) §3.2, [Hindley 2008](../../documents/articles/bibliographies/hindley2008.md) Ch. 3.
