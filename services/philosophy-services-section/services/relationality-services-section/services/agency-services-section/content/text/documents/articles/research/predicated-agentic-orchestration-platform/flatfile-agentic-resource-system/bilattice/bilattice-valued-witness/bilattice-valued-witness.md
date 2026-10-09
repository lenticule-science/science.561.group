---
name: bilattice-valued-witness
description: "A witness records what happened."
type: concept
class: pattern
depends-on: [transaction-lens, witness-routing]
see-also: [bilattice, predication-algebra-model, learning]
references:
  - "PAM core math: truth × knowledge bilattice"
  - "Belnap-Dunn four-valued logic (true, false, both, neither)"
  - "Ginsberg 1988: Multivalued logics for AI"
title: bilattice-valued-witness
---

# Bilattice-valued witness

A witness records *what* happened.
A bilattice-valued witness records *how true* and *how known* it is — the substrate's audit primitive ascends from boolean facts to graded predications.

Two optional float-in-`[0,1]` axes extend the [witness](../../teaching/explanations/witness.md):

- **`truth`** — degree-of-truth.
  `1.0` = "fully true" (the classical case); `0.0` = "fully false"; `0.5` = "as plausible as not."
- **`evidence`** — degree-of-knowledge.
  `1.0` = "fully evidenced" (every supporting predication checked); `0.0` = "no evidence yet."

These are the two axes of the PAM bilattice (Ginsberg/Belnap-Dunn lineage): truth ranges over *what's the case*, knowledge over *what we know about it*.
The pair `(truth, evidence)` lives in the product lattice `[0,1] × [0,1]`.
Both axes default to `1.0` so plain operator emissions cost no opt-in, and the wire form drops default values so historical event-log lines round-trip byte-for-byte equal.

## How the [transaction lens](../../event-sourcing/transaction-lens/transaction-lens.md) reads bilattice

Each [posting](../../event-sourcing/transaction-lens/transaction-lens.md) carries the source witness's `truth` and `evidence` through as `witness_truth` / `witness_evidence`.
The `effective_amount(weight_by)` method scales the posting's raw amount by the requested axis:

| `weight_by`  | scale factor               | reading                          |
|--------------|----------------------------|----------------------------------|
| `None`       | 1                          | classical: every posting counts fully |
| `"truth"`    | `truth`                    | belief-weighted accounting       |
| `"evidence"` | `evidence`                 | knowledge-weighted accounting    |
| `"k_meet"`   | `min(truth, evidence)`     | conservative joint reading       |

`pyfars ledger tally --weight-by truth` and `pyfars ledger balance --weight-by k_meet` apply the weighting at the sum step.
The same chart-of-accounts admits multiple readings of the same event-log without rewriting bindings.

The CLI also gains belief-thresholding filters:

```
pyfars ledger postings --min-truth 0.7        # only confident postings
pyfars ledger tally --min-evidence 0.5        # only well-backed flows
pyfars ledger balance --weight-by k_meet      # bilattice-conservative balance
```

## Why graded witnesses

Three forces pull the substrate toward graded values:

1. **Diagnosis confidence.** A [diagnosis-witness](../../dispatch/witness-routing/witness-routing.md) with `cause="probably the dispatcher missed an upstream task"` should not weigh as much as a diagnosis with a citation.
  The diagnoser sets `truth` accordingly.
2. **Lesson saturation.** A lesson distilled from one observation carries `evidence ≈ 0.5`; a lesson confirmed by nine carries `evidence ≈ 0.9`.
  The bilattice gives the substrate's "knowledge stock" a natural readout under `tally --commodity LESSONS --weight-by evidence`.
3. **Speculative dispatch.** When the dispatcher *posits* a task match before user confirmation, the witness can be emitted at `truth=0.5` so the speculative posting doesn't claim definite completion until ratified.

## Future direction: bilattice operations on the substrate

Two predications about the same target can be combined with the bilattice's `⊗_t` (truth-meet) and `⊕_k` (knowledge-join) to derive a composite witness.
PAM uses these for CRDT-convergent merging of divergent writes; FARS is single-writer today but the operators are already valued in the right algebra, ready for that closure when it arrives.
