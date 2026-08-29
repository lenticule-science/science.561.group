---
type: theorem
class: engineering-claim
status: proved
depends-on: [scott-continuity-as-checkpointability, strict-regime-engineering-envelope, cost-discipline-reads-free]
see-also: [monotonic-clock-discipline, cost-discipline-reads-free, repair-as-top-cell-resolution, cheapest-sufficient-tier-routing-as-monotone-least-element-selection, per-tick-firing-order-is-deterministic-lex-extension]
---

# Anti-starvation priority escalation is a monotone inflationary operator with a finite-height termination bound

**Claim.** Let $\mathbf{P} = \{0, 1, \dots, 9\}$ be the priority set of `process/fairness-and-priority.md` §2 (lower number = higher priority). Take the *opposite poset* $\mathbf{P}^{\mathrm{op}}$ in which $0$ is the top element and $9$ the bottom (so "more urgent" is "higher in $\mathbf{P}^{\mathrm{op}}$"). Define the per-tick escalation operator on a session's effective priority $p \in \mathbf{P}$ at substrate ordinal $t$:

$$E_{(s, t)}(p) \;=\; \begin{cases} p - 1 & \text{if } \mathrm{wait}(s, t) \ge N \text{ and } p > 0,\\ p & \text{otherwise}\end{cases}$$

where $\mathrm{wait}(s, t)$ is the number of ticks since session $s$'s last respond completed and $N \in \mathbb{N}_{>0}$ is the spec's escalation threshold (default $100$). Then $E_{(s, t)}$ is *monotone* and *inflationary* on $\mathbf{P}^{\mathrm{op}}$ (it never decreases urgency; every step is a $\le_{\mathbf{P}^{\mathrm{op}}}$-step), and the iterated trajectory $p_t, p_{t+1}, \dots$ under sustained wait reaches a *fixed point* at $p = 0$ within $N + 9$ ticks of the wait beginning. The bound decomposes as: at most $N - 1$ ticks of "wait accumulating below threshold" during which $E$ is the identity, plus at most $9$ consecutive advancing ticks after the threshold is first crossed (one per tick: once $\mathrm{wait}(s, t) \ge N$ persists, $E$ advances $p$ by $1$ each tick until $p = 0$).

The fixed point at $p = 0$ is the *priority axis's* fixed point; it does not unconditionally guarantee the session is processed (exogenous resource constraints may still block — surfaced as `PCS_FAIRNESS_STALLED` per spec §9). What the fixed point guarantees structurally is that the priority axis has reached its top and no further escalation is available; any continued non-progression after that is, by the spec's discipline, a substrate anomaly to be surfaced rather than escalated again.

## Why this holds

The structural facts: $\mathbf{P}$ is finite of cardinality $10$, hence finite height. Take its order-reverse $\mathbf{P}^{\mathrm{op}}$ so that the "preferred" direction (more urgent) is upward. Then $E_{(s, t)}$ is:

