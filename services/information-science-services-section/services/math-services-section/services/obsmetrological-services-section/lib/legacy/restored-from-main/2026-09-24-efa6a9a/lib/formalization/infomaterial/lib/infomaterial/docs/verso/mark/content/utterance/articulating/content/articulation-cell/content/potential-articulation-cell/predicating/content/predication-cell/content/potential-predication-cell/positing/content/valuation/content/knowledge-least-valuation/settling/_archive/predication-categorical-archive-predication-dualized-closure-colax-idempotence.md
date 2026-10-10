---
type: theorem
status: proved
depends-on: [dualized-closure-2-comonad, closure-2-monad-lax-idempotence, jung-rivieccio-duality]
---

# The dualized closure is colax-idempotent

The [dualized closure 2-comonad](../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../philosophy-services-section/services/logic-services-section/content/text/documents/articles/notes/undated/dualized-closure-2-comonad.md) $\mathrm{Cl}^*$ is colax-idempotent: there is an adjunction $\delta^* \dashv \epsilon^*_{\mathrm{Cl}^*}$ in $[\mathbf{PrFib}^*, \mathbf{PrFib}^*]$ with identity unit.

## Proof

Colax-idempotence for 2-comonads is the dual of Kelly–Lack (K1) for 2-monads. The primal statement [closure 2-monad lax-idempotence](closure-2-monad-lax-idempotence.md) gives $\mu \dashv \eta_{\mathrm{Cl}}$ with identity counit; dualization via the $\mathcal{K}^{\mathrm{op}}$-identity reverses the adjunction direction and the counit becomes the unit, preserving the identity-unit condition.

Concretely: the primal $\mathrm{Cl}$ sends $\mathcal{E}$ to its closure-saturation $\mathrm{Cl}(\mathcal{E}) \supseteq \mathcal{E}$ via the inflationarity inclusion $\eta_\mathcal{E}$. Under [Jung–Rivieccio duality](jung-rivieccio-duality.md), "$\supseteq$" reverses to "$\subseteq$" — algebra growth dualizes to spectrum shrinking ([closure-fixed-points–Priestley correspondence](closure-fixed-points-priestley-correspondence.md)) — so the unit $\eta$ dualizes to the closed-subspace inclusion $\epsilon^* : \mathrm{Cl}^*(\mathcal{E}^*) \hookrightarrow \mathcal{E}^*$. Lax-idempotence of $\mathrm{Cl}$ therefore dualizes to colax-idempotence of $\mathrm{Cl}^*$. $\square$

## Coalgebra uniqueness

By the colax-idempotent analogue of Kelly–Lack (K2), every paired-Priestley opfibration admits at most one $\mathrm{Cl}^*$-coalgebra structure up to unique invertible 2-cell. Being a $\mathrm{Cl}^*$-coalgebra is a property, not additional data — mirror image of the property-like status of being $\mathcal{C}$-closed on the primal side.
