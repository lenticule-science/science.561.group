---
title: "What order structure do the four settling regimes form?"
kind: question
status: answered
asked-at: 2026-05-11
answered-at: 2026-05-11
answer-summary: "The four regimes are totally ordered by closure-ordinal bound and form a meet-semilattice with meet equal to min."
---

The [four-regime dichotomy](../../../references/four-regime-dichotomy.md) classifies every settling by its closure ordinal $\kappa$ into one of four strata: strict ($\kappa < \omega$), Scott-continuous ($\kappa = \omega$), transfinite-bounded ($\omega < \kappa < \omega_1$), aperiodic ($\kappa \geq \omega_1$). This is a partition, but the theorem does not explicitly state the order structure on the four strata as a mathematical object.

The question matters because the downstream engineering theory ([multi-regime-session-discipline-is-meet](../../../engineering/theories/tech/theories/computing/theories/predicated-computing/theorems/multi-regime-session-discipline-is-meet.md)) uses the regime semilattice without a predication-category proof of its existence.

## Answer

The four closure-ordinal intervals $[0,\omega)$, $\{\omega\}$, $(\omega,\omega_1)$, $[\omega_1,\infty)$ are totally ordered by ordinal comparison, giving the chain

$$\mathrm{strict} \;<\; \mathrm{scott\text{-}cont} \;<\; \mathrm{transfinite\text{-}bounded} \;<\; \mathrm{aperiodic}.$$

A total chain is a meet-semilattice with $R \sqcap R' = \min(R, R')$. The formal theorem is [regime-chain-order](../../../humanities/theories/math/theories/categories/theories/predication-categories/theorems/regime-chain-order.md).
