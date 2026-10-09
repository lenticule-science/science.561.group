---
kind: theorem
status: proved
depends-on: [bilattice, twist-product, negation, priestley-space, paired-priestley-space]
---

# Jung–Rivieccio duality

The category of distributive [bilattices](../objects/bilattice.md) is dually equivalent to a category of [paired Priestley spaces](../paired-priestley-space.md):

$$\mathbf{DBiLat}^{\mathrm{op}} \simeq \mathbf{PairedPriSp}.$$

Each distributive bilattice $\mathbf{B} \cong \mathbf{L}^\bowtie$ from a [twist product](../../../../../../../../../../residuated-lattice/content/twist-product/twist-product.md) corresponds to the pair $(\mathrm{Spec}(\mathbf{L}), \mathrm{Spec}(\mathbf{L}))$ — two copies of the Priestley dual of $\mathbf{L}$ — equipped with a swap involution encoding the bilattice [negation](../morphisms/negation.md).

## Proof

[@jung-rivieccio2012].
The duality lifts the classical Priestley duality $\mathbf{DLat}^{\mathrm{op}} \simeq \mathbf{PriSp}$ ([@priestley1970], 1972) — a [Priestley space](../../../priestley-space.md) being a compact, totally order-disconnected ordered topological space, with the contravariant equivalence sending a bounded distributive lattice to its space of prime filters and a Priestley space to its lattice of clopen up-sets — to the bilattice setting via the twist-product structure. $\square$

## Specialization to $\mathbf{FOUR}$

Since $\mathrm{Spec}(\mathbf{2})$ is a single point, the paired Priestley dual of [$\mathbf{FOUR}$](../objects/four-bilattice.md) $= \mathbf{2}^\bowtie$ is the two-point space $\{+, -\}$ with the swap map $+ \leftrightarrow -$.
This is the simplest non-trivial paired Priestley space.
