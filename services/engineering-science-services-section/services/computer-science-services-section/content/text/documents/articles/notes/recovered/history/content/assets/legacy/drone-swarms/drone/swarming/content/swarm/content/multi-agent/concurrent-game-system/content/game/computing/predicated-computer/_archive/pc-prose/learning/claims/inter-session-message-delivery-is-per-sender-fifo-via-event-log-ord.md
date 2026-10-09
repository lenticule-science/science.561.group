---
type: theorem
class: engineering-claim
status: proved
depends-on: [monotonic-clock-discipline, closure-rule-system-realizes-closure-2-monad]
see-also: [per-stream-chunk-delivery-is-fifo-projection-of-event-log, per-tick-firing-order-is-deterministic-lex-extension, modal-restriction-as-substrate-authorization-primitive]
---

# Inter-session message delivery is per-sender FIFO via event-log ord

The dev spec `ipc/message-passing.md` §6 commits that messages from one sender to one receiver maintain order, while across multiple senders ordering is "per-receiver event-ordinal (the order the receiver's heartbeat sees them). No FIFO guarantee across senders." The dev spec `process/inter-session-messaging.md` §4 implements this through a heartbeat-driven surfacing rule on `(*, has-unread-message, $recipient)`. This theorem grounds those commitments structurally.

## Claim

Let $S$ be a sender session and $R$ a receiver session. Let $M_{S \to R}$ be the set of `session-message` cells with `from-session = S`, `to-session = R`, each carrying its substrate-stamped `authored-at-ord` field.

**Claim 1 (per-sender total order on author-ord).** The function $m \mapsto \mathrm{authored\text{-}at\text{-}ord}(m)$ is injective on $M_{S \to R}$ and the resulting strict total order on $M_{S \to R}$ agrees with $S$'s respond-cycle authoring order: if $S$'s respond invocation authoring $m_1$ commits before $S$'s respond invocation authoring $m_2$ begins, then $\mathrm{authored\text{-}at\text{-}ord}(m_1) < \mathrm{authored\text{-}at\text{-}ord}(m_2)$. The order is immutable: no later substrate operation reassigns `authored-at-ord` values, so once two messages from $S$ to $R$ exist on the event log, their relative order is structurally fixed and any consumer can recover $S$'s authoring order by sorting on this single scalar.

**Claim 2 (no cross-sender total order).** For two senders $S_1 \ne S_2$ both authoring messages to $R$, no substrate property orders $M_{S_1 \to R}$ against $M_{S_2 \to R}$ beyond the local event-log interleaving at $R$'s substrate. The interleaving is determined by the order in which the two senders' respond invocations commit their event-log appends — a function of each session's local respond scheduling, fuel budget, and tick alignment — and is not a causal relation: a receiver cannot infer either sender's wall-clock authoring time from the relative event-ord of two cross-sender messages.

**Claim 3 (per-channel grain).** Claim 1 is per ordered pair $(S, R)$. Different `from-session` values, or the same sender writing to two different receivers, are independent ordered chains. A consumer that uses `authored-at-ord` alone as a sequencing key without first partitioning by `(from-session, to-session)` will conflate distinct chains' orderings.

**Scope note (delivery vs ordering).** This theorem makes a structural claim about the *order* on $M_{S \to R}$ that the substrate guarantees, not about the wall-clock sequence in which the §4 `surface-unread-session-messages` rule's bind iterations produce `has-unread-message` assertions for a given recipient. A subscriber that wishes to consume from $S$'s channel in $S$'s authoring order does so by reading `from-session` and `authored-at-ord` from each surfaced message and processing in `authored-at-ord` order on a per-`from-session` basis; this discipline recovers per-sender FIFO from Claim 1 regardless of how the §4 rule's intra-tick bind iteration is scheduled.

## Proof

**Part 1: per-sender author-ord is strictly increasing in $S$'s respond-cycle order.**

