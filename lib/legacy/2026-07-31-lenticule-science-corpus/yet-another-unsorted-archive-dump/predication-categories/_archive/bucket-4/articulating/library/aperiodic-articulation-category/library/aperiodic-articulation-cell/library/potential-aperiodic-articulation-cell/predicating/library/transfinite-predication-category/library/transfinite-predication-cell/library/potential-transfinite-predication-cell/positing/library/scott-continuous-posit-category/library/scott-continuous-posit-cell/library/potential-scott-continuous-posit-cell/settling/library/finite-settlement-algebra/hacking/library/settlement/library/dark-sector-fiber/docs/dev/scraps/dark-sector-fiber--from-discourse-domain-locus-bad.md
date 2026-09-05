---
type: definition
class: fiber
realizes: [evidence]
status: sketch
depends-on: [predication-fiber-algebra, dark-matter, dark-energy]
---

# Dark sector fiber

A [predication fiber algebra](../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/predication-fiber-algebra.md) $A_p$ for a predicate $p$ that records exclusively gravitational evidence: every value $v(p)(e, e')$ has its non-$\bot$ component supported entirely on the gravitational projection of the bilattice and zero on the electromagnetic, weak, and strong projections.

Concretely, factorize the value bilattice $\mathbf{L}$ as a product over the four fundamental forces:

$$\mathbf{L} \cong \mathbf{L}_{\mathrm{grav}} \times \mathbf{L}_{\mathrm{em}} \times \mathbf{L}_{\mathrm{weak}} \times \mathbf{L}_{\mathrm{strong}}$$

(ignoring color confinement subtleties; this is a coarse decomposition for foundational purposes). A predicate $p$ has a **dark sector fiber** when its values, as the [cosmological settling](cosmological-settling.md) evolves, never leave the subalgebra $\mathbf{L}_{\mathrm{grav}} \times \{\bot\} \times \{\bot\} \times \{\bot\}$.

## What this is claiming about [dark matter](../../theories/structure/terms/dark-matter.md) and [dark energy](../../theories/structure/terms/dark-energy.md)

The predicated reframing of the dark sectors is structural: dark matter and dark energy are not "missing" from the universe in any absolute sense. They are missing from the *electromagnetic-evidence projection* of the [cosmological settling](cosmological-settling.md). A dark-matter halo's predicates have full-knowledge values on $\mathbf{L}_{\mathrm{grav}}$ — galaxy rotation curves, gravitational lensing, CMB power-spectrum signatures all witness those values — and $\bot$-values on $\mathbf{L}_{\mathrm{em}}$. The dark sector is the *non-degenerate* part of the settling whose only admissible evidence channel is gravity.

This sharpens what "we don't know what dark matter is" means. The standard formulation says: we don't know which particle, if any, dark matter consists of. The predicated reformulation says: we know the cells, the predicates, and the values these predicates take on $\mathbf{L}_{\mathrm{grav}}$; we know that an electromagnetic observation always returns $\bot$; we do not know which closure rules (which underlying particle physics) generates the gravitational evidence we observe.

## What this does and doesn't dissolve

The reframing **does not** explain dark matter. It does not predict the particle. It does not derive the dark-matter density from first principles. It does not adjudicate between WIMPs, axions, and modified gravity.

It **does** make explicit a structural feature that ordinary-language cosmology elides: the dark sectors are defined by the *channel* through which we receive evidence, not by their intrinsic substance. A dark-matter particle that scattered weakly with photons would be a different thing — it would have a non-$\bot$ projection on $\mathbf{L}_{\mathrm{em}}$ — and would no longer be "dark" in the sense at issue. Darkness is a property of the [predication fiber algebra](../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/predication-fiber-algebra.md), not of the underlying particle.

## Status

Sketch. The factorization of $\mathbf{L}$ along the four forces is suggestive but not yet rigorously constructed; it requires identifying the [bilattice homomorphisms](../../../../../humanities/theories/math/theories/categories/theories/predication-categories/concepts/bilattice-homomorphism-naturality.md) corresponding to "EM-restricted measurement," "gravity-restricted measurement," etc., and showing they are compatible with the closure-rule system. Open question: does the [dark-energy-as-closure-rate](../theorems/dark-energy-as-closure-rate.md) conjecture follow from a stronger version of this factorization?
