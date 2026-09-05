---
kind: theorem
status: proved
closes: modal-necessity-operator
depends-on: [twist-product, four-bilattice, twist-modal-translation, twist-translation-consequence, modal-necessity-operator]
---

# Modal finite model property

Both the local and global consequence relations of the four-valued modal logic on $\mathbf{FOUR}^\bowtie$ have the finite model property, and therefore are decidable.

## Proof

Classical bimodal logic has the finite model property ([@blackburn-et-al2001], Theorems 2.7.9 and 3.1.10).
The [twist translation consequence preservation](twist-translation-consequence.md) theorem transfers the property to the four-valued modal logic via the translation $\nu$.
Given a failed consequence $\Gamma \not\vdash \phi$, the corresponding $\nu_1(\Gamma) \not\vdash^{cb} \nu_1(\phi)$ admits a finite bimodal Boolean model; recombining this model via the [twist-product](../objects/twist-product.md) structure produces a finite four-valued Kripke model witnessing the original failed consequence. $\square$

## Corollary

The modal calculus on knowledge presheaf fibers over $\mathbf{L} = \mathbf{2}$ has the finite model property and is decidable.
