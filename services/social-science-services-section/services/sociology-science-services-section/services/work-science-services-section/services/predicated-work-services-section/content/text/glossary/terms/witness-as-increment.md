---
type: definition
class: correspondence
status: draft
name: "Event attestation as operational increment"
previous-title: "Witness as increment"
depends-on: [operations-settling, increment-sequence]
---

# Event attestation and FOUR WIT are different objects

**Definitions.** An event attestation \`e\` records an attributed
operation, claim, source, stage and, where present, the affected
predication cell \`φ_e\`. An evidence increment \`u_τ(φ_e)\`
proposes a change to that cell's evidence \`Record\`. A
[WIT](https://github.com/lenticule-science/science-services-section/blob/main/services/social-science-services-section/services/economics-and-business-science-services-section/services/monetary-economics-science-services-section/content/text/glossary/terms/wit.md)
is **one FOUR knowledge-order cover**. The former is not
automatically the latter.

Let \`R_τ(c)=(p_τ,n_τ)∈ℕ²\`, and
\`charge(R_τ(c))=(1[p_τ>0],1[n_τ>0])\`. For
a new attestation \`e\`, the proposed tally update is
\`R_{τ+1}(c)=R_τ(c)+Δ_e\`, where
\`Δ_e∈ℕ²\` is its nonnegative evidence-count contribution,
and the same attestation must not be double-booked on replay.

A **new FOUR WIT cover** at \`c\` exists only if the two charges
differ by one coordinate rising from 0 to 1. A transition
\`(0,0)→(1,1)\` consumes two covers, not one; a transition
\`(1,0)→(2,0)\` adds a tally but **zero** new FOUR covers.
The unverified assertion of a task's completion is evidence of
the speaker's assertion; it is not independent fulfillment.

**Source relationship:** the historical “witness as increment”
correspondence was an informal alignment between records of work
and a monotone evidence log. Its correct scope is
\`attestation(e) ↦ proposed Δ_e\`; only the
derived \`charge\` transition can be counted in WIT units.
Calling an entire event log record “one wit” violates the unit.

## Separate reception and contested evidence

A remote copy of an attestation does not create a second **source**
WIT. A receiver may undergo a distinct *local* FOUR cover after
admitting the evidence. To issue [ACK](https://github.com/lenticule-science/science-services-section/blob/main/services/social-science-services-section/services/economics-and-business-science-services-section/services/monetary-economics-science-services-section/content/text/glossary/terms/ack.md),
the other party must record uptake of a **particular WIT**
at a border. Delivery, local storage and ACK are not synonyms.
An [ATT](https://github.com/lenticule-science/science-services-section/blob/main/services/social-science-services-section/services/economics-and-business-science-services-section/services/monetary-economics-science-services-section/content/text/glossary/terms/att.md)
of the ACK requires a second-order witnessing event.

Conflicting evidence \`p>0 ∧ n>0\` gives FOUR charge \`⊤\`.
This fact **does not entail nonzero cohomology**. The assertion
\`H¹≠0\` requires a specified cover, coefficient system,
restriction maps, cocycle and calculation showing nontriviality.
A one-cell contradiction can coexist with \`H¹=0\` on a
trivial/contractible cover. A local \`⊤\` and a global
descent obstruction have different types.

## Operational query scope

- An append-only log allows a replica to establish **local
  membership** of a known event identifier without a
  coordinator. It cannot by itself prove that the claimed event
  actually occurred.
- A local *absence* of an entry does not prove global
  nonexistence across asynchronously replicated stores.
- A closure-rule consequent is a **derived reading**, not
  an independent attributed attestation. No closure process
  may fabricate the source's actor, signature, witness event
  or counterparty ACK.
- Replayability requires a specified deterministic transition
  rule, canonical source inputs, event order and recorded
  nondeterminism. A bare event-log name proves none of these.

## Adjudication

For evidence \`R(c)=(p,n)\` with both tallies positive,
an adjudicator may add an authorized **disposition record**
marking one source's *standing* as superseded, or retain the
contested standing. This does **not subtract** evidence from
the append-only record. If a new active-evidence projection
excludes a superseded source, name that projection and its
authority; do not state that FOUR's monotone join itself
changed from \`⊤\` to \`t\` or \`f\`.

See [Adjudicate contested source evidence](https://github.com/lenticule-science/science-services-section/blob/main/services/social-science-services-section/services/social-theory-science-services-section/content/text/documents/articles/notes/undated/adjudicate-witness-conflict.md).
That draft explicitly distinguishes case disposition, receiver
ACK, and a cohomological assertion not yet proved.
