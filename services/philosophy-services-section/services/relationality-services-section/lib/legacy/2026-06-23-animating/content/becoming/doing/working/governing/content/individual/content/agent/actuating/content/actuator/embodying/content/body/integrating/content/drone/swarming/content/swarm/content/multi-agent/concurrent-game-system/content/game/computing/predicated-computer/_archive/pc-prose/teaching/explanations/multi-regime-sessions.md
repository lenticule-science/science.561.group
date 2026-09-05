---
type: narrative
depends-on: [regime-meet-semilattice, multi-regime-session-discipline-is-meet, regime-classification-for-substrate, federation-convergence, snapshot-replay-fidelity]
see-also: [regime-discipline, federation-as-substrate-join]
---

# Multi-regime sessions

Most predicated-computing sessions stay within a single substrate, and the substrate's regime determines the session's engine fuel, audit-cohomology bound, federation shipping discipline, and snapshot policy. The interesting case is the session whose `respond` scope crosses substrates of different regimes — strict and transfinite-bounded, Scott-continuous and aperiodic, and so on. This narrative walks through how such a session inherits its discipline.

The library content backing the narrative is two files: [regime-meet-semilattice](../teaching/explanations/regime-meet-semilattice.md) gives the chain order and meet operation on regimes; [multi-regime-session-discipline-is-meet](../theorems/multi-regime-session-discipline-is-meet.md) proves the session adopts the meet as its unique maximal sound discipline.

## The chain order

The four regimes are ordered by the admissibility content of their per-regime engineering envelopes — strict admits the smallest set of closure-rule firings (quantifier-free, finite cascade, $H^1 = 0$, endpoint-state-shippable, endpoint-only snapshot), aperiodic the largest. The order is total, and per the meet-semilattice concept the meet of two regimes equals the smaller (more restrictive) of the two.

The four envelope axes — engine fuel, audit cohomology, federation shipping, snapshot policy — are co-aligned with the chain order. A regime smaller in the chain is at least as restrictive on every axis simultaneously. A session that adopts a regime adopts all four axis envelopes at once; there is no per-axis mix to negotiate.

## The discipline

A session whose scope has regimes $\{R_1, \ldots, R_n\}$ adopts $R_S = \min_i R_i$. Concretely:

- The session's engine fuel is the strictest of its scope substrates' fuel envelopes. Closure-rule firings the looser scope substrates would have permitted, but $R_S$ does not, are rejected at the session boundary.
- The session's audit cohomology is the strongest $H^1$-bound across its scope. A single strict or Scott-continuous scope element collapses the session's audit machinery to $H^1 = 0$ session-wide; $H^1$-classes from any transfinite-bounded scope substrate are not visible through the session.
- The session's federation handshake agrees on the meet's federation discipline — endpoint state if $R_S$ is strict or Scott-continuous, trajectory if $R_S$ is transfinite-bounded or aperiodic.
- The session's snapshot policy follows the meet.

Why the meet and not, say, the max or a per-axis mix: the meet is the unique *maximally useful* discipline that does not over-permit relative to any scope substrate. Adopting any regime less restrictive than $R_S$ would admit firings the most-restrictive scope substrate cannot honour; adopting any more-restrictive regime is sound but needlessly rejects firings every scope substrate would admit. The theorem proves both directions.

## What the discipline rules out

- **Per-axis cross-regime mixing.** No conformant session adopts strict-regime fuel paired with aperiodic-regime audit. The four axes' chains are co-aligned; choosing the strongest of one axis and the weakest of another is not the envelope of any of the four canonical regimes, and no envelope theorem proves it.
- **Silent over-permitting.** A session whose actual scope expands to a more-restrictive substrate cannot quietly continue at its previous regime. The substrate either reconfigures to the new meet with an explicit witness (cf. the dev runtime's `PCC_SESSION_REGIME_SCOPE_VIOLATION` surface), or refuses the firing.
- **Defaults to the loosest scope's regime.** A session that defaults to its loosest scope's regime over-permits on every more-restrictive scope element, producing audit-witness gaps. The meet is the correct default; nothing else is sound on the strictest scope element.
- **Strongest-discipline default for federation.** A federation handshake that defaults to "ship trajectory" regardless of peer regime over-permits on strict peers — the strict peer's engine cannot reconstruct trajectory cells beyond its envelope. The handshake computes the meet and ships at the meet's federation discipline.

## Where this lives in the dev surface

The dev spec `process/multi-regime-session.md` (in the PyPredComp dev docs) commits the substrate to computing the meet at session-open by reading each scope element's `regime-record.regime` and configuring the downstream engine, audit, federation, and snapshot disciplines from the corresponding per-regime envelope. The closure-rule firings outside the meet's admissibility set are rejected with `PCC_REGIME_MISMATCH`. Mid-session scope expansion that would shrink $R_S$ surfaces as `PCC_SESSION_REGIME_SCOPE_VIOLATION`. The library theorem this narrative is built on is what justifies these choices as the discipline-aligned defaults.
