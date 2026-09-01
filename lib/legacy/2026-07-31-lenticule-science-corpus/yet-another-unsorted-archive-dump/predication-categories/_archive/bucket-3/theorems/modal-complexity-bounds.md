---
kind: theorem
status: proved
depends-on: [twist-modal-translation, twist-translation-consequence, modal-finite-model-property]
---

# Modal complexity bounds

Local consequence on the knowledge presheaf modal calculus is in PSPACE. Global consequence is in EXPTIME.

## Proof

Classical bimodal logic is decidable, with local consequence PSPACE-complete and global consequence EXPTIME-complete for the minimal normal bimodal logic ([@halpern-moses1992]; [@blackburn-et-al2001]). The [twist modal translation](../objects/twist-modal-translation.md) $\nu$ has polynomial size, so by the [consequence-preservation theorem](twist-translation-consequence.md) the four-valued modal logic inherits the classical bimodal complexity bounds up to a polynomial factor — preserving the PSPACE upper bound for local consequence and the EXPTIME upper bound for global consequence. $\square$

## Remark

For finite fiber-algebra cases — finite [entity set](../objects/entity-set.md) $E$ and $\mathbf{L} = \mathbf{2}$ — these bounds specialize to polynomial-time enumeration over $\mathbf{FOUR}^{E \times E}$.
