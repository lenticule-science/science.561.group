---
type: theorem
class: engineering-claim
status: proved
depends-on: [stream, window, settlement-determinism, snapshot-replay-fidelity, hash-injectivity-under-canonical-form, settling-continuity, settling-monotonicity]
see-also: [federation-convergence]
---

# Stream and window aggregations replay byte-identically

**Claim.** For any [stream](teaching/explanations/stream.md) $S$ with substrate-recorded items and any [window](teaching/explanations/window.md) $W$ over $S$ with a deterministic aggregation function: replaying $S$'s admission events through $W$'s aggregation reproduces the original window-aggregate values byte-identically. Per [settlement-determinism](settlement-determinism.md), this holds across substrate replays and federation peers.

## Why this holds

**Part 1: Stream contents are substrate-recorded.** Per [stream-record](../objects/stream-record.md), every item published to the stream is admitted via a substrate operation producing a witness. Per the [event-log](../objects/event-log.md), the witness chain records every publication.

**Part 2: Window aggregation is deterministic.** Per [window](teaching/explanations/window.md), the aggregation function applied to window items is deterministic. Per [settlement-determinism](settlement-determinism.md), the substrate's evaluation of the function is deterministic.

**Part 3: Replay reconstructs items in order.** Per [snapshot-replay-fidelity](snapshot-replay-fidelity.md), replaying the substrate from a snapshot reproduces every item in the stream at the substrate ordinal of its original publication. Per [hash-injectivity-under-canonical-form](hash-injectivity-under-canonical-form.md), the items' canonical-form hashes are byte-identical across replays.

**Part 4: Window membership is reconstructible.** Per [window](teaching/explanations/window.md)'s definition (substrate-recorded window-kind, bounding parameter), the items in any window can be determined from the stream's items and their substrate ordinals.

**Part 5: Aggregation at window-close is the limit of partial aggregations.** A window's closing aggregate value is the directed join (in the [knowledge order](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/concepts/knowledge-order.md)) of the partial aggregates produced as items arrived. This is exactly [settling continuity](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/concepts/settling-continuity.md) on the window's settling sub-trajectory: the value at the window-close limit ordinal equals $\bigvee_k \{ v_\sigma(\text{aggregate}) : \sigma < \text{close} \}$. Per [settling monotonicity](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/concepts/settling-monotonicity.md), partial aggregates form a $\leq_k$-monotone chain; the closing value is determined by that chain alone, not by the wall-clock at which the window happens to close. Replay reconstructs the same chain, hence the same limit, hence the same closing aggregate.

Combining: items are substrate-recorded (Part 1), aggregation is deterministic (Part 2), replay reconstructs items (Part 3), window membership is determined (Part 4), and the window-close aggregate is the directed knowledge-join of monotone partials (Part 5). The aggregate values replay byte-identically.

## Engineering consequence

- **Auditable analytics.** Historical aggregations can be reproduced from the event log; auditors can verify reported metrics.
- **Federation-portable analytics.** Per [federation-convergence](federation-convergence.md), federated substrates compute the same aggregates on the same stream content.
- **Backfill-safe.** Recomputing aggregates from past stream data produces consistent results.

## What the theorem requires

- Per [stream-record](../objects/stream-record.md), stream items are admitted as substrate operations.
- Per [window](teaching/explanations/window.md), window definitions are substrate content.
- Per [settlement-determinism](settlement-determinism.md), aggregation functions are deterministic.
