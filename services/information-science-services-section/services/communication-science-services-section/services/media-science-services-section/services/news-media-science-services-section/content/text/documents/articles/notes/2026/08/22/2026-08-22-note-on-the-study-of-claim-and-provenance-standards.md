---
title: "Study of Claim and Provenance Standards"
description: "A literature-and-standards study of the agent-readable claim infrastructure proposed in this section's memos finds mature, citable anchors for provenance (W3C PROV-DM/PROV-O, Recommendations of 30 April 2013, resting on Moreau et al.'s 2007-08 Open Provenance Model and Green, Karvounarakis & Tannen's 2007 provenance-semirings database theory), fact-check markup (schema.org ClaimReview, built in 2015 by Duke Reporters' Lab's Bill Adair with Google and schema.org's Dan Brickley), scholarly claim packaging (Groth, Gibson & Velterop's 2010 nanopublication model with Kuhn's trusty-URI infrastructure), media-origin attestation (C2PA 1.0, specified 21 December 2021 and publicly announced 26 January 2022), and identity attestation (W3C Verifiable Credentials 1.0, a Recommendation since 19 November 2019, with 2.0 reaching Recommendation on 15 May 2025) - but finds a multi-valued claim-state ontology, a correction-propagation graph spanning every downstream artifact, a per-object machine-checkable conformance profile, and any working settlement or token layer for claim validation to be genuinely greenfield, the last underscored by Civil's 2018 token-sale failure and 2020 shutdown."
date-created: 2026-08-22
type: notes
name: 2026-08-22-note-on-the-study-of-claim-and-provenance-standards
authors:
  - claude-sonnet-5
status: draft-for-review
keywords: ["claim-infrastructure", "provenance", "w3c-prov", "claimreview", "nanopublication", "c2pa", "content-credentials", "verifiable-credentials", "fact-checking", "conformance", "standards-survey"]
tags: ["draft", "study"]
---


This is a study of the standards and literature behind the agent-readable claim infrastructure this section's memos propose, read for one purpose: to establish, for each component of that infrastructure -
claim states, provenance trails, corrections, attestations, conformance, agent-readable feeds -
which parts already exist as standards or peer-reviewed systems and which are genuinely greenfield,
so that any production work builds on existing foundations rather than reinventing them.
Method: web-verified citations and spec dates, markdown-linked;
any claim this note could not independently confirm is marked **[UNVERIFIED]** inline.
The two memos this study serves are [Agent-Readable Claim Infrastructure](../../../../../../../../../../../../../../../social-science-services-section/services/sociology-science-services-section/services/work-science-services-section/content/text/documents/articles/notes/2026/06/19/2026-06-19-claim-infrastructure-business.md) and [Accountable Agentic Newsrooms](../../../../../../../../../../../../../semiotics-science-services-section/content/text/documents/articles/notes/undated/accountable-agentic-newsrooms.md);
both already gesture at several of the standards below, and this note exists to confirm precisely what those standards do and do not cover, with dates a reader can check.

## 1. W3C PROV family and its database-theory ancestor

