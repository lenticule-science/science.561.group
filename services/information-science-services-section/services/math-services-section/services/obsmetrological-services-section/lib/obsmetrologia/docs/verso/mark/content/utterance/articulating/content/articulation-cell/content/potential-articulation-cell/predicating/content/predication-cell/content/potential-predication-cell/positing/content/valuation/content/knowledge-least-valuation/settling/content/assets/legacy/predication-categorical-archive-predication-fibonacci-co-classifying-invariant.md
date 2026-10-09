---
type: example
status: draft
depends-on: [aperiodic-co-classification, aperiodic-co-classifying-invariant, fibonacci-classifying-invariant, fibonacci-substitution-settling, verdier-duality-bitopological-site]
instantiates: [aperiodic-co-classification]
lineage: 5
---

# Co-classifying invariant of the Fibonacci substitution settling

The L5a instance of the [aperiodic co-classification](../theorems/aperiodic-co-classification.md). **Lineage 5a** instance — the cosheaf-side dual of [fibonacci-classifying-invariant](fibonacci-classifying-invariant.md).

## Co-classifying invariant

By the aperiodic co-classification theorem, the cosheaf homology has the same firing-ordinal generator structure:

$$H_1(\mathbf{T}^*_{\leq \omega_1}, \check{\mathcal{F}}_v) \;=\; \bigoplus_{\mu \in L_{\mathrm{ns}}(\omega_1)} \mathbb{Z}.$$

The co-classifying invariant:

$$\check{\mathrm{cl}}\text{-}\mathrm{inv}(v_{\text{Fibonacci}}) \;=\; \sum_{\mu \in L_{\mathrm{ns}}(\omega_1)} \check{e}_\mu \;\in\; \bigoplus_{\mu \in L_{\mathrm{ns}}(\omega_1)} \mathbb{Z}.$$

## Sheaf vs cosheaf presentations

Both $\mathrm{cl}\text{-}\mathrm{inv}$ and $\check{\mathrm{cl}}\text{-}\mathrm{inv}$ encode the same firing-ordinal data, paired by Verdier duality. They differ in computational character:

- **Sheaf side.** Each generator $e_\mu$ is a 1-cocycle that is not a coboundary — records "agreement on this firing's content cannot be reduced to earlier-stage agreement."
- **Cosheaf side.** Each generator $\check{e}_\mu$ is a 1-cycle that is not a boundary — records "the void at this firing cannot be aggregated into earlier-stage void."

For the Fibonacci settling specifically: the "void at firing $\mu$" is the cells whose substitution-stage hasn't reached them by stage $\mu$. The cosheaf records *which cells are still uncovered* at each firing — dual to the sheaf's record of *which cells are newly covered*.

## Position in Lineage 5

The L5a co-classification instance, paired with the sheaf-side presentation. Together they exhibit predication categories' first concrete instance of the paired classifying-invariant structure on a substantive aperiodic case.
