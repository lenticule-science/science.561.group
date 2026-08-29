---
kind: narrative
discusses: [gray-street-fibration-monad, emmenegger-fibration-comonad, closure-2-monad, predication-fibration, predication-hyperdoctrine, predicate-category-naturality]
---

# Two disentangled KZ structures

The full predication-hyperdoctrine framework carries *two* lax-idempotent 2-monadic structures, living at structurally different levels. They are independent and they compose cleanly, and untangling them is one of the prerequisites to reading the hyperdoctrinal results clearly.

## Fibration-KZ — the vertical direction

The first lives on $\mathbf{Cat}/\mathcal{C}$. The [Gray–Street fibration 2-monad](../theorems/gray-street-fibration-monad.md) $\mathbb{M}$ generates fibrations: pseudo-algebras for $\mathbb{M}$ are cloven Grothendieck fibrations over $\mathcal{C}$. Dually, the [Emmenegger fibration 2-comonad](../theorems/emmenegger-fibration-comonad.md) $\mathbb{N}$ has the same algebras-as-cofibrations content, with the 2-adjunction $\mathbb{M} \dashv \mathbb{N}$ packaging both views.

What this 2-monad structure says about an [predication fibration](../objects/predication-fibration.md) $\mathcal{E} \to \mathcal{C}$ is: $\mathcal{E}$ is a pseudo-$\mathbb{M}$-algebra. This is a *vertical* property — about how the fibers organize over the predicate base, how reindexing functors behave, how cloven choices of cartesian lifts compose up to canonical iso. The 2-cells of $\mathbb{M}$/$\mathbb{N}$ track the non-strict composition that this setting needs.

## Closure-KZ — the saturation direction

The second lives on $\mathbf{PrFib}(\mathcal{C})$ — the 2-category of predication fibrations. The [closure 2-monad](../morphisms/closure-2-monad.md) $\mathrm{Cl}$ is fiberwise application of the closure family $(\mathrm{cl}_p)_{p \in \mathcal{C}}$. Pseudo-algebras for $\mathrm{Cl}$ are exactly the [$\mathcal{C}$-closed](../concepts/predicate-category-naturality.md) predication fibrations — those whose state at every settling step is saturated under inference.

What this 2-monad structure says about a knowledge presheaf is: it has reached saturation. This is a *saturation* property — about whether the settling has run all derivable consequences to ground, not about the fibration shape.

## Why disentangling matters

The two are independent in a precise sense:

- An predication fibration can be a pseudo-$\mathbb{M}$-algebra (= cloven fibration) without being a pseudo-$\mathrm{Cl}$-algebra (= $\mathcal{C}$-closed). The pre-quiescence settling states are exactly such examples: fibrations on the nose, but not yet saturated.
- The settling proceeds by alternating: external evidence arrives, $\mathrm{Cl}$ fires to saturate, the result is again a pseudo-$\mathbb{M}$-algebra. The fibration structure is invariant under closure firing; only the saturation status changes.

A "fully $\mathcal{C}$-closed knowledge presheaf" is a presheaf that is *both* an $\mathbb{M}$-algebra and a $\mathrm{Cl}$-algebra. The two property-statuses combine; neither implies the other. In the structural stratification, this matches the [predication fibration](../objects/predication-fibration.md) and [settling-equipped predication hyperdoctrine](../objects/settling-coalgebra-structure.md) being separate axes of structure, with the intermediate [predication hyperdoctrine](../objects/predication-hyperdoctrine.md) supplying the adjoint and coherence content that connects them.

## Conflation is structurally wrong

The two KZ structures live at different levels and act on different ambient 2-categories ($\mathbf{Cat}/\mathcal{C}$ for $\mathbb{M}\dashv\mathbb{N}$; $\mathbf{PrFib}(\mathcal{C})$ for $\mathrm{Cl}$). Fusing them — e.g., writing the settling endofunctor as $F_U = \mathbb{M}(\mathcal{E}) \vee_k U$ instead of $F_U(\mathcal{E})_\tau = \mathrm{Cl}(\mathcal{E}) \vee_k u_\tau$ — collapses the saturation step into the fibration step and loses the predicate-category-naturality content that lives only in $\mathrm{Cl}$. The framework needs both, used at their respective levels.
