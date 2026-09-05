---
name: aperiodic-co-classifying-invariant
description: "The cosheaf-homology dual of the aperiodic-classifying-invariant. čl-inv(v) ∈ H_1 records the aperiodic settlement's MLD-class as a cosheaf homology class — built from cycles on the cosheaf side. Related to the sheaf-side cl-inv ∈ H^1 by Verdier duality on the bitopological-settling-site."
symbol: "čl-inv(v)"
realizes: [cohomological-equivalence]
depends-on: [aperiodic-classifying-invariant, settling-cohomology, settling-associated-sheaf, closure-ordinal]
derives-from: docs/dev/scraps/aperiodic-co-classifying-invariant.md
---

# Aperiodic co-classifying invariant

The **cosheaf-homology dual** of the aperiodic-classifying-invariant.

Where `cl-inv(v) ∈ H^1` records the aperiodic settlement's MLD-class as a **sheaf cohomology** class (built from cocycles on the bitopological-settling-site), the co-classifying invariant

$$\check{\mathrm{cl}}\text{-}\mathrm{inv}(v) \;\in\; H_1$$

records the **same MLD-class** as a **cosheaf homology** class — built from cycles on the cosheaf side.

The two presentations encode the same data, related by **Verdier duality** on the bitopological-settling-site.

## Definition

Let `v` be an aperiodic-regime settlement with closure-ordinal `κ ≥ ω₁`. Let

$$\check{\mathcal{F}}_v$$

be the **cosheaf** associated to `v`'s settling-associated-sheaf `F_v` via Verdier duality. The co-classifying invariant is the canonical-cycle homology class

$$\check{\mathrm{cl}}\text{-}\mathrm{inv}(v) \;:=\; [\mathbf{1}_{\check{\mathcal{F}}_v}] \;\in\; H_1\bigl(\mathbf{T}^*_{\leq \kappa},\, \check{\mathcal{F}}_v\bigr).$$

## Verdier duality identification

Spatial Verdier duality on the bitopological-settling-site (archive theorem, sketch) gives the identification

$$H^1(\mathcal{F}_v) \;\simeq\; H_1(\check{\mathcal{F}}_v)$$

in `q`-fuzzy form, and **strictly** in the Boolean d-frame setting that the substrate uses.

Under this identification:

$$\mathrm{cl}\text{-}\mathrm{inv}(v) \;\leftrightarrow\; \check{\mathrm{cl}}\text{-}\mathrm{inv}(v).$$

The two invariants are **structurally identical** under the duality — they encode the same MLD-class.

## Why have both

The sheaf-side `cl-inv` and the cosheaf-side `čl-inv` are formally equivalent but operationally different:

- **Sheaf-side `cl-inv`**: works with COCYCLES — `+`-direction differentials, cohomology classes in `H^1`. Natural for the algebra-then-Spec construction.
- **Cosheaf-side `čl-inv`**: works with CYCLES — `−`-direction differentials, homology classes in `H_1`. Natural for the dynamics-then-cells construction.

Different problems benefit from different presentations:

- Theorems about "where evidence accumulates" (the sheaf-side count of newly-designated cells): cleaner in `cl-inv`.
- Theorems about "what evidence-pathway produced this state" (the cosheaf-side trace of cycles back to initial states): cleaner in `čl-inv`.

Both invariants exist for any aperiodic settlement and equate under Verdier duality.

## Position

`aperiodic-articulation-category/hacking/library/aperiodic-co-classifying-invariant/`. Articulating tier — sibling of `aperiodic-classifying-invariant`. Both classify aperiodic settlements; both are at articulating tier; they are Verdier-dual presentations of the same MLD-class data.

## Derivation source

Adapted from `predication-categories/objects/aperiodic-co-classifying-invariant.md`, preserved at `docs/dev/scraps/`.
