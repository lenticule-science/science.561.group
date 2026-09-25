---
title: "The Claim Infrastructure Reference Architecture"
description: "A synthesis composing the five verified engineering studies of 2026-08-22 into one buildable architecture for the news program's three bets — a bitemporal event log as substrate, nanopublication-style statement-addressable claim documents in JSON-LD as representation, a Certificate-Transparency-style Merkle log as the integrity and per-claim-conformance layer, WebSub-pushed ActivityPub Update activities with LDES/RFC 5005 replay and Memento versioning as correction propagation, and gated claim-extraction and grounded-generation transforms at the editorial boundary — stated explicitly as a DAG of standards and findings with every node citing the study that grounds it, including the architectural verdicts the verification pass forced: build on named graphs and JSON-LD rather than RDF-star while RDF 1.2 remains a Candidate Recommendation, and treat the unassembled WebSub-plus-ActivityPub-plus-replay combination as the program's genuine opening."
date-created: 2026-08-22
type: notes
name: 2026-08-22-note-on-the-claim-infrastructure-reference-architecture
authors:
  - claude-fable-5
status: draft-for-owner-review
keywords: ["reference-architecture", "claim-infrastructure", "bitemporal", "nanopublication", "transparency-log", "correction-propagation", "editorial-gates", "synthesis", "dag"]
tags: ["draft", "synthesis", "architecture"]
---


This note composes the five engineering studies landed and adversarially verified 2026-08-22 —
[event-sourced and bitemporal state](./2026-08-22-note-on-the-study-of-event-sourced-and-bitemporal-state-engineering.md),
[statement-level metadata](./2026-08-22-note-on-the-study-of-statement-level-metadata-engineering.md),
[transparency logs and verifiable data structures](./2026-08-22-note-on-the-study-of-transparency-logs-and-verifiable-data-structures.md),
[syndication and propagation protocols](./2026-08-22-note-on-the-study-of-syndication-and-propagation-protocols.md),
and [claim extraction and grounded generation](./2026-08-22-note-on-the-study-of-claim-extraction-and-grounded-generation-engineering.md) —
into a single architecture for the three bets of the
[web news media research program](../../../../../../../../../../content/text/documents/articles/notes/2026/08/22/2026-08-22-note-on-the-web-news-media-research-program.md).
The composition principle is the owner's:
engineering is the composition of others' wisdom —
a DAG whose nodes are standards and verified findings and whose edges are data flow.
Nothing below is invented where something citable exists;
every node names the study that grounds it.

## 1. The substrate: a bitemporal event log of claim events

