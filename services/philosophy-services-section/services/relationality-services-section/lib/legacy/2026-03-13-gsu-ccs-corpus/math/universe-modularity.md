---
id: universe-modularity
name: UniverseModularity
description: "the relational universe R is maximally expressive — an added internal operation is definable in R if and only if it is compatible with reindexing, sheaf gluing, and the modal structure."
---

### Theorem — Modularity of the Relational Universe {#universe-modularity}

Let $\widetilde{R}$ be an extension of $R$ by an added internal operation $\omega$. Then exactly
one holds:

1. $\omega$ is **compatible**: natural with respect to reindexing along $T$, compatible with
   sheaf gluing for $J$, and compatible with $\sigma$, $\Delta$, and the invariant structure.
   In this case $\omega$ factors through $U_G$ — it is definable from the existing structure —
   and $\widetilde{R} \simeq R$. The extension is conservative.

2. $\omega$ is **incompatible**: it fails at least one of the three compatibility conditions.
   Then $\widetilde{R}$ is not a relational universe.

**Consequence.** $R$ is maximally expressive subject to its eight axioms: no genuinely new
primitive operation can be added without breaking the defining structure.

**Proof.** The reverse direction — incompatible implies not a relational universe — follows
directly from the definitions: if $\omega$ fails naturality with respect to reindexing, or
fails to respect sheaf gluing, or fails to respect the modal/invariant structure, then
$\widetilde{R}$ violates one of the conditions defining a relational universe model.

The forward direction — conservative extension implies $\omega$ factors through $U_G$ — is not
established here. It requires the universal property of $U_G$ and follows from the initiality
of $R$ among relational universe models (§initiality) together with the characterization of
$U_G$-closed subclasses (§generated-subuniverse): if $\widetilde{R} \simeq R$, then the
canonical morphism $R \to \widetilde{R}$ from initiality must be the identity, forcing $\omega$
to lie in the image of $U_G$. This argument is a sketch; it has not been written out. $\square$
