---
type: example
status: sketch
instantiates: [cosmological-settling, cosmological-principle-as-symmetric-settling, comoving-frame]
depends-on: [cosmological-settling, cosmological-principle, friedmann-equations, lambda-cdm-model]
---

# Lambda-CDM as the symmetric reduction of the cosmological settling

A worked sketch of the cosmological-principle-as-symmetric-settling reduction in the case where the symmetry group is maximal (full FLRW) and the matter content is the standard Lambda-CDM mix. The example demonstrates, at sketch level, how the [cosmological settling](../objects/cosmological-settling.md) recovers the [Friedmann equations](../../theories/evolution/terms/friedmann-equations.md) on its $G_t$-invariant subspace.

## Setup

Take the value bilattice to be a bounded continuous one — the unit interval $[0,1]$ as a Belnap-style truth lattice paired with itself via the [twist product](../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/twist-product.md), giving a continuous bilattice $[0,1] \bowtie [0,1]$ with $\bot = (0,0)$ and $\top = (1,1)$. This admits real-valued projections and is the simplest non-trivial choice that supports the densities and ratios of [Lambda-CDM](../../../terms/lambda-cdm-model.md).

Take the [light-cone predicate category](../objects/light-cone-predicate-category.md) $\mathcal{C}_{\mathrm{cone}}$ to contain at minimum the following predicates, all evaluated at diagonal cells $(e, p, e)$:

- $p_a$ — the scale-factor predicate: $v_t(p_a)(e, e) = a(t(e))$ extracted as the truth-axis projection.
- $p_{\rho_b}$ — the baryon-density predicate.
- $p_{\rho_c}$ — the cold-dark-matter-density predicate.
- $p_{\rho_\gamma}$ — the radiation-density predicate.
- $p_\Lambda$ — the cosmological-constant predicate.

Take the [comoving frame](../objects/comoving-frame.md) of FLRW as the privileged section of the cosmic-time projection.

## The symmetric subspace

The [cosmological-principle-as-symmetric-settling](../theorems/cosmological-principle-as-symmetric-settling.md) symmetry group at each cosmic time $t$ is the spatial isometry group of FLRW: $\mathrm{ISO}(3)$ for spatially flat, or $\mathrm{SO}(4)$ / $\mathrm{ISO}(3,1)$ for closed/open spatial sections. Restrict $v_t$ to the $G_t$-invariant subspace. On this subspace, every cell value depends only on $t$:

$$v_t(p_a)(e, e) = a(t), \quad v_t(p_{\rho_b})(e, e) = \rho_b(t), \quad \text{etc.}$$

The infinite-dimensional state-space of $v_t$ collapses onto a five-dimensional state-space parameterized by $(a, \rho_b, \rho_c, \rho_\gamma, \rho_\Lambda)$, all functions of $t$ alone.

## The closure-rule reduction

The closure-rule system, restricted to this subspace, must be a system of ordinary differential equations on these five quantities (plus their ratios, but the dilution rules eliminate redundant degrees of freedom). The structural derivation works as follows:

- The **dilution closure rules** for each matter species fire at every cosmic-time successor step and update the density predicates by a multiplicative factor of the scale-factor ratio:

$$\rho_b(t + dt) = \rho_b(t) \cdot \left(\frac{a(t)}{a(t+dt)}\right)^3, \quad \rho_\gamma(t + dt) = \rho_\gamma(t) \cdot \left(\frac{a(t)}{a(t+dt)}\right)^4$$

These are the $\leq_k$-monotone updates of the density predicates as the comoving slice expands. The exponents (3 vs 4) come from the predicate's transformation under the [redshift reindexing](../morphisms/redshift-reindexing.md) — non-relativistic species pick up only the volume dilution, relativistic species pick up an additional energy redshift.

- The **gravitational closure rule** — the predicated content of the Einstein field equations on the symmetric subspace — fires at every successor step and constrains the scale factor's evolution through the joint values of the density predicates. The constraint, on the symmetric subspace, is:

$$\left(\frac{\dot a}{a}\right)^2 = \frac{8\pi G}{3} (\rho_b + \rho_c + \rho_\gamma + \rho_\Lambda) - \frac{kc^2}{a^2}$$

— the **first Friedmann equation**. The closure rule's firing rate reduces to this differential constraint in the continuous-cosmic-time limit.

## What this sketch is and isn't

This example shows the **shape** of the recovery: under symmetric reduction, the cosmological settling collapses to a finite-dimensional state space parameterized by the standard Lambda-CDM variables, and the closure-rule system reduces to the standard Friedmann + dilution equations. The example does **not** carry out the closure-rule construction in full categorical detail — that requires:

1. Writing the Einstein equations as a closure rule on metric-component predicates (currently sketch-level only in [cosmological-settling](../objects/cosmological-settling.md)).
2. Verifying that the rule's symmetric-restriction firing rate matches the Friedmann left-hand side as a derived consequence rather than as input.
3. Checking that the perturbation-theory expansion around the symmetric solution matches the standard linear cosmological perturbation theory.

Each of those is a tractable but non-trivial calculation. The example serves as a **target**: when the construction in (1)–(3) is complete, this is the result it must reproduce. Until then, the example is a programmatic statement of intent.

## Status

Sketch. The example is structurally consistent with the cosmological settling object's claims and is well-typed. The actual derivation of the Friedmann equation from the closure-rule system is not presented here because the closure-rule system has not been written down explicitly. The role of this example is to fix the target.