Claims, assertions, contests, corrections, and retractions are events in an append-only log,
in the log-as-source-of-truth sense of the practitioner canon (Kreps; Kleppmann) documented in the event-state study.
Claim *state* is never stored as mutable rows;
it is materialized from the log into bitemporal views carrying the temporal-database literature's two axes:
valid time — when the claim held in the world —
and transaction time — when the newsroom asserted or learned it (Snodgrass and Ahn's distinction, peer-reviewed core).
A correction is then not a special mechanism at all:
it is precisely a retroactive bitemporal update,
an event at transaction time t2 revising what is asserted about valid time t1,
with both coordinates preserved and queryable.
This discharges bet 1's lifecycle semantics into forty years of temporal-database science
instead of inventing a state machine from scratch.

## 2. The representation: statement-addressable claim documents

Each materialized claim state is published as a nanopublication-shaped bundle —
assertion, provenance, and publication-info as separate named graphs (Carroll et al.'s named graphs; Groth, Gibson and Velterop's anatomy) —
identified by a content-hash identifier in the trusty-URI manner (Kuhn and Dumontier),
serialized as JSON-LD 1.1 with a versioned, additive-only context,
and validated against published SHACL shapes.
The statement-metadata study's verification pass forced one architectural verdict:
as of 2026-08 RDF 1.2 and its quoted-triples remain Candidate Recommendation, not Recommendation,
so the architecture builds on named graphs and JSON-LD — both settled Recommendations —
and treats RDF-star adoption as a future migration, not a dependency.
Every claim document also emits a plain schema.org ClaimReview projection,
so consumers that speak only the surviving mass-deployed channel
(the semantic-web study's central adoption finding)
lose the lifecycle but keep the verdict.
This is bet 1's vocabulary and half of bet 3's audit surface.

## 3. The integrity layer: a transparency log of claim states

Every published claim document and every correction event is appended to a Merkle-tree transparency log
in the Certificate Transparency pattern (RFC 6962, RFC 9162; Crosby and Wallach's tamper-evident logging; Trillian and sigstore as generalization precedent),
signed with modern primitives (Ed25519 per RFC 8032; JWS/COSE envelopes; W3C Data Integrity proofs for attestations).
Consumers receive inclusion proofs and consistency proofs,
so a publisher demonstrably cannot rewrite claim history silently —
the exact property the science-side
[claim and provenance standards study](./2026-08-22-note-on-the-study-of-claim-and-provenance-standards.md)
found missing from every existing trust scheme, all of which rate publishers, not claims.
Per-claim conformance is then a checkable conjunction:
the document validates against its published shapes,
and its hash is provably included in the log.
This is bet 3, built from the one prior art (CT) that has operated at internet scale for a decade.

## 4. The propagation layer: push, replay, and versions

Correction propagation composes four standards the propagation study verified individually
and found never assembled together for news:
corrections travel as ActivityPub Update activities (W3C Recommendation, with the fediverse as working — and instructively imperfect — deployment precedent),
pushed to subscribers via WebSub (W3C Recommendation 2018);
full claim histories are replayable by late-arriving consumers via archived feeds (RFC 5005) or Linked Data Event Streams;
prior versions of any claim document remain addressable via Memento (RFC 7089);
and outbound references follow robust-link practice against the reference rot Klein et al. quantified.
The study's gap finding is the program's opening stated as engineering:
each piece is a settled standard with running code,
and the composition is unclaimed territory.
This is bet 2,
designed against the empirically real failure mode the science-side studies identified —
corrections that never reach downstream copies —
not the imaginary backfire effect.

## 5. The editorial boundary: extraction and generation as gated transforms

Claims enter and leave the system only through gates,
per the claims-to-prose memo's constraint that generation is a constrained relation, not translation.
At ingestion: claim detection (ClaimBuster lineage),
decomposition into atomic assertions (the FactScore pattern),
and retrieve-then-verify checking (the FEVER architecture),
with the NLP study's brittleness findings (annotation artifacts, benchmark-to-newsroom gap) determining
that these transforms *propose* claim events and never commit them without the gate.
At realization: grounded generation whose citations are evaluated for attribution (AIS; ALCE),
with the study's explicit verdict on which metrics are strong enough to serve as automated gate checks
and which remain too weak,
so gate placement follows measured instrument strength rather than optimism.
The gates' human-accountability boundary is owned by the
[accountable-agentic-newsrooms memo](../../../../../../../../../../../../../semiotics-science-services-section/content/text/documents/articles/notes/undated/accountable-agentic-newsrooms.md);
the executors of these gates are LLM agents,
and the AI and artificial-agent study wave landed the same day with three verdicts that now govern this layer.
First, convergence:
the evaluation-science study and the claim-extraction study reach the same conclusion from independent literatures —
no surveyed benchmark, judge, calibration method, or faithfulness metric is validated at newsroom-claim granularity,
so every automated instrument is a gate *signal* feeding a human-governed, override-capable gate,
which the evidence now supports as the correct design rather than merely a cautious default.
Second, a hard constraint:
LLM-as-judge is usable as an always-on first-pass flag (Zheng et al.'s agreement result)
but must never be the sole gate when judge and drafter share model lineage,
per Panickssery et al.'s causal self-preference finding —
directly binding on this library, which drafts and judges within one model family.
Third, grounding for the pipeline shape itself:
the multi-agent study finds the generic "more agents are better" claim contested once compute is held constant,
but the MAST failure taxonomy's task-verification category independently confirms
that a dedicated adversarial verification step catches a specific failure mode — unchecked termination —
that a single agent is structurally prone to;
the draft-then-verify design this library runs on, and this architecture inherits,
rests on that narrower, evidenced claim.
The FIPA-ACL critique literature adds the hand-off contract's design rule:
gates check publicly observable commitments —
what a draft asserts and what it cites —
never inferred agent intent.

## 6. The DAG, explicitly

Nodes and their grounding, edges as data flow:

- event log (Kafka/log pattern; event-state study) → bitemporal views (Snodgrass; event-state study) → claim documents (nanopub anatomy, named graphs, JSON-LD, SHACL; statement-metadata study)
- claim documents → transparency log (RFC 6962/9162; transparency study) → inclusion/consistency proofs → per-claim conformance checks
- claim documents → ClaimReview projection (schema.org channel; semantic-web and claim-standards studies) → legacy consumers
- correction events → ActivityPub Update + WebSub push; event log → RFC 5005/LDES replay; claim-document versions → Memento (propagation study) → downstream copies
- source text → detection → decomposition → verification gates (NLP study) → *proposed* claim events → human-accountable commit
- evidence + claim documents → grounded generation → attribution evaluation gate (NLP study) → published prose surfaces

Every in-edge is someone else's verified wisdom;
the only novel node is the composition itself —
which is what engineering is.

## 7. Standing debts

- The evaluation study names the program's sharpest engineering gap:
  essentially no peer-reviewed literature on retry, fallback, and guardrail design for LLM systems was found,
  so the gate runtime's own reliability is an open systems-engineering problem;
  a targeted search of systems venues (OSDI/NSDI-adjacent) is owed.
- Whether Zheng et al.'s judge/human agreement transfers from open-ended chat to structured news-claim grading is unverified;
  §5's first-pass-flag role depends on that transfer and should be validated in-house before production.
- The four legacy implementation attempts under this section's lib/legacy/ have not yet been read against this architecture; a triage note comparing what they built to what the studies ground is owed.
- Parent-README registration of this section is carried as post-backup debt, as recorded in the section README.
