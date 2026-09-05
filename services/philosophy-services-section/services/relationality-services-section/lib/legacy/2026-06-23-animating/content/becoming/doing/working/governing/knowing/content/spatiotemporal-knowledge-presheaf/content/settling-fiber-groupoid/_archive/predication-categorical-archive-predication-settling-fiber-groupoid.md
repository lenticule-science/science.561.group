---
type: definition
class: groupoid
symbol: "\\mathrm{KP}^\\simeq(B)"
depends-on: [predication-settling, mutually-locally-derivable, settling-morphism, settling-automorphism-1-truncation]
---

# Settling fiber groupoid

For a fixed base $B = (\mathbf{L}, \mathcal{C}, E, \lambda)$, the **settling fiber groupoid** $\mathrm{KP}^\simeq(B)$ has:

- **0-cells:** [predication settlings](predication-settling.md) over $B$.
- **1-cells:** invertible [settling-morphisms](../morphisms/settling-morphism.md) — equivalently, biequivalences in the 2-category of settlings over $B$ — including those with non-zero ordinal shift $\delta$.
- **2-cells:** identities, by [settling-automorphism 1-truncation](../theorems/settling-automorphism-1-truncation.md).

The 2-cells of $\mathrm{KP}^\simeq(B)$ are all identities, so it is effectively a 1-groupoid despite being embedded in the 2-category of settlings over $B$. We treat it as a 1-groupoid throughout.

## Components are MLD-classes

The connected components of the settling fiber groupoid are the [mutually-locally-derivable](teaching/explanations/mutually-locally-derivable.md) equivalence classes:

$$\pi_0(\mathrm{KP}^\simeq(B)) \;=\; \mathrm{KP}(B) \,/\, \sim_{\mathrm{MLD}}.$$

A component is by definition an isomorphism class; since 1-cells are biequivalences and biequivalence coincides with MLD on this 2-category, components are MLD-classes.

## Automorphism restriction

Although 1-cells between distinct settlings may carry non-trivial ordinal shift $\delta > 0$, *endo*-automorphisms $\phi : v \to v$ are forced to $\delta = 0$: a shift-$\delta$ self-morphism is not invertible because $v_{\tau - \delta}$ is undefined for $\tau < \delta$. Consequently $\mathrm{Aut}^\simeq(v)$ consists of $\delta = 0$ settling-autos only.

## Visible quotient

The settling fiber groupoid carries a normal subgroupoid of [invisible automorphisms](teaching/explanations/invisible-automorphism-subgroup.md). Quotienting gives the [visible settling fiber groupoid](visible-settling-fiber-groupoid.md) — the primary moduli object.
