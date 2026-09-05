---
title: "Note on the NLnet Language-Fiber Enterprise Pursuit"
description: "The founder's live ratification of pursuing the NLnet NGI application and the wider @lenticule-science/communicating language-fiber enterprise (family-first, Lakota flagship), its theory-to-code grounding, the week's founder-attention plan, identity/community decision-context, and the open preconditions before submission."
date-created: 2026-09-01
type: notes
name: 2026-09-01-note-on-the-nlnet-language-fiber-enterprise-pursuit
authors:
  - emsenn
  - claude-sonnet-5
keywords:
  - nlnet
  - language-fiber
  - lakota-language-algebra
  - communicating
  - lambek
  - curry-howard-lambek
  - language-cone
status: pursuit-ratified-not-submitted
---

## What this document is

The living strategy carrier for the NLnet NGI application and the wider
`@lenticule-science/communicating` language-fiber enterprise it is drawn
from. It exists because the founder ratified pursuing this live, in
session, on 2026-09-01 — a decision made in conversation, not yet
anywhere on disk before this note. It is meant to be read next by
whichever session continues the pursuit: the thesis, the ratification,
where the thesis is grounded in real code and real math already in this
repository, this week's plan, the identity/community discipline that
governs how this is talked about, and what is still open before the
application can actually be submitted. Update this note in place as the
pursuit moves; do not append a transcript.

## The enterprise thesis

`@lenticule-science/communicating` is one shared, language-neutral
morphosyntactic and semantic algebra with five "language fiber" packages
built over it — English, Lakota, Latin, Mandarin, and Toki Pona — so that
a grammar improvement made for one language becomes reusable machinery
for the rest. Two fibers already have real in-house consumers (English:
a transcript-compaction service and linguistics-services-section's own
candidate-reading composer; Mandarin: `@emsenn/language-learning-frontier`'s
vocabulary-calibration loop), which is the evidence this is production
infrastructure and not a research prototype.

Lakota Language Algebra is the family's flagship: the fiber that proves
the shared approach precisely where the field's default technique —
scraping and statistically modeling whatever text exists online — is
both technically weak and ethically fraught, for a language the internet
does not hold enough text on and whose largest existing effort, the
Lakota Language Consortium, has itself faced public criticism over how
it acquired elder-contributed material. The full extraction-harm framing,
the technical comparison against LakotaBERT and the other named peers,
and the drafted answers to NLnet's own application questions are in the
sibling carrier
[2026-08-31 NLnet NGI grant application draft](../../../../08/31/2026-08-31-note-on-nlnet-ngi-grant-application-draft-for-lakota-language-algebra.md);
this note does not restate that content, only the facts the founder
added live on top of it.

## Founder ratification

The founder ratified pursuing this as framed — family-first (the engine
plus all five fibers), Lakota flagship — live in this Claude session on
`bare-cedar-fog`, 2026-09-01 (session `72294c81-5506-4ee1-b7cc-8abdc7e8894f`),
in the founder's own words:

> "I'm sold on pursuing this."

The founder also stated the theory's actual scope, in their own words:

> "we love the idea of language topologies, curry howard lambek language
> lorentzian light cones — this isn't just a lakota thing, ideally."

## Theory-to-code map

The founder's framing is not a metaphor reached for in conversation; it
names structure that is already live in this repository, in two
different layers.

**The engine, as code.** `@lenticule-science/communicating` is
~8,900 lines of TypeScript, seated at
`linguistics-services-section/lib/communicating/src/`. Its Lambek-calculus
proof-carrier module is
`lib/communicating/src/speaking/listening/parsing/lambek.mts` (280 lines):
it reads settled parse forests as typed sequents and records
dependency-licensed proof steps. A separate "holography" projection
module lives at `lib/communicating/src/holography/`. The five fiber
packages sit under `linguistics-services-section/services/`:
`english-language-algebra` (consumed by
`token-compactification-services-section` and by
`linguistics-services-section` itself), `lakota-language-algebra`,
`latin-language-algebra`, `mandarin-language-algebra` (consumed by
`@emsenn/language-learning-frontier`), and `tokipona-language-algebra`.

