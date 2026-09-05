---
name: bilattice-accessibility-relation
description: "A four-valued relation R: W × W → L^⋈ between worlds in a world-set W, valued in the twist-product L^⋈ of a residuated lattice L. The bilattice-valued accessibility relation that bilattice modal operators use. When L = 2 and R is {0, 1}-valued, recovers classical Kripke accessibility."
symbol: "R"
depends-on: [world-set, twist-product, residuated-lattice]
derives-from: docs/dev/scraps/bilattice-accessibility-relation.md
---

# Bilattice accessibility relation

A four-valued relation, denoted `R`, between worlds: a function

$$R \;:\; W \times W \to \mathbf{L}^\bowtie$$

from ordered pairs of worlds in a world-set `W` to elements of the twist-product `L^⋈` over a residuated-lattice `L`.

For each ordered pair `(w, w')`, the value `R(w, w') ∈ L^⋈` records the **bilattice-valued accessibility** from `w` to `w'`. Reading on FOUR (`L = 2`):

- `R(w, w') = ⊥` — no claim about accessibility (the modal substrate hasn't received evidence either way).
- `R(w, w') = t` — `w'` IS accessible from `w` (positive evidence).
- `R(w, w') = f` — `w'` is NOT accessible from `w` (negative evidence).
- `R(w, w') = ⊤` — contradictory evidence: both accessible and not.

## Generalizing classical Kripke

Classical Kripke modal logic uses a Boolean relation `R: W × W → {0, 1}`:

- `R(w, w') = 1` — accessible.
- `R(w, w') = 0` — not accessible.

The bilattice accessibility relation **generalizes** this:

- When `L = 2`, `L^⋈ = FOUR`. `R` valued in FOUR adds `⊥` (no claim) and `⊤` (contradiction) to the Boolean truth-asymmetric `t, f`.
- When `L` is non-trivial (e.g., `L = [0, 1]`), `R` becomes a *graded* accessibility: `R(w, w') ∈ L^⋈` records both the positive-evidence-strength and the negative-evidence-strength of accessibility.

So bilattice accessibility is the substrate's general accessibility relation; classical Kripke is a special case (`L = 2`, values restricted to `{0, 1} ⊂ FOUR`).

## Use in modal operators

The bilattice modal-necessity-operator `□_R` and modal-possibility-operator `♢_R` use `R` to gate world-quantification:

$$(\Box_R u)_w(s, o) \;=\; \bigwedge_t \{\, R(w, w') \to u_{w'}(s, o) \,:\, w' \in W \,\},$$

$$(\Diamond_R u)_w(s, o) \;=\; \bigvee_t \{\, R(w, w') \odot u_{w'}(s, o) \,:\, w' \in W \,\}.$$

The accessibility value `R(w, w')` enters via the twist-product-right-residual `→` in necessity (gates the implication by accessibility-strength) and via twist-product-fusion `⊙` in possibility (multiplies value by accessibility-strength).

So `R` is the **gating data** that determines which worlds contribute to a world-quantified modal valuation, and at what strength.

## Worked example: classical Kripke recovery

Take `L = 2`. Take `W = {w_1, w_2, w_3}` with `R(w_1, w_2) = t`, `R(w_1, w_3) = f`, `R(w_2, w_3) = t`, others `⊥`.

Equivalent classical reading: `w_2` is accessible from `w_1`; `w_3` is NOT accessible from `w_1`; `w_3` IS accessible from `w_2`; other accessibility is unknown.

For a world-indexed valuation `u_{w}(p)(a, b) = c_w`, the bilattice necessity at `w_1`:

`(□_R u)_{w_1}(p)(a, b) = c_{w_2}` (only `w_2` contributes — `R(w_1, w_3) = f` means `f → anything = ⊤_t`, which doesn't constrain the meet; `R(w_1, w_1) = ⊥` means `⊥ → c_{w_1} = ⊤_t` likewise).

This recovers the classical "intersection over accessible worlds" behavior.

## Worked example: graded accessibility

Take `L = [0, 1]` (unit interval). Take `R(w, w') = ⟨0.7, 0.2⟩` — 70% positive evidence for accessibility, 20% negative. The accessibility is **graded**: world `w'` is "mostly accessible" from `w`, with some doubt.

The bilattice modal operators then weight `w'`'s contribution by `R(w, w')`. A world that is half-accessible contributes a half-weighted value to the modal join/meet. This is fuzzy Kripke modal logic, generalized to bilattice values.

## Position

`transfinite-predication-category/hacking/library/bilattice-accessibility-relation/`. Predicating tier — the modal substrate that the modal-necessity-operator and modal-possibility-operator (both predicating-tier siblings) use as gating data.

## Derivation source

Adapted from `predication-categories/objects/bilattice-accessibility-relation.md`, preserved at `docs/dev/scraps/`.
