---
type: question
class: open
status: open
opened-at: 2026-05-03
depends-on: [evidence-vector, witness-chain-as-proof-object, evidence-vector-as-canonical-binding-attestation, federation-trust-bilattice-graded]
see-also: [empty-repair-log-disposition-disambiguation, repair-resolution-state-as-substrate-content]
---

# Should the substrate's federation handshake explicitly negotiate attestation depth?

## The question

Per [evidence-vector-as-canonical-binding-attestation](../theorems/evidence-vector-as-canonical-binding-attestation.md), the substrate's [evidence vector](teaching/explanations/evidence-vector.md) and its [witness chain as proof object](../theorems/witness-chain-as-proof-object.md) are *structurally distinct attestation surfaces*: the former is a cheap canonical-form binding; the latter is the full per-atom derivation record sufficient for re-execution. The dev spec's [evidence-vector](../../../../../../../../operations/engineering/tools/predication-computer/pypredcomp/docs/dev/specs/kernel/evidence-vector.md) §6 lists "federation trust" as a use case, but does not specify *which* attestation surface federation trust requires, nor how peers negotiate which surface(s) to exchange.

Three sub-questions follow:

1. **Federation handshake content.** When peers $A$ and $B$ establish a federation channel, does the handshake explicitly negotiate "binding-only" vs "binding-plus-derivation" attestation? Or is the choice implicit in the trust class assigned via [federation-trust-bilattice-graded](../theorems/federation-trust-bilattice-graded.md)?

2. **Per-invocation attestation profile.** When peer $A$ ships a `respond` result to peer $B$, does $A$ ship (a) only the evidence vector, (b) only the witness chain, or (c) both? Does the choice vary per `respond` invocation (perhaps based on payload sensitivity), per peer relationship, or per substrate-config policy?

3. **Audit-cohomology query interface.** Per [audit-content-via-inconsistency-sheaf-cohomology](../theorems/audit-content-via-inconsistency-sheaf-cohomology.md), the substrate exposes audit queries against $\top$-cell content. Does the audit interface return the evidence vector, the witness chain, or both? Does the audit query parameterise on attestation depth?

## Why this matters

A federation peer that consumes evidence vectors and *treats* them as derivation-attestation is over-trusting the producer — per the binding-attestation theorem, evidence vectors do not attest derivation soundness. If the dev spec is silent on which attestation surface federation trust requires, implementers will choose differently:

- A trust-conservative implementer ships and verifies witness chains by default. This is correct but expensive.
- A trust-liberal implementer ships and verifies evidence vectors only. This is cheap but vulnerable to a peer that consistently applies an incorrect closure rule (the peer's evidence will match its own re-execution, but the derivation is wrong).

Under federation, two peers running different implementations may have different actual trust contracts despite the protocol claiming uniform "federation trust." The dev spec's §6 phrasing is rhetorically ambiguous; an explicit handshake field would make the trust contract part of the wire-form protocol rather than a per-implementation policy.

## Partial considerations

### Cost asymmetry

Evidence vectors are $O(n)$ to verify (where $n$ is repair-log length); witness chains are $O(\text{re-execute closure rules})$ which can be substantially larger for non-trivial settlements. A federation handshake that defaults to witness exchange may be untenable at scale; a handshake that defaults to evidence exchange may be insufficient for high-stakes operations.

A reasonable middle ground: peers exchange evidence by default, with witness exchange triggered by (a) audit query, (b) federation peer's `derivation-trust` capability per [stratified-cell-atom](teaching/explanations/stratified-cell-atom.md) federation-handshake-content, or (c) explicit per-invocation flag.

### Sensitivity-conditional attestation

Per the substrate's modal-restriction-as-authorization-primitive discipline ([modal-restriction-as-substrate-authorization-primitive](../theorems/modal-restriction-as-substrate-authorization-primitive.md)), capability scoping varies by operation sensitivity. Attestation depth could similarly vary: low-sensitivity operations attest by evidence vector; high-sensitivity (governance, identity, security) operations attest by witness chain. The substrate-config policy would parametrise this, with the federation handshake exposing the sensitivity-to-attestation mapping for peer-policy comparison.

### Witness-chain composability with evidence vectors

The witness chain per [witness-chain-as-proof-object](../theorems/witness-chain-as-proof-object.md) and the evidence vector per [evidence-vector](teaching/explanations/evidence-vector.md) bind overlapping but non-identical content:

- Witness chain hashes per-atom intermediate values; evidence vector hashes per-repair-log-entry encoding.
- Witness chain references operator and rule identifiers; evidence vector references rule_id only via the repair-entry's content.
- Witness chain extends across the trajectory; evidence vector is bounded by the repair-log's length.

A unified attestation artefact carrying both — evidence vector entries cross-referencing witness-chain positions — would let a single transmission satisfy both attestation contracts. Whether the dev spec's wire-form should evolve to such a unified artefact, or maintain the two as separate surfaces, is part of the open question.

### Federation peers without full derivation-trust

A peer at trust class `verified-by-evidence` (binding only, derivation untrusted) cannot be relied on for derivation-correctness — peer-shipped saturated and settled atoms must be re-derived by the receiver per the [stratified-cell-atom](teaching/explanations/stratified-cell-atom.md) federation-handshake-content's stratum-demotion policy. So the substrate already partially answers the question: peers without `derivation-trust` are *implicitly* at the binding-only attestation level. Making this explicit in the federation handshake (as a `attestation-depth` field with values `binding`, `binding+witness`) would make the peer-policy comparison wire-form-explicit.

### Empty repair log interaction

This question interacts with [empty-repair-log-disposition-disambiguation](empty-repair-log-disposition-disambiguation.md): an evidence vector for a settled-noop respond contains only input and output hashes (no repair-entry hashes), making it indistinguishable from an evidence vector for an aborted-empty-repair respond. The witness chain for a settled-noop is also empty (no derivation steps). The disposition discriminator must travel in the response envelope or as an additional evidence-vector slot; this question's resolution would inform that one.

## What an answer would look like

The captain answer would specify:

1. The federation handshake's `attestation-depth` field shape and allowed values (e.g. `{ "binding" | "binding+witness" }` or a richer trust-class enum).
2. The per-invocation attestation-profile policy: default behaviour, override mechanism, sensitivity-conditional rules.
3. The audit-query interface's attestation-depth parameter (does the audit interface always return witness chains for full audit, or expose binding-only as a cheaper option?).
4. Whether the wire-form should evolve to a unified attestation artefact, or maintain the two surfaces as separate.

A "no, leave it implementation-defined" answer is also tenable but would commit the substrate to per-implementation trust contracts rather than wire-form-explicit ones.

## Adjacent open questions

- [empty-repair-log-disposition-disambiguation](empty-repair-log-disposition-disambiguation.md) — the response-envelope-vs-substrate-content question for the empty-repair disposition discriminator interacts with this question's wire-form proposals.
- [federation-envelope-as-substrate-record](federation-envelope-as-substrate-record.md) — whether the federation envelope itself is substrate-content interacts with whether attestation-depth negotiation is recorded as substrate-content.
- [repair-resolution-state-as-substrate-content](repair-resolution-state-as-substrate-content.md) — the parallel question about repair-resolution lifecycle's substrate-content status; both bear on what federation peers can independently audit.
