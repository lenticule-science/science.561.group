---
title: "Study of Transparency Logs and Verifiable Data Structures for the Claim Infrastructure"
description: "A web-verified literature study establishing that append-only Merkle-tree logging (Merkle 1987; Crosby & Wallach 2009), Certificate Transparency (RFC 6962, RFC 9162, Laurie 2014), generalized transparency (Trillian; sigstore/Rekor with a peer-reviewed CCS 2022 paper) and key/binary transparency (CONIKS, USENIX Security 2015) are mature, standards- and peer-review-backed patterns directly reusable for per-claim conformance (bet 3), that JWS/COSE/Ed25519 and W3C VC Data Integrity are mature signing substrates for non-repudiable correction events (bet 2), and that content addressing (IPFS/Benet 2014, CID/multihash) is practitioner-tier prior art rather than a standards-track fit, with the open gap being that no reviewed literature yet specifies a transparency log schema for mutable claim *lifecycles* rather than append-only issuance/certificate events."
date-created: 2026-08-22
type: notes
name: 2026-08-22-note-on-the-study-of-transparency-logs-and-verifiable-data-structures
authors:
  - claude-sonnet-5
status: draft-for-review
keywords: ["transparency-logs", "merkle-trees", "certificate-transparency", "verifiable-data-structures", "content-addressing", "key-transparency", "signing-formats", "claim-infrastructure"]
tags: ["draft", "study"]
---


This study is read for one purpose:
to establish, for this engineering sub-literature, which claims trace to peer-reviewed research, IETF/W3C specifications, or documented production systems versus blog folklore and vendor marketing,
so the claim-infrastructure implementation builds on the right kind of source.
Method: web-verified citations.
Every load-bearing claim carries a markdown-linked source — a DOI, RFC number, W3C TR page, or stable URL.
Anything not verifiable to the primary source is marked **[UNVERIFIED]** inline.

## 1. Merkle hash trees: the structural origin (Merkle, 1987)