Per [closure-rule-system-realizes-closure-2-monad](closure-rule-system-realizes-closure-2-monad.md), each session's respond cycle is serialized: at most one respond invocation is in flight per session at any wall-clock instant. The dev spec `process/session-as-process.md` §1 makes this concrete — a session has a single open respond loop and budgets are per-respond, not per-concurrent-respond. The inter-session-messaging §3 author-step happens inside the sender's respond invocation (the `respond(target=session:<recipient>, payload={msg-type: ..., content: ...})` call), so two distinct authors $m_1, m_2$ from $S$ to $R$ occur in two distinct, totally-ordered respond invocations of $S$.

Per [monotonic-clock-discipline](monotonic-clock-discipline.md), substrate event-log appends are stamped with a strictly increasing event-ord. The `authored-at-ord` predicate on the message cell is exactly this stamp. Therefore $\mathrm{authored\text{-}at\text{-}ord}(m_1) < \mathrm{authored\text{-}at\text{-}ord}(m_2)$ whenever $S$'s respond authoring $m_1$ commits before $S$'s respond authoring $m_2$ begins. Injectivity of $m \mapsto \mathrm{authored\text{-}at\text{-}ord}(m)$ on $M_{S \to R}$ follows from strict event-ord monotonicity across all event-log appends, of which the message-author appends are a subsequence.

**Part 2: the order is structurally immutable.**

The substrate's event log is append-only — past entries are not rewritten by later operations. The `authored-at-ord` predicate's value, once written into the message cell at author time, is a fact in the event log; the predication-categories' bilattice discipline admits later predications on other predicates of the same cell but does not retract or reassign the original `authored-at-ord` stamp. Therefore the strict total order on $M_{S \to R}$ established in Part 1 persists across all substrate operations — including replay, snapshot-restore, and substrate edits to other predicates of the message cells.

**Part 3: cross-sender interleaving is not constrained beyond local event-log ord.**

For two senders $S_1, S_2$, their respond invocations are independent — neither blocks on the other; the substrate serializes their event-log appends per-substrate (the substrate has one event log) but does not coordinate the *content* of those appends across senders. The relative event-ord of an $S_1$-message and an $S_2$-message is whichever sender's respond invocation reached the substrate's append point first, which depends on each session's local respond scheduling, fuel budget, and tick alignment.

Two consequences:

- The substrate gives no semantic ordering between $S_1$'s and $S_2$'s messages: a receiver observing two cross-sender messages with $\mathrm{authored\text{-}at\text{-}ord}(m_1^{S_1}) < \mathrm{authored\text{-}at\text{-}ord}(m_2^{S_2})$ cannot infer that $S_1$ authored $m_1$ wall-clock-before $S_2$ authored $m_2$. The opposite event-ord interleaving on a sibling substrate, or under the same substrate replayed with different fuel scheduling at the senders, is admissible.
- Causal-coordination across senders requires explicit structure. The §2 `response` message-type's `responds-to` predicate is the canonical mechanism: a response cell carries a structural reference to a specific query message, independent of event-ord. The §2 `conflict` message-type's `conflict-on` predicate plays the same role for cross-session disagreement detection.

**Part 4: per-(sender, receiver) channel independence.**

Two distinct ordered pairs $(S, R_1)$ and $(S, R_2)$ — same sender, different receivers — produce two disjoint subsets of the message-cell population, distinguished by the `to-session` predicate. A subscriber attached to $R_1$'s `(R_1, has-unread-message, *)` projection sees only the $(S, R_1)$ subset; the same sender's $(S, R_2)$ messages are not visible there at all. Conversely $(S_1, R)$ and $(S_2, R)$ — different senders, same receiver — both surface at $R$ but carry distinct `from-session` values; Part 1 applies independently to each per-`from-session` subset and Claim 2 says nothing structural orders the two subsets against each other.

A subscriber that wants to deduplicate or sequence across receivers, or to merge channels, must therefore partition by the `(from-session, to-session)` pair before reading `authored-at-ord`.

## Engineering consequence

