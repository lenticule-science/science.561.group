---
name: settlement-moduli-prestack
description: "The pseudo-functor B^op → Gpd sending each base (L, C, E, λ) to its visible-settlement-fiber-groupoid. Equivalently, the fibered category ∫ M^pre → B whose fiber over B is KP^vis(B). The substrate's moduli classifier for settlements, before stackification."
kind: prestack
symbol: "M^pre"
source-category: B^op (parameter-base-category, opposite)
target-category: Gpd (groupoids)
defined-as: "M^pre(B) := KP^vis(B)"
depends-on: [settlement, visible-settlement-fiber-groupoid, mutually-locally-derivable]
derives-from: docs/dev/scraps/settling-moduli-prestack.md
---

# Settlement moduli prestack

The pseudo-functor

$$\mathscr{M}^{\mathrm{pre}} \;:\; \mathbf{B}^{\mathrm{op}} \to \mathbf{Gpd}, \qquad (\mathbf{L}, \mathcal{C}, E, \lambda) \;\mapsto\; \mathrm{KP}^{\mathrm{vis}}(\mathbf{L}, \mathcal{C}, E, \lambda),$$

sending each base in the parameter-base-category `B` to its visible-settlement-fiber-groupoid.

Equivalently, the fibered category `∫ M^pre → B` whose fiber over `B` is `KP^vis(B)`.

## Functoriality on morphisms

A base-change `(ℓ, e, π, φ_λ): B → B'` in `B` induces a base-change functor

$$\mathscr{M}^{\mathrm{pre}}(B') \to \mathscr{M}^{\mathrm{pre}}(B)$$

via the pullback construction: a settlement over `B'` restricts to a settlement over `B` via the base-change data, and the restriction respects MLD-equivalence (an MLD-equivalence over `B'` pulls back to one over `B`).

The pseudo-functoriality (composition of base-changes commutes up to canonical iso) is the technical content that makes `M^pre` a pseudo-functor rather than a strict one.

## Why "pre" stack

A **stack** is a pseudo-functor that satisfies a descent condition: gluing on coverings is preserved. The settlement-moduli-prestack is the pseudo-functor without the descent condition yet checked.

The substrate's stackification theorem (forthcoming) shows that `M^pre` satisfies descent for the parameter-base-topology — but the prestack here is the un-stackified form. Whether stackification produces a new object or is the identity is the substantive content of the forthcoming theorem.

## Relation to coarse moduli

The coarse-settlement-moduli is the **0-truncation** of `M^pre`:

$$|\mathscr{M}^{\mathrm{pre}}| \;=\; \pi_0 \circ \mathscr{M}^{\mathrm{pre}}.$$

So `M^pre` carries more information than the coarse moduli: it carries the automorphism structure at each MLD-class, not just the set of classes. This is what distinguishes "stack-level classification" from "set-level classification."

## Position

`finite-settlement-algebra/hacking/library/settlement-moduli-prestack/`. Settling tier — the moduli classifier for settlements.

## Derivation source

Adapted from `predication-categories/objects/settling-moduli-prestack.md`, preserved at `docs/dev/scraps/`. Renamed from `settling-moduli-prestack` to `settlement-moduli-prestack` per the four-object grammar.
