---
type: example
status: verified
depends-on: [skh-deformation-ext-classification, transfinite-induction-d-frame-h1-generators, two-firing-transfinite-settling, social-network-deformation-tangent, strict-regime-deformation-tangent]
instantiates: [skh-deformation-ext-classification]
lineage: 4
---

# Deformation tangent of the two-firing transfinite settling

The L4 instance of the [Ext-classification of SKH deformations](../theorems/skh-deformation-ext-classification.md). **Lineage 4** instance — first concrete deformation computation with non-zero tangent space.

## Setup

The L4 [two-firing transfinite settling](two-firing-transfinite-settling.md): $E = \omega \cdot 2 + 1$, $\Pi_1$-induction, two NSC firings at $\omega$ and $\omega \cdot 2$.

## Ext^1 computation

A first-order deformation perturbs the settling. Unlike L1 / L2 (rigid because Boolean discrete data), L4 has *closure-rule structure* that admits perturbation:

- **Rule-perturbation tangent directions.** The $\Pi_1$-induction rule has a *firing position* parameter (the threshold below which the antecedent must hold). Perturbing this threshold gives a tangent direction. Concretely: $r_\beta$ fires at $\beta$ iff $(\forall \alpha < \beta. v(P)(\alpha, \alpha) = \mathbf{t})$. We could deform to $r_{\beta - \delta}$ with $\delta \in (0, \beta)$ — but this is a *discrete* shift, not infinitesimal.

But there's a continuous direction available:

- **Per-firing weight perturbations.** In the Q-enriched setting (with non-Boolean quantale), each firing's d-frame generator $D_\mu$ has a quantale-graded weight. Perturbing this weight infinitesimally gives a continuous tangent direction at $\mu$. For Boolean quantale, this collapses to discrete; for richer quantales, continuous.

For Boolean d-frame data (predication categories' typical setting), $\mathrm{Ext}^1$ is *zero* on the strict-adjoint-only directions but *non-zero* on the firing-ordinal-perturbation direction, where each firing $\mu \in L_{\mathrm{ns}}$ contributes a direction:

$$\mathrm{Ext}^1(\mathcal{F}_v, \mathcal{F}_v) \;=\; \mathbb{Z}^{|L_{\mathrm{ns}}|} \;=\; \mathbb{Z}^2$$

for the two-firing settling. **The L4 deformation tangent is countable** (finite here because of the bounded ordinal; countably infinite at $E = \omega \cdot k + 1$ for arbitrary $k$, and full countably infinite for the $E = \omega^2 + 1$ case).

## Comparison across lineages

| Lineage | Setting | $\dim \mathrm{Ext}^1$ |
|---|---|---|
| L1 | strict, single-cell | $0$ (rigid) |
| L2 | strict, multi-entity | $0$ (rigid; Boolean discrete) |
| L4 (this file) | transfinite-bounded, two-firing | $|L_{\mathrm{ns}}| = 2$ |
| L4 (countably-many-firings variant) | transfinite-bounded, $\omega$ firings | $|L_{\mathrm{ns}}| = \omega$ |
| L5 (forthcoming) | aperiodic | $|L_{\mathrm{ns}}(\omega_1)| = 2^{\aleph_0}$ |

L4 is where the deformation rank progression *starts being non-zero*. The corpus's distinctive content (deformation theory becomes substantive here) emerges at the transfinite-bounded boundary.

## Ext^2

By [vanishing-above-degree-1](../theorems/settling-cohomology-vanishes-above-degree-1.md), $\mathrm{Ext}^2(\mathcal{F}_v, \mathcal{F}_v) = 0$. Unobstructed: every first-order deformation extends to a formal deformation.

## Position in Lineage 4

The L4 deformation-tangent computation. With this in hand, L4 has been carried through:

- Settling structure ([transfinite-induction-settling](transfinite-induction-settling.md), [two-firing-transfinite-settling](two-firing-transfinite-settling.md), and others)
- d-frame $H^1$ generators ([transfinite-induction-d-frame-h1-generators](transfinite-induction-d-frame-h1-generators.md))
- Strong-MLD orbit ([transfinite-induction-strong-mld-exchange-orbit](transfinite-induction-strong-mld-exchange-orbit.md))
- Verdier dual ([transfinite-induction-verdier-dual](transfinite-induction-verdier-dual.md))
- Co-classification ([transfinite-induction-co-classification](transfinite-induction-co-classification.md))
- Meta-classification ([transfinite-induction-meta-classification](transfinite-induction-meta-classification.md))
- Deformation tangent (this file)

L4 is now complete as the lineage's intended role: the *workhorse* benchmark where predication categories' distinctive content has substantive concrete instances.
