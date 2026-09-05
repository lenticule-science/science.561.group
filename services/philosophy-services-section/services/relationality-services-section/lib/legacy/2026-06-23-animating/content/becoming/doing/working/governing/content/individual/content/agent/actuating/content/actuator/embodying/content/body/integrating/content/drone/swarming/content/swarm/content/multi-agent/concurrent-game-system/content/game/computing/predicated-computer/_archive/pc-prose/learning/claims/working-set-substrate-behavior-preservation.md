---
type: theorem
class: engineering-claim
status: proved
depends-on: [working-set, persistent-set, page-in, evict, settlement-determinism, cost-discipline-reads-free]
see-also: [eviction-policy]
---

# Working-set membership does not affect substrate behavior

**Claim.** For any substrate operation $O$ and any [working-set](teaching/explanations/working-set.md) state, the operation's outcome (the substrate's resulting predication valuation, per [settlement-determinism](settlement-determinism.md)) is independent of which predications were in the working set when $O$ began. Page-in and evict are performance optimizations; they do not change what the substrate computes.

## Why this holds

The argument follows from the substrate's separation between *content identity* and *content residency*.

**Part 1: Substrate content is content-addressed.** Per [hash-injectivity-under-canonical-form](hash-injectivity-under-canonical-form.md), substrate predications are identified by canonical-form hash; whether the cell is in working-set or persistent-set, the cell's content is the same.

**Part 2: Operations resolve cells by reference.** Per [closure-rule-application](../morphisms/closure-rule-application.md), substrate operations identify input cells by reference (typically by content-hash). Whether the cell is currently in working-set or needs to be paged-in, the operation's input is the same.

**Part 3: Page-in is hash-verified.** Per [page-in](../morphisms/page-in.md), loaded bytes are verified against the requested hash; the working-set cell after page-in is byte-identical to the persistent-set cell.

**Part 4: Evict is content-preserving.** Per [evict](../morphisms/evict.md), eviction writes to persistent-set before removing from working-set; the cell's content survives.

Combining: substrate operations work on cells identified by hash, working-set membership is just where-the-cell-currently-resides, and movement between working-set and persistent-set preserves content. Therefore the operation's outcome is independent of working-set membership.

## Engineering consequence

- **Memory-budget pressure doesn't change behavior.** A substrate under memory pressure (paging frequently) produces the same answers as a substrate with all content resident.
- **Working-set tuning is performance-only.** Adjusting eviction policy, increasing memory budget, pre-paging hot cells — all affect performance but not correctness.
- **Substrate replay doesn't depend on working-set state.** Per [snapshot-replay-fidelity](snapshot-replay-fidelity.md), replay reproduces substrate state regardless of how the working-set was managed during replay.

## What the theorem rules out

- A substrate operation that branches on whether a cell is currently in working-set is non-conformant. Per [settlement-determinism](settlement-determinism.md), substrate behavior is deterministic on `(event log, closure-rule system)`; working-set state is host-runtime context, not substrate state.
- An eviction that loses cell content (rather than persisting it before removal) breaks Part 4. The substrate must persist before evicting.

## What the theorem requires

- Per [hash-injectivity-under-canonical-form](hash-injectivity-under-canonical-form.md), substrate content is hash-addressable.
- Per [page-in](../morphisms/page-in.md), page-in is hash-verified.
- Per [evict](../morphisms/evict.md), eviction is persistence-before-removal.
- Per [cost-discipline-reads-free](cost-discipline-reads-free.md), working-set queries are reads.
