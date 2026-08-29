---
type: concept
class: discipline
depends-on: [regime-record, regime-chain-order]
see-also: [regime-classification-for-substrate, multi-regime-session-discipline-is-meet, regime-discipline]
---

# Regime meet-semilattice

The four [regimes](../objects/regime-record.md) — strict, Scott-continuous, transfinite-bounded, aperiodic — ordered by *envelope-admissibility containment*:

$$ \mathrm{strict} \;\le\; \mathrm{scott\text{-}continuous} \;\le\; \mathrm{transfinite\text{-}bounded} \;\le\; \mathrm{aperiodic}, $$

where $R \le R'$ iff every closure-rule firing admissible under $R$'s [per-regime engineering envelope](../theorems/regime-classification-for-substrate.md) is admissible under $R'$'s envelope. Lower in the chain means more restrictive admissibility set.

The chain is total, so the meet exists and equals $\min$:

$$ R \sqcap R' \;=\; \min(R, R'). $$

The meet is the regime whose envelope-admissibility set is the intersection of the two — equivalently, the more restrictive of the two regimes.
