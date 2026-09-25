---
type: transformer
status: active
source: Asm(K₁)
target: Eff
depends-on:
  - ../structures/k1.md
  - ../structures/eff.md
see-also:
  - ../prose/learning/claims/eff-is-minimum-level.md
references:
  - Carboni-Celia-Magno 1982
  - Hyland 1982
title: Exact completion
description: The exact completion is the construction
---

# Exact completion

The **exact completion** is the construction

$$\mathrm{ex}: \mathbf{Asm}(\mathcal{K}_1) \;\longrightarrow\; \mathbf{Eff}$$

that adjoins quotients of all equivalence relations to the assembly category $\mathbf{Asm}(\mathcal{K}_1)$, producing the full elementary topos $\mathbf{Eff} = RT(\mathcal{K}_1)$.

## The input: Asm(K₁)

The assembly category $\mathbf{Asm}(\mathcal{K}_1)$ has:
- Objects: *assemblies* $(X, \delta)$ — a set $X$ with a realizability relation $\delta: X \to \mathcal{P}(\omega)$, assigning to each element $x \in X$ a nonempty set $\delta(x) \subseteq \omega$ of realizers.
- Morphisms: functions $f: X \to Y$ tracked by a partial recursive function $r$ such that for all $x \in X$ and $a \in \delta(x)$: $r \cdot a \downarrow$ and $r \cdot a \in \delta(f(x))$.

$\mathbf{Asm}(\mathcal{K}_1)$ is a Turing category (it has a Turing object $\mathcal{K}_1$), a CCC with dominance (modest sets sit inside it), and supports denotational semantics for typed languages. But it is *not* an elementary topos: it lacks a subobject classifier — the exact completion step is precisely what produces $\Omega_{\mathbf{Eff}}$.

## The construction

The exact completion $\mathrm{ex}(\mathcal{C})$ of a category $\mathcal{C}$ with finite limits adds quotients of all *pseudo-equivalence relations* (pairs of morphisms satisfying the equivalence relation axioms up to isomorphism). For $\mathcal{C} = \mathbf{Asm}(\mathcal{K}_1)$:

1. Objects of $\mathbf{Eff}$ are equivalence classes of assemblies under the realizability equivalence relation.
2. Morphisms are equivalence classes of tracked functions under realizability equivalence.
3. The subobject classifier $\Omega_{\mathbf{Eff}} \cong \{\text{r.e. sets}\}/{\sim}$ arises as the quotient of the "assembly of r.e. propositions" by realizability equivalence — the exact step that is unavailable in $\mathbf{Asm}$ itself.

## What the completion adds

The exact completion adds exactly what is needed for $\mathbf{Eff}$ to be an elementary topos:
- A subobject classifier $\Omega_{\mathbf{Eff}}$ (condition 1 for internal logic)
- Internal first-order quantification (via $\Omega_{\mathbf{Eff}}$)
- Kleene's second recursion theorem as an internal theorem (via the Turing object of $\mathbf{Asm}$ lifted through the completion)

These are precisely the three conditions required for $\mathbf{Eff}$ to internally prove halting undecidability and Rice's theorem. See [eff-is-minimum-level](../concepts/eff-is-minimum-level.md).

## Universality

The exact completion is universal: for any regular category $\mathcal{D}$ (a category with finite limits and active image factorizations), a left exact functor $\mathbf{Asm}(\mathcal{K}_1) \to \mathcal{D}$ extends uniquely (up to natural isomorphism) to a regular functor $\mathbf{Eff} \to \mathcal{D}$. This makes $\mathbf{Eff}$ the canonical regular completion of the computability structure.
