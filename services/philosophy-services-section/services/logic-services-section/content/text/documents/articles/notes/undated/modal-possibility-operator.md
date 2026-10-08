---
name: modal-possibility-operator
description: "Possibility operator ♢_R on world-indexed valuations, dual to □_R: (♢_R u)_w(s, o) := ⋁_t {R(w, w') ⊙ u_{w'}(s, o) : w' ∈ W}. The four-valued analogue of classical Kripke possibility; reduces to classical Boolean ♢ when L = 2 and R is {0, 1}-valued."
symbol: "♢_R"
depends-on: [world-set, bilattice-accessibility-relation, predication-fiber-algebra, twist-product-fusion, truth-order]
derives-from: docs/dev/scraps/modal-possibility-operator.md
title: modal-possibility-operator
---

# Modal possibility operator

For a family `u = (u_w)_{w ∈ W}` of valuations over a world set `W`:

$$(\Diamond_R u)_w(s, o) \;:=\; \bigvee_t \{ R(w, w') \odot u_{w'}(s, o) : w' \in W \},$$

where:

- `⋁_t` is the truth-order join on `L^⋈`.
- `R` is a bilattice-accessibility-relation.
- `⊙` is the twist-product-fusion per-cell.

## What it computes

For each world `w`, the value of `♢_R u` at `(s, o)` is the truth-order supremum, over all worlds `w'`, of the fusion of accessibility-strength `R(w, w')` with the value `u_{w'}(s, o)`. Worlds inaccessible contribute `⊥_t` (no contribution); accessible worlds contribute their value multiplied by accessibility strength.

## Duality with `□_R`

- `□_R` uses `⋀_t` and `→` (residual). "Necessity = greatest lower bound of implications."
- `♢_R` uses `⋁_t` and `⊙` (fusion). "Possibility = least upper bound of accessibility-fused values."

These are the right adjoint / left adjoint duality on the truth-order side. Together they generalize Kripke modal logic to the four-valued bilattice setting.

## Classical reduction

When `L = 2` and `R` is `{0, 1}`-valued, `♢_R` reduces to the **classical Boolean possibility operator**:

`(♢_R u)_w(s, o) = ⋁ {u_{w'}(s, o) : w' accessible from w}`.

## Position

`transfinite-predication-category/hacking/library/modal-possibility-operator/`. Sibling of `modal-necessity-operator/`.

## Derivation source

Adapted from `predication-categories/morphisms/modal-possibility-operator.md`, preserved at `docs/dev/scraps/`.
