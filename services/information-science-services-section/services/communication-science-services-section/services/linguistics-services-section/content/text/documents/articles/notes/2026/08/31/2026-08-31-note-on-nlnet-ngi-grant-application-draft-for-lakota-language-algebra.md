---
title: "NLnet NGI Zero Grant Application Draft for @lenticule-science/lakota-language-algebra"
description: "A submission-ready DRAFT of an NLnet NGI Zero grant application for the lakota-language-algebra package, mapped against NLnet's actual application-form questions, plus the facts only the founder can supply before it can be submitted."
date-created: 2026-08-31
type: notes
name: 2026-08-31-note-on-nlnet-ngi-grant-application-draft-for-lakota-language-algebra
authors:
  - claude-sonnet-5
keywords:
  - nlnet
  - ngi-zero
  - grant-application
  - lakota-language-algebra
  - lakota
  - open-source-licensing
status: draft-not-submitted
---

## What this document is

A draft grant application for **NLnet's NGI Zero funding line**
(nlnet.nl), targeting the candidate artifact
`@lenticule-science/lakota-language-algebra` (npm, house registry,
version 0.1.4). This is a **draft only** — no submission, account
creation, or contact with NLnet has been made. The founder reviews,
edits, and submits it.

It is organized around NLnet's own application form, fetched live from
nlnet.nl on 2026-08-31 (see "Sources and verification" at the end for
exactly what was fetched and when). Every section below is either a
drafted answer, or a line beginning `HANDS:` naming the exact fact,
personal judgment, or account/submission action only the founder's own
identity or memory can supply — never a vague approval request.

## Call facts, verified live on 2026-08-31