**The theory, as math already in the corpus.** The founder's own phrase
— "curry howard lambek language lorentzian light cones" — names a real,
live line of work in `obsmetrological-services-section`'s Lean proof
root, not a coinage from this conversation. `Obsmetrologia/Language/Predicating/CurryHowardLambek.lean`
(947 lines) proves the Curry-Howard-Lambek correspondence itself
(`curry_howard`, `curry_howard_lambek`, `chl_quartet_is_nuclear`) and
ties Lambek's cartesian-closed-category semantics directly into the same
proof as Curry-Howard. `Obsmetrologia/CausalSets/Curvature/Lambek.lean`
(228 lines) is the light-cone leg: it reads spacetime curvature through
Lambek bi-residuation over causal sets, proving
`residuals_coincide_iff_commutative` and a discrete Bianchi identity —
the literal Lorentzian-light-cone connection the founder named. The
full asset census for this whole line — live Lean sources, the
repo-coined "Language Cone" term's two lineages, and what is proven
versus still an open obligation (the language-cone coincidence theorem,
`PPA-FR-040`, is stated as open, not proved, in every source that names
it) — is
`math-services-section/content/text/documents/articles/research-articles/curry-howard-lambek-language-cone-proof-pathing-yoneda-inventory.md`.
Grant-funded engineering on the language fibers is downstream applied
work over this proof root, not a separate theory invented for the
application.

## The week's founder-attention plan

The founder stated they will personally work the language app and
related parts through the week of 2026-09-01 — this enterprise has
active founder attention, not only agent momentum. Sessions continuing
this pursuit should expect founder-driven changes to the language
fibers, the app, or this thesis during that window and read this note
fresh before extending it, rather than assuming the state recorded here
is still current without checking.

## Identity and community — decision context, not elaboration

Stated here minimally and exactly as the founder gave it, as
decision-context only:

The founder states they are Lakota, with a complicated enrollment
situation and no tribal membership themselves. They have cousins who
hold membership — Lakota, and Anishinaabe relations as well. Any
community or family involvement in this work, including a possible
Anishinaabemowin fiber, is those relatives' choice to make, initiated by
the founder personally, never by agents or by the application itself.

This is unrelated to, and does not revise, the corpus's separate
Pheží Ocháǧe / tiyóšpaye account
(`561-group-services-section/content/text/glossary/terms/phezi-ochage.md`
and its source note); that account already defers questions of Lakota
language and recorded historical band names to the language's own
knowledge holders, and this note does not add to or resolve that
deferral.

Statements about the founder's identity in the application are the
founder's own to make. No session may add a tribal-affiliation or
heritage statement to the application text on the founder's behalf.

## Open preconditions

None of the following are agent-decidable; they block actual submission,
not this note:

- **License.** `lakota-language-algebra` and all four sibling fibers
  currently declare `"license": "UNLICENSED"`; `@lenticule-science/communicating`
  itself carries no `license` field at all. Apache-2.0 is decided as the
  target for the whole family — the package manifests have not yet been
  changed; that is go-public engineering work, not a documentation
  change.
- **Public repository.** Target is the existing `github.com/lenticule-science`
  org (no org-creation gate remains); the package currently lives only
  inside the private `bare-cedar-fog` monorepo, and the repository URL
  named in `lakota-language-algebra`'s own `package.json` returns
  HTTP 404.
- **Conformance debt riding the go-public push.** `lakota-language-algebra`'s
  own `src/lakota-die.mjs` (lines 14–15) still constructs actor
  identifiers under the rejected `urn:ame:` scheme
  (`const ACTOR = \`urn:ame:${NODE_ID}\`;`, `LMT_ACTOR = "urn:ame:leader-movement-team"`) —
  the coinage the owner explicitly rejected the day the aggressive-repair
  ground premise was ruled (working-discipline). This needs fixing before
  or as part of the public push, not carried into a public repository.
- **NLnet call mechanics.** The call reopens 2026-09-03 with the first
  deadline 2026-11-03; NLnet funds unincorporated individuals, which
  matters because the 561 Group has no legal entity; sampled NLnet
  project pages do not name the individual applicant, only the project
  (observed pattern, not a written policy — see the NLnet draft's
  "Submission notes").
- **HANDS items already named in the NLnet draft** (contact fields,
  day rate, corpus/lexicon provenance, any existing personal or
  community relationships to name) are unchanged by this note and remain
  the founder's to supply.
