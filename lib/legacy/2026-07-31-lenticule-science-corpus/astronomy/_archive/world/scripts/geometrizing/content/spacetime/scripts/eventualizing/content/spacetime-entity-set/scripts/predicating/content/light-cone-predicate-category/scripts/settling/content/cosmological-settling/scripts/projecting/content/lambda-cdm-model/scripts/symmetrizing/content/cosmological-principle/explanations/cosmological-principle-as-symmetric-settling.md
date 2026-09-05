---
type: theorem
status: draft
depends-on: [cosmological-settling, comoving-frame, cosmological-principle]
---

# Cosmological principle as symmetric settling

**Statement.** The [cosmological principle](../../../terms/cosmological-principle.md) — large-scale spatial homogeneity and isotropy of the universe — is equivalent to the following symmetry of the [cosmological settling](../objects/cosmological-settling.md):

For each cosmic time $t$, there exists a transitive group action $G_t$ on the comoving spatial slice $\Sigma_t \subseteq E_{\mathrm{cos}}$ — the spatial isometry group of the [comoving frame](../objects/comoving-frame.md) — such that $v_t$ is invariant under $G_t$:

$$v_t(p)(g \cdot s, g \cdot o) = v_t(p)(s, o) \quad \text{for all } g \in G_t, \text{ all predicates } p \text{ in } \mathcal{C}_{\mathrm{cone}}, \text{ all comoving } s, o \in \Sigma_t.$$

## Proof sketch (forward direction)

Suppose the cosmological principle holds: the universe is large-scale homogeneous and isotropic. Then any two comoving spatial points $\vec{x}, \vec{x}'$ on $\Sigma_t$ are related by a spatial isometry $g$, and the universe has the same physical content at $\vec{x}$ as at $g \cdot \vec{x}$. In particular, for any predicate $p$ measurable at large scales, the bilattice value $v_t(p)$ at any cell sourced at $\vec{x}$ equals the value at the corresponding cell sourced at $g \cdot \vec{x}$. This is the invariance claim. $\square$

## Proof sketch (reverse direction)

Suppose $v_t$ is $G_t$-invariant for the comoving spatial isometry group at each $t$. Then any large-scale-measurable predicate has values that are constant across the comoving slice — its expectation value is the same at every comoving point. This is exactly the operational content of homogeneity and isotropy at the level of measurable averages. $\square$

## What this gives us

Once the cosmological principle is recast as a symmetry of the settling, two structural consequences follow:

- **Reduction to comoving observables.** Under $G_t$-invariance, the cosmological settling restricted to large-scale predicates depends only on cosmic time, not on spatial position. The infinite-dimensional state-space of $v_t$ collapses, on the symmetric subspace, to a finite-dimensional state-space parameterized by the time-dependent values of $G_t$-invariant predicates: the [scale factor](../../../theories/evolution/terms/scale-factor.md), the energy densities of the matter components, the curvature scalar.
- **Friedmann reduction.** The closure-rule system, restricted to the $G_t$-invariant subspace, becomes a system of ordinary differential equations in cosmic time on these finite parameters. Identification of these ODEs with the [Friedmann equations](../../../theories/evolution/terms/friedmann-equations.md) is the predicated content of "Lambda-CDM is the symmetric reduction of general cosmology."

## Status

Draft. The forward and reverse statements as stated are essentially tautologies once "large-scale" is given an operational meaning (e.g., averaging over Hubble-scale cells). The substantive content — that the symmetric reduction of the closure-rule system gives the Friedmann equations — is open and is the first concrete check of [cosmological-settling](../objects/cosmological-settling.md). Sketch of how the check would go: write the Einstein equations as a closure rule on metric-component predicates, restrict to $G_t$-invariant valuations (the FLRW ansatz), and verify that the resulting closure-rule firing rate matches the time derivative of the scale factor in the Friedmann equations.
