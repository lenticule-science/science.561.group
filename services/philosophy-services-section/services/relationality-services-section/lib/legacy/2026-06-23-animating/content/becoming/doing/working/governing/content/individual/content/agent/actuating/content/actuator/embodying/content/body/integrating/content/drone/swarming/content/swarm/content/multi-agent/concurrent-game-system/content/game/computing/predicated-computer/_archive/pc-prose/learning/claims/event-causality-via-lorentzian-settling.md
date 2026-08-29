---
type: theorem
class: engineering-claim
status: proved
depends-on: [time-and-event-ordinals, event-log, lorentzian-causal-settling, closure-ordinal, four-regime-dichotomy, settlement-determinism, lorentzian-apex-void-as-timelike-spacelike]
see-also: [settlement-via-closure-2-monad, replication-consistency-via-network-sheaf]
---

# Event causality is the Lorentzian causal settling on the substrate's events

**Claim.** The substrate's events under their causal-precedence relation form a [Lorentzian causal-structure settling](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/lorentzian-causal-settling.md) — events are points in a discrete-spacetime model, the relation "event $e_1$ is in $e_2$'s causal past" is a cell-valued predication, and the substrate's replay operation is exactly the closure of the seed precedence relation to its transitive closure. Per [lorentzian-apex-void-as-timelike-spacelike](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/theorems/lorentzian-apex-void-as-timelike-spacelike.md), every pair of events is either *timelike-related* (one in the other's causal past — apex cone) or *spacelike-separated* (neither in the other's causal past — void cone). The substrate's parallel-replay optimization is exactly the spacelike-separated reading: events whose causal cones don't intersect can be replayed concurrently.

## Why this holds

Per [lorentzian-causal-settling](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/lorentzian-causal-settling.md), the substrate-side instance is direct:

- **Cells** = pairs $(e_1, e_2)$ of events in the substrate's event set $E$.
- **Initial settling** $v_0(e_1, e_2)$ = $\mathbf{t}$ if $e_1 \prec_0 e_2$ (direct causal link, recorded in the substrate's event-graph predications), $\bot$ otherwise.
- **Closure operator** = causal transitivity: $T_{\mathrm{caus}}(v)(e_1, e_3) := v(e_1, e_3) \vee \exists e_2 . [v(e_1, e_2) \wedge v(e_2, e_3)]$.
- **Settling** = the full causal order $\preceq$ on $E$, computed at the closure-fixed-point.

Per [settlement-via-closure-2-monad](settlement-via-closure-2-monad.md), the closure 2-monad's iteration converges to a fixed point; per the [four-regime-dichotomy](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/theorems/four-regime-dichotomy.md), the closure ordinal $\kappa$ classifies the substrate's regime:

- **Strict** ($\kappa < \omega$) — finite event sets, $\kappa = \lceil \log_2 D \rceil$ where $D$ is the longest causal chain.
- **Scott-continuous** ($\kappa = \omega$) — countable streams, every causal pair determined at some finite stage.
- **Transfinite-bounded** ($\omega < \kappa < \omega_1$) — countably-many ordinal strata.
- **Aperiodic** ($\kappa \geq \omega_1$) — pathological substrates.

Per [lorentzian-apex-void-as-timelike-spacelike](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/theorems/lorentzian-apex-void-as-timelike-spacelike.md), the apex / void cones of the settled substrate correspond to the timelike / spacelike duality:

- **Apex cone** (settled cells) = pairs $(e_1, e_2)$ where $e_1$ causally precedes $e_2$ — *timelike-related* events.
- **Void cone** (permanently $\bot$ cells) = pairs $(e_1, e_2)$ where neither precedes the other — *spacelike-separated* events.

The substrate's replay is therefore structurally the Lorentzian closure: replay traverses the causal order, and any operator's input-events must be available before the operator's output-events in the order.

## Engineering consequence

- **Parallel replay along spacelike-separated events.** Events in the void cone — no causal dependency in either direction — admit *any* relative ordering. The substrate's runtime can replay them concurrently on different worker threads / federation peers / replicas. Per [replication-consistency-via-network-sheaf](replication-consistency-via-network-sheaf.md), independent replicas converge under closure-merge regardless of the per-replica ordering of spacelike events.
- **Sequential replay along timelike chains.** Events in the apex cone — one in the other's causal past — must be replayed in causal order. The substrate's runtime serializes timelike chains.
- **Causal-cone determines reachability.** Whether event $e_1$ can affect event $e_2$ is determined by the apex cone of $e_1$: $e_2$ is reachable from $e_1$ iff $e_2 \in \mathrm{ApexCone}(e_1)$. Per the substrate's structural causal closure, this is computable from the event-graph predications without runtime queries.
- **Worldline parameterization is per-substrate.** Per [time-and-event-ordinals](teaching/explanations/time-and-event-ordinals.md), each substrate's *event ordinal* is its worldline parameterization — a substrate-local linear ordering compatible with the causal partial order. Two substrates may parameterize differently along distinct worldlines; the *causal* content is observer-independent.
- **Replay-determinism is causal-determinism.** Per [settlement-determinism](../theorems/settlement-determinism.md), the substrate's settled state is a function of (event log, operator specifications). Per this theorem, the relevant order on the event log is the causal order, not the worldline ordinal — replaying along any worldline parameterization compatible with the causal order produces the same fixed point.
- **Multi-observer Lorentzian extends to multi-replica.** Per [lorentzian-causal-settling](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/lorentzian-causal-settling.md)'s multi-observer section, each replica has its own causal past (its backward light cone) and assigns settlings only on cells reachable from that past. The substrate's per-replica state is exactly this observer-relative settling.

## What the theorem rules out

- **Forced sequential replay.** A substrate that replays all events in worldline order even when they are spacelike-separated is leaving parallelism unused. Per the theorem, the structural ordering is causal, not worldline; the substrate may replay along any topological sort of the causal order.
- **Causal-violation-by-policy.** A substrate that allows an operator to read an event-state before the events that produced it have been replayed has violated the causal closure. Per [settlement-determinism](../theorems/settlement-determinism.md), the substrate's reads must respect the causal order.
- **Worldline-ordinal as content.** A reducer that branches on the substrate's event-ordinal value as if it were canonical content is conflating the worldline parameterization with the causal structure. Per [time-and-event-ordinals](teaching/explanations/time-and-event-ordinals.md), the ordinal is per-substrate; the causal precedence is observer-independent.

## What the theorem requires

- The substrate's event set is recorded as substrate content (per [event-log](../objects/event-log.md)).
- Direct causal links are explicit predications (an event's "this depends on these prior events" is a substrate predication, not implicit runtime data).
- The substrate's closure operator implements causal transitivity (per [lorentzian-causal-settling](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/lorentzian-causal-settling.md)).
- The substrate's regime is admissible: strict / Scott-continuous / transfinite-bounded for terminating replay; aperiodic-regime substrates require the direct-limit framework for finite-time observations.

## Position

This theorem grounds the substrate's temporal discipline in the Lorentzian causal-set framework: the substrate's events are spacetime points, replay is causal closure, parallelism is spacelike independence. Together with [time-and-event-ordinals](teaching/explanations/time-and-event-ordinals.md), it makes precise the substrate's distinction between *worldline ordinal* (per-substrate parameterization) and *causal precedence* (observer-independent structure). The substrate's audit, replay, federation, and parallel-execution disciplines are all consistent with the substrate's events forming a Lorentzian causal set.
