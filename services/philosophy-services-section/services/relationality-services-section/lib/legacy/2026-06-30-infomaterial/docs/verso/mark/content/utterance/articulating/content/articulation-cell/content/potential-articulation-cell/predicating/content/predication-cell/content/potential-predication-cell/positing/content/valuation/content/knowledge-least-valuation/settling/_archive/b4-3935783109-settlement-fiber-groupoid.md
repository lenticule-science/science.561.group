---
name: settlement-fiber-groupoid
description: "For a fixed base B, the groupoid whose 0-cells are settlements over B, 1-cells are invertible settlement-morphisms (biequivalences with possibly non-zero ordinal shift), and 2-cells are identities (effectively 1-truncated by settlement-automorphism-1-truncation theorem)."
kind: groupoid
symbol: "KP^≃(B)"
zero-cells: "settlements over B"
one-cells: "invertible settlement-morphisms (with ordinal shift)"
two-cells: "identities (1-truncated)"
component-set: "|KP^≃(B)| = MLD-classes"
depends-on: [settlement, mutually-locally-derivable, settlement-morphism]
derives-from: docs/dev/scraps/settling-fiber-groupoid.md
---

# Settlement fiber groupoid

For a fixed base `B = (L, C, E, λ)`, the **settlement fiber groupoid** `KP^≃(B)` has:

- **0-cells**: settlements over `B`.
- **1-cells**: invertible settlement-morphisms — equivalently, biequivalences in the 2-category of settlements over `B` — including those with non-zero ordinal shift `δ`.
- **2-cells**: identities, by the **settlement-automorphism 1-truncation theorem** (archive).

The 2-cells of `KP^≃(B)` are all identities, so `KP^≃(B)` is effectively a **1-groupoid** despite being embedded in the 2-category of settlements over `B`. We treat it as a 1-groupoid throughout.

## Components are MLD-classes

The set of components (path-connected pieces) of `KP^≃(B)` is:

$$\pi_0\bigl(\mathrm{KP}^\simeq(B)\bigr) \;=\; \mathrm{KP}(B) \,/\, {\sim_{\mathrm{MLD}}}.$$

Two settlements are in the same component iff they are MLD-equivalent — there is an invertible settlement-morphism (with some ordinal shift) connecting them. So the groupoid's components are exactly the MLD-classes.

This is what makes `KP^≃(B)` the groupoid-level realization of MLD-classification: 0-cells are settlements, components are MLD-classes, automorphism groups at each component are the visible-symmetry of the class.

## Automorphism groups

For each settlement `v`, the **automorphism group** in `KP^≃(B)` is

$$\mathrm{Aut}^\simeq(v) \;=\; \{\, \phi: v \to v \,:\, \phi \text{ is an invertible settlement-morphism with } \delta \in \lambda \,\}.$$

These are settlement-morphism automorphisms — possibly with non-zero ordinal shift. The shift-zero subgroup is the "rigid" part; the shift-nonzero parts encode the orbit's self-shift symmetries.

`Aut^≃(v)` decomposes via the **settlement-automorphism decomposition** theorem:

$$\mathrm{Aut}^\simeq(v) \;\cong\; N(v) \;\rtimes\; \mathrm{Aut}^{\mathrm{vis}}(v),$$

where `N(v)` is the invisible automorphism subgroup (the kernel of action on the associated sheaf) and `Aut^vis(v)` is the visible automorphism quotient. The semidirect product structure is the formal sense in which "invisible" and "visible" symmetries combine.

## Why "fiber"

`KP^≃(B)` is the **fiber over `B`** in the fibered category presentation of the settlement-moduli-prestack: the prestack `M^pre: B^op → Gpd` has `M^pre(B) = KP^vis(B)` (the visible-quotient), and `KP^≃(B)` is the un-quotiented fiber-data that the prestack then quotients.

## Why this is the right groupoid level

Settlements have rich automorphism structure (the invisible/visible decomposition, the ordinal-shift component). A bare *set of settlements* loses this. A *2-groupoid of settlements* would carry more data than the substrate uses. The 1-truncation theorem says **1-groupoid** is the right structural level: rich enough to remember automorphisms, simple enough to manipulate.

## Position

`finite-settlement-algebra/hacking/library/settlement-fiber-groupoid/`. Settling tier — the un-quotiented fiber-groupoid of settlements. The visible quotient `KP^vis(B)` is the sibling that the moduli prestacks land in.

## Derivation source

Adapted from `predication-categories/objects/settling-fiber-groupoid.md`, preserved at `docs/dev/scraps/`. Renamed per the four-object grammar.
