---
type: example
status: current
depends-on: [untyped-lambda-calculus, beta-reduction, normalization, simply-typed-lambda-calculus]
---

# The Y combinator (and why STLC rejects it)

The **Y combinator** is the canonical fixed-point combinator of the [untyped-lambda-calculus](../../../../glossary/terms/untyped-lambda-calculus.md):

$$
Y \;=\; \lambda f.\,(\lambda x.\,f\;(x\;x))\;(\lambda x.\,f\;(x\;x)).
$$

Its defining property: for any term $g$, $Y\;g \to_\beta^* g\;(Y\;g)$. The combinator feeds a function its own fixed point, enabling recursion *without naming the recursive function*.

## How it works

By [beta-reduction](../../../../glossary/terms/beta-reduction.md):

$$
Y\;g = (\lambda f.\,(\lambda x.\,f\;(x\;x))\;(\lambda x.\,f\;(x\;x)))\;g \to_\beta (\lambda x.\,g\;(x\;x))\;(\lambda x.\,g\;(x\;x))
$$
$$
\to_\beta g\;((\lambda x.\,g\;(x\;x))\;(\lambda x.\,g\;(x\;x))) = g\;(Y\;g)\;\text{(unfolding the definition)}.
$$

Iterating produces $Y\;g \to_\beta^* g\;(g\;(g\;(\ldots\;(g\;(Y\;g))\ldots)))$ for any depth. Recursive functions are then defined by their fixed-point equations — factorial as $\mathrm{fact} = Y\;(\lambda f.\,\lambda n.\,\mathrm{if}\;n=0\;\mathrm{then}\;1\;\mathrm{else}\;n \cdot f(n-1))$.

## Why STLC rejects it

The Y combinator has *no [simply-typed-lambda-calculus](../../../../glossary/terms/simply-typed-lambda-calculus.md) type*. To see this, suppose $Y : (A \to A) \to A$. Then $\lambda x.\,f\;(x\;x)$ has type $B \to A$ for some $B$, and inside, $x\;x$ requires $x : B$ and $x : B \to A$, forcing $B = B \to A$ — a fixed-point equation on types that has no solution in STLC's recursion-free type grammar.

This is *exactly* the contrapositive of [strong-normalization-stlc](../../research-articles/strong-normalization-stlc.md): if Y were STLC-typeable, then for any $g$, $Y\;g \to_\beta^* g\;(Y\;g) \to_\beta^* g\;(g\;(Y\;g)) \to_\beta^* \cdots$ would be a non-terminating reduction of a well-typed term, contradicting strong [normalization](../../../../glossary/terms/normalization.md).

## What this exhibits

- *Why typing rules out recursion*. The simplest typed calculi cannot type fixed-point combinators because typing is a finiteness constraint and fixed points are infinitary.
- *How richer type systems recover recursion*. PCF (Plotkin's typed lambda calculus) adds an explicit `fix : (A \to A) \to A` constant — recovering general recursion at the cost of strong normalization. [Dependent-type-theory](../../../../glossary/terms/dependent-type-theory.md) admits *well-founded* recursion (every recursive call must be on a structurally smaller argument) — recovering some recursion while preserving normalization.
- *The trade-off named.* Turing-completeness, normalization — choose one. The untyped calculus chooses Turing-completeness; STLC chooses normalization; PCF chooses Turing-completeness; MLTT chooses normalization-with-well-founded-recursion as a compromise.
