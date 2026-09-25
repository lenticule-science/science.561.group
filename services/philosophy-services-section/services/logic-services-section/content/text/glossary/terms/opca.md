---
type: structure
status: active
depends-on:
  - pca.md
see-also:
  - eff.md
  - ../prose/learning/claims/opca-equivalent-to-reat.md
  - ../code/transformers/applicative-morphism.md
references:
  - Hofstra-van Oosten 2003
  - van Oosten 2008
title: oPCA — Ordered Partial Combinatory Algebra
description: "An ordered partial combinatory algebra (oPCA) is a PCA $(A, \\cdot)$ equipped with a preorder $\\leq$ on $A$ such that application is monotone:"
---

# oPCA — Ordered Partial Combinatory Algebra

An **ordered partial combinatory algebra** (oPCA) is a PCA $(A, \cdot)$ equipped with a preorder $\leq$ on $A$ such that application is monotone:

$$a \leq a',\; b \leq b' \;\Rightarrow\; a \cdot b \leq a' \cdot b' \quad (\text{wherever } a \cdot b \text{ is defined})$$

with the combinators $k$ and $s$ serving as realizers for monotonicity and substitution under the order.

## Ordered applicative morphisms

A morphism in $\mathbf{oPCA}$ is an *ordered applicative morphism* $\gamma: (A, \leq_A) \to (B, \leq_B)$: a monotone function $\gamma: A \to B$ tracked by a realizer $r \in B$ satisfying

$$r \cdot \gamma(a) \cdot \gamma(b) \leq_B \gamma(a \cdot b) \quad \text{wherever } a \cdot b \text{ is defined}$$

The realizer $r$ tracks $\gamma$ in the sense that applying $r$ in $B$ to the images of any application in $A$ lands below the image of the result.

## Why oPCA is the right morphism notion

The plain functor $RT: \mathbf{PCA} \to \mathbf{TOP}$ (sending PCAs to realizability toposes via plain applicative morphisms) is not full: there exist geometric morphisms between realizability toposes not induced by any plain applicative morphism.

The ordered version $RT: \mathbf{oPCA} \to \mathbf{TOP}$ is fully faithful on morphism-sets: every geometric morphism $RT(A) \to RT(B)$ arises from a unique (up to preorder equivalence) ordered applicative morphism $A \to B$. This is the Hofstra-van Oosten theorem (2003); see [opca-equivalent-to-reat](../concepts/opca-equivalent-to-reat.md).

## The order on K₁

$\mathcal{K}_1$ carries its canonical order: $a \leq_{\mathcal{K}_1} b$ iff $\varphi_a \subseteq \varphi_b$ (as partial functions — $b$ is at least as defined as $a$ and agrees with $a$ where $a$ is defined). This makes $\mathcal{K}_1$ an oPCA; the oPCA-morphisms out of $(\mathcal{K}_1, \subseteq)$ are exactly the ordered applicative morphisms that give geometric morphisms out of $\mathbf{Eff}$.

## Scope

$\mathbf{oPCA} \simeq \mathbf{ReaT}$ is complete for realizability-based computational paradigms: all geometric morphisms between realizability toposes are oPCA-morphisms. But it does not reach:
- The nominal-sets topos $\mathbf{Sets}^{\mathbf{I}}$ (no realizability structure)
- Game-semantic categories (no Turing object, no realizability structure)
- Concurrent games with symmetry $\mathbf{CGS}$ (the ambient structure for the typed theory)

The transition from oPCA to the typed world goes through the Dialectica embedding and the functor $F: \mathbf{Dial}(\mathbf{Eff}) \to \mathbf{CGS}$.
