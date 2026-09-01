---
kind: theorem
status: proved
depends-on: [closure-algebras-are-c-closed, dualized-closure-2-comonad, dualized-closure-colax-idempotence, quiescence-as-closure-algebra, jung-rivieccio-duality]
---

# $\mathrm{Cl}$-algebras correspond to $\mathrm{Cl}^*$-coalgebras

Under [Jung–Rivieccio duality](jung-rivieccio-duality.md) $\mathbf{PrFib} \leftrightarrow \mathbf{PrFib}^*$, pseudo-algebras of the [closure 2-monad](../morphisms/closure-2-monad.md) $\mathrm{Cl}$ — equivalently, the $\mathcal{C}$-closed predication fibrations of [closure-algebras-are-$\mathcal{C}$-closed](closure-algebras-are-c-closed.md) — correspond bijectively to pseudo-coalgebras of the [dualized closure 2-comonad](../morphisms/dualized-closure-2-comonad.md) $\mathrm{Cl}^*$.

Under this correspondence, the primal characterization "[quiescent settling = $\mathrm{Cl}$-algebra at the fixed ordinal](quiescence-as-closure-algebra.md)" matches the dual-side characterization "terminal dual settling = $\mathrm{Cl}^*$-coalgebra at the fixed ordinal."

## Proof

A pseudo-algebra structure for $\mathrm{Cl}$ is a morphism $a : \mathrm{Cl}(\mathcal{E}) \to \mathcal{E}$ inverse to $\eta_\mathcal{E}$ up to canonical iso, forcing $\mathrm{Cl}(\mathcal{E}) = \mathcal{E}$ — i.e., $\mathcal{E}$ is $\mathcal{C}$-closed.

Dualizing: a pseudo-coalgebra structure for $\mathrm{Cl}^*$ is a morphism $a^* : \mathcal{E}^* \to \mathrm{Cl}^*(\mathcal{E}^*)$ inverse to $\epsilon^*_{\mathcal{E}^*}$ up to canonical iso, forcing $\mathcal{E}^* = \mathrm{Cl}^*(\mathcal{E}^*)$ — i.e., $\mathcal{E}^*$ coincides with its confirming-subspace.

The two conditions are exchanged under the [closure-fixed-points-Priestley correspondence](closure-fixed-points-priestley-correspondence.md). $\square$
