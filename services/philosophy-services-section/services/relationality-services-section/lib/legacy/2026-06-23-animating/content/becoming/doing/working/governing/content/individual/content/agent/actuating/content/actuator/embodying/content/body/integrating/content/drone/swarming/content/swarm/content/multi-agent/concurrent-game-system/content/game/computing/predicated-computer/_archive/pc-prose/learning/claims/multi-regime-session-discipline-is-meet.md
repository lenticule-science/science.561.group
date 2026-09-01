---
type: theorem
class: engineering-claim
status: proved
depends-on: [regime-record, regime-meet-semilattice, regime-classification-for-substrate, strict-regime-engineering-envelope, scott-continuous-regime-engineering-envelope, transfinite-bounded-regime-engineering-envelope, aperiodic-regime-engineering-envelope]
math-depends-on: [four-regime-dichotomy, regime-chain-order]
---

# Multi-regime session discipline is the regime meet across its scope

**Claim.** Let $S$ be a session whose `respond` scope touches entities $\{e_1, \ldots, e_n\}$ from substrates with declared regimes $\{R_1, \ldots, R_n\}$. Order the four regimes by [regime-meet-semilattice](teaching/explanations/regime-meet-semilattice.md), and define a session discipline $R$ to be **sound for scope $\{R_i\}$** iff every closure-rule firing admissible under $R$ is admissible under every $R_i$ (the session does not over-permit relative to any scope element). Then

$$ R_S \;:=\; \bigsqcap_{i=1}^{n} R_i \;=\; \min_{i=1}^{n} R_i $$

is the **unique maximal sound discipline** for scope $\{R_i\}$. Every $R \le R_S$ is sound; no $R > R_S$ is sound.

## Proof

Three parts.

**Part 1: per-axis envelope content is co-aligned with the chain order.** Each per-regime envelope theorem ([strict](strict-regime-engineering-envelope.md), [Scott-continuous](scott-continuous-regime-engineering-envelope.md), [transfinite-bounded](transfinite-bounded-regime-engineering-envelope.md), [aperiodic](aperiodic-regime-engineering-envelope.md)) commits an envelope along four axes — engine fuel, audit cohomology, federation shipping, snapshot policy. On each axis, the four envelopes' admissibility sets are nested in the chain direction:

- **Fuel:** strict (finite per cascade) $\subseteq$ Scott-continuous (finite per prefix) $\subseteq$ transfinite-bounded (countable firing ordinal) $\subseteq$ aperiodic ($\omega_1$-or-larger).
- **Audit cohomology:** strict ($H^1 = 0$) $\subseteq$ Scott-continuous ($H^1 = 0$) $\subseteq$ transfinite-bounded (countable-rank $H^1$) $\subseteq$ aperiodic ($\omega_1$-rank $H^1$).
- **Federation shipping:** endpoint-state-shippable for strict and Scott-continuous; trajectory-required for transfinite-bounded and aperiodic.
- **Snapshot:** endpoint-only for strict and Scott-continuous; trajectory for transfinite-bounded and aperiodic.

A regime smaller in the chain admits a subset of firings on every axis. The meet is well-defined and equals $\min$.

**Part 2: every $R \le R_S$ is sound.** Pick any axis $A$. By Part 1, on axis $A$ the admissibility set at $R$ is contained in the admissibility set at every $R'$ with $R \le R'$. So if $R \le R_i$ for every $i$, on axis $A$ every firing admitted by $R$ is admitted by every $R_i$. The session at $R$ does not over-permit on axis $A$. This holds for all four axes, so $R$ is sound. The set of sound disciplines is the down-set $\{R : R \le R_S\}$, which contains $R_S$.

**Part 3: no $R' > R_S$ is sound.** Let $i^* = \arg\min_i R_i$, so $R_{i^*} = R_S$. Suppose $R' > R_S$ in the chain. By Part 1, on at least one axis $A$ the admissibility set at $R'$ properly contains the admissibility set at $R_S$ — strict containment somewhere is what distinguishes non-equal regimes in the chain. Pick such an $A$ and a firing $f$ admitted on $A$ at $R'$ but not at $R_S$. The substrate at $e_{i^*}$ is conformant to its declared regime $R_{i^*} = R_S$ (per [regime-classification-for-substrate](regime-classification-for-substrate.md)), so its envelope rejects $f$ on axis $A$. The session at $R'$ admits $f$; the substrate at $e_{i^*}$ rejects it. The session over-permits — the negation of soundness.

Combining Parts 2 and 3, $R_S$ is the unique maximal sound discipline. $\square$

## Corollary

If a closure-rule firing during respond extends the session's actual scope to include $e_{n+1}$ with $R_{n+1} < R_S$, the new meet is $R_{n+1} < R_S$. By Part 3 with the new scope, the session's current discipline (at $R_S$) is now unsound. The substrate either reconfigures to the new meet with an explicit witness of the discipline change, or refuses the firing with a typed error; it does not silently re-derive in either direction.
