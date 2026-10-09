---
name: Verifiable Credentials
description: "The W3C Verifiable Credentials Data Model - a Recommendation since 19 November 2019, with a 2.0 family reaching Recommendation on 15 May 2025 - that lets an issuer make a cryptographically verifiable, revocable claim about a subject, giving claim/provenance infrastructure a mature attestation primitive for conformance certificates and correction-event signatures even though no adopted claim- or conformance-specific credential profile yet exists on top of it."
date-created: 2026-08-22
aliases:
  - VC
  - VC Data Model
  - W3C Verifiable Credentials
  - verifiable credential
instance-of: w3c-standard
---

The **Verifiable Credentials (VC) Data Model** is a W3C specification letting an issuer make a claim about a subject in a form that is cryptographically signed, independently verifiable, and revocable,
typically paired with decentralized identifiers (DIDs) to identify issuer and subject without a central authority.
**VC 1.0** became a W3C Recommendation on **19 November 2019** ([w3.org/TR/2019/REC-vc-data-model-20191119/](https://www.w3.org/TR/2019/REC-vc-data-model-20191119/)).
The **2.0** family -
the data model plus Data Integrity, EdDSA and ECDSA cryptosuites, JOSE/COSE securing mechanisms, Controlled Identifiers 1.0, and Bitstring Status List 1.0 -
reached Recommendation status on **15 May 2025** ([W3C press release](https://www.w3.org/press-releases/2025/verifiable-credentials-2-0/)).

VC maps directly onto the "attestation" component of agent-readable claim infrastructure:
a validator or conformance registry signing "object O conforms to profile P," or an editor's desk signing "claim C was corrected at time T," is exactly the shape of action VC was designed for.
What does not yet exist is a **claim- or conformance-specific VC profile** -
VC supplies the general credentialing primitive, but no adopted vocabulary was found for a "this claim object conforms to schema X" or "this correction event is attested by issuer Y" credential.
The Ethereum Attestation Service (EAS) is a practical, widely cited attestation registry that could carry similar information,
but it is an industry project rather than a standards-body output and carries no conformance guarantee of its own.
Building a claim- and conformance-specific profile on top of the VC Data Model remains open work.

## See also

- [Study of Claim and Provenance Standards](../../documents/articles/notes/2026/08/22/2026-08-22-note-on-the-study-of-claim-and-provenance-standards.md) - the fuller study this entry summarizes, including its greenfield gaps