- NLnet's site currently lists two forthcoming programmes, **Restack**
  and **CodeSupply**, both marked "coming soon," replacing the NGI Zero
  Core/Commons funds (NGI Zero Core's eighth and final call closed
  2024-10-01; NGI Zero Commons' final call has also closed). NLnet's own
  2026-06-12 article is titled "Transitioning from NGI to Open Internet
  Stack — open calls temporarily paused."
- NLnet's 2026-08-03 announcement ("NLnet changes deadlines to odd
  months") states plainly: **"NLnet will resume its open calls on
  September 3rd 2026, with the first deadline on November 3rd."** New
  deadlines fall on the third day of every odd month going forward.
- The historical NGI Zero funding range was **"between 5,000 and 50,000
  euro's — with the possibility to scale them up if there is proven
  potential."** No page fetched on 2026-08-31 states a different range
  for the September 2026 reopening; the exact fund name (Core, Commons,
  Open Internet Stack, or something else) that the September 3 call
  reopens under was **not resolved** from the pages fetched.
- Queued, not hands: **re-check nlnet.nl/propose/ in the days before
  submitting** — the programme is mid-transition and the live call name,
  its theme list, and any eligibility text may differ from what a
  September-2026-dated snapshot shows in September or October. Re-fetching
  a public page is ordinary session work; do it just before submission
  rather than waiting on the founder for it.
- Mandatory conditions stated on the application page: release under
  "libre/open licenses," apply "open standards where possible," submit
  in English, and disclose any generative-AI use in writing the
  proposal.

## The application form, question by question

NLnet's application form (fetched from nlnet.nl/propose/ on 2026-08-31)
asks, in this order: a call selector, contact fields (name, email,
phone, organisation, country), proposal name, website/wiki, an
abstract, prior relevant experience, requested amount, a budget-use
explanation, a comparison with existing/historical efforts, expected
technical challenges, an ecosystem/engagement description, attachments,
a generative-AI disclosure (model, dates, prompts, unedited output, with
an optional file upload), a privacy-statement acknowledgment, an
"email me a copy" checkbox, and an optional PGP public key. Each
substantive question is answered below in that order.

### Contact information

HANDS: the founder supplies name, phone, organisation (personal name,
"the 561 Group," or something else), and country, exactly as they want
them to appear on a public NLnet grant record (NLnet publishes
funded-project summaries) — this is personal contact information no
session may invent or select on the founder's behalf. An email address
is on file for this session's user (morgan.sennhauser@gmail.com); HANDS:
the founder confirms which address to use for a funding-body relationship.

### Proposal name

Draft: **"Lakota Language Algebra: an open morphosyntactic engine for
Lakȟótiyapi."**

### Website / wiki

Decided — see "License and public availability" below: publish to a
public repository under the existing `github.com/lenticule-science` org
(the org already exists; no org-creation gate remains). The package's own
`package.json` names `git+https://github.com/emsenn/lakota-language.git`
as its repository, but that URL returns HTTP 404 as of 2026-08-31
(verified live): no public repository exists there. The package currently
lives only inside the private `bare-cedar-fog` monorepo
(`git@github.com:emsenn/bare-cedar-fog.git`, confirmed from the working
tree's own `git remote -v`). NLnet needs a working public URL — either a
real public mirror of this package or an npm listing on a public registry
(the house registry, `registry.561.group`, is not public). Pushing the
public repo is queued go-public engineering work, to be completed before
submission.

### Abstract — "Can you explain the whole project and its expected outcome(s)"

Draft:

> `@lenticule-science/communicating` is a general-purpose,
> language-neutral morphosyntactic and semantic algebra — roughly 8,900
> lines of TypeScript, including a Lambek-calculus proof-carrier module
> (`lambek.mts`, 280 lines) that reads settled parse forests as typed
> sequents and records dependency-licensed proof steps, plus a separate
> "holography" projection module — with five working "language fiber"
> packages built over it: English, Lakota, Latin, Mandarin, and Toki
> Pona. This is production infrastructure, not a research prototype: the
> English fiber already has two in-house consumers (a transcript-
> compaction service and the linguistics section's own candidate-reading
> composer), and the Mandarin fiber powers the generate-then-verify
> vocabulary-calibration loop inside a working language-tutoring
> application, `@emsenn/language-learning-frontier`. Because every fiber
> shares one algebra, a grammar improvement made for one language — a
> new morphology rule, a new attachment schema — becomes reusable
> machinery for the rest.
>
> Lakota Language Algebra is this family's flagship deliverable: the
> fiber that proves the shared approach works precisely where the
> field's default technique — scraping and statistically modeling
> whatever text exists online — is both technically weak and ethically
> fraught, for a language, Lakȟótiyapi (Lakota), a Siouan language of
> the northern Great Plains with roughly 2,000 fluent speakers, most of
> them elders, that the internet simply does not hold enough text on
> (see "compare with existing efforts" and "corpus sourcing," below, on
> the risks of scraping and on the Lakota Language Consortium's own
> public criticism over how it acquired elder-contributed material).
> Lakota Language Algebra is the opposite kind of artifact: a small,
> rule-based, deterministic morphosyntactic engine — not a statistical
> language model — that tokenizes Lakota text, tags words against a
> curated closed-class lexicon and verb-stem list, encodes the
> language's SOV word order and postposed determiner/adjective
> attachment, produces dependency parses, and extracts basic semantic
> role frames (agent, patient, instrument, recipient, location).
>
> The engine currently and honestly does not model Lakota's real person
> morphology: subject and object agreement in Lakota is carried by
> prefixal and infixal verb affixes (wa-/ya-/uŋk-, and more), and the
> current release explicitly leaves that ⊥ (unmodeled) rather than
> faking it with a wrong model. Grant-funded work would close that gap
> — implement real pronominal-affix morphology, resolve the resulting
> subject/object attachment ambiguity, give Lakota postpositions their
> own grammatical schema class instead of reusing a borrowed
> "preposition" slot, and grow the test corpus and documentation to a
> point where the package is a usable building block for other people's
> Lakota-language tools: dictionaries, learning apps, transcription
> pipelines, or a future Universal Dependencies treebank for the
> language (none exists yet).

### Have you been involved with projects or organisations relevant to this project before?

Draft, stated only from what is verifiable on disk:

> The applicant maintains `lakota-language-algebra` as one of five
> language fibers built over 2026 on a shared, ~8,900-line
> morphosyntactic engine (`@lenticule-science/communicating`): fibers
> for English, Lakota, Latin, Mandarin, and Toki Pona, all built and
> tested from scratch. Two of those fibers already have real in-house
> consumers — English's is consumed by a transcript-compaction service
> and by the linguistics section's own candidate-reading composer, and
> Mandarin's is consumed by a working language-tutoring application's
> vocabulary-calibration loop — evidence the underlying engine is
> production infrastructure, not an experiment. None of the family is
> under an open license yet (see "License and public availability,"
> below, for the decided remediation). `lakota-language-algebra`'s own
> test suite currently passes 20/20 (`node --test`, this session's own
> fresh-install run).

HANDS: the founder supplies any other relevant prior experience to name
here — professional linguistics background, prior open-source
contributions elsewhere, or personal/family connection to the language
and its speakers. Nothing beyond the above was found on disk that could
honestly be stated in NLnet's register without overclaiming, and the
identity material that does exist in this repository (see "On stating
identity and mission," below) is personal characterization only the
founder can settle before it goes in front of a funding body.

### Requested amount (EUR) and budget breakdown

Draft task breakdown — days are estimates from the actual, currently
unmodeled work named in the README's own "established limits" section;
**the day-rate and therefore the total is HANDS**: the founder sets their
own compensation rate — this is a money-scope figure no session invents
on the founder's behalf:

| Task | Description | Estimated effort |
|---|---|---|
| 1. Pronominal-affix morphology | Model Lakota's real subject/object person marking as prefixal/infixal verb morphology (wa-/ya-/uŋk- and the fuller paradigm), replacing the current left-positional placeholder | 8–12 days |
| 2. Attachment disambiguation | Use the new agreement morphology to resolve the subject/object collision the README currently documents as unrecovered | 4–6 days |
| 3. Postposition schema | Give postpositions their own grammatical class instead of reusing the borrowed "preposition" slot noted as a known limitation | 3–5 days |
| 4. Corpus growth and test coverage | Expand the curated lexicon and verb-stem list and the test suite beyond the current 20 tests, under a documented, consent-based sourcing process (see "Corpus sourcing" below) | 6–10 days |
| 5. Public release engineering | Apply an open license across the package and its `@lenticule-science/communicating` dependency, publish to a public registry, stand up a public repository, write end-user documentation | 3–5 days |
| 6. Interoperability | Export dependency parses in a Universal Dependencies-compatible format so the work can plug into that broader open ecosystem | 4–6 days |
| **Total** | | **28–44 days** |

HANDS: the founder states the day rate to apply (NLnet's guidance says
"make rates explicit") and any co-funding or in-kind support to
disclose, which determines the final EUR figure requested, within the
programme's historical €5,000–€50,000 band.

### Compare your own project with existing or historical efforts

Draft, built from real, dated research performed 2026-08-31 (see
sources):

> Most comparable efforts, including the peers below, build a single
> language's tooling from scratch. Lakota Language Algebra is instead
> one fiber over a shared, five-language morphosyntactic engine
> (`@lenticule-science/communicating`), so each peer below is a
> language-scoped comparison inside a larger frame, not a like-for-like
> project comparison.
>
> - **LakotaBERT** (Pudasaini et al., arXiv:2503.18212, 2025) is the
>   closest technical peer: a RoBERTa-style transformer pretrained on a
>   ~105,000-sentence Lakota/English/parallel corpus, released under
>   CC BY 4.0. It is a statistical language model — its outputs are not
>   inspectable rules, it needs a sizeable training corpus and GPU
>   compute to reproduce or extend, and it does not itself produce
>   structured dependency parses or semantic role frames. Lakota
>   Language Algebra is the opposite kind of artifact: a small,
>   deterministic, auditable rule set that runs anywhere Node.js runs,
>   with no training step and no opaque weights — the two approaches are
>   complementary, not competing, and a shared open corpus could
>   plausibly serve both.
> - **The Lakota Language Consortium / Language Conservancy**
>   (lakhota.org) is the largest existing Lakota-language effort: the
>   New Lakota Dictionary, curriculum materials, and the Owóksape online
>   learning platform, used by tens of thousands of students since 2004.
>   Its work is pedagogical and lexicographic, not a released,
>   open-source computational grammar library — this project does not
>   compete with it and would be a natural downstream consumer of
>   dictionary data if a compatible open license and data format existed.
> - **NRC Canada's Indigenous Languages Technology (ILT) project** builds
>   speech and text tooling for Canadian Indigenous languages under a
>   comparable open-infrastructure mandate, but does not cover Lakota.
> - **AmericasNLP** (the annual Workshop on NLP for Indigenous Languages
>   of the Americas) is the closest active research community; it has
>   supported Universal Dependencies treebanks for several Americas
>   languages (Apurinã, Western Sierra Puebla Nahuatl, Shipibo-Konibo,
>   St. Lawrence Island Yupik among others), but no Lakota UD treebank
>   currently exists. This project's dependency-parse output is a
>   plausible seed for filling that gap.

### What are significant technical challenges you expect to solve during the project?

Draft, taken directly from the package's own stated, honest limitations
(not invented for the application):

> Lakota's real person-marking system is prefixal/infixal verb
> morphology, not a suffix or word-order rule — the hardest single
> problem, and the one the current release explicitly declines to fake.
> A second, coupled problem is that without that morphology, subject and
> object arguments both resolve by left-attachment and can collide on
> the same nearest nominal; solving the first problem is a precondition
> for solving the second correctly rather than heuristically. A third,
> smaller problem is that postpositions currently occupy a borrowed
> "preposition" slot in the shared cross-language schema, which caps how
> much of the true postpositional relation set can be recovered; this
> needs either a schema extension in the shared
> `@lenticule-science/communicating` engine or a documented Lakota-side
> workaround that does not corrupt the schema for the other five
> language fibers built on it.

### Describe the ecosystem of the project, and how you will engage with relevant actors and promote the outcomes

Draft:

> The engine is deliberately built as one "language fiber" over a
> shared, language-neutral morphosyntactic algebra
> (`@lenticule-science/communicating`) that already has English,
> Mandarin, Toki Pona, and Latin fibers — two of which are already
> consumed by other in-house software rather than sitting unused (a
> transcript-compaction service and the linguistics section's own
> reading composer, for English; a language-tutoring application's
> vocabulary-calibration loop, for Mandarin); a fix made for Lakota's
> agreement morphology (e.g., a real prefixal/infixal affix model)
> becomes reusable machinery for any other polysynthetic or
> agglutinative language added later, and vice versa. The shared-
> algebra design's natural next case is a further Indigenous-language
> fiber such as Anishinaabemowin (also polysynthetic, also carrying real
> community language-preservation stakes) — named here only as a
> roadmap direction; no community engagement, partnership, or
> commitment of any kind exists yet for it, and none is claimed. Planned
> outward engagement: publish the package under an open license on a
> public npm registry; export a Universal Dependencies-compatible parse
> format so the output can be evaluated against and potentially
> contributed to that broader treebank ecosystem; and share the
> released artifact with the AmericasNLP community and with
> LakotaBERT's authors as a complementary, non-statistical resource.

HANDS: the founder states any existing personal relationships with
Lakota speakers, the Lakota Language Consortium, tribal language
programs, or academic groups (AmericasNLP, LakotaBERT's authors) that
would turn "planned engagement" into "existing engagement" — nothing of
that kind was found on disk, and NLnet reviewers weight demonstrated
community connections heavily for a project in this space.

### Corpus sourcing (feeds the ethics/attachments discussion, not a form field)

HANDS: the current lexicon and verb-stem list in
`src/bundle.mjs` has no cited source in the package itself (no
bibliography, no named dictionary or speaker consultant) — only the
founder, as the package's original author, holds this fact. Before this
application states how the corpus will grow, the founder states where
the existing ~40 lexical items came from and what consent or licensing
process will govern new additions —
Lakota-language data sourcing carries real, documented community
sensitivity (the Lakota Language Consortium has itself faced public
criticism over how it acquired and licensed elder-contributed
material). This is exactly the kind of fact NLnet's own "compare with
existing efforts" and "ecosystem engagement" questions are designed to
surface, and it should not be glossed over in the final submission.

### Attachments

Draft: none strictly required. Optional candidates the founder could
attach: the package's own `README.md`, the verbatim `node --test`
output (20/20 passing, this session), or a short architecture note on
`@lenticule-science/communicating`.

### Generative AI disclosure

NLnet's form requires naming the model, what it was used for, prompt
dates, the prompts themselves, and the unedited output, as a text field
or file upload. Draft disclosure text:

> Generative AI (Anthropic's Claude, "claude-sonnet-5," accessed via
> Claude Code) was used on 2026-08-31 to research NLnet's current
> application-form questions and public-project-naming conventions,
> verify the candidate package family's test suites, source code, and
> license status, research comparable open-source and academic
> Lakota-language projects, and draft this application's prose from
> those verified facts. All drafted prose was reviewed and edited by
> the applicant before submission.

Queued, not hands: NLnet asks for the actual prompts and unedited
output, not just a summary. This session's full transcript is
recoverable from `~/.claude/projects/-home-emsenn-info/*.jsonl` per this
repository's own session-bootstrap convention; extracting and attaching
the relevant portion is ordinary session work (per mine-transcripts) —
do it before submission rather than fabricating a prompt log or waiting
on the founder to do it by hand.

### Privacy statement, "send me a copy," PGP key

HANDS — these are the founder's own account and contact preferences at
submission time (part of the submission act itself); nothing to draft.

## License and public availability — the actual blocker

Verified directly from the package manifests (not from documentation
or memory), 2026-08-31:

- `@lenticule-science/lakota-language-algebra`'s `package.json` declares
  `"license": "UNLICENSED"` — in npm's convention this means **no
  license is granted**, i.e. all rights reserved by default, the
  opposite of open source. The other four sibling fibers
  (`english-language-algebra`, `latin-language-algebra`,
  `mandarin-language-algebra`, `tokipona-language-algebra`) declare the
  identical `"license": "UNLICENSED"`, verified directly from each
  fiber's own `package.json` — this is a family-wide precondition, not
  a Lakota-specific gap.
- The shared engine they all depend on, `@lenticule-science/communicating`
  (installed at v0.0.4), has **no `license` field at all** in its own
  `package.json` — same effect, and the harder blocker: an open license
  on `lakota-language-algebra` alone does not make the code it actually
  runs on open.
- The public repository named in the package manifest
  (`github.com/emsenn/lakota-language`) returns HTTP 404 as of
  2026-08-31; the actual git history lives only inside the private
  `bare-cedar-fog` monorepo.

NLnet's mandatory condition is release "under libre/open licenses."
**None of this is submission-ready as-is.** Decided before this draft
becomes a real application:

1. License decided: **Apache-2.0** — the house's most common choice
   elsewhere in the tree, applied here to `lakota-language-algebra` and
   to `@lenticule-science/communicating` (and ideally the sibling
   language fibers, for ecosystem consistency). This decision covers this
   draft's text only; the actual `package.json` `license` fields ship
   with the go-public work, not edited in this sweep.
2. Public repository: decided — push under the existing
   `github.com/lenticule-science` org (queued go-public engineering
   work, no org-creation gate remains) so the "Website/wiki" field has
   something to point at.
3. Lexicon data provenance (see "Corpus sourcing" above) is HANDS: only
   the founder holds the fact of where the existing lexicon came from,
   since an open license on the code does not by itself resolve
   open-data provenance questions for the Lakota-language content it
   ships.

## On stating identity and mission

The task that produced this draft asked for the project's mission to be
stated "in NLnet's own register," including the applicant's own
relationship to the Lakota language. What is actually on disk, read
directly rather than assumed: this repository's root note
(`561-group-services-section/content/text/glossary/terms/phezi-ochage.md`
and its dated source,
`561-group-services-section/content/text/documents/articles/notes/2026/08/21/2026-08-21-note-on-phezi-ochage.md`)
states that **emsenn** (this repository's owner) heads a small,
described-as-real tiyóšpaye (kinship band) that the note names **Pheží
Ocháǧe**, and that "the band is Lakota." Pheží Ocháǧe is **the band
itself, not a person's name** — it is not a "band leader" in the sense
of an individual's name, and the 561 Group is described in that same
corpus as the corporate structure the band's work is conducted through,
not the band itself.

This draft leaves the applicant's identity out of the application text
above, for two reasons stated
plainly rather than smoothed over: (1) NLnet's actual form, as fetched,
does not ask about the applicant's ethnicity or tribal affiliation at
all — the abstract and prior-experience answers above are complete
without it; and (2) the source note itself explicitly defers "the
relation of Pheží Ocháǧe to the recorded band names of Lakota history"
to "the language's and the tradition's own knowledge holders."
HANDS: the founder decides whether and how to characterize this
personally in the application (for instance in the free-text
prior-experience field), and, separately, whether the corpus's account
of Pheží Ocháǧe is something the founder wants stated to an external
funding body at all. This is personal/identity characterization no
session may settle on the founder's behalf.

## Submission notes

- **Does NLnet's public funded-project page name the individual
  applicant, or only the project?** Checked live on 2026-08-31 against
  three sampled pages: the project index at `nlnet.nl/project/`, and
  two individual project pages, `nlnet.nl/project/Seppo/` (an NGI0
  Entrust-funded project) and `nlnet.nl/project/GoatCounter/` (a
  known solo-developer project, NGI0 PET-funded). Neither individual
  page names the applicant or developer: each shows only the project
  name, a short description, and the funding programme/period, with no
  "by [name]" line or contact/team listing on the project page itself;
  the index page's only "people"-shaped links are generic site
  navigation (`People`, `Contact`), not per-project attribution. This
  is an observed pattern from a small, non-exhaustive sample (one
  large well-known project, one known solo-developer project), not a
  written NLnet policy statement found on any fetched page — treat it
  as a reasonable expectation of privacy for the "Contact information"
  section's HANDS decision, not a guarantee, and re-check the specific
  accepted-project page's actual content once (if) this project is
  funded and published.

## Verification performed this session (2026-08-31)

- **Tests**: from a clean `npm install` against the live house registry
  (`registry.561.group`, mirrored through the local Verdaccio at
  `127.0.0.1:4873`, both confirmed reachable, HTTP 200), `npm test` in
  `lakota-language-algebra` ran `node --test test/*.test.mjs
  src/*.test.mts` and reported:
  ```
  ℹ tests 20
  ℹ suites 0
  ℹ pass 20
  ℹ fail 0
  ℹ cancelled 0
  ℹ skipped 0
  ℹ todo 0
  ```
  (Before `npm install`, the same command failed all 4 test files with
  `ERR_MODULE_NOT_FOUND` — the dependencies simply were not installed
  yet; this is a normal fresh-checkout state, not a defect in the
  package.)
- **License**: read directly from `package.json` at
  `linguistics-services-section/services/lakota-language-algebra/package.json`
  (`"license": "UNLICENSED"`) and from the installed
  `@lenticule-science/communicating/package.json` (no `license` key
  present); confirmed the same `"license": "UNLICENSED"` in the
  `package.json` of each sibling fiber
  (`english-language-algebra`, `latin-language-algebra`,
  `mandarin-language-algebra`, `tokipona-language-algebra`).
- **The family framing**: read directly from the tree, not assumed —
  `@lenticule-science/communicating`'s own `src/` totals 8,879 lines of
  `.mts`/`.mjs` across its morphosyntactic algebra, parsing (including
  `speaking/listening/parsing/lambek.mts`, 280 lines), understanding,
  and holography (`src/holography/`) modules; each of the five fibers'
  own `package.json` `description` confirms it is "this language's
  fiber over `@lenticule-science/communicating`'s language-engine
  algebra"; `@red-cup-engineering/token-compactification-services-section`'s
  and `@lenticule-science/linguistics-services-section`'s own
  `package.json` files both declare a dependency on
  `@lenticule-science/english-language-algebra`; and
  `@emsenn/language-learning-frontier`'s `package.json` `description`
  states its `verifyPassage()` re-tags candidate passages "through
  `@lenticule-science/mandarin-language-algebra`'s real tokenizer."
- **NLnet call and form content**: fetched live from `https://nlnet.nl`,
  `https://nlnet.nl/propose/`, `https://nlnet.nl/NGI0/`,
  `https://nlnet.nl/core/`, `https://nlnet.nl/news/`, and
  `https://nlnet.nl/news/2026/20260803-phaseshift.html` on 2026-08-31.
- **Comparable projects**: web-searched 2026-08-31 for LakotaBERT
  (arXiv:2503.18212), the Lakota Language Consortium (lakhota.org), NRC
  Canada's Indigenous Languages Technology project, and AmericasNLP /
  Universal Dependencies coverage of Americas indigenous languages.
- **Public repository check**: `https://github.com/emsenn/lakota-language`
  returned HTTP 404 when fetched live on 2026-08-31.
- **NLnet public-naming pattern**: fetched live on 2026-08-31 — see
  "Submission notes," above, for the pages checked and what they show.
- **Prior internal record**: the funding lead itself was first surfaced
  in `561-group-services-section/content/text/documents/articles/notes/2026/08/27/2026-08-27-note-on-possible-561-group-operations.md`
  ("Funding prospects" section), which this draft cross-checked and
  found still accurate on the call-opening and deadline dates, and
  corrected on the fund-name-in-transition point.
