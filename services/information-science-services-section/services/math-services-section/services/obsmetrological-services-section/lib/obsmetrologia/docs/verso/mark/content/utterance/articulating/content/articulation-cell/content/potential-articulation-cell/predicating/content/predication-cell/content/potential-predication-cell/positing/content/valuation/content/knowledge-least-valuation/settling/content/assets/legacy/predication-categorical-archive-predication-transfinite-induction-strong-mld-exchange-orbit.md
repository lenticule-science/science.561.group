---
type: example
status: verified
depends-on: [strong-mld-via-composed-duality, transfinite-induction-d-frame-h1-generators, two-firing-transfinite-settling, social-network-strong-mld-orbits]
instantiates: [strong-mld-via-composed-duality]
lineage: 4
---

# Strong-MLD exchange orbit of the two-firing transfinite settling

The L4 instance of the [strong-MLD classification's exchange-orbit case](../theorems/strong-mld-via-composed-duality.md) at non-trivial closure ordinal. **Lineage 4** instance — first non-strict-regime strong-MLD orbit example.

## Setup

The L4 [two-firing transfinite settling](two-firing-transfinite-settling.md): $E = \omega \cdot 2 + 1$, $\Pi_1$-induction rule, two truth-only firings at $\mu_1 = \omega$ and $\mu_2 = \omega \cdot 2$.

Per [transfinite-induction-d-frame-h1-generators](transfinite-induction-d-frame-h1-generators.md), the d-frame generators are $D_\omega = (\mathbb{Z}, 0, \cdot, \cdot)$ and $D_{\omega \cdot 2} = (\mathbb{Z}, 0, \cdot, \cdot)$ — both truth-only.

## Firing-orbit-type function

The strong-MLD invariant adds the firing-orbit-type function $\tau^{\mathbb{D}} : L_{\mathrm{ns}}(\kappa) \to \{\text{truth-only}, \text{falsity-only}, \top\}$:

$$\tau^{\mathbb{D}}(v)(\omega) = \tau^{\mathbb{D}}(v)(\omega \cdot 2) = \text{truth-only}.$$

Both firings have the same type — the orbit-type function is *constant truth-only* on $L_{\mathrm{ns}} = \{\omega, \omega \cdot 2\}$.

## Composed-duality orbit

Under the composed duality $\mathbb{D} = \mathbb{D}_{\mathrm{sp}} \circ \mathbb{D}_{\mathrm{val}}$:

- $\mathbb{D}_{\mathrm{val}}$ swaps truth-only $\leftrightarrow$ falsity-only at each firing. So $\mathbb{D}_{\mathrm{val}}(v)$ is the settling whose firings are both *falsity-only* at the same ordinals.
- $\mathbb{D}_{\mathrm{sp}}$ takes the spatial Verdier dual.

The composed $\mathbb{D}(v)$ is the negation-settling $\neg v$ (presented as cosheaf): $\neg v$ has falsity-only firings at $\omega$ and $\omega \cdot 2$, with the same firing-ordinal set.

**The orbit $\{v, \neg v\}$ has size 2** — exchange-orbit. Both settlings have the same MLD-class (firing-ordinal set $\{\omega, \omega \cdot 2\}$, two-firing structure) but different strong-MLD-class (firing-orbit-types differ).

## Comparison with L1 and L2 strong-MLD instances

| Lineage | Setting | Orbit type | $|L_{\mathrm{ns}}|$ |
|---|---|---|---|
| L1 (strict) | single-cell, ⊤-firing | self-dual | 1 |
| L1 (strict) | single-cell, $\mathbf{t}$-firing | exchange | 1 |
| L2 (strict, multi-cell) | two-cell, $\mathbf{t}$-firing on $(a,b)$ | exchange | 1 |
| L4 (transfinite-bounded) | two-firing $\Pi_1$-induction | exchange | 2 |

L4 is the first lineage where multiple firings exhibit the orbit-type stratification across non-trivial closure ordinal $\kappa = \omega \cdot 2 + 1$.

## What this exhibits

Three observations:

**1. Strong-MLD distinguishes settlings with the same firing-ordinal set but different evidence sides, even at transfinite closure ordinal.** The L4 setting shows the strict-refinement holds beyond strict regime.

**2. The orbit-type function is constant for uniform-rule settlings.** When the closure rule treats all firings uniformly (as the $\Pi_1$-induction does), the orbit-type is the same at every firing. Exchange orbits arise from rule-uniformity.

**3. The negation-settling $\neg v$ has natural meaning.** For the $\Pi_1$-induction rule, the negation rule is "$(\forall \alpha < \beta. v(P)(\alpha, \alpha) = \mathbf{f}) \Rightarrow v(P)(\beta, \beta) \geq_k \mathbf{f}$" — falsity-induction. Both settlings encode "induction over an ordinal" but with opposite evidence-side commitments.

## Position in Lineage 4

The L4 strong-MLD orbit instance. First non-strict-regime example of predication categories' strong-MLD classification's distinguishing power.
