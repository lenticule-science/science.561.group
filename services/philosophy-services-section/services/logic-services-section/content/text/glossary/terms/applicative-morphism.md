---
type: transformer
status: active
source: pca
target: pca
depends-on:
  - ../structures/pca.md
see-also:
  - ../structures/opca.md
  - ../prose/learning/claims/opca-equivalent-to-reat.md
references:
  - van Oosten 2008
  - Hofstra-van Oosten 2003
title: Applicative morphism
description: "An applicative morphism $\\gamma: A \\to B$ between PCAs is a function $\\gamma: A \\to B$ tracked by a realizer $r \\in B$ satisfying:"
---

# Applicative morphism

An **applicative morphism** $\gamma: A \to B$ between PCAs is a function $\gamma: A \to B$ tracked by a realizer $r \in B$ satisfying:

$$r \cdot \gamma(a) \cdot \gamma(b) \simeq \gamma(a \cdot b) \quad \text{wherever } a \cdot b \text{ is defined}$$

*Read*: the image of an application in $A$ is computable (tracked by $r$) from the images of the arguments — the application $a \cdot b$ in $A$ can be simulated in $B$ by applying $r$ to $\gamma(a)$ and $\gamma(b)$.

## What it gives

An applicative morphism $\gamma: A \to B$ induces a functor from $A$-assemblies to $B$-assemblies: send $(X, \delta)$ (set $X$ with $A$-realizability relation $\delta \subseteq X \times A$) to $(X, \gamma \circ \delta)$ ($B$-realizability via $\gamma$). This functor is the inverse image of a geometric morphism $RT(A) \to RT(B)$ between realizability toposes (van Oosten 2008, Theorem 3.5.3).

## The gap: plain applicative morphisms miss geometric morphisms

The functor $RT: \mathbf{PCA} \to \mathbf{TOP}$ sending $\gamma \mapsto (RT(\gamma): RT(A) \to RT(B))$ is not full: there exist geometric morphisms between realizability toposes not induced by any plain applicative morphism.

The fix is to pass to **ordered applicative morphisms** in $\mathbf{oPCA}$: see [opca](opca.md). The ordered version $RT: \mathbf{oPCA} \to \mathbf{TOP}$ is fully faithful.

## The example: K₁ → K₂

An applicative morphism $\gamma: \mathcal{K}_1 \to \mathcal{K}_2$ exists (every partial recursive function is computable by a continuous function on Baire space), inducing a geometric morphism $\mathbf{Eff} \to RT(\mathcal{K}_2)$ — the embedding of discrete computation into continuous computation. No morphism exists in the reverse direction: $\mathcal{K}_2$-realizable total functions include non-recursive functions.
