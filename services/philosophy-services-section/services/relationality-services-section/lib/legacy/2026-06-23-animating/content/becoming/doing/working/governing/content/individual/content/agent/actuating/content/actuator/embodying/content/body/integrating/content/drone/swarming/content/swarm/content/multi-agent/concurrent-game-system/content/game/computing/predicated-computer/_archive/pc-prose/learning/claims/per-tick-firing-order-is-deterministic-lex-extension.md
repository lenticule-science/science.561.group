---
type: theorem
class: engineering-claim
status: proved
depends-on: [settlement-determinism, anti-starvation-as-monotone-priority-repair-fixed-point, monotonic-clock-discipline]
see-also: [graded-dispatch-via-q-enriched-fusion, cheapest-sufficient-tier-routing-as-monotone-least-element-selection]
---

# Per-tick firing order is determined by the spec's committed constraints

The dev spec `process/fairness-and-priority.md` §1 commits two separate ordering disciplines for what happens within a tick — one over closure-rule firings, one over respond invocations — and asserts the resulting trajectory is deterministic. This theorem records what the spec's commitments actually pin down.

## Claim A — closure-rule firing order

Let $R_t$ be the set of (rule, bind-assignment) pairs whose premises match the substrate state at the start of tick $t$. The spec commits two constraints on the order in which the runtime fires elements of $R_t$:

1. **Priority order.** If $\mathrm{pri}(r_1) < \mathrm{pri}(r_2)$ (lower number = higher priority, including any escalation per [anti-starvation-as-monotone-priority-repair-fixed-point](anti-starvation-as-monotone-priority-repair-fixed-point.md)), then $r_1$ fires before $r_2$.
2. **Lex tie-break by rule-id.** Within a priority class, ties are broken lexicographically by `rule-id`.

The order on $R_t$ is therefore the lex order on $(\mathrm{pri}, \mathrm{rule\text{-}id})$. This is total on the projection of $R_t$ to *distinct rules*: any two rules with distinct rule-ids are strictly ordered.

What the spec does **not** pin down: the order in which the multiple bind-assignments of a *single* rule fire within a layer. The spec's two constraints leave this open; this theorem does not invent a third constraint to close it. Two conformant runtimes therefore agree on the order of distinct rules, and may differ on the internal order of a rule's multiple firings within one layer. The substrate's value-side determinism survives because rule firings within a layer commute under closure-2-monad lax-idempotence (per [settlement-determinism](settlement-determinism.md) Part 2) — the settled fiber after the layer is independent of internal order.

## Claim B — respond-invocation dispatch order

Let $D_t$ be the set of respond invocations queued for processing at tick $t$, with each invocation $d$ tagged by the priority $\mathrm{pri}(d)$ of its session at dispatch time. The spec commits two constraints (§1.3 and §1.4):

3. **Priority-class precedence.** If $\mathrm{pri}(d_1) < \mathrm{pri}(d_2)$, then $d_1$ is processed before $d_2$.
4. **Round-robin within a priority class.** Within a priority class, sessions take turns: the queue's head is the session that has gone longest since its last dispatch in this class.

Model the runtime's per-class dispatch state as a deque of sessions: when a session is dispatched, its head invocation is processed and the session is rotated to the tail (if it has further queued invocations in this class). Initially, the deque is ordered by the first appearance of each session's queued respond at this priority class.

**Then the order in which $D_t$ is processed is determined by the pair (priority class, deque rotation), and the resulting sequence is a function of $D_t$ together with the deque's initial state at tick $t$.**

The spec does **not** commit a tie-break between two respond invocations from the *same* session within the same priority class — they are processed in the queue order in which the session enqueued them, which is itself a substrate-content artifact (the respond-author event-ordinals, totally ordered per [monotonic-clock-discipline](monotonic-clock-discipline.md) within a single session). The deque's initial state and the per-session queue are both functions of substrate content visible at the start of the tick; given the same content, the same dispatch sequence results.

## Proof

**Claim A.** The lex order on $(\mathrm{pri}, \mathrm{rule\text{-}id})$ is total on distinct rule-ids: priority-classes partition $R_t$, and within a class lex-on-rule-id is total because rule-ids are distinct strings — closure-rule records are admitted with unique `id` fields per the normative `kernel/closure-rule-record.md` admission discipline; collisions are rejected at admission time and never enter $R_t$. Constraint 1 forces any conformant order to agree on cross-class precedence; constraint 2 forces any conformant order to agree on within-class precedence between distinct rules. So any two conformant orderings of $R_t$ agree on the projection to distinct rules.

For two firings of the *same* rule within a layer (different bind-assignments), neither constraint applies — both have the same rule-id and the same priority. The spec leaves this open. The closure-2-monad's lax-idempotence (per [settlement-determinism](settlement-determinism.md) Part 2 and the underlying [closure-2-monad-lax-idempotence](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/theorems/closure-2-monad-lax-idempotence.md)) ensures the layer's settled output is independent of the internal ordering of these firings; value-side determinism survives.

**Claim B.** The theorem assumes a fixed, conformant deque-initialization policy (e.g., session-first-appearance order at the priority class); fairness §1 does not by itself select among equivalent RR initializations, and a substrate that wishes to pin one must commit it in the kernel's dispatch surface. Given any such policy, the deque-based dispatch is deterministic by construction once the deque's initial state is fixed: each step pops the head, processes its session's next invocation, and rotates. The deque's initial state at tick $t$ is determined by substrate content (the per-session last-dispatch-tick cells, plus the per-session queue of respond invocations enqueued before $t$). All of this content is visible at the start of $t$; per [settlement-determinism](settlement-determinism.md), conformant substrates with the same event log have the same content. So the deque's initial state agrees across conformant runtimes, and the dispatch sequence is the deterministic deque trajectory from that state.

Constraint 3 (priority precedence) is the outer loop over priority classes: the deque for priority $k$ is processed to empty before the deque for priority $k+1$ is touched, with priority-escalation events from the lower-priority deques re-entering at the appropriate higher-priority deque per [anti-starvation-as-monotone-priority-repair-fixed-point](anti-starvation-as-monotone-priority-repair-fixed-point.md). Constraint 4 (round-robin) is the per-class deque's rotation discipline. Both are deterministic functions of substrate content. $\square$

## What the theorem rules out

A conformant runtime cannot use a per-tick scheduling decision that is a function of host-runtime state outside the substrate (wall-clock-driven priority, host-thread scheduling races, network-arrival jitter). Any such function would diverge between two conformant runtimes whose substrate content matches but whose host state differs, violating the spec's deterministic-firing-order commitment.

## What the theorem does not claim

The spec leaves two finer-grained orderings open: the internal order of multiple bind-assignments of one rule within one layer, and (implicitly) the order of two respond invocations from the same session at the same priority that were enqueued at the same substrate-ordinal. The first is closed at the value-determinism layer by closure-2-monad commutation; the second is closed by the per-session monotonic clock (a single session cannot enqueue two responds at the same ordinal). Closing these in the spec text, if desired, would require additional commitments beyond §1's four bullets — they are not consequences of the spec as written, and this theorem does not impute them.
