---
kind: theorem
status: proved
depends-on: [settling-coalgebra-structure, closure-2-monad, closure-algebras-are-c-closed, settling-quiescence, settling-endofunctor, increment-sequence, scott-continuous-closure]
---

# Quiescence as closure-algebra structure

A [settling-equipped predication hyperdoctrine](../../predication-hyperdoctrine/content/settling-coalgebra-structure/settling-coalgebra-structure.md) $(\mathcal{E}, c)$ reaches a settling fixed point at ordinal $\tau^*$ — that is, is [quiescent](../settling-quiescence.md) at $\tau^*$ — iff the state $\mathcal{E}_{\tau^*}$ is a [closure 2-monad](../morphisms/closure-2-monad.md) algebra (equivalently, is [$\mathcal{C}$-closed](../../../../../../../../../../../../predicate-category/content/predicate-category-naturality/predicate-category-naturality.md)).

## Proof

Settling fixed point means $c^{\tau^*+1} = c^{\tau^*}$, i.e., $F_U(\mathcal{E}_{\tau^*}) = \mathcal{E}_{\tau^*}$ where $F_U$ is the [settling endofunctor](../morphisms/settling-endofunctor.md).
Assuming eventually-zero increments (so $u_\tau = \bot$ for $\tau > \tau_0$), this reduces to $\mathrm{Cl}(\mathcal{E}_{\tau^*}) = \mathcal{E}_{\tau^*}$, which by [closure algebras are $\mathcal{C}$-closed](closure-algebras-are-c-closed.md) is exactly $\mathrm{Cl}$-algebra structure on $\mathcal{E}_{\tau^*}$. $\square$

## Remark

This unifies [settling quiescence](../settling-quiescence.md) with $\mathrm{Cl}$-algebra structure: the settling stabilizes iff the state acquires the (property-like) $\mathrm{Cl}$-algebra structure.

## Regime-dependent structure

The closure 2-monad is strict-idempotent in the finite [Scott-continuous](../../../../../../../pre-bilattice/content/bilattice/content/predication-fiber-algebra/content/closure-operator/content/scott-continuous-closure/scott-continuous-closure.md) regime and genuinely lax-idempotent otherwise:

- *Strict-idempotent $\mathrm{Cl}$:* closure satisfies $\mathrm{cl}_p^2 = \mathrm{cl}_p$ on the nose; $\mu = \mathrm{id}$.
  The [settling convergence](../../../references/settling-convergence.md) and [transfinite settling convergence](../../../references/transfinite-settling-convergence.md) results apply.
- *Genuinely lax-idempotent $\mathrm{Cl}$:* $\mathrm{cl}_p^2 = \mathrm{cl}_p$ only up to canonical 2-cell; $\mu$ is non-identity.
  The settling closure ordinal exceeds $\omega$.

The four-regime classification analyzes the boundary between these regimes.
