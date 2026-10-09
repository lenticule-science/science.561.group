---
kind: theorem
status: proved
depends-on: [closure-2-monad, closure-operator, predication-fibration]
type: theorem
---

# Closure 2-monad lax-idempotence

The [closure 2-monad](../morphisms/closure-2-monad.md) $\mathrm{Cl}$ satisfies Kelly–Lack (K1): there is an adjunction $\mu \dashv \eta_\mathrm{Cl}$ in $[\mathbf{PrFib}, \mathbf{PrFib}]$ with counit $\mu \cdot \eta_\mathrm{Cl} = 1_\mathrm{Cl}$.
Equivalently, $\mathrm{Cl}$ is lax-idempotent.

## Proof

Checking (K1) requires verifying two conditions:

(i) The counit $\mu \cdot \eta_\mathrm{Cl}$ on $\mathrm{Cl}$ is the identity: at each fiber, $\mu_{\mathrm{Cl}(\mathcal{E}), p} \circ \eta_{\mathrm{Cl}(\mathcal{E}), p}$ traces $\mathrm{cl}_p(v) \xrightarrow{\eta} \mathrm{cl}_p(\mathrm{cl}_p(v)) \xrightarrow{\mu} \mathrm{cl}_p(v)$.
By inflationarity and idempotence (strict or lax), this composite is the identity.

(ii) Adjoint triangle equalities hold by the monad laws.

So $\mu \dashv \eta_\mathrm{Cl}$.
By Kelly–Lack (K1), $\mathrm{Cl}$ is lax-idempotent. $\square$

## Corollary

By Kelly–Lack's property-like theorem (K2), every [predication fibration](../objects/predication-fibration.md) admits at most one $\mathrm{Cl}$-algebra structure up to unique iso.
Being a $\mathrm{Cl}$-algebra is a property, not additional structural data.
