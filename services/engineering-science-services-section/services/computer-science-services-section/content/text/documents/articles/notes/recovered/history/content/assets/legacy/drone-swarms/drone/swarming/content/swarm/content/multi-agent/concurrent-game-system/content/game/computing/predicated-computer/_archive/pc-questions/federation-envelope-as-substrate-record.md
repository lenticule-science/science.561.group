---
type: question
status: open
explores: [federation-envelope, reification, content-addressed-store, witness, event-log]
see-also: [federation-bridge, federation-trust-bilattice-graded]
---

# Should `federation-envelope` have a corresponding substrate-record object in PC?

PC carries [federation-envelope](teaching/explanations/federation-envelope.md) as a *concept* — the substrate's transport-independent wire format for a federated message, specifying the envelope's structure (sender identity-record-hash, signature, payload, etc.). The concept is precise enough to interoperate against.

But PC has no `FederationEnvelopeRecord` *object* — no spec for the substrate-record that *reifies* an envelope into a substrate's event log on emission and admission. Sub-theories that instantiate the concept need to invent the record shape locally:

- The flatfile sub-theory ([FARS](theories/agential-orchestration-platform/theories/flatfile-agentic-resource-system/)) authored [federation-envelope-record](theories/agential-orchestration-platform/theories/flatfile-agentic-resource-system/objects/federation-envelope-record.md) with required fields (`envelope-id`, `from-peer-id`, `to-peer-id`, `ordinal`, `payload`, `signature`, `sender-witness-hash`, `stored-at-path`, etc.) and invariants (substrate-recorded on both sides, hash-stable, signature-required, vocabulary-bounded, replay-deterministic, append-only after admission).
- A future AgOP example over a different substrate would presumably re-derive a similar record shape, possibly with subtle divergences that hurt cross-substrate interoperability.

The question is whether PC SHOULD lift `federation-envelope-record` to a parent-theory object that AgOP examples instantiate, in the same pattern as PC's [identity-record](../objects/identity-record.md) (parent of substrate-specific identity-record realizations) and [transport-record](../objects/transport-record.md) (parent of substrate-specific transport-record realizations).

Arguments **for** lifting:
- The fields a federation-envelope-record SHALL carry are substrate-general: envelope-id (a content-hash), from/to peer-ids (identity-record hashes), ordinal (per-pair monotonic), payload (kind-tagged structured content), signature, witness-chain, admission/emission timestamps. None depend on flatfile-substrate specifics.
- Cross-substrate federation (a flatfile FARS node federating with a hosted-database AgOP realization) needs a shared record schema, not just a shared concept.
- The substrate-record object is what the parent theory currently lacks for federation; without it, FARS's `federation-envelope-record.md` and a future Rust-engine `federation-envelope-record.md` may diverge silently.

Arguments **against** lifting:
- Substrate-record shapes are presentation; the substrate-portable identity is the envelope-id (a content-hash). As long as different substrate realizations canonicalize to the same bytes-under-canonical-form, presentation differences are admissible.
- Lifting may introduce field requirements (e.g., `stored-at-path`) that are flatfile-specific and don't generalize cleanly to a row-in-a-table substrate.

A resolution would either author `federation-envelope-record` as a PC object (with substrate-general required fields and substrate-specific extension points), or document that PC deliberately leaves the record shape to sub-theories with the concept's wire-format spec as the cross-substrate contract.

A parallel question applies to [peer-record](theories/agential-orchestration-platform/theories/flatfile-agentic-resource-system/objects/peer-record.md) — FARS authored it locally; PC has no parent. The same argument-shape applies.
