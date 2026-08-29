---
title: Nanopublication
description: "A named-graph/RDF packaging of a single core scientific assertion plus a two-tier provenance record - the provenance of the assertion and the provenance of the nanopublication as a publication event - defined by Groth, Gibson & Velterop (2010) and identified via Kuhn & Dumontier's cryptographic-hash trusty URIs, a mature scholarly-communication precedent for atomic claim objects that has not been adapted to the modality, evidentiality, and warrant requirements journalistic claims carry."
date-created: 2026-08-22
aliases:
  - nanopub
  - nanopublications
  - trusty URI
defines:
  - nanopublication
  - trusty URI
instance-of: provenance-model
---

A **nanopublication** is the smallest unit of publishable scientific information:
a named-graph/RDF packaging of one core assertion together with two tiers of provenance -
the provenance of the assertion itself (who or what supports it, and how) and the provenance of the nanopublication as a publication event (who published it, and when).
The model comes from Groth, Gibson, and Velterop, "The anatomy of a nanopublication," *Information Services and Use* 30(1-2):51-56 (2010), DOI [10.3233/ISU-2010-0613](https://content.iospress.com/articles/information-services-and-use/isu613), written to address a specific problem in scholarly communication:
as publication volume grows, it becomes harder to find, connect, and attribute the specific core statements buried inside long-form articles.

The identifier layer is supplied separately by Tobias Kuhn and Michel Dumontier's **trusty URIs**:
a URI whose suffix is a cryptographic hash of the artifact it names, giving an immutable, independently verifiable reference with no central registry required ([Kuhn & Dumontier, "Trusty URIs," ESWC 2014, arXiv:1401.5775](https://arxiv.org/abs/1401.5775)).
Trusty URIs are implemented in Kuhn's `nanopub-java` library ([arXiv:1508.04977](https://arxiv.org/pdf/1508.04977)) and served by a decentralized network of nanopublication servers that anyone can join ([nanopub.net guidelines](https://nanopub.net/guidelines/working_draft/)).

The nanopublication's "claim -> provenance -> provenance-of-publication" structure anticipates, by more than a decade,
the "claim -> evidence -> provenance -> ... -> agent-readable endpoint" pipeline that agent-readable news-claim infrastructure proposes.
But the precedent is structural, not deployed for news:
nanopublications package RDF-triple scientific assertions against a formal ontology,
not natural-language journalistic claims carrying attribution, modality ("said," "may," "disputed"), and evidentiality that must survive prose transformation, correction, and republication.
Adapting the nanopublication model and its trusty-URI identifier scheme to those journalistic requirements remains an open problem, not a solved one.

## See also

- [Study of Claim and Provenance Standards](../../documents/articles/notes/2026/08/22/2026-08-22-note-on-the-study-of-claim-and-provenance-standards.md) - the fuller study this entry summarizes, including its greenfield gaps