**PROV-DM** and **PROV-O** are W3C Recommendations published together on **30 April 2013**, alongside sibling documents PROV-N, PROV-XML, PROV-CONSTRAINTS, PROV-AQ, and PROV-DICTIONARY ([PROV-O](https://www.w3.org/TR/prov-o/), [PROV-DM](https://www.w3.org/TR/prov-dm/)).
PROV-O supplies an OWL2 ontology of entities, activities, agents, and the relations among them (generation, usage, derivation, attribution, delegation) that a claim or a media object passed through editorial hands can be recorded against directly.
Moreau and Groth's companion volume, *Provenance: An Introduction to PROV* (Morgan & Claypool Synthesis Lectures on the Semantic Web, 2013, companion site [provbook.org](https://www.provbook.org/)), is the practitioner-level primer for generating, publishing, and querying PROV records.

PROV did not appear from nothing.
Its direct predecessor is the **Open Provenance Model** (OPM), first described by Moreau, Freire, Futrelle, McGrath, Myers, and Paulson in "The Open Provenance Model: An Overview" (2008) and formalized as OPM v1.1 in *Future Generation Computer Systems* (2010-2011).
The W3C working group's own account notes a load-bearing change between the two:
OPM defined provenance artifacts as strictly immutable, while PROV relaxed this so that PROV entities may be mutable as long as the attributes that matter to a given description stay fixed -
a distinction that matters for any claim object whose text is corrected in place rather than replaced.

Underneath both sits a database-theory result with no direct citation in either memo:
Green, Karvounarakis, and Tannen, "Provenance Semirings," *Proceedings of the 26th ACM SIGMOD-SIGACT-SIGART Symposium on Principles of Database Systems* (PODS 2007), pp. 31-40 ([paper PDF](https://web.cs.ucdavis.edu/~green/papers/pods07.pdf)).
This paper gives provenance a compositional algebraic semantics:
atomic facts are annotated with elements of a commutative semiring, and the annotations propagate through relational-query evaluation,
so that the same formalism can express confidence, cost, or multiplicity of support for a derived fact depending on which semiring is chosen.
This is the anchor that makes "provenance" more than a graph-drawing convention -
it is why a PROV-style derivation graph can, in principle, be given a formal composition semantics rather than only a vocabulary of node and edge types.

What PROV-O does **not** supply, and both source memos say so in their own words, is any notion of whether a claim is true, fair, or legally safe -
PROV-O records *who did what to what, when*, not *whether it should be believed*.
The claim-state layer the memos want (asserted, supported, disputed, superseded, stale, withdrawn) sits entirely outside the PROV vocabulary and is not addressed by any Recommendation found in this study;
it would need to be defined as an extension ontology layered on top of PROV-O, not discovered within it.

## 2. ClaimReview and the fact-check markup ecosystem

**schema.org ClaimReview** was built in **2015**, after a conversation between Google staff and *Washington Post* fact-checker Glenn Kessler;
Bill Adair (director of Duke's Reporters' Lab), Dan Brickley (schema.org), and Justin Kosslyn (Google) developed the tagging system on schema.org's existing vocabulary ([Reporters' Lab](https://reporterslab.org/tag/claimreview/); [The Trusted Web interview with Adair](https://thetrustedweb.org/misinformation-fighting-directory-duke-reporters-lab-bill-adair/)).
ClaimReview is a schema.org `Review` subtype -
"a fact-checking review of claims made ... in some creative work" -
carrying the claim text, the claimant, and a `reviewRating` verdict ([schema.org/ClaimReview](https://schema.org/ClaimReview)).
Google's **Fact Check Tools API** (a `FactCheck Claim Search API`) lets a consumer query ClaimReview-tagged content programmatically,
the same data that surfaces in **Fact Check Explorer** ([developers.google.com](https://developers.google.com/fact-check/tools/api); [Google Search Central ClaimReview docs](https://developers.google.com/search/docs/appearance/structured-data/factcheck)).
A sibling schema, **MediaReview**, was developed in 2020 for fact-checkers to tag manipulated images and video specifically, using a taxonomy originated by the *Washington Post* and refined through an open process funded by Google and Facebook,
with ratings such as "Missing Context," "Edited," and "Satire/Parody" ([Reporters' Lab, "What is MediaReview?"](http://reporterslab.org/2020/06/11/what-is-mediareview/); [schema.org/MediaReview](https://schema.org/MediaReview)).

The documented limit is uptake, not technology.
Duke's Reporters' Lab reports that only about half of the roughly 160 fact-checking organizations it tracks worldwide use ClaimReview,
which limits findability especially for outlets working in underrepresented languages and countries ([Reporters' Lab, "A better ClaimReview"](https://reporterslab.org/2019/04/18/a-better-claimreview-to-grow-a-global-fact-check-database/)).
Platform adoption came in stages -
Bing adopted the markup and Facebook folded it into its own fact-checking pipeline in 2018 -
which reinforced but did not close the adoption gap.
ClaimReview's `reviewRating` is also a single verdict field, not the multi-valued claim-state machine (asserted / supported / disputed / superseded / stale / withdrawn / non-settleable) the claim-infrastructure memo wants;
extending ClaimReview's binary-verdict model into a richer state machine is not something the existing markup does today.

## 3. Fact-verification research: claim detection to real-world claims

Three benchmarks form the research substrate both memos cite, and all three are mature, peer-reviewed, and publicly available.

**ClaimBuster** - Hassan, Arslan, Li, and Tremayne, "Toward Automated Fact-Checking: Detecting Check-worthy Factual Claims by ClaimBuster," KDD 2017 ([ACM DL](https://dl.acm.org/doi/10.1145/3097983.3098131)) -
built a "claim spotter" (a multi-class SVM over bag-of-words, part-of-speech, and entity-type features) that classifies sentences as a factual claim, an unimportant factual claim, or a non-factual claim,
trained on a hand-labeled corpus of US presidential debate transcripts and used to live-cover the 2016 debates.
This is claim *detection*, upstream of verification.

**FEVER** - Thorne, Vlachos, Christodoulopoulos, and Mittal, "FEVER: a Large-scale Dataset for Fact Extraction and VERification," NAACL 2018 ([ACL Anthology N18-1074](https://aclanthology.org/N18-1074/)) -
built 185,445 claims by altering sentences drawn from roughly 50,000 popular Wikipedia introductions, each labeled Supported, Refuted, or NotEnoughInfo by human annotators independent of the source sentence.
The paper's own baseline result is telling:
labeling a claim correctly *together with* correct supporting evidence reached only 31.87% accuracy, against 50.91% when evidence was ignored -
meaning the hard part of the task is finding and using the right evidence, not just guessing the verdict.

**AVeriTeC** - Schlichtkrull, Guo, and Vlachos, "AVeriTeC: A Dataset for Real-world Claim Verification with Evidence from the Web," NeurIPS 2023 ([arXiv:2305.13117](https://arxiv.org/abs/2305.13117); [NeurIPS poster page](https://neurips.cc/virtual/2023/poster/73517)) -
built 4,568 real-world claims drawn from fact-checks by 50 different organizations, each annotated with question-answer evidence pairs and a textual justification,
explicitly designed to avoid FEVER's synthetic-claim weaknesses (context-dependence, evidence insufficiency, temporal leakage), reaching substantial inter-annotator agreement (kappa = 0.619) on verdicts.

None of these three benchmarks tests what the accountable-agentic-newsrooms memo says a newsroom-native benchmark must test:
correction propagation across dependent artifacts, headline-body-claim alignment, protected-source handling, or multi-surface republication after a correction.
That memo's own §15 says as much of FEVER, AVeriTeC, QAGS, and SummaC together.
The dataset-to-newsroom gap is real and is not closed by any benchmark found in this search.

## 4. Nanopublications: a scholarly precedent for atomic claim objects

Groth, Gibson, and Velterop, "The anatomy of a nanopublication," *Information Services and Use* 30(1-2):51-56 (2010), DOI [10.3233/ISU-2010-0613](https://content.iospress.com/articles/information-services-and-use/isu613), defines the nanopublication as a named-graph/RDF packaging of a single core scientific assertion together with (a) the provenance of the assertion itself and (b) the provenance of the nanopublication as a publication event -
a two-tier provenance structure the memos' "claim -> provenance -> license -> agent-readable endpoint" pipeline echoes closely, twelve years before agent-readable news claims were on the table.
Tobias Kuhn and Michel Dumontier's **trusty URIs** supply the identifier layer:
a URI whose suffix is a cryptographic hash of the artifact it names, giving immutable, independently verifiable references without a central registry ([Kuhn & Dumontier, "Trusty URIs," ESWC 2014, arXiv:1401.5775](https://arxiv.org/abs/1401.5775)),
implemented in Kuhn's `nanopub-java` library ([arXiv:1508.04977](https://arxiv.org/pdf/1508.04977)) and served by a decentralized network of nanopublication servers that anyone can join ([nanopub.net guidelines](https://nanopub.net/guidelines/working_draft/)).

The precedent is structural, not deployed for news.
Nanopublications package RDF-triple scientific assertions -
subject-predicate-object statements with a formal ontology behind them -
not natural-language journalistic claims carrying attribution, modality ("said," "may," "disputed"), and evidentiality that must survive every prose transformation.
Adapting the nanopublication model's provenance tiering and trusty-URI identifier scheme to the semantics a news claim needs (warrant state, correction history, source role) is not something the existing nanopublication infrastructure does out of the box;
it is a genuinely open adaptation problem, not a solved one.

## 5. Media provenance: C2PA and Content Credentials against watermarking and truth

**C2PA** (Coalition for Content Provenance and Authenticity) formed in **February 2021** from the merger of two earlier efforts:
Adobe's Content Authenticity Initiative (CAI, launched 2019, built around certifying the origin of authentic content rather than only detecting fakes) and Microsoft/BBC's Project Origin, a news-sector provenance project ([truescreen.io history](https://truescreen.io/articles/c2pa-standard-history-limitations/)).
The **C2PA Technical Specification 1.0** carries a spec date of **21 December 2021** ([spec PDF](https://spec.c2pa.org/specifications/specifications/1.0/specs/_attachments/C2PA_Specification.pdf))
and was publicly announced as "the world's first industry standard for content provenance" on **26 January 2022** ([C2PA press release](https://c2pa.org/c2pa-releases-specification-of-worlds-first-industry-standard-for-content-provenance/)).
**Content Credentials** is CAI's consumer-facing branding for the tamper-evident metadata a C2PA manifest produces -
the label a viewer sees, not a separate technical standard.

C2PA and watermarking solve different problems and the source memo's own bibliography already flags this.
Google's **SynthID** embeds an imperceptible watermark directly in pixel or audio data,
so it survives lossy re-encoding and cropping but carries almost no context beyond "a participating generator produced or edited this file."
C2PA is a cryptographically signed manifest of origin and edit history,
richer in content but broken by a single screenshot, resize, or format conversion.
In May 2026, Google and OpenAI announced combining both layers so that the failure modes cover for each other ([c2paviewer.com](https://c2paviewer.com/articles/openai-google-c2pa-synthid-2026)).

Neither layer establishes truth.
A 2026 preprint - Golaszewski, Krawetz, Sherman, et al., "Verifying Provenance of Digital Media: Why the C2PA Specifications Fall Short" ([arXiv:2604.24890](https://arxiv.org/abs/2604.24890), posted 27 April 2026) -
reports the first independent security and formal-methods analysis of C2PA's protocols and concludes the current specification fails some of its own claimed security goals,
recommending against relying on C2PA alone for high-stakes journalism, legal evidence, or financial disclosure.
**[UNVERIFIED]**: this is a very recent preprint not yet subject to peer review at the time of this note,
and its findings should be treated as contested rather than settled until a reviewed version appears.
Both source memos already make the weaker, uncontroversial version of this point without needing the preprint:
C2PA attests *origin*, not *truth*,
and a cryptographically valid manifest can accompany a false or misleading claim.

## 6. W3C Verifiable Credentials and the attestation component

The **Verifiable Credentials Data Model 1.0** became a W3C Recommendation on **19 November 2019** ([w3.org/TR/2019/REC-vc-data-model-20191119/](https://www.w3.org/TR/2019/REC-vc-data-model-20191119/)).
The **2.0** family -
the data model plus Data Integrity, EdDSA and ECDSA cryptosuites, JOSE/COSE securing, Controlled Identifiers 1.0, and Bitstring Status List 1.0 -
reached Recommendation status on **15 May 2025** ([W3C press release](https://www.w3.org/press-releases/2025/verifiable-credentials-2-0/)).
VC gives an issuer a way to make a cryptographically verifiable, revocable claim about a subject;
paired with decentralized identifiers (DIDs), this maps directly onto the claim-infrastructure memo's "attestations" component -
a validator or conformance registry signing "object O conforms to profile P" or "claim C was corrected at time T" is exactly the shape of action VC was designed for,
and the memo's own bibliography already cites the VC data model for this reason.

What does not exist is a **claim- or conformance-specific VC profile**.
VC is a general credentialing primitive;
nothing in this search produced an existing, adopted VC vocabulary for "this claim object conforms to schema X" or "this correction event is attested by issuer Y."
The Ethereum Attestation Service (EAS), which the claim-infrastructure memo also cites, is a practical attestation registry but is an industry project, not a standards-body output,
and carries no conformance guarantee of its own.
Building the claim/conformance-specific profile on top of VC is greenfield work.

## 7. Trust and conformance signals at the publisher level

Three lineages exist here, at three different levels of formality, and none of them certifies individual claims or media objects the way the memos propose.

**The Trust Project**, founded and led by journalist Sally Lehrman, launched its effort publicly in 2017 with help from more than 75 news organizations, producing eight **Trust Indicators** -
standardized organization- and article-level disclosures (ownership, funding, methods, corrections policy, and more) integrated into the schema.org vocabulary and piloted by Google, Facebook, Bing, and Twitter ([Poynter, 2017](https://www.poynter.org/ethics-trust/2017/trust-project-is-launching-a-major-effort-today-to-help-rebuild-trust-in-the-media/); [thetrustproject.org](https://thetrustproject.org/about/)).

**The Journalism Trust Initiative (JTI)** was announced by Reporters Without Borders (RSF) on 3 April 2018 with the European Broadcasting Union, AFP, and the Global Editors Network as partners,
and developed over the following eighteen months with roughly 130 experts under the CEN-CENELEC standardization process.
The result, **CEN Workshop Agreement CWA 17493**, was published in **December 2019** ([CEN workshop page](https://www.cen.eu/news/workshops/Pages/WS-2019-018.aspx); [CWA 17493 PDF](https://www.cencenelec.eu/media/CEN-CENELEC/CWAs/ICT/cwa17493.pdf)).
It is an eighteen-clause, ISO-style standard for the institutional and process level of news production -
ownership transparency, editorial guidelines, independence, accuracy, and correction policy -
meant to support third-party certification (with France's COFRAC accreditation body in the pilot).
This is the closest existing precedent to a "conformance registry" in the memo's sense,
but it certifies an **organization's process**, not a machine-readable per-claim or per-artifact conformance result.

**NewsGuard** is the commercial analogue:
a 0-100 trust score plus a Green/Red/Satire/Platform rating, assigned by working journalists against nine apolitical criteria (accuracy, corrections, transparency, ownership disclosure, and others), covering more than 35,000 sources,
sold through a web dashboard, API, and enterprise/advertising tier to platforms, advertisers, and AI developers ([NewsGuard reliability ratings](https://www.newsguardtech.com/solutions/news-reliability-ratings/)).
NewsGuard is the existing business closest in shape to the claim-infrastructure memo's "conformance certificate" and "validator service" revenue lines -
it already monetizes structured trust signals to AI companies -
but it rates whole publishers, not individual claim objects.

The **W3C Credible Web Community Group** produced "Credibility Signals" (2018 draft) and "Reviewed Credibility Signals" (2020), plus a final report, "Technological Approaches to Improving Credibility Assessment on the Web" ([credweb.org](https://credweb.org/reviewed-signals-20200220)).
This is explicitly Community Group output -
it carries none of the formal review or Recommendation-track status that PROV-O or the VC Data Model have, and its own site describes the signal catalog as reviewed and "promising" rather than standardized.
It is useful taxonomy, not a citable standard, and the memos should not lean on it as though it were one.

## 8. Cautionary precedent: Civil and the settlement/token layer

**Civil**, a blockchain-journalism platform backed by ConsenSys, attempted a CVL token generation event in September-October 2018 with an $8 million soft cap and a $24 million hard cap;
it raised approximately $1.4 million, about three-quarters of it from ConsenSys itself, and canceled the sale on **16 October 2018**, refunding all buyers ([TechCrunch](https://techcrunch.com/2018/10/16/blockchain-media-startup-civil-is-issuing-full-refunds-to-all-buyers-of-its-cryptocurrency); [Nieman Lab](https://www.niemanlab.org/2018/10/civils-token-sale-has-failed-now-what-refunds-for-one-thing/)).
Civil restructured and continued for another eighteen months, including partnerships with Forbes and AP, but shut down in **June 2020**, with its team absorbed into ConsenSys's decentralized-identity work;
founder Matthew Iles wrote that the company "had not been able to find a path to sustainability," and the Civil Registry and CVL token code were open-sourced but left unmaintained ([CoinDesk](https://www.coindesk.com/markets/2020/06/02/media-startup-civil-shuts-down-team-absorbed-into-decentralized-id-efforts-at-consensys); [Poynter, "R.I.P. Civil"](https://www.poynter.org/business-work/2020/r-i-p-civil-lessons-from-a-failed-startup/)).

Civil is the only real-world precedent this search found for a token-based journalism-infrastructure project at meaningful scale, and it failed at the fundraising stage -
before its validator, dispute, or settlement mechanics were ever tested against adversarial use.
Nothing in the standards landscape surveyed above (VC/DID, EAS) constitutes evidence that a claim-validation token economy works;
both are general-purpose attestation primitives, not settlement markets.
This is consistent with the claim-infrastructure memo's own recommendation to use attestations before tokens and bounties before markets,
and it is the strongest reason to treat any settlement, staking, or protocol-token component as the least-precedented, highest-risk part of the proposed infrastructure.

## 9. Mapping: memo components to existing standards

| Memo component | Existing standard / literature | Status |
|---|---|---|
| Claim states (asserted, disputed, superseded, stale, withdrawn, non-settleable) | None directly; ClaimReview's single `reviewRating` verdict is the closest existing field | **Greenfield** - no multi-valued claim-state vocabulary exists |
| Provenance trails (who did what, when, from what) | W3C PROV-DM/PROV-O (2013), preceded by the Open Provenance Model (2008-11), grounded in provenance semirings (Green, Karvounarakis & Tannen, 2007) | **Mature** - directly reusable |
| Media origin/edit history | C2PA 1.0 (2021/2022); Content Credentials branding; SynthID as a complementary watermark layer | **Mature but explicitly insufficient alone** - attests origin, not truth, and its security properties are under active dispute (arXiv:2604.24890, **[UNVERIFIED]** as unreviewed preprint) |
| Corrections as disclosed policy | Trust Project indicators (corrections disclosure); JTI/CWA 17493 (correction-policy clause) | **Partially covered** - disclosure norm exists at the organization level |
| Corrections as a propagating graph event | None found | **Greenfield** |
| Attestations (issuer-signed claim/conformance events) | W3C Verifiable Credentials 1.0 (2019) / 2.0 (2025); EAS as a non-standards-body registry | **Mature primitive**; no claim- or conformance-specific VC profile exists - **greenfield vocabulary** |
| Conformance / registry, at organization level | Journalism Trust Initiative / CEN CWA 17493 (2019); NewsGuard (commercial, publisher-level) | **Mature precedent, wrong grain** - certifies organizations, not individual claim objects |
| Conformance / registry, at per-claim/per-object level | None found; W3C Credible Web CG's signal catalog is non-normative | **Greenfield** |
| Agent-readable claim/fact-check feeds | schema.org ClaimReview (2015) / MediaReview (2020); Google Fact Check Tools API | **Mature markup and API exist**, but adoption is roughly 50% among tracked fact-checkers and verdict expressiveness is limited |
| Claim detection and verification research substrate | ClaimBuster (2017); FEVER (2018); AVeriTeC (2023) | **Mature benchmarks**; none test correction propagation, headline pragmatics, or newsroom accountability - **dataset-to-newsroom gap remains** |
| Atomic, citable claim-object packaging | Nanopublications (Groth, Gibson & Velterop, 2010) with trusty URIs (Kuhn) | **Mature in scholarly communication**; adapting it to journalistic modality/evidentiality/warrant is **greenfield** |
| Settlement markets, validator staking, correction bonds, protocol tokens | Civil (2018 ICO failure, 2020 shutdown) is the only precedent at scale, and it failed before testing these mechanics | **Greenfield and highest-risk** - no working precedent exists |

## Gaps carried forward

Six things remain genuinely open after this study, and none of them is closed by simply adopting an existing standard:

1. A **multi-valued claim-state ontology** with formal semantics for transitions among asserted, supported, disputed, superseded, stale, withdrawn, and non-settleable - PROV-O and ClaimReview both stop short of this.
2. A **correction-propagation graph** that treats a correction as an event invalidating every downstream artifact (sentence, headline, caption, feed entry, archive record, cached AI summary), with regression tests - no standard or literature surveyed here defines this end to end.
3. A **per-object, machine-checkable conformance profile** - JTI/CWA 17493 and NewsGuard both operate at the publisher level, and the W3C Credible Web Community Group's signal catalog is explicitly non-normative.
4. A **claim- and conformance-specific Verifiable Credentials profile** - VC/DID supply the cryptographic primitive; no adopted vocabulary for claim or conformance attestations was found.
5. Adapting **nanopublication-style atomic claim packaging** to journalistic modality, evidentiality, attribution, and warrant requirements that scholarly assertions do not carry.
6. Any **working settlement, validator-staking, or token market** for claim disputes - Civil remains the only precedent at scale, and it failed at the fundraising stage, before any of these mechanics were tested.

## Verification note

Verified 2026-08-22.
An adversarial pass checked 18 of this note's most load-bearing citations against Crossref, arXiv, W3C, and publisher/press sources directly (PROV-DM/PROV-O's Recommendation date; the Open Provenance Model paper and its FGCS v1.1 formalization; Green, Karvounarakis & Tannen's provenance-semirings paper; ClaimReview's 2015 origin story and the Reporters' Lab adoption figure; MediaReview; ClaimBuster; FEVER, including its 31.87%/50.91% accuracy figures; AVeriTeC, including its kappa=0.619 and claim/organization counts; the nanopublication paper's DOI and journal details; the trusty-URI paper; C2PA's formation, spec date, and announcement date; the Golaszewski et al. C2PA security preprint; VC 1.0 and 2.0's Recommendation dates; Civil's token-sale figures and shutdown; and the JTI/CWA 17493 timeline).
One citation was corrected: the trusty-URI claim in both this note (Section 4) and the [nanopublication glossary term](../../../../../../glossary/terms/nanopublication.md) cited arXiv:1508.04977 (Kuhn's solo-authored `nanopub-java` paper) as the source for Kuhn & Dumontier's trusty-URI design;
the trusty-URI paper itself is arXiv:1401.5775 (Kuhn & Dumontier, ESWC 2014) and has been cited separately from the `nanopub-java` implementation paper in both files.
One citation carries a pre-existing **[UNVERIFIED]** marker that this pass confirmed as warranted rather than removing:
the Golaszewski, Krawetz, Sherman et al. C2PA security preprint (arXiv:2604.24890) is a real, correctly attributed paper, but remains an unreviewed 2026 preprint, so the marker stays.
No other checked citation - author names, years, titles, venues, volume/issue/page numbers, DOIs, or URLs - required correction, and no additional claim was found to need an **[UNVERIFIED]** marker beyond the ones already present in this note and its sibling glossary terms.