- **Monotone on $\mathbf{P}^{\mathrm{op}}$.** If $p \le_{\mathbf{P}^{\mathrm{op}}} p'$ (i.e. $p \ge_{\mathbf{P}} p'$ in the original priority numbering), then under the same wait condition $E(p) \le_{\mathbf{P}^{\mathrm{op}}} E(p')$ — the operator preserves the $\mathbf{P}^{\mathrm{op}}$-order.
- **Inflationary on $\mathbf{P}^{\mathrm{op}}$.** $p \le_{\mathbf{P}^{\mathrm{op}}} E(p)$ for every $p$ — escalation never moves a priority *down* in the urgency order; it either advances upward by one step or stays put.

$E_{(s, t)}$ is *not* a closure operator (it is not idempotent: $E(E(p)) \ne E(p)$ when both steps cross the wait threshold and $p > 1$). What it is, structurally, is a monotone inflationary operator on a finite-height poset — Knaster-Tarski's hypothesis with finiteness rather than full order-completeness, and the iterate $E^k(p)$ is non-decreasing in $\mathbf{P}^{\mathrm{op}}$ until it reaches the maximum element $0$, after which $E$ is the identity.

The termination bound decomposes into a *threshold-arming phase* and a *strict-ascent phase*:

- **Threshold-arming phase.** While $\mathrm{wait}(s, t) < N$, $E_{(s, t)}$ is the identity; the priority does not advance. This phase lasts at most $N - 1$ ticks (the spec's default $N = 100$ gives a $99$-tick arming window).
- **Strict-ascent phase.** Once $\mathrm{wait}(s, t) \ge N$ holds and continues to hold (no processing in the interim), each subsequent tick fires $E$ as a strictly-advancing step on $\mathbf{P}^{\mathrm{op}}$. By the chain-length argument — $\mathbf{P}^{\mathrm{op}}$ has height $9$ (chain $9 < 8 < \dots < 0$ in urgency), so a strictly-ascending sequence has length at most $10$ — the operator reaches its fixed point at $p = 0$ in at most $9$ ascent ticks.

Total: at most $N - 1 + 9 = N + 8$ ticks from the start of the wait until the priority fixed point at $0$ (default: $108$ ticks; rounding up to $N + 9$ to absorb the off-by-one). Per [scott-continuity-as-checkpointability](scott-continuity-as-checkpointability.md), each tick is a substrate checkpoint; the trajectory is observable and replayable. (A spec variant that resets the wait counter on each escalation step would give the alternative bound $9 \cdot N$ ticks; the discipline declared by `process/fairness-and-priority.md` §4 is the no-reset variant analyzed here, in which a sustained-wait session traverses the full chain in $\sim N$ ticks plus the chain length.)

The reset on processing is the trajectory's *consumption*: per spec §4, "escalations expire on processing; the rule/session reverts to its declared priority." This is not a separate "decay" rule — it is the substrate's recognition that once the session has been processed, the wait counter resets, the precondition $\mathrm{wait}(s, t) \ge N$ fails, and the session re-enters the trajectory at its declared priority. In closure-trajectory language: the consumed fixed point releases the trajectory to the next escalation cycle.

Per [strict-regime-engineering-envelope](strict-regime-engineering-envelope.md), the substrate's strict regime caps per-respond settlement fuel at a finite layer count. The escalation rule fires at most once per tick per session; per [cost-discipline-reads-free](cost-discipline-reads-free.md), the wait scan is read-only and contributes the cost-quantale's unit. The escalation discipline is therefore structurally compatible with the strict-regime fuel envelope — the per-tick cost is $O(\text{stalled sessions})$ rule-firings plus a free read pass.

## What the priority fixed point does and does not guarantee

What the fixed point at $p = 0$ guarantees:

- The priority axis cannot escalate further (no $p < 0$ in $\mathbf{P}$).
- Per spec §1.1, priority-$0$ rule firings happen first within a tick; if the session's queued respond is dispatchable, it dispatches before any lower-priority session's queued respond.
- The escalation trajectory has reached its termination — any further non-progression is *not* a missing escalation step.

What the fixed point at $p = 0$ does *not* guarantee:

- That the session actually progresses. A session may still be blocked on an exogenous resource (downstream peer unreachable, capability-fiber denial, blocked-pending operator confirmation). Per spec §9, this case emits `PCS_FAIRNESS_STALLED` — the substrate's explicit acknowledgement that priority escalation has reached its limit and the blockage is structural, not schedule-induced.

This is the spec's correct discipline: the closure trajectory in priority-space terminates structurally; the substrate then transitions to anomaly-surfacing rather than continuing to fire $E$ as a no-op. The two regimes — escalation-while-trajectory-runs, anomaly-on-fixed-point-without-progress — are structurally distinguished by whether $p > 0$ or $p = 0$.

## The two-track discipline composes the same operator

The spec's §3 (per-rule priority escalation) and §4 (per-session priority escalation) are two independent applications of the same operator-shape on different priority cells: a rule's `priority` field and a session's `priority` cell. By standard order-theoretic compositionality, two independent monotone inflationary operators on finite-height posets produce a product monotone inflationary operator on the product poset; the joint trajectory is bounded by the sum of heights. Both tracks terminate independently.

The deadline-discipline of `scheduling/deadline.md` §2 is yet another instance: deadline-anchored priority adjustment is a *deterministic* (ord-distance-driven, not wait-driven) version of the same monotone inflationary shape, where the trigger is $\mathrm{ord\text{-}distance} \le \mathrm{threshold}_k$ rather than $\mathrm{wait} \ge N$. The same finite-height termination bound applies, capping deadline-priority adjustment at $p_{\mathrm{declared}} - 3$ (per spec §5).

## Engineering consequence

- **Bounded-time escalation, structurally.** Per the finite-height termination bound, every session reaches priority $0$ within $N + 9$ ticks of the start of its wait under sustained non-processing (default: $\sim 109$ ticks). The bound is order-theoretic, not empirical: $N$ comes from the threshold-arming phase, $9$ from the chain length of $\mathbf{P}^{\mathrm{op}}$.
- **Reset is automatic.** Per spec §4 "escalations expire on processing," the trajectory's fixed point is released when the gated work runs; the session re-enters the trajectory at its declared priority. No separate decay rule is needed — reset is the dual of consumption-on-progress.
- **Per-tick cost is constant.** Per [strict-regime-engineering-envelope](strict-regime-engineering-envelope.md), the escalation rule's per-tick fuel cost is $O(\text{stalled sessions})$, with each escalation contributing one closure-rule firing. Per [cost-discipline-reads-free](cost-discipline-reads-free.md), the wait-tick scan is read-only.
- **Determinism is preserved.** The priority cell at each tick is a deterministic function of the prior priority cell and the wait predicate; replaying the event log reproduces every escalation byte-identically.
- **Stall escalation surfaces, not livelocks.** Per `PCS_FAIRNESS_STALLED`, a session that has reached priority $0$ but cannot progress emits an anomaly cell rather than continuing to fire $E$ as a no-op. This is the trajectory's "fixed-point reached without resolution" surface — structurally distinct from "still climbing toward fixed point." Per [repair-as-top-cell-resolution](repair-as-top-cell-resolution.md)'s `repair^⊥` shape (abort/escalate to governance), the substrate surfaces rather than livelocks.
- **Reservation is an orthogonal constraint.** Per spec §7, reserved-budget sessions reserve capacity even when idle; the trajectory analysis here is over the *priority* component of the dispatch decision only. The two compose in the dispatch scheduler per [graded-dispatch-via-q-enriched-fusion](graded-dispatch-via-q-enriched-fusion.md)'s product structure; this theorem governs only the priority axis.

## What the theorem rules out

- **Unbounded priority escalation.** A discipline that escalates without a chain-height bound (negative priorities, fractional priorities) cannot guarantee termination by the finite-height argument. The spec's $\mathbf{P} = \{0, \dots, 9\}$ is the structural prerequisite.
- **Non-monotone priority adjustment.** A discipline that *decreases* urgency when the wait threshold is met would not be inflationary on $\mathbf{P}^{\mathrm{op}}$; the trajectory would not converge by the inflationary argument. The spec's §4 directionality is structural.
- **Time-decayed priority without consumption.** A discipline that decays priority back to declared *without* gating on processing would break the consumption-reset dual; the trajectory would oscillate rather than terminate cleanly. The spec's "expire on processing" reset is the trajectory-correct discipline.
- **Per-rule escalation as priority-cell mutation.** Re-writing a rule's declared `priority` field would lose the witness chain. The substrate's effective-priority shadow cell (separate from the declared priority) is the witness-preserving discipline.
- **Conflation with cost or capability.** Per spec §6, fairness operates within concurrency limits (which live in the cost quantale per [cost-composition-via-lawvere-quantale](cost-composition-via-lawvere-quantale.md)); per [cheapest-sufficient-tier-routing-as-monotone-least-element-selection](cheapest-sufficient-tier-routing-as-monotone-least-element-selection.md), tier choice is a separate selection. Anti-starvation is the priority-axis trajectory only; conflating it with cost or capability would lose the per-axis termination bound.
- **Liveness as a priority-axis guarantee.** This theorem does *not* claim that reaching priority $0$ implies the session is processed. The spec's `PCS_FAIRNESS_STALLED` is the substrate's honest acknowledgement that priority is one axis of three and exogenous blockage is a real possibility. A theorem that conflated priority-fixed-point with liveness would over-claim; this theorem deliberately does not.

## What the theorem requires

- The priority poset $\mathbf{P}$ is finite-height (the spec's $\{0, \dots, 9\}$ satisfies this).
- $E_{(s, t)}$ is monotone and inflationary on $\mathbf{P}^{\mathrm{op}}$.
- The substrate's per-tick fairness discipline processes the highest-priority dispatchable respond first (per `process/fairness-and-priority.md` §1.1) — this is what makes priority $0$ a *meaningful* fixed point in scheduling terms.
- Escalation is *consumed* by processing (the §4 reset is the trajectory's fixed-point dual).
- The wait threshold $N$ is a finite positive integer (default $N = 100$ satisfies this).
- The substrate operates in the strict regime per [strict-regime-engineering-envelope](strict-regime-engineering-envelope.md), so the per-tick rule-fuel envelope accommodates the escalation rule's $O(\text{stalled sessions})$ cost.
- `PCS_FAIRNESS_STALLED` is the substrate's surface for "priority fixed point reached without progress" — the theorem does not paper over this case.

## Position

This theorem grounds the substrate's anti-starvation discipline in finite-height order theory: $E$ is a monotone inflationary operator on the finite-height priority poset, and its iterated trajectory terminates in at most $N + 9$ ticks (threshold-arming phase plus chain-length ascent). The dev spec's "no starvation" claim is, structurally, a *bounded-time priority termination*, not a liveness guarantee — exogenous blockage is honestly surfaced as `PCS_FAIRNESS_STALLED` rather than absorbed into the trajectory. Together with [cheapest-sufficient-tier-routing-as-monotone-least-element-selection](cheapest-sufficient-tier-routing-as-monotone-least-element-selection.md) (which grounds tier choice as a monotone min on a finite cost-ordered chain) and [graded-dispatch-via-q-enriched-fusion](graded-dispatch-via-q-enriched-fusion.md) (which grounds office selection as a $\odot$-fold), this theorem completes the structural decomposition of the dispatch scheduler's three independent axes: office, tier, and priority. Each axis lives in a distinct order-theoretic structure (bilattice-graded fiber, totally-ordered tier chain, finite-height priority poset); each carries its own termination/selection guarantee. Starvation-prevention on the priority axis is, structurally, a finite-height termination bound — the spec's bound is exactly the order-theoretic bound, no more.