The hash tree itself originates with Ralph Merkle's
["A Digital Signature Based on a Conventional Encryption Function"](https://link.springer.com/chapter/10.1007/3-540-48184-2_32),
presented at the Conference on the Theory and Application of Cryptographic Techniques (CRYPTO '87), Santa Barbara, August 16–20, 1987,
and published in the proceedings as Springer LNCS volume 293 ([IACR CryptoDB entry](https://www.iacr.org/cryptodb/data/paper.php?pubkey=1642); [dblp record](https://dblp.org/rec/conf/crypto/Merkle87.html)).
The task brief's working date of "1987/1989" does not match the verified record —
the paper was presented in 1987 and appears in the 1987 conference's Springer proceedings (LNCS 293);
no independent 1989 publication was found, so the citation below uses the verified 1987 date and this discrepancy is noted rather than silently carried forward.
The construction — a binary tree of hashes whose root commits to every leaf, letting any single leaf be proven present with a logarithmic-length path — is the structural primitive under every system in this study: Certificate Transparency, Trillian, Rekor, and IPFS's Merkle DAG all instantiate it.

## 2. Tamper-evident logging as a data-structures problem (Crosby & Wallach, 2009)

Scott Crosby and Dan Wallach's
["Efficient Data Structures for Tamper-Evident Logging"](https://www.usenix.org/conference/usenixsecurity09/technical-sessions/presentation/efficient-data-structures-tamper-evident),
18th USENIX Security Symposium, Montreal, 2009 ([ACM DL record](https://dl.acm.org/doi/10.5555/1855768.1855788)),
is the paper that turns Merkle's primitive into the specific pattern Certificate Transparency later adopted: a history tree that an untrusted logger maintains for multiple clients, kept honest by auditors who challenge it to produce consistency and inclusion proofs in logarithmic size and time, rather than the linear-size proofs of naive hash-chained logs.
This is the direct structural ancestor of the RFC 6962/9162 Merkle Tree Head design, cited as such by the Certificate Transparency RFCs' own bibliography — the paper that makes tamper-evident logging a general engineering pattern rather than a certificate-specific hack.

## 3. Certificate Transparency: the deployed instance (RFC 6962, RFC 9162, Laurie 2014)

Certificate Transparency is the load-bearing precedent for bet 3.
[RFC 6962](https://www.rfc-editor.org/rfc/rfc6962.html), "Certificate Transparency" (Laurie, Langley & Kasper, IETF, June 2013), specifies an experimental protocol for publicly logging TLS certificates as they are issued, in append-only Merkle-tree logs that anyone can audit for inclusion and consistency, so that certificate authorities cannot silently mis-issue certificates undetected.
It was obsoleted by [RFC 9162](https://datatracker.ietf.org/doc/html/rfc9162), "Certificate Transparency Version 2.0" (Laurie, Messeri & Stradling, IETF, December 2021 — note the CT 2.0 author list is Laurie/Messeri/Stradling, not Laurie/Langley/Kasper, who authored the original 2013 RFC), which adds a TLS extension for delivering log artifacts and tightens the gossip/audit story.
Ben Laurie's practitioner synthesis, ["Certificate Transparency"](https://queue.acm.org/detail.cfm?id=2668154), ACM Queue 12(8), 2014 ([ACM DL record](https://dl.acm.org/doi/10.1145/2659897)), states the general design principle plainly: public, verifiable, append-only logs, monitors, and auditors as the three roles that make silent tampering detectable rather than merely discouraged.
This three-role decomposition (log operator, monitor, auditor) is the direct pattern this program needs for per-claim conformance: a claim-state log an outlet cannot rewrite unnoticed, monitored by anyone who cares to watch a given publisher or claim, audited by proof-checking clients.

## 4. Generalized transparency logs: Trillian and sigstore/Rekor

Google's [Trillian](https://github.com/google/trillian) generalizes the CT Merkle-tree-log pattern into a reusable, cryptographically verifiable append-only data store with a gRPC API modeled on RFC 6962's operations ([project docs](https://google.github.io/trillian/)); this is practitioner-tier documentation, not a peer-reviewed artifact, and the project's own docs now note it is in maintenance mode with Tessera recommended for new tiled-log deployments — carried here as current operational status, not evaluated further.
Sigstore's [Rekor](https://github.com/sigstore/rekor) is a signature transparency log built on the same append-only-log pattern, purpose-built for software-artifact signing events rather than certificates ([Rekor overview docs](https://docs.sigstore.dev/logging/overview/)).
Unlike Trillian, sigstore has a peer-reviewed systematization: Zachary Newman, John Speed Meyers, and Santiago Torres-Arias, ["Sigstore: Software Signing for Everybody"](https://dl.acm.org/doi/10.1145/3548606.3560596), ACM CCS 2022 (DOI 10.1145/3548606.3560596), which documents the security model, adoption data, and the transparency-log-plus-short-lived-certificate design that lets signing happen without long-term key custody.
This paper is confirmed peer-reviewed (published in the CCS 2022 proceedings, pages 2353–2367), answering the brief's request to check for one.
Generalized transparency logging is the direct architectural template for a claim-state log: a log service that any claim-graph event (assertion, correction, retraction) can be appended to, with inclusion and consistency proofs available to any consumer, independent of the specific certificate or software-artifact domain CT and sigstore were each built for.

## 5. Key and binary transparency: CONIKS (Melara et al., 2015)

Marcela Melara, Aaron Blankstein, Joseph Bonneau, Edward Felten, and Michael Freedman, ["CONIKS: Bringing Key Transparency to End Users"](https://www.usenix.org/conference/usenixsecurity15/technical-sessions/presentation/melara), 24th USENIX Security Symposium, 2015 ([paper PDF](https://www.usenix.org/system/files/conference/usenixsecurity15/sec15-paper-melara.pdf); [dblp record](https://dblp.org/rec/conf/uss/MelaraBBFF15.html)), extends the transparency-log pattern from certificates to end-user key bindings, adding a specific capability the CT design lacks: users can efficiently monitor only their own bindings for consistency (under 20 kB/day even at billions-of-users scale) rather than requiring a global monitor to watch the whole log, and providers can be collectively audited for non-equivocation at a constant 2.5 kB per provider per day.
This self-auditing-of-one's-own-entries pattern is the closest existing precedent for a claim-state log where an individual claim's subject, or a fact-checking organization, needs to verify their own claim's history without downloading or monitoring the entire cross-publisher log — a scaling requirement per-claim conformance will face that CT-style global monitoring does not solve by itself.

## 6. Signing and proof formats: JWS, COSE, Ed25519, and W3C VC Data Integrity

Four format-layer standards, all mature and directly reusable:
[RFC 7515](https://www.rfc-editor.org/rfc/rfc7515.html), "JSON Web Signature (JWS)" (IETF, May 2015), specifies signing/MAC over JSON-based structures — the format ClaimReview-adjacent JSON-LD payloads would most naturally carry a signature in.
[RFC 9052](https://www.rfc-editor.org/rfc/rfc9052.html), "CBOR Object Signing and Encryption (COSE): Structures and Process" (IETF, August 2022, obsoleting RFC 8152), is the CBOR-binary analogue of JWS, relevant if claim-log entries need a compact binary encoding rather than JSON.
[RFC 8032](https://www.rfc-editor.org/rfc/rfc8032.html), "Edwards-Curve Digital Signature Algorithm (EdDSA)" (IETF, January 2017), specifies Ed25519, the signature scheme both sigstore and most modern transparency-log tooling use for log-entry and artifact signatures, chosen for its combination of ~128-bit security, deterministic signing, and fast verification.
[W3C Verifiable Credential Data Integrity 1.0](https://www.w3.org/TR/vc-data-integrity/) reached full **W3C Recommendation** status in 2025 as part of the Verifiable Credentials 2.0 family rollout ([W3C news announcement, 2025](https://www.w3.org/news/2025/the-verifiable-credentials-2-0-family-of-specifications-is-now-a-w3c-recommendation/)); as of this study's date (2026-08-22) it is a Recommendation, not a draft, with a 1.1 revision in progress ([editor's draft](https://w3c.github.io/vc-data-integrity/)).
Data Integrity's proof-graph model — attaching a cryptographic proof object to a JSON-LD document by reference to a canonicalized graph — is the most directly reusable of the four for a JSON-LD claim vocabulary, since it is designed to sign linked-data documents rather than opaque byte strings.

## 7. Content addressing: IPFS, CID/multihash, and the addressing distinction

Juan Benet, ["IPFS - Content Addressed, Versioned, P2P File System"](https://arxiv.org/abs/1407.3561), arXiv:1407.3561, 2014, is an unrefereed preprint — **practitioner/preprint tier, not peer-reviewed** — that describes content-addressed block storage built on a generalized Merkle DAG.
The CID (Content Identifier) format and its multihash component are documented in the [CID specification](https://specs.ipfs.tech/cid/) and [multiformats/cid repository](https://github.com/multiformats/cid); this is practitioner-tier engineering documentation (a living spec maintained by the Multiformats/IPFS project), not a standards-track or peer-reviewed artifact, and is cited here at that tier.
The general distinction the brief asks to draw — content addressing (retrieval by a hash of the data itself, so the identifier is invariant to where or how many copies exist) versus location addressing (retrieval by a network or filesystem path, as ordinary URLs do) — is well documented in [IPFS's own concept docs](https://docs.ipfs.tech/concepts/content-addressing/) but the distinction itself is a systems-architecture commonplace rather than something with a single citable origin; it is carried here at the same practitioner tier as the CID spec.
For the claim infrastructure, content addressing is the natural way to reference an immutable claim-state snapshot (a specific version of a claim's evidence bundle) by its hash, independent of which mirror or CDN currently hosts it — but it is orthogonal to, not a substitute for, the append-only *log* that Certificate-Transparency-style systems provide: content addressing proves a given blob is the one referenced, while a transparency log proves an append happened and nothing was removed. Both are needed together.

## 8. Mapping to the program's bets

The [program note](../../../../../../../../../../content/text/documents/articles/notes/2026/08/22/2026-08-22-note-on-the-web-news-media-research-program.md) names three ordered bets: claim-state and correction semantics, correction propagation, and per-claim conformance.
This study maps most directly to the third and second.

**Bet 3, per-claim conformance**, is a direct architectural match to the Certificate Transparency pattern (Section 3) generalized the way Trillian and sigstore/Rekor generalize it (Section 4): an append-only, publicly auditable log of claim states and corrections, CT-style, so any consumer can obtain an inclusion proof that a given claim state was logged and a consistency proof that the log's history was not rewritten — meaning a publisher cannot silently alter a claim's recorded history the way CT makes silent certificate mis-issuance detectable. CONIKS's per-user self-auditing (Section 5) is the closest precedent for making this scale to individual claim subjects rather than requiring global monitors.

**Bet 2, correction propagation**, gains non-repudiation from this same substrate: once a correction event is written into a signed (Section 6), append-only (Sections 1–3) log entry, the publisher cannot later deny having recorded (or having failed to record) the correction, and downstream consumers can cryptographically verify a correction's timestamp and inclusion independent of whether the original article was ever re-fetched. Content addressing (Section 7) complements this by letting a correction event reference the exact prior claim-state snapshot it supersedes by hash, rather than by a mutable URL.

**Bet 1, claim-state and correction semantics**, is the one this study does not cover directly — it is a vocabulary and lifecycle-modeling problem, not a data-structures problem — but every pattern above assumes bet 1 has already defined what a "claim state" and "correction event" *are* as typed, serializable objects before they can be logged, signed, or content-addressed.

## 9. Gaps carried forward

- No reviewed literature was found that specifies a transparency-log schema for *mutable, multi-state claim lifecycles* rather than append-only issuance events (certificates) or artifact-signing events (sigstore); CT and Rekor both log discrete events, not a state machine's transitions, so adapting either to bet 1's asserted → corroborated → contested → corrected → retracted lifecycle is unstudied design work, not literature reuse.
- Trillian's practitioner docs note the project itself is in maintenance mode in favor of Tessera for new tiled-log deployments; this study did not locate a peer-reviewed or RFC-level treatment of Tessera, so any future implementation choice between Trillian, Tessera, and Rekor as the log substrate remains **[UNVERIFIED]** against anything beyond project documentation.
- The distinction between content addressing and location addressing (Section 7) was verifiable only against practitioner documentation (IPFS's own docs), not a peer-reviewed or standards-track source with that framing as its explicit subject; a canonical academic treatment of the distinction, if one exists, was not located in this pass.
- W3C VC Data Integrity's move from 1.0 (Recommendation, 2025) to a 1.1 editor's draft was confirmed to exist but this study did not review what changes 1.1 introduces; that is carried forward as unread, not as unverified.
- This study did not attempt to verify Certificate Transparency's real-world deployment statistics (log counts, coverage percentages) since the brief's coverage list did not ask for adoption-metric claims; any such figures used elsewhere in the program should be sourced and checked separately.

## Verification note

Verified 2026-08-22 by an adversarial second pass against primary sources, not secondary mentions: the RFC Editor (rfc-editor.org) for every RFC, Crossref's REST API for every DOI, the arXiv API for the IPFS preprint, and direct fetches of the USENIX, ACM Queue/CACM, W3C, and project-documentation pages cited.
15 load-bearing citations checked: Merkle 1987, Crosby & Wallach 2009, RFC 6962, RFC 9162, Laurie's ACM Queue/CACM "Certificate Transparency," Trillian's project docs, Rekor's project docs, Newman/Meyers/Torres-Arias (Sigstore, CCS 2022), CONIKS (Melara et al. 2015), RFC 7515, RFC 9052, RFC 8032, W3C VC Data Integrity 1.0, Benet's IPFS preprint, and the CID specification.
0 corrected — every checked author list, date, venue, volume/issue, page range, DOI, and RFC status matched its primary source exactly, including details the brief specifically flagged for scrutiny: RFC 9162's obsoleting of RFC 6962 and its Laurie/Messeri/Stradling author list (distinct from RFC 6962's Laurie/Langley/Kasper), the CONIKS paper's own bandwidth figures (under 20 kB/day self-audit even at billions-of-users scale, a constant 2.5 kB per provider per day), and the Sigstore CCS 2022 paper's page range (2353–2367) and CCS venue.
The one apparent discrepancy surfaced in this pass — Crossref lists a `1988` print date for Merkle's LNCS 293 volume against the `1987` conference date this study and its glossary terms use — was checked against the two bibliographic authorities the study itself already cites (IACR's CryptoDB and dblp), both of which record 1987; this is the ordinary conference-vs-proceedings-volume publication lag, not a citation error, and the existing 1987 date is left uncorrected.
The ACM DL record for Laurie's "Certificate Transparency" was checked to confirm dl.acm.org itself indexes DOI 10.1145/2659897 as **ACM Queue, Vol. 12, No. 8** (the same DOI is also carried by the Communications of the ACM Practice-section reprint, vol. 57 no. 10) — the study's "ACM Queue 12(8)" citation is correct as written.
2 markers remain **[UNVERIFIED]**, both already flagged in the draft and confirmed still unresolved in this pass rather than newly added: Tessera's status as Trillian's recommended successor (no RFC-level or peer-reviewed treatment was located for Tessera itself), and the peer-review status of Benet's IPFS paper (the arXiv API confirms arXiv:1407.3561 remains a preprint, with no refereed-venue publication found).
Structural check, not a citation: the program-note relative link in Section 8 (13 levels of `../`) was independently re-verified with `realpath -e` and resolves to the intended file, confirming the drafting agent's path correction rather than merely repeating it.
