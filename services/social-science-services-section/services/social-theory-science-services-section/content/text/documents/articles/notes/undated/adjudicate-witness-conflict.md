---
type: specification
class: resolution
status: draft
symbol: "\\alpha"
depends-on: [operations-settling, witness-as-increment, repair-resolution-poset]
title: "Adjudicate contested source evidence"
description: "An authority-scoped disposition over conflicting evidence records. Counterparty ACK is separate; no automatic FOUR charge or H¹ erasure is claimed."
---

# Adjudicate contested source evidence

**Source correction:** the previous version typed one \`Wit_τ\` as
a pair \`(φ,agent)\`, called an internal adjudication mode
\`acknowledge\` without recording a second party's
[ACK](https://github.com/lenticule-science/science-services-section/blob/main/services/social-science-services-section/services/economics-and-business-science-services-section/services/monetary-economics-science-services-section/content/text/glossary/terms/ack.md),
and asserted that authorized retractions make a FOUR \`⊤\`
cell become \`t\` or \`f\` by monotone closure. Those
identifications are not valid in the stated carriers.

Let \`c\` be a predication cell and
\`R_τ(c)=(pos_τ,neg_τ)∈ℕ²\` its accumulated
attributed evidence tally. A contested cell satisfies
\`pos_τ>0 ∧ neg_τ>0\`; its FOUR charge is \`⊤\`.
An attestation entry \`e\` is a source-bearing record, **not
one WIT merely because it is an entry**. The number of WIT
knowledge covers is computed from actual FOUR charge
transitions, not event-count cardinality.

## Authority-scoped disposition

An adjudication request is a tuple
\`d=(caseRef,c,authorityRef,evidenceRefs,kind,time)\`
with \`kind∈{affirm,retract,record-contest}\`. These are
candidate **decision kinds**, not units of WIT/ACK/ATT.
The proposed partial operator is

\[
\alpha : (R(c),d)\rightharpoonup (R(c),Disposition(d)).
\]

Preconditions are an identified case, an adjudicator with
jurisdiction over \`c\`, exact referenced evidence, and a
reproducible disposition rule. Failure of those preconditions
yields **no authorized disposition**.

- \`affirm\`: records a decision selecting positive standing
  and the reasons/authority for rejecting one or more
  negative assertions; it does not erase those assertions
  from \`R(c)\`.
- \`retract\`: records a decision selecting negative standing
  and the reasons/authority for rejecting one or more
  positive assertions; it does not erase their history.
- \`record-contest\`: records that both sides remain in
  dispute without selecting either. It is an internal
  disposition, **not ACK**. An independent receiving actor
  may separately ACK a particular WIT, including contested
  evidence, by issuing a real border uptake.

For all three kinds, an append-only evidence Record has
\`R_{τ+1}(c)≥_kR_τ(c)\` provided there are only
nonnegative evidence additions. Hence an unfiltered
knowledge-order reading with \`charge(R_τ(c))=⊤\`
remains at \`⊤\`; issuing a disposition about standing
cannot subtract a positive count.

A distinct, explicitly typed *active-evidence projection*
may select non-superseded assertions for current normative
decisions. Its input includes disposition authority and
reference set; its output is a new **reading**. It is not the
historical FOUR charge, and no theorem establishing this
projection's laws is cited here.

## Border settlement

A disposition is a local governance act. It becomes an
[ACK](https://github.com/lenticule-science/science-services-section/blob/main/services/social-science-services-section/services/economics-and-business-science-services-section/services/monetary-economics-science-services-section/content/text/glossary/terms/ack.md)
only upon independent counterparty uptake of a specified
WIT and crossing. It becomes an [economic tally](https://github.com/lenticule-science/science-services-section/blob/main/services/social-science-services-section/services/economics-and-business-science-services-section/services/monetary-economics-science-services-section/content/text/glossary/terms/tally.md)
only if the exact matching release/admission records exist
for the same case. A claimed adjudication is neither of
these by naming it “acknowledged” or “resolved”.

## Cohomological boundary

The existence of a cell at FOUR \`⊤\` does not entail
that \`H¹\` of any proposed witness sheaf is nonzero.
To claim a cocycle, first specify the cover, overlap
restriction maps and coefficient system, then compute
the class. Similarly, an \`affirm\`/\`retract\`
disposition does not automatically turn that class into
a coboundary. Those are **unproved hypotheses**, as
qualified in [Adjudication modes and H¹ class](adjudication-modes-and-h1.md).

This source is a Science specification. Executable
authorization checks and event-sourcing behavior belong
to Red Cup Engineering; installed acceptance and actual
receiving belong to Operations.
