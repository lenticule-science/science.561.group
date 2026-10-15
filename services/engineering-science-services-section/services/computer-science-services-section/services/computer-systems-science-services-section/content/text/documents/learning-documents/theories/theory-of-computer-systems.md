---
title: "Theory of Computer Systems"
date-created: 2026-10-15
description: "A computer system is a predicated computer of the multi-participant kind: its storage unit is the predication cell, its operations are assert, retract and traverse, identity is relational, computation is settling, and its anatomy is a boundary, one durable store, an interchangeable engine and an observation surface; the Group's substrate (SCA, SEN, SEAVT, SignCell) is the concrete form."
type: theory
name: theory-of-computer-systems
reading-order: 9
depends-on: [theory-of-obsmetrologia, theory-of-predication-categories, theory-of-locution, theory-of-agency, theory-of-concurrent-game-systems]
used-by: [theory-of-market-systems]
keywords: [predicated-computer, system, settling, store, engine, boundary, observation-surface, locale, closure-conditions, sca, sen, seavt, signcell, signchain, signgraph, signcraft, activitypub-plus-plus, semioverse]
provenance:
  authors: [emsenn, claude-opus-5-5]
  derived-from:
    - "deleted predicated-computing objects (git show 7422a224b376^:…/predicated-computing/objects/{predicated-computer,locale,predicated-arena}.md)"
    - "engineering-services-section/content/text/documents/articles/notes/2026/03/21/ (substrate anatomy, correspondences, federation as substrate join)"
    - "science-services-section/services/philosophy-services-section/services/logic-services-section/content/text/documents/articles/learning-articles/questions/what-is-the-theory-of-computing.md"
    - "561-group-services-section/services/561-group-operations-services-section/services/561-group-board-of-directors/services/561-group-board-of-directors-leader-movement-team/content/text/documents/articles/notes/2026/09/23/2026-09-23-note-on-the-software-ecosystem.md (the Leader's Layer 0)"
    - "red-cup-engineering/computer-content-address-engineering-services-section (SCA); SEN and SEAVT specifications (deleted 97034fcf8ec7)"
---

# Theory of Computer Systems

The Group keeps two theories of the computer apart. The **theory of computing** says what computation is: concurrent games with symmetry, with the effective topos as its computable fragment (see the theory of concurrent game systems). The **predicated computer** says what kind of machine a computer runs on: a substrate whose unit is the predication cell and whose computation is settling. A **computer system** is a predicated computer of the multi-participant kind: many substrate instances coupled into one settling collective by replication, federation or a concurrent game. An agent is a kind of system.

## The predicated computer

Three invariants define it, and each forces the next.

- **S1. The unit of storage is the predication cell.** Storage holds (subject, predicate, object) cells with values in the fiber algebra. A cell is identified by its triple, not by an address. There is no fetch-from-address primitive.
- **S2. The unit of operation is the relational primitive.** The substrate offers assert, retract (by its retraction discipline, which adds a contrary rather than erasing) and traverse along a predicate, and it raises values monotonically in ≤k. Every richer operator decomposes into these, or it is not an operator on the substrate.
- **S3. Identity is relational.** An entity is constituted by the predications it takes part in. Two entities with the same incident structure are one entity.

Further laws:

- **S4. Settling is computation.** An entity's predications are its program; the substrate has no separate code and data. Quiescence is normal form: settled state is the output of a computation, unsettled state is a computation still running. Tape is the store, head is the wavefront, finite control is the closure-rule system, halting is quiescence.
- **S5. Completeness is local.** A scope is complete when seven closure conditions hold in it: bare admission, identity, composite, reference, constraint classification, procedure, coherence. A complete scope is a locale, identified by its (vocabulary, rule subset, shape catalog, operation catalog), not by its name or its location.
- **S6. Arenas are I/O contracts.** A computer's arena is its (input type, output type). Two computers' compatibility (direct, translatable, incompatible) is decided from arenas without reading internals.
- **S7. Anatomy.** A predicated computer has four components: an input boundary, a store, an engine and an observation surface. Only the store holds durable state. Two engines that respect the algebra produce byte-identical settled outputs from byte-identical inputs, so engines are interchangeable plumbing.
- **S8. Kinds by settling signature.** A system is multi-participant settling; a database is storage-dominant; a functional runtime is the finite regime; a web-serving computer is request-response settling; an interactive application settles to quiescence under interaction; a concept computer stabilizes concepts.
- **S9. The section quartet.** Computer data, code and networking are the three coordinate concerns; computer systems is their composition (operating systems, agent and inference systems, proof assistants, blockchains, MUDs).

## The Group's substrate

The Leader's Layer 0 (2026-09-23) is the concrete predicated computer. Data is most primitive, code operationalizes it, networking transmits it.

