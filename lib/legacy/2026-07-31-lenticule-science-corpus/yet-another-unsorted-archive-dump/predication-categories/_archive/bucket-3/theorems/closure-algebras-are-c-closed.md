---
kind: theorem
status: proved
depends-on: [closure-2-monad, predication-fibration, predicate-category-naturality]
---

# Closure 2-monad algebras are $\mathcal{C}$-closed presheaves

Pseudo-algebras of the [closure 2-monad](../morphisms/closure-2-monad.md) $\mathrm{Cl}$ are exactly the [$\mathcal{C}$-closed](../concepts/predicate-category-naturality.md) [predication fibrations](../objects/predication-fibration.md).

## Proof

A pseudo-algebra structure on $\mathcal{E}$ is a morphism $a : \mathrm{Cl}(\mathcal{E}) \to \mathcal{E}$ inverse to $\eta_\mathcal{E}$ up to canonical iso. By inflationarity, $\eta_\mathcal{E}$ is an inclusion $\mathcal{E} \hookrightarrow \mathrm{Cl}(\mathcal{E})$; for $a$ to be inverse requires $\mathrm{Cl}(\mathcal{E}) = \mathcal{E}$ — i.e., $\mathcal{E}$ is already closed. Conversely, every $\mathcal{C}$-closed knowledge presheaf admits the identity as its canonical $\mathrm{Cl}$-algebra structure. $\square$

## Remark

This recovers the [predicate-category naturality](../concepts/predicate-category-naturality.md) property exactly: "$\mathcal{C}$-closure is the characteristic property that the closure operator produces" is upgraded here to "being $\mathcal{C}$-closed is a $\mathrm{Cl}$-algebra structure, which is unique-up-to-iso by Kelly–Lack (K2)."
