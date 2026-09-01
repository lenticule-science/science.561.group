---
type: theorem
status: sketch
depends-on: [sufficiency-gap, cosmological-settling, friedmann-equations, dark-energy]
---

# Reflexive–Friedmann coupling

**Statement.** Couple the [sufficiency gap](../objects/sufficiency-gap.md) $g(z)$ to the [Friedmann equations](../../../theories/evolution/terms/friedmann-equations.md) by treating $g(z)$ as an order parameter whose squared amplitude contributes a transient energy density to the Friedmann right-hand side. The resulting **Reflexive–Friedmann System (RFS)** is

$$
\begin{cases}
\dfrac{dg}{dz} = -A(z) g - B g^3, \\[4pt]
H^2(z) = H_0^2 \bigl[\Omega_m (1+z)^3 + \Omega_\Lambda + \Omega_g \, g^2(z)\bigr],
\end{cases}
$$

with $A(z) = \beta \bigl[\Omega_m (1+z)^3 - \Omega_\Lambda\bigr]$ governing the sign of equilibrium, $B > 0$ saturating the order parameter, $\beta$ controlling the relational response rate, and $\Omega_g$ the fractional density of the reflexive component.

The system has a critical redshift $z_c$ at which $A(z_c) = 0$:

$$
(1 + z_c)^3 = \frac{\Omega_\Lambda}{\Omega_m},
$$

yielding $z_c \approx 0.9$ for current Lambda-CDM parameter estimates — coincident with the matter-to-dark-energy transition.

## What this is doing

The RFS proposes a **dynamical** rather than merely diagnostic role for the sufficiency gap. In the diagnostic reading ([hubble-tension-as-residuation-failure](hubble-tension-as-residuation-failure.md)), $g(z)$ is a measurement of how badly two inference sub-settlings disagree. In the RFS reading, $g(z)$ is *also* a physical degree of freedom that back-reacts on the cosmological expansion: a non-zero $g(z)$ contributes an effective energy density $\rho_g = \rho_* g^2(z)$ to the Friedmann equation, whose effect is a transient modification of $H(z)$ around $z_c$.

The RFS is a phase-change model. The Landau-style $g^2 + g^4$ effective potential

$$
\Phi(g; z) = \tfrac{1}{2} A(z) g^2 + \tfrac{1}{4} B g^4
$$

has $A > 0$ in the matter-dominated regime (closed phase, $g \approx 0$, sub-settlings residuate) and $A < 0$ in the dark-energy-dominated regime (open phase, $g > 0$, residuation fails). The transition at $A(z_c) = 0$ is the categorical content of the universe's transition from deceleration to acceleration: as expansion shifts from matter-dominated to $\Lambda$-dominated, the cosmological settling enters a regime in which present inference sub-settlings cannot residuate, and the sufficiency gap acquires a non-zero floor.

## Derived observables

Effective dark-energy equation of state under the RFS:

$$
w_{\mathrm{eff}}(z) = -1 + \frac{2(1+z)}{3 H(z)} \frac{dg}{dz} \frac{\Omega_g g}{\Omega_\Lambda + \Omega_g g^2}.
$$

For small $\Omega_g$ and $g(z)$ peaked near $z_c$, $w_{\mathrm{eff}}$ deviates from $-1$ near $z_c$ and returns to $-1$ at low and high $z$. This is structurally distinguishable from a constant $w \neq -1$ (quintessence) and from a strictly $w = -1$ ($\Lambda$).

Reflexive entropy:

$$
S_r(z) = -\int g(z) \ln g(z) \, dz,
$$

peaking near $z_c$ and capturing the cosmic-history-integrated relational instability. This is a candidate observable connecting the RFS to standard thermodynamic entropy bounds in cosmology.

## What this is and is not

**Is:** A worked dynamical extension of the [sufficiency gap](../objects/sufficiency-gap.md), making the gap not just a diagnostic but a candidate physical degree of freedom. The model is minimal — it adds one new function $g(z)$ and three parameters $(\Omega_g, \beta, B)$ to standard Lambda-CDM — and it is testable: it makes specific predictions for $H(z)$ and $w_{\mathrm{eff}}(z)$ that differ from $\Lambda$CDM in measurable ways.

**Is not:** Verified, derived, or competitive (yet) with quintessence, early dark energy, or other established Hubble-tension proposals. The RFS is a *structurally motivated* model — its appeal is that the same $g(z)$ that diagnoses the tension also resolves it dynamically — but its empirical fit to current data has not been carried out, and its physical interpretation (what does $\rho_g$ correspond to in fundamental terms?) is presently a place-holder.

The RFS is filed here as the most natural dynamical extension of the predicated diagnosis of the Hubble tension. Whether it survives contact with data is open.

## Status

Sketch. The dynamical equations are well-posed and $z_c \approx 0.9$ matches the empirical equality redshift. Open tasks: (a) fit the RFS to combined Planck + DESI BAO + Pantheon+ data and constrain $(\Omega_g, \beta, B)$; (b) compare to wCDM and EDE on the same data; (c) derive (or refute) a candidate microphysical origin for $\rho_g$ — most naturally, a closure-rule whose firing rate is suppressed in the matter-dominated regime and unsuppressed in the $\Lambda$-dominated regime, connecting back to [dark-energy-as-closure-rate](dark-energy-as-closure-rate.md).

## Provenance

Translates the **Reflexive–Friedmann System** introduced in [`reflexive-disequilibrium-and-cosmological-phase-change.md`](../../../../../../../../work/triage/engineering-archive/library/humanities/theories/philosophy/theories/relationality/triage/provenance/relationality-archive/sscu-sprint/domains/cosmology/reflexive-disequilibrium-and-cosmological-phase-change.md) (sscu-sprint, 2026-02-27). The earlier formulation of the same coupled system, with the same effective potential $\Phi(g) = \tfrac12 A(z) g^2 + \tfrac14 B g^4$ and the same critical-redshift derivation $(1+z_c)^3 = \Omega_\Lambda / \Omega_m$, appears in the math-from-relationality-bucket as [`reflexive-hubble-tension.md`](../../../../../../../../work/triage/engineering-archive/library/humanities/theories/philosophy/theories/relationality/triage/provenance/math-from-relationality-bucket/reflexive-hubble-tension.md) — that draft is the proximate source for the coupled equations. The dynamical equation for $g(z)$ and the modified Friedmann equation are carried over verbatim; the surrounding categorical framing has been re-expressed in the predication-categorical vocabulary of inference sub-settlings, knowledge order, and residuated bilattices.
