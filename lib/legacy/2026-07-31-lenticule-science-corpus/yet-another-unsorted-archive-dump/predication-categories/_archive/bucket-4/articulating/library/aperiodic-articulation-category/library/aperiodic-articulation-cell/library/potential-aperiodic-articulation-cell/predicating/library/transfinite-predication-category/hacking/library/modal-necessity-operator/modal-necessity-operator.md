---
name: modal-necessity-operator
description: "Necessity operator □_R on world-indexed valuations: (□_R u)_w(s, o) := ⋀_t {R(w, w') → u_{w'}(s, o) : w' ∈ W}. The four-valued analogue of classical Kripke necessity; reduces to classical Boolean □ when L = 2 and R is {0, 1}-valued."
symbol: "□_R"
depends-on: [world-set, bilattice-accessibility-relation, predication-fiber-algebra, twist-product-right-residual, truth-order]
derives-from: docs/dev/scraps/modal-necessity-operator.md
---

# Modal necessity operator

For a family `u = (u_w)_{w ∈ W}` of valuations over a world set `W`, where each `u_w ∈ A_p`:

$$(\Box_R u)_w(s, o) \;:=\; \bigwedge_t \{ R(w, w') \to u_{w'}(s, o) : w' \in W \},$$

where:

- `⋀_t` is the truth-order meet on `L^⋈`.
- `R` is a bilattice-accessibility-relation between worlds.
- `→` is the strong implication on `L^⋈` — equivalently, the twist-product-right-residual `⇒` restricted to per-cell action.

## What it computes

For each world `w`, the value of `□_R u` at `(s, o)` is the truth-order infimum, over all worlds `w'`, of the residual implication from accessibility-strength `R(w, w')` to the value `u_{w'}(s, o)`. Worlds inaccessible from `w` contribute `⊤_t` (vacuously satisfied); worlds accessible from `w` contribute their actual value gated by the accessibility strength.

## Classical reduction

When `L = 2` and `R` is `{0, 1}`-valued, `□_R` reduces to the **classical Boolean necessity operator**:

`(□_R u)_w(s, o) = ⋀ {u_{w'}(s, o) : w' accessible from w}`.

This is the standard Kripke semantics. The bilattice version generalizes by allowing graded accessibility and four-valued evidence at each world.

## Position

`transfinite-predication-category/hacking/library/modal-necessity-operator/`. Predicating tier — modal operators act on world-indexed predication-valuations, which are predicating-tier objects.

## Derivation source

Adapted from `predication-categories/morphisms/modal-necessity-operator.md`, preserved at `docs/dev/scraps/`.
