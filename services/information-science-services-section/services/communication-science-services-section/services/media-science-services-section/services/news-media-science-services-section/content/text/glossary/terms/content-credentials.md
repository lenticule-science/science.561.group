---
name: Content Credentials
description: "The Content Authenticity Initiative's consumer-facing branding for a C2PA manifest - a cryptographically signed record of a media file's origin and edit history specified at version 1.0 on 21 December 2021 and publicly announced 26 January 2022 by the Coalition for Content Provenance and Authenticity, which formed in February 2021 from the merger of Adobe's CAI and Microsoft/BBC's Project Origin, and which a 2026 unreviewed preprint argues fails some of its own claimed security goals - attesting origin, not truth, and complementary rather than equivalent to imperceptible watermarking such as Google's SynthID."
date-created: 2026-08-22
aliases:
  - C2PA
  - Coalition for Content Provenance and Authenticity
  - C2PA manifest
  - Content Authenticity Initiative
  - CAI
instance-of: industry-standard
---

**C2PA** (the Coalition for Content Provenance and Authenticity) is the industry body that specifies a cryptographically signed manifest recording a media file's origin, editing tool, timestamps, and full edit chain.
**Content Credentials** is the Content Authenticity Initiative's (CAI's) consumer-facing branding for what that manifest shows a viewer -
the label, not a separate technical standard.

C2PA formed in **February 2021** from the merger of two earlier efforts:
Adobe's Content Authenticity Initiative, launched in 2019 around certifying the origin of authentic content rather than only detecting fakes, and Microsoft/BBC's **Project Origin**, a news-sector provenance-traceability project ([truescreen.io](https://truescreen.io/articles/c2pa-standard-history-limitations/)).
The **C2PA Technical Specification 1.0** carries a spec date of **21 December 2021** ([spec PDF](https://spec.c2pa.org/specifications/specifications/1.0/specs/_attachments/C2PA_Specification.pdf))
and was publicly announced as "the world's first industry standard for content provenance" on **26 January 2022** ([C2PA press release](https://c2pa.org/c2pa-releases-specification-of-worlds-first-industry-standard-for-content-provenance/)).

C2PA is not watermarking, and the two are complementary rather than redundant.
Google's **SynthID** embeds an imperceptible watermark directly in pixel or audio data,
surviving lossy re-encoding and cropping but carrying almost no context beyond "a participating generator produced or edited this file."
C2PA's signed manifest carries richer context but is broken by a single screenshot, resize, or format conversion.
In May 2026, Google and OpenAI announced combining both layers so each covers the other's failure mode ([c2paviewer.com](https://c2paviewer.com/articles/openai-google-c2pa-synthid-2026)).

Neither layer establishes truth.
A 2026 preprint - Golaszewski, Krawetz, Sherman, et al., "Verifying Provenance of Digital Media: Why the C2PA Specifications Fall Short" ([arXiv:2604.24890](https://arxiv.org/abs/2604.24890), posted 27 April 2026) -
reports the first independent security and formal-methods analysis of C2PA's protocols and concludes the current specification fails some of its own claimed security goals,
recommending against relying on C2PA alone for high-stakes journalism, legal evidence, or financial disclosure.
**[UNVERIFIED]**: this is a recent preprint, not yet peer-reviewed,
and should be treated as contested rather than settled.
Independent of that preprint, the uncontroversial point stands:
C2PA attests *origin*, not *truth* -
a cryptographically valid manifest can accompany a false or misleading claim.

## See also

- [Study of Claim and Provenance Standards](../../documents/articles/notes/2026/08/22/2026-08-22-note-on-the-study-of-claim-and-provenance-standards.md) - the fuller study this entry summarizes, including its greenfield gaps
