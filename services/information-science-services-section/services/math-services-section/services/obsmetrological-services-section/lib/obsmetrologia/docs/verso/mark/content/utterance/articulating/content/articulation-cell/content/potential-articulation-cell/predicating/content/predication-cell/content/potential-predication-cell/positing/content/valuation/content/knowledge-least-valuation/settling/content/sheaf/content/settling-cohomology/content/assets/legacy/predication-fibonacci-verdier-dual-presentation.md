---
type: example
status: draft
depends-on: [verdier-duality-bitopological-site, q-enriched-curry-grothendieck-site, q-enriched-curry-transfinite-cw, fibonacci-substitution-settling, fibonacci-co-classifying-invariant, transfinite-induction-verdier-dual]
instantiates: [verdier-duality-bitopological-site, q-enriched-curry-transfinite-cw]
lineage: 5
---

# Verdier-dual presentation of the Fibonacci substitution settling

The L5a instance of the Verdier dual on an aperiodic case.

## Setup

The L5a [Fibonacci substitution settling](fibonacci-substitution-settling.md) at $E = \omega_1$.

## Cellular fiber and Layer 3

The paired Priestley fiber at the limit is a transfinite-cellular complex with cells indexed by $L_{\mathrm{ns}}(\omega_1)$ (uncountable). Apply the [transfinite Curry equivalence](../theorems/q-enriched-curry-transfinite-cw.md):

- Each finite sub-complex has Curry fuzziness $q^{\mathrm{fib}} = 1$ (Boolean d-frame data, strict-adjoint inclusions).
- Transfinite fuzziness $q^{\mathrm{transfin}} = \bigwedge_F q^{\mathrm{fib}}(F) = 1$ — strict equivalence.

So Verdier duality holds strictly on the Fibonacci settling.

## Verdier identification

The sheaf cohomology and cosheaf homology agree (per the co-classification):

$$H^1(\mathcal{F}_v) \;\simeq\; H_1(\check{\mathcal{F}}_v) \;=\; \bigoplus_{L_{\mathrm{ns}}(\omega_1)} \mathbb{Z}.$$

The sheaf side records the "covered cells become covered at firing $\mu$" cocycle structure; the cosheaf side records the dual "uncovered cells become covered at firing $\mu$" cycle structure. Both encode the firing-ordinal data.

## Position in Lineage 5

The L5a Verdier-dual instance — predication categories' first end-to-end Verdier dual computation on an aperiodic case using all three layers (1+2+3) of the cellular extension plan.