- **SCA (semiotic content address)** names. An SCA is the RFC 6920 `ni:///sha-256;` name of the RFC 8949 core-deterministic CBOR encoding of a NFC-normalized JSON carrier. Its semantic identity is the SCA of a normalized envelope whose body is a SEN normal form; its proof-path coordinate is {surface, token, claim}, with surface generators `A.B` (generation), `A:B` (witness) and `A-B` (obstruction). Records are placed by the address alone (ni-path-v1), with no index.
- **SEN (semiotic expression notation)** relates. It is a total typed LISP carried over JSON: the Lean-proved simply typed core (confluent, so a normal form can be an address) plus exactly four executable forms (mark, coincide, cond, fold). A predication cell is pair(s, pair(mark(p), o)). FOUR's charges are four distinguished marks.
- **SEAVT (semiotic EAVT)** temporalizes. A row is {e, a, v, t} with e, a and v closed well-typed SEN terms and t the witnessed time, journaled append-only in a witness journal. Charge, contradiction and RDF are derived readings, never stored fields. Strata are derived passes: asserted, saturated (Fix σ), settled (Fix σ ∩ Fix Δ).
- **metrologic** settles: the JavaScript carrier of Obsmetrologia.
- **The Sign libraries** realize the quartet. SignCell : SignChain : SignGraph : SignCraft :: data : code : networking : systems. SignCell is the semiotic cell all computational data shares. SignChain is the evidence bilattice and is meant to replace LangChain. SignGraph organizes SignChain's bilattice as a Chu space and is meant to replace LangGraph.
- **ActivityPub++** transmits between instances: ActivityPub(CloudEvent(A2A(SEN))), one public face per actor, no public A2A listener, every object a SEN document named by its ni. The network of nodes is the Semioverse. Its server is MOOSE; MetroPlat is a library over it.

Every object therefore has two addresses: a content address (which bytes) and a proof-path address (how it was derived). Every protocol surface (HTTP route, MCP URI, ActivityPub IRI, package export, filesystem path) is a reading of one apex term. Activities that name their predecessors by digest form a causal set, so the network needs no global clock. A node's knowledge is the join of the reports in its past light cone.

## Consequences for the Group's systems

Required:

1. **A MetroPlat instance is a predicated computer of kind system.** It has one durable store (witness journals of SEAVT rows), input boundaries (locution codecs), an engine (the owning sections' closure rules) and observation surfaces (per-actor restrictions).
2. **No component keeps durable state outside the store.** A service with its own database of work, status or standing is outside the computer and is a misfold.
3. **Engines are interchangeable.** Any engine that respects the algebra gives the same settled output from the same record. Replaying a journal reproduces state exactly.
4. **Names are SCAs.** A `ni:` over `JSON.stringify` output, a hex digest or a bare `sha256:` string is not a house content name.
5. **The filepath is a proof.** Each earned directory segment is a generating or restricting morphism, and flattening an earned path destroys information.

## Open

- Open: leg agreement, the theorem that all protocol readings of one address term show the same object (`ConeOfReadings`).
- Open: whether SEAVT belongs to SignChain or to a data package beneath it (Leader, 2026-09-25: "to me, SEAVT sounds like a part of SignChain, but I could be wrong").

## Sources

- The predicated computer (deleted): `git show 7422a224b376^:lib/emsenn/services/561-group/services/public-services-section/services/personal-services-section/services/emsenn-services-section/lib/legacy/2026-08-19-personal-glossary-source-residue/2026-08-18-archive-emsenn-org/gibwodgit/archive/flowif/library/theories/engineering/theories/tech/theories/computing/theories/predicated-computing/objects/predicated-computer.md` and siblings `locale.md`, `predicated-arena.md`.
- Substrate anatomy: `engineering-services-section/content/text/documents/articles/notes/2026/03/21/2026-03-21-note-on-substrate-anatomy-as-four-components.md` and siblings.
- What the theory of computing is: `science-services-section/services/philosophy-services-section/services/logic-services-section/content/text/documents/articles/learning-articles/questions/what-is-the-theory-of-computing.md`.
- The Leader's Layer 0: `561-group-services-section/services/561-group-operations-services-section/services/561-group-board-of-directors/services/561-group-board-of-directors-leader-movement-team/content/text/documents/articles/notes/2026/09/23/2026-09-23-note-on-the-software-ecosystem.md`.
- SCA and ni-path-v1: `red-cup-engineering/computer-content-address-engineering-services-section@main:content/text/documents/articles/specifications/`.
- SEN and SEAVT specifications (deleted): `git show 97034fcf8ec7^:` under `engineering-services-section/services/computer-engineering-services-section/services/computer-code-engineering-services-section/content/text/documents/articles/specifications/`.
- SEAVT term: `engineering-services-section/content/text/glossary/terms/seavt.md`.
- ActivityPub++ (deleted): `git show 8eb890e29b21^:` under `computer-networking-engineering-services-section/services/activitypub-services-section/content/text/documents/articles/specifications/2026-09-27-specification-of-activitypub-plus-plus.md`; the Semioverse as a knowledge meshnet: `git show 5fe511669e86^:` under `living-web-science-services-section/content/text/documents/articles/notes/2026/09/27/`.
