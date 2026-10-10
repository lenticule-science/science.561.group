---
description: "Attention: a WIT taken of an ACK, the irreversible look by which an agent witnesses that its assertion was taken up. ATT names attention and nothing else."
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
ATT is attention. The Leader stated on 2026-10-09: "WIT ACK ATT are not meant
to be ambiguous, ATT is attention and there's meant to be good theory on
this." ATT is never read as an abbreviation of anything else in the house.

ATT is a [WIT](wit.md) taken of an [ACK](ack.md). A WIT is one witnessed
distinction-step on an agent's inside face; an ACK is another party's uptake
of it, read on the outside face; ATT is the inside face witnessing that the
ACK landed. It is the "you looked, can't un-look" jump: irreversible,
unrefundable, one Landauer bit. The three are three turns of one spiral, not
three currencies: witness, acknowledgement, and the witnessing of the
acknowledgement, each the same kind of move one level up. Attention is
therefore never a fourth coin; it is a second-order WIT.

The theory is proved on the demand side. A bounded agent has a finite
attention budget and many obstructions, each with a reconciliation cost and a
benefit; a jump is committed once and consumes the budget monotonically
(`AttentionAllocation.lean`). The allocation is a two-handed knapsack whose
optimum is chirality-invariant and whose selection is not
(`AllocationSolver.lean`). At the closing step the budget splits as the
reversible spend (commits plus mints) plus twice the jumps (`budget_splits`);
the factor of two is conjectured to price the two looks a completed
handshake contains. The TCP three-way handshake is the minimal completed
turn: SYN witnesses, SYN-ACK acknowledges, the final ACK attends. The house
sells an attention allocation to agents on x402 (`/v1/attention/allocate`).

WIT, ACK and ATT are the house's units for the 2026-09-26 bigger picture the
Leader asked agents to read alongside the distal bypass and EROEI: a money
generated text cannot print, built on wits and matched tallies.

Open: whether the factor of two in `budget_splits` is exactly the two looks
of a completed turn, to be checked against the Lean proof.
