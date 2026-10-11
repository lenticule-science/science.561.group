---
title: SEN SEAVT and ActivityPub++ source release review
date-created: 2026-10-07
status: DRAFT-FOR-LEADER-REVIEW
admission: unadmitted local preparation
intended-packaging-owner: standard-document-release-team
related-executive-endeavor: demand-15b1f81a150f7c950990d6b6100c1e86
lmt-class-define-work-order: unresolved
acceptance-disposition: pending
---

# SEN SEAVT and ActivityPub++ source release review

**DRAFT-FOR-LEADER-REVIEW**

SEN, SEAVT and ActivityPub++ are recovered in full for the Leader's requested source release. Two retained errata proposals need separate decisions:

1. **SEN:** accept, amend or reject the dated implementation-status note while keeping the normative grammar and stated proof scope unchanged
2. **SEAVT:** accept, amend or reject the executable placement, admission, normalization and recorder-example corrections while preserving the abstract row definition

ActivityPub++ has no proposed edit. SCA accompanies these three priorities as supporting content-addressing work.

## Scope

The packet preserves seven complete historical artifacts: SEN and SEAVT Markdown; ActivityPub++ authored JSON, Markdown and RFCXML; SCA Markdown; and the specification-publishing method. All match their recorded byte identities at Bare Cedar Fog snapshot `36116a727f8993d64063341d9ed5cbd281ecd00f`. The proposed SEN and SEAVT versions, two-file diff and retained release notes sit separately under `proposed-errata/`.

The existing packaging owner is Red Cup Engineering's `standard-document-release-team`, observed in `red-cup-engineering/text-services-section` at `df2d945d584571918bcceb48c127ad30961f789a`. Its [process](current-method/PROCESS.md), [owner record](current-method/standard-document-release-team.json) and [cycle contract](current-method/standard-document-release-cycle.json) accompany the packet.

Intended owner-relative entry:

`services/document-services-section/services/standard-document-release-team/content/documents/specifications/2026/10/07/semiotic-specification-release-review/REVIEW.md`

## References

- [SEN original](originals/2026-09-23-specification-of-the-semiotic-expression-notation.md): September 23, version 0.1.0, draft; historical seat `computer-code-engineering-services-section`
- [SEAVT original](originals/2026-09-23-specification-of-the-semiotic-eavt.md): September 23, version 0.1.0, draft; the same historical seat
- [ActivityPub++ authored record](originals/2026-09-27-specification-of-activitypub-plus-plus.specification.json), [Markdown](originals/2026-09-27-specification-of-activitypub-plus-plus.md) and [RFCXML](originals/draft-emsenn-activitypub-plus-plus-00.xml): September 27, version 0.1.0, draft; historical seat `activitypub-services-section`
- [SCA original](originals/2026-09-23-specification-of-the-semiotic-content-address.md) and [publishing method](originals/publishing-a-specification-SKILL.md): supporting sources

[Pinned source links](SOURCE-LOCATORS.md) supply exact original paths, Git blob identities and SHA-256 hashes. [Verification](evidence/verification.json) covers the seven bundled originals; the [historical manifest](evidence/manifest.json) also records 24 source artifacts outside this packet. [PACKET-MANIFEST.json](PACKET-MANIFEST.json) and [SHA256SUMS](SHA256SUMS) identify the complete local payload.

## Definitions

SEN supplies the typed expression language. SEAVT temporalizes it through rows with closed, well-typed SEN entity, attribute and value terms plus witnessed time. ActivityPub++ specifies the ActivityPub, CloudEvents and A2A nesting for the Semioverse. SCA supplies supporting content commitment. Their complete definitions remain in the originals.

SignCell and SignCraft are software implementing or using these carriers. They are distinct from the specifications being reviewed.

## Normative content

The originals retain every normative passage, author, version and historical reference. This wrapper adds no normative clause.

The [SEN candidate](proposed-errata/2026-09-23-specification-of-the-semiotic-expression-notation.md) changes its status line and appends a dated implementation note. It identifies later `prim`, sum and empty-type behavior and a legacy identity vector without adding them to the specified core-plus-four grammar or extending the cited core proof.

The [SEAVT candidate](proposed-errata/2026-09-23-specification-of-the-semiotic-eavt.md) corrects the recorded package placement, distinguishes inferable-coordinate admission from abstract well-typedness, clarifies row normalization, and replaces `charge:{support,refutation}` with the recorder's `told:{for,against}` example and optional causes/origin. Its abstract row definition is unchanged.

The [exact diff](proposed-errata/retained-implementation-status-only.patch) and [retained review](proposed-errata/retained-release-notes.md) carry those proposals and their dated implementation evidence.

## Conformance

Completed checks establish recovery integrity: seven original SHA-256 and Git blob matches; three current-method Git blob matches; ActivityPub++ JSON parsing and XML well-formedness; unchanged SEN normative body and SEAVT abstract row; local-link checks and packet checksums. Protocol conformance, proof builds, renderer equivalence and peer interoperability were not tested.

## Status and remaining actions

This is local, unadmitted preparation. The packaging process requires exact-path sources and holds the draft from GitHub push or external publication until a Leader disposition. It also requires an actual LMT class-define tracking work order. That identity is unresolved; related executive endeavor `demand-15b1f81a150f7c950990d6b6100c1e86` supplies context only.

Current normative custodians and receiving paths remain unresolved after the [bounded source checks](evidence/read-route-receipt.json). The packaging owner's relationship to the historical specification-workbench method is also unresolved. Other open claims are SEN extension authority/proof scope, SEAVT's abstract-versus-executable admission boundary, SCA envelope-profile drift, and ActivityPub++'s dated node and protocol questions. Their detailed qualifications remain in the originals and retained review. Release destination, reuse licensing and submission/adoption disposition remain separate choices.

The Leader, or a delegate whose authority is established, can now accept this exact package as a faithful basis for a release candidate, return corrections, or defer it, while deciding the two errata separately. Bind the disposition to the packet manifest digest. Source-review acceptance can precede custody resolution; cycle completion and an upstream handoff still need the actual tracking and receiving identities. No such acceptance, handoff or publication is recorded here.
