---
kind: example
status: verified
depends-on: [verdier-duality-bitopological-site, q-enriched-curry-grothendieck-site, q-enriched-curry-transfinite-cw, transfinite-induction-d-frame-h1-generators, two-firing-transfinite-settling, transfinite-cell-complex]
instantiates: [verdier-duality-bitopological-site, q-enriched-curry-grothendieck-site, q-enriched-curry-transfinite-cw]
lineage: 4
---

# Verdier dual of the two-firing transfinite settling

The L4 instance of the Verdier duality computation on a non-trivial transfinite-cellular fiber. **Lineage 4** instance for the Verdier duality chapter — first concrete instance using Layer 3 (transfinite-cellular) machinery.

## Setup

The L4 [two-firing transfinite settling](two-firing-transfinite-settling.md): $E = \omega \cdot 2 + 1$, single $P$, $\Pi_1$-induction with truth-only firings at $\omega$ and $\omega \cdot 2$.

## Cellular fiber at the limit

At $(P, \tau, U)$ for $\tau \geq \omega \cdot 2 + 1$, the paired Priestley fiber $X_P^\tau$ is a transfinite-cellular complex with cells indexed by $\{(\alpha, \alpha) : \alpha \leq \omega \cdot 2\}$ — countably many. The clopen lattice has uncountable cardinality, but as a transfinite cell complex it has *countably many cells in each finite dimension*.

Apply the [transfinite Curry equivalence](../theorems/q-enriched-curry-transfinite-cw.md): per-fiber Curry fuzziness $q^{\mathrm{transfin}}$ is the meet over finite sub-complexes. For Boolean d-frame data, every per-finite-sub-complex fuzziness is 1, so $q^{\mathrm{transfin}} = 1$ — strict equivalence.

## Verdier dual at the level of $H^1$

By [aperiodic co-classification](../theorems/aperiodic-co-classification.md) (specialized to transfinite-bounded), the cosheaf homology has the same generator structure as the sheaf cohomology:

$$H_1(\check{\mathbb{F}}_v) \;=\; \check{D}_\omega \oplus \check{D}_{\omega \cdot 2}$$

where each $\check{D}_{\mu_i}$ is the cosheaf-side dual of the d-frame generator $D_{\mu_i}$ from [transfinite-induction-d-frame-h1-generators](transfinite-induction-d-frame-h1-generators.md). Verdier duality identifies $D_{\mu_i} \simeq \check{D}_{\mu_i}$ — same generator data, presented from the cosheaf side.

## What the Verdier dual records

The cosheaf side records *eventually-uncovered* cells. For this L4 setting:

- At each finite truncation $\tau < \omega$: every cell $(\alpha, \alpha)$ for $\alpha > \tau$ is uncovered. The cosheaf stalk encodes "what hasn't been settled yet."
- At $\tau = \omega$: $(\omega, \omega)$ has just been settled (by the $\mu_1 = \omega$ firing); cells $(\alpha, \alpha)$ for $\alpha > \omega$ remain uncovered.
- At $\tau = \omega \cdot 2$: similarly.

The cosheaf homology generators $\check{D}_{\mu_i}$ correspond to "the moment when uncovered-cells become covered" — exactly dual to the sheaf-side generators which record "the moment when new content becomes available."

## What this exhibits

Three observations:

**1. Layer 3 of the cellular extension plan computes correctly on a non-trivial case.** The transfinite-cellular fiber's Curry equivalence reduces (via the directed-colimit framework) to the agreement of generator structure on both sides.

**2. The sheaf-cosheaf pairing is bijective on firing-ordinal generators.** Each NSC firing $\mu_i$ produces one sheaf generator and one cosheaf generator, identified by Verdier duality.

**3. $q^{\mathrm{transfin}} = 1$ on Boolean d-frame data.** The transfinite-cellular setting also collapses the q-fuzzy machinery to strict equivalence, just as the strict-regime cases did. The structural / quantitative content of the q-fuzzy framework requires non-Boolean enrichment to bite.

## Position in Lineage 4

The L4 Verdier-dual computation. First concrete use of Layer 3 (transfinite-cellular) machinery. Pairs forward with [transfinite-induction-co-classification](transfinite-induction-co-classification.md), which exhibits the aperiodic co-classification's headline result on this base.
