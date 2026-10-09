---
type: theorem
status: proved
depends-on: [four-regime-dichotomy, closure-ordinal]
see-also: [regime-decomposition, regime-mld-invariance, antecedent-regime-bound, regime-antimonotonicity, settling-cohomology-vanishes-above-degree-1]
---

# Regime chain order

The four [regimes](../../../references/four-regime-dichotomy.md) form a **total chain** under the ordering induced by closure-ordinal bound, and this chain is a **meet-semilattice**:

$$\mathrm{strict} \;<\; \mathrm{scott\text{-}cont} \;<\; \mathrm{transfinite\text{-}bounded} \;<\; \mathrm{aperiodic},$$

with meet $R \sqcap R' = \min(R, R')$.

## Proof

By the [four-regime dichotomy](../../../references/four-regime-dichotomy.md), the four regimes correspond bijectively to the four ordinal intervals

$$[0, \omega), \quad \{\omega\}, \quad (\omega, \omega_1), \quad [\omega_1, \infty),$$

where each settling's [closure ordinal](../objects/closure-ordinal.md) $\kappa$ determines which interval it falls in. These four intervals are totally ordered by ordinal comparison: every ordinal in $[0,\omega)$ is strictly less than every ordinal in $\{\omega\}$, which is strictly less than every ordinal in $(\omega,\omega_1)$, which is strictly less than every ordinal in $[\omega_1, \infty)$. The regime label function $\kappa \mapsto \mathrm{reg}(v)$ is a monotone surjection from the poset of closure ordinals onto the four-element chain. $\square$

The four-element chain is a total order, hence trivially a meet-semilattice. The meet $R \sqcap R' = \min(R, R')$ is just the minimum in the chain.

## Corollary

For any set of settlings $\{v_1, \ldots, v_n\}$ over possibly different bases, there is a well-defined **meet of their regimes** $\bigsqcap_i \mathrm{reg}(v_i) = \min_i \mathrm{reg}(v_i)$ in the chain order. This is the regime of the "most constrained" settling in the collection.

## Relation to cohomology

The chain order is compatible with the cohomological stratification: the strict and Scott-continuous regimes have $H^1 = 0$ for the [settling-associated sheaf](../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../engineering-services-section/services/computer-engineering-services-section/services/computer-systems-engineering-services-section/services/agent-computer-system-engineering-services-section/apps/agentic-relation-engine/lib/relating/docs/settling-associated-sheaf.md); the transfinite-bounded and aperiodic regimes have non-trivial $H^1$. The regime chain order thus separates "cohomologically trivial" (lower two regimes) from "cohomologically alive" (upper two).

## Engineering grounding

This theorem is the predication-category foundation for the [regime-meet-semilattice](../engineering/theories/tech/theories/computing/theories/predicated-computing/concepts/regime-meet-semilattice.md) concept in predicated-computing, and for the [multi-regime session discipline](../engineering/theories/tech/theories/computing/theories/predicated-computing/theorems/multi-regime-session-discipline-is-meet.md) theorem: the maximal sound discipline for a mixed-regime scope is the meet in this chain.
