---
description: "ATT: the finite WIT-denominated reconciliation budget of an agent; at a receiving border, the second-order WIT taken of another party's ACK. These are separate sorts of one theory, not synonyms for subjective interest."
identity: att
name: ATT
aliases:
  - attention
  - attention economy unit
provenance:
  domain: economy
  scheme: distinction-denomination
  authors:
    - emsenn
    - Lenticule Science Senior (561 Group office agent, pass assist of debt-2026-10-09-leader-words-held-in-corpus)
  leader-utterances:
    - "ni:///sha-256;qBEv_AXMKQNa6Tq9lIzJ3fDHx8170OHrQERQDLIzQ4c"
    - "ni:///sha-256;aEQQJq1tSuFzwz0aozM-rAihJoPrtYaK73W6F7yWezE"
  sources:
    - "../../documents/articles/notes/2026/09/04/2026-09-04-note-on-acknowledgement-beside-wit.md, section 'Witness, acknowledgement, attention: three economies, one spiral'"
    - "economics-science-services-section/lib/obsmetrologia-economics/ObsmetrologiaEconomics/AttentionAllocation.lean and AllocationSolver.lean"
relations:
  requires:
    - wit
    - ack
---

ATT is the Group's **attention** term, not an open synonym for concern,
reading time, employee hours, impressions or a generic mental state. The
Leader's [2026-10-09 ruling](../../documents/articles/notes/2026/10/09/2026-10-09-note-on-wit-ack-and-att.md)
holds two mathematically different but connected *sorts*.

## ATT: budget and allocation

Let `B : ℕ` be the finite reconciliation budget of a bounded agent.
For a list `S` of priced obstructions, define

`Feasible(B,S) := totalCost(S) ≤ B`

and `residual(U,S) := totalBenefit(U) − totalBenefit(S)`.
[`ObsmetrologiaEconomics/AttentionAllocation.lean`](../../../../../economics-science-services-section/lib/obsmetrologia-economics/ObsmetrologiaEconomics/AttentionAllocation.lean)
proves feasibility of the empty selection, monotonicity of spent cost,
downward closure of feasibility, and antitonicity of the residual in
captured benefit. [`AllocationSolver.lean`](../../../../../economics-science-services-section/lib/obsmetrologia-economics/ObsmetrologiaEconomics/AllocationSolver.lean)
provides the exhaustive finite optimizer and handed tie-selection
results. The budget is denominated in witness-step costs on the
October 9 source's reading; the general identification between
these units and every physical or logical Landauer count is **not proved**.

An agent's `B` is capacity; `totalCost(S)` is expenditure. An
unspent budget is not a completed border ACK and not an instance of
second-order witnessing. No automatically generated assertion may
silently equate `B` with `totalCost(S)` or a single WIT.

## ATT: a WIT of ACK at a border

The nested receiving act is `WIT(ACK(w))`. The originator bears
WIT `w` on a cell; another party produces a [counterparty ACK](ack.md)
on `w` across a boundary; the originator then WITs **that ACK**.
The second-order witnessing act is a distinct transition, not
automatically produced by transmitting the first WIT or by the
other party issuing its ACK. The [September 4 source
synthesis](../../documents/articles/notes/2026/09/04/2026-09-04-note-on-acknowledgement-beside-wit.md)
models the receiving geometry as faces of an agent and names the
second-order move ATT.

The September 4 and October 9 records propose a correspondence
between this nested act and the finite WIT-denominated expenditure
from the budget. That correspondence is a **research reading** of
the existing formal structures, not a checked general theorem
that every ACK yields one ATT or exactly one Landauer bit.
The proved `budget_splits` uses `2 × jumps` as two knowledge-order
covers; identifying that factor with the two agents' looks in a
handshake is explicitly conjectural.

## Term conformance

- Use `ATT(B,S)` when discussing bounded allocation.
- Use `ATT(w,a)`, with `a=ACK(w)` and a distinct second-order
  witnessing act, when discussing uptake at a border.
- Use `operator-hours`, `compute-tokens`, `joules`, `impressions`,
  `watched-minutes` or the appropriate measured resource when
  those are the actual observations; do not call them ATT without
  a valid mapping and its evidence.
- A [FOUR WIT](wit.md), a [counterparty ACK](ack.md) and a
  [matched economic tally](tally.md) remain distinct. A valid
  tally on transaction `b` does not discharge another obligation
  `o` merely because both were discussed politically.

This lexical policy is machine-addressable through the section's
[`wit-ack-att-lexical-admission.json`](../../../../data/records/wit-ack-att-lexical-admission.json).
The profile only nominates exact spans for semantic review; it does
not certify a theorem or a deployed recipient.