- The §6 message-passing claim "ordering is per-receiver event-ordinal" reduces to a structural property of `authored-at-ord` on the per-substrate event log. Within a single substrate it survives replay and snapshot-restore (event-ord is part of the snapshotted state). Cross-substrate behavior under federation depends on the federation transport's order discipline and is out of scope for this theorem.
- Inter-session protocols that rely on causal reply (RPC-style query/response per §2's `query` and `response` types) MUST use the `responds-to` predicate to chain reply→query. Relying on cross-sender event-ord to imply causality is incorrect.
- A receiver implementing exactly-once handling of a sender's messages can use `authored-at-ord` as a per-sender high-water mark — but only after partitioning by `from-session`. A single global high-water mark across senders would silently drop messages from any sender whose authoring lags another's.
- Multi-session task-handoff coordination (the `task-handoff` and `completed` types) is per-channel ordered: a sender's `task-handoff` followed by a `completed` from the same sender to the same receiver carries the structural author-ord recoverable by the receiver. A `completed` from a *different* sender for the same `task-id` carries no implicit ordering relative to the original handoff.

## What the theorem rules out

- **Cross-sender FIFO.** A subscriber design that assumes "if $S_1$ sent before $S_2$, the receiver sees $S_1$'s message first" is incorrect under this theorem; nothing in the substrate enforces it. Cross-sender ordering requires either a single coordinator session or an explicit causal-id protocol.
- **Per-msg-type FIFO across all messages.** A receiver scanning all `query` messages globally and assuming author-ord matches conversation order will silently mis-order parallel queries from distinct senders.
- **Inferring sender wall-clock from event-ord.** The substrate's event-ord is not a wall-clock; it is the per-substrate monotonic ord per [monotonic-clock-discipline](monotonic-clock-discipline.md). Two independent senders' relative wall-clock times are not derivable from their messages' relative `authored-at-ord` values.
- **Cross-substrate FIFO under federation, in general.** This theorem proves per-sender ordering only within a single substrate's event log. Whether per-sender ordering survives federation between substrates depends on the federation transport's order discipline (specifically, whether the transport delivers a single source-substrate's appends in their source-event-ord). That property is not established here; protocols that need cross-substrate per-sender ordering must cite the federation discipline that gives it, or reduce to a single-substrate channel.

## What the theorem requires

- The substrate's respond cycle is serialized per session, per [closure-rule-system-realizes-closure-2-monad](closure-rule-system-realizes-closure-2-monad.md) and the dev spec `process/session-as-process.md` §1.
- Event-log appends are stamped with strictly increasing ord per [monotonic-clock-discipline](monotonic-clock-discipline.md).
- The receiver's consumer logic conditions on `(from-session, to-session)` and processes per-channel in `authored-at-ord` order. The structural guarantee is the immutable total order on `authored-at-ord` per channel; the per-sender FIFO that engineering protocols rely on is recovered by the consumer disciplining itself to that order, not by the substrate scheduling surfacing-rule firings in any particular sequence.

## Position

This theorem is the structural ground for inter-session-messaging's causal discipline. It is the substrate-internal counterpart to [per-stream-chunk-delivery-is-fifo-projection-of-event-log](per-stream-chunk-delivery-is-fifo-projection-of-event-log.md), which establishes per-channel FIFO for stdout/stderr chunks streamed over WebSocket. The two theorems share the per-channel-only ordering shape; they differ in mechanism and grain. The chunk-delivery theorem invokes RFC 6455 transport FIFO to pin a wall-clock delivery sequence at the subscriber. This theorem makes a weaker but cleaner claim: it pins a structural total order on per-channel messages via `authored-at-ord` and leaves wall-clock surfacing-sequence to the consumer's processing discipline. The reason for the weaker form is that inter-session messaging's surfacing path is internal to the substrate's rule machinery — it is not a single ordered transport — so the substrate-level guarantee that survives all internal scheduling choices is the order on the cell-data, not the order of rule firings.

Causal protocols layered above inter-session messaging — query/response chains, task-handoff/completion pairs, conflict surfacing — get their causality from the explicit `responds-to`, `task-id`, and `conflict-on` predicates, not from cross-sender event-ord. This theorem says that is the only architecture the substrate admits.
