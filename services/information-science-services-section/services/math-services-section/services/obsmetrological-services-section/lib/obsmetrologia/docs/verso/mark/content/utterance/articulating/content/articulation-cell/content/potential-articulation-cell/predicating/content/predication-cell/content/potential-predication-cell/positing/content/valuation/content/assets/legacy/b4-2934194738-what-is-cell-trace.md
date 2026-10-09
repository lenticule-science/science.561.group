---
name: what is a cell-trace
description: Questions that drive the cell-trace structure's definition and theorems. The questioning record is the first artifact written for any new $thing — it states what we do not yet know about the thing, so we have a place to question it properly rather than chat at the operator about it. Unresolved questions here are the agenda for the structure's learning/answering/ slot.
---

# What is a cell-trace?

A cell-trace is, provisionally, a finite ordered sequence of cell-records sharing a common cell-projection — the engineering-side, finitely-presented realization of a predication-cell-trace. The mathematical definition is at [cell-trace.md](../../cell-trace.md); the theorems forcing it to exist as a distinct sibling of [cell-id](../../../../../../../../../../../../../../../../../../../../../../../../../../../../philosophy-services-section/services/logic-services-section/content/text/documents/articles/notes/undated/cell-id.md) live there.

This file holds the questions about that definition that the bytes do not yet answer.

## Questions about content addressing

1. **What is a cell-trace's identifier?** Three candidates:
   - SHA-256 of the canonical-JSON of the full sequence (treat the trace as one record).
   - SHA-256 of the concatenated list of constituent [cell-id](../../../../../../../../../../../../../../../../../../../../../../../../../../../../philosophy-services-section/services/logic-services-section/content/text/documents/articles/notes/undated/cell-id.md) values (Merkle-style summary).
   - Inherit the identifier of the trace's endpoint cell-record — the trace has no identifier of its own.

   Each has different stability under extension: option 1's id changes when the trace grows; option 2's id also changes but the prefix is recoverable; option 3 is stable under prefix-extension but not unique across traces that share an endpoint. Which one does the 561 OS need?

2. **Should `trace-id` be its own $thing, sibling of `cell-id` under `cell-record/library/`?** If yes, the questioning record for trace-id is the next file to write.

## Questions about the trace's relationship to the cell-record event log

3. **Is a cell-trace materialized, or is it a *view* over the existing cell-record event-log JSONL?** Two presentations:
   - Materialized: the trace exists on disk as its own JSONL or array record.
   - View: the trace is computable from the event-log by filtering on the cell projection and sorting by transaction-id.

   The view-only reading saves storage and avoids representation drift; the materialized reading admits constant-time content-addressing and prefix-sharing. Which does the schema commit to? Does the schema admit both?

4. **When two traces overlap (share a prefix of cell-records), how is the shared prefix represented?** If traces are materialized, naive storage duplicates the prefix. A Merkle/prefix-tree representation (option 2 from Q1) admits structural sharing. The math is silent; the spec choice is open.

5. **Is the empty cell-trace ⟨⟩ valid?** A length-0 trace at a cell that has never been asserted has its place in the structure-as-set, but the JSONL has no rows for it. Does the schema admit the empty trace, or does it require length ≥ 1?

## Questions about provenance

6. **Does `derived-from` always reach back inside the same cell-trace?** Two cases:
   - **Intra-cell:** the closure-rule fired on prior values of the *same* cell. Then the `derived-from` cell-ids are all members of the same cell-trace.
   - **Inter-cell:** the closure-rule fired on values at *other* cells. Then `derived-from` reaches into other cell-traces.

   Both happen. The structure should be explicit about which one's permitted, and whether the layer-5 cell-trace is required to capture both as part of its provenance, or only the intra-cell case.

7. **The provenance DAG induced by `derived-from` across all traces — is it one global DAG, or per-cell-trace slices?** *Theorem (claim):* there is one global DAG over cell-records; the cell-projection partitions its vertices into per-cell slices; each slice is exactly the cell-trace at that cell. Status: stated in [cell-trace.md](../../cell-trace.md) as a structural fact; the proof has not been written. Belongs in `learning/answering/cell-trace-is-a-cell-projection-of-the-provenance-dag.md`.

## Questions about stratum

8. **How does the trace interact with [stratum](../../../../../../../../../../../../../../../../../../../../../../../../../../../../philosophy-services-section/services/logic-services-section/content/text/documents/articles/notes/undated/cell-record.md#the-fields)?** Three sub-questions:
   - If $r_0$ has stratum `asserted` and $r_5$ has stratum `settled`, must intermediate rows show stratum `saturated`, or can settled appear without a saturated predecessor?
   - Is the stratum tag monotone non-decreasing along the trace (asserted ≤ saturated ≤ settled), or can a settling-step regress when a new assertion lands?
   - Does the trace "graduate" — i.e., is there a finite ordinal after which all further rows must be at stratum `settled`?

   The math (settling monotonicity in ≤_k) does not directly constrain stratum. The convention in the cell-record record names stratum as an "optional" field; the trace structure needs to commit to whether absence of stratum is permitted.

## Questions about closure under operations

9. **Is the concatenation of two cell-traces at the same cell a cell-trace?** Necessary: the concatenation's transaction-ids must remain monotone, the value chain must remain ≤_k-monotone across the join, and the cell-projection is preserved. Sufficient? Only if the second trace's first row's transaction-id ≥ the first trace's last row's transaction-id AND value ≥_k. Is concatenation therefore a *partial* monoid operation on cell-traces at φ?

10. **Does the cell-trace at φ have a maximum / supremum under prefix-extension?** If the event-log is finite, yes: there is a longest cell-trace at φ. If the event-log is unbounded (a long-running settling), the supremum exists only in a limit-completion. Which does the structure assume?

## Questions about the boolean-2 degenerate case

11. **In the boolean-2, λ=1 degeneracy (Theorem T6 of cell-trace.md), a cell-trace has length ≤ 1.** Does the schema admit this collapse derivably, or must it be enforced by an external invariant? The schema's `minItems` would naturally be 0; the degeneracy is not enforced at the schema level.

12. **Datomic-style retractions** add a row with the same E/A as a prior row but a "retracted" flag. The 561 analogue is a knowledge-order advance ⟨⊤,⊥⟩ → ⟨⊤,⊤⟩ (now know both for and against). Does the cell-trace's value-chain monotonicity correctly handle retraction-as-knowledge-advance, or does the retraction case force a separate clause in the schema?

## Questions about the layer-5 → layer-1 forgetful map

13. **Theorem T5** says U : CellTrace → PredicationCellTrace strips transaction-ids and provenance to recover the layer-1 ≤_k-chain. Is U a *functor* (between trace categories) or merely a function (between sets of traces)? If functor, what are the morphisms in CellTrace? Candidate: morphisms are prefix-extensions; U sends prefix-extensions to ordinal-embeddings of chains. The morphism structure has not been worked out.

14. **Is U surjective?** Every finite ≤_k-monotone chain in **L**^⋈ at φ is in im U by construction (Theorem T5's "converse" direction). But not every layer-1 predication-cell-trace is finite — settling bounds λ may be infinite ordinals. So U is not surjective in general; only its restriction to finite chains is. Does the cell-trace structure care about the non-finite predication-cell-trace, or is it explicitly the finitely-presented case?

## How this record progresses

Same protocol as for predication-cell-trace's questioning record: resolved definitions move to frontmatter or to body sections of [cell-trace.md](../../cell-trace.md); theorems-with-proofs move to `learning/answering/` files under this directory; still-open questions stay here.
