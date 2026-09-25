---
name: ClaimReview
description: "A schema.org Review subtype built in 2015 by Duke Reporters' Lab's Bill Adair with Google and schema.org's Dan Brickley for fact-checkers to mark up a claim, its claimant, and a verdict so that platforms like Google's Fact Check Explorer can surface it, adopted by roughly half of the fact-checking organizations Duke tracks worldwide and carrying only a single verdict field rather than a multi-valued claim-state model."
date-created: 2026-08-22
aliases:
  - ClaimReview markup
  - schema.org ClaimReview
  - fact-check markup
instance-of: schema-org-type
---

**ClaimReview** is a [schema.org](https://schema.org/) `Review` subtype -
"a fact-checking review of claims made ... in some creative work" -
that a publisher attaches to a fact-check article so that search engines and other platforms can find, parse, and surface it.
It was built in 2015 after a conversation between Google staff and *Washington Post* fact-checker Glenn Kessler;
Bill Adair, director of Duke's Reporters' Lab, was brought in to develop a tagging system with Dan Brickley of schema.org and Justin Kosslyn of Google ([Reporters' Lab](https://reporterslab.org/tag/claimreview/); [The Trusted Web, interview with Adair](https://thetrustedweb.org/misinformation-fighting-directory-duke-reporters-lab-bill-adair/)).
A ClaimReview record carries the claim text, the claimant, and a `reviewRating` verdict ([schema.org/ClaimReview](https://schema.org/ClaimReview));
Google's Fact Check Tools API and Fact Check Explorer are built directly on this markup ([developers.google.com](https://developers.google.com/fact-check/tools/api)).
A sibling schema, **MediaReview**, was developed in 2020 for tagging manipulated images and video specifically,
using a taxonomy originated by the *Washington Post* and funded jointly by Google and Facebook ([Reporters' Lab, "What is MediaReview?"](http://reporterslab.org/2020/06/11/what-is-mediareview/)).

Adoption remains partial:
Duke's Reporters' Lab reports that only about half of the roughly 160 fact-checking organizations it tracks worldwide use ClaimReview,
which limits findability especially for outlets working in underrepresented languages and countries ([Reporters' Lab, "A better ClaimReview"](https://reporterslab.org/2019/04/18/a-better-claimreview-to-grow-a-global-fact-check-database/)).
Bing adopted the markup and Facebook folded it into its own fact-checking pipeline in 2018, reinforcing but not closing that gap.
ClaimReview's `reviewRating` is also a single verdict field, not a state machine:
it does not distinguish asserted, disputed, superseded, stale, or withdrawn claims the way a richer claim-state ontology would,
a limit relevant to any project proposing agent-readable claim states built on top of it.

## See also

- [Study of Claim and Provenance Standards](../../documents/articles/notes/2026/08/22/2026-08-22-note-on-the-study-of-claim-and-provenance-standards.md) - the fuller study this entry summarizes, including its greenfield gaps
