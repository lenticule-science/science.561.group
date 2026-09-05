---
type: example
depends-on: [coarse-settling-moduli, natural-number-successor-settling, moduli-classifying-function, rigid-moduli-point, four-regime-dichotomy]
instantiates: [coarse-settling-moduli, rigid-moduli-point]
lineage: 3
---

# Scott-continuous natural-number moduli

A [coarse settling moduli](../objects/coarse-settling-moduli.md) point in [Scott-continuous regime](../theorems/four-regime-dichotomy.md) — the [natural-number successor settling](natural-number-successor-settling.md) viewed as a moduli point. **Lineage 3** instance for the moduli stack chapter.

## Base

$\mathbf{L} = \mathbf{2}$, [entity set](../objects/entity-set.md) $E = \mathbb{N}$, [predicate category](../objects/predicate-category.md) one-object on $P$, [settling bound](../objects/settling-bound.md) $\lambda = \omega + 1$, with closure restricted to Scott-continuous rules.

## Regime

The Scott-continuous regime ($\kappa \leq \omega$).

## The moduli point

Initial state $v_0(P)(0, 0) = \mathbf{t}$, closure rule $P(n, n) \Rightarrow P(n + 1, n + 1)$. Quiescent at $\omega$ with diagonal $\{(k, k) : k \in \mathbb{N}\}$ all $\mathbf{t}$.

## Classifying datum

The [settling-associated sheaf](../objects/settling-associated-sheaf.md) has one generator per stage $\tau \in \mathbb{N}$ — the newly-designated cell $(\tau, \tau)$. The [moduli classifying function](../morphisms/moduli-classifying-function.md) records the sheaf-iso class: "one new diagonal cell per successor stage, stabilizing at $\omega$."

## Visible automorphisms

- $\mathrm{Sym}(\mathbb{N})$-stabilizer: trivial. Each $\alpha \in \mathbb{N}$ is distinguished by its settling-stage of designation.
- Fiber-swap: fixes the diagonal pointwise, hence acts trivially on $\mathcal{F}_U$. Invisible.
- Predicate-automorphism: trivial ($\mathcal{C}$ one-object).
- Gauge: never visible (by [visible automorphism sources](../theorems/visible-automorphism-sources.md)).

So $\mathrm{Aut}^{\mathrm{vis}}_{\mathrm{nat}}(v) = \{1\}$. [Rigid](teaching/explanations/rigid-moduli-point.md) Scott-continuous point.

## Place in the moduli

This MLD-class is one point of the Scott-continuous stratum $|\mathrm{KP}^{\mathrm{vis}}(B)|_B$. The full count of Scott-continuous classes over this base would require enumerating Scott-continuous closure operators on $E = \mathbb{N}$, which is combinatorially rich — different finitary inference rule systems produce different settlings, each with its own MLD-class. Not attempted here; the present example identifies one canonical point.

## Role

Demonstrates that Scott-continuous moduli points are well-defined and have well-defined visible-auto structure (rigid in this case). Spatial infinity ($|E| = \aleph_0$) without temporal infinity ($\kappa \leq \omega$): typical of standard knowledge-representation systems with finitary inference.
