---
kind: example
status: verified
depends-on: [aperiodic-co-classification, aperiodic-co-classifying-invariant, transfinite-induction-verdier-dual, transfinite-induction-moduli-point, transfinite-induction-settling]
instantiates: [aperiodic-co-classification]
lineage: 4
---

# Aperiodic co-classification of the transfinite-induction settling

The L4 instance of the [aperiodic co-classification theorem](../theorems/aperiodic-co-classification.md). **Lineage 4** instance — first concrete pair of $\mathrm{cl}\text{-}\mathrm{inv}$ and $\check{\mathrm{cl}}\text{-}\mathrm{inv}$.

## Setup

The L4 [transfinite-induction settling](transfinite-induction-settling.md) at $E = \omega_1$, with closure ordinal $\kappa = \omega_1$.

## Sheaf-side classifying invariant

Per [transfinite-induction-moduli-point](transfinite-induction-moduli-point.md):

$$\mathrm{cl}\text{-}\mathrm{inv}(v) \;=\; \sum_{\mu \in L_{\mathrm{ns}}(\omega_1)} e_\mu \;\in\; \bigoplus_{\mu \in L_{\mathrm{ns}}(\omega_1)} \mathbb{Z}$$

where $L_{\mathrm{ns}}(\omega_1) = \{\mu < \omega_1 : \mu \text{ countable limit ordinal}\}$ — uncountably many firing ordinals.

## Cosheaf-side co-classifying invariant

By the aperiodic co-classification theorem, the dual:

$$\check{\mathrm{cl}}\text{-}\mathrm{inv}(v) \;=\; \sum_{\mu \in L_{\mathrm{ns}}(\omega_1)} \check{e}_\mu \;\in\; H_1(\mathbf{T}^*_{\leq \omega_1}, \check{\mathcal{F}}_v).$$

Same firing-ordinal data, presented as cosheaf-homology cycles.

## Both presentations encode the same MLD-class

By the aperiodic co-classification theorem: $v \sim_{\mathrm{MLD}} v' \iff \mathrm{cl}\text{-}\mathrm{inv}(v) = \mathrm{cl}\text{-}\mathrm{inv}(v') \iff \check{\mathrm{cl}}\text{-}\mathrm{inv}(v) = \check{\mathrm{cl}}\text{-}\mathrm{inv}(v')$.

The two routes — sheaf cohomology $H^1$ and cosheaf homology $H_1$ — produce the same classification. They differ in what *operations* are natural:

- **$H^1$ side (sheaf cocycles):** equality testing via coboundary witness; classes refine under sub-truncation.
- **$H_1$ side (cosheaf cycles):** explicit cycle representatives via local generators; classes coarsen under base-extension.

For computing whether two transfinite-induction settlings are MLD: the sheaf-side check is more natural. For exhibiting an explicit MLD-class representative: the cosheaf-side construction is more natural.

## Position in Lineage 4

The L4 instance of the aperiodic co-classification. First concrete computation of the corpus's paired classifying-invariant structure on a substantive aperiodic settling.
