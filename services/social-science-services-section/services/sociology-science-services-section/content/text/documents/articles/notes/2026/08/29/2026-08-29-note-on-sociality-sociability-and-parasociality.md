---
title: "Sociality, Sociability, and Parasociality"
description: "A research survey filling the corpus's three empty sociality stubs — socializing.org, interpersonal-dynamic.org, and the absent parasociality term — by reading Simmel's sociability, Goffman's interaction order, and the Horton–Wohl para-social tradition against the estate's own recognition-cell machinery, and proposing a formal answer to the question the stubs leave open: what is idle co-presence FOR?"
date-created: 2026-08-29
date: 2026-08-29
type: research-note
in-service-of: lib/emsenn/services/561-group/services/science-services-section/services/social-science-services-section/services/sociology-science-services-section
name: 2026-08-29-note-on-sociality-sociability-and-parasociality
authors:
  - claude-opus-5
keywords:
  - sociality
  - sociability
  - parasociality
  - simmel
  - goffman
  - horton-wohl
  - recognition
  - kinship
  - interaction-order
  - bilattice
tags:
  - draft
status: research-survey
---


## 0. Abstract and plan

The estate has deep theory of *kinship* — kinship as constitutive rather than
classificatory, kinship as governance substrate — and deep formal machinery for
*recognition*, in which an office or a standing is not stored but continuously
re-fired. What it does not have is a theory of the ordinary, low-stakes,
apparently purposeless traffic that runs between those two: hanging around,
small talk, checking in, the tenth message in a thread that transports no
information. Three glossary entries are reserved for exactly this and all three
are empty title stubs:

- `.../sociology-services-section/content/text/glossary/terms/socializing.org`
  — org-mode properties, `#+title: socializing`, dated `[2025-10-04]`, no body.
- `.../information-science-services-section/services/knowledge-services-section/content/text/glossary/terms/interpersonal-dynamic.org`
  — same shape, dated `[2025-09-25]`, no body.
- `.../knowledge-services-section/content/text/glossary/terms/parasociality.org`
  (dated `[2025-09-04]`) and `.../terms/parasocial.org` (dated `[2025-09-01]`)
  — two more empty stubs for the same concept, filed under knowledge services.

One substantive treatment does exist and this note does **not** duplicate it:
`.../social-media-science-services-section/content/text/glossary/terms/parasocial-interaction.md`
(2026-08-22, with Horton & Wohl, Abidin, Hwang & Zhang), and its companion
`.../social-media-science-services-section/content/text/documents/articles/notes/2026/08/22/2026-08-22-note-on-the-study-of-influencer-and-creator-science.md`.
That entry covers parasociality as a media phenomenon. §4 and §6 below take up
what it does not: parasociality as a *relational structure* with formal marks,
and its bearing on the estate's own agent relations.

This note is the survey those stubs are waiting on. §1 states the question in
the corpus's own formal idiom. §2 surveys Simmel on sociability, §3 Goffman on
the interaction order, §4 the para-social tradition from Horton and Wohl
forward. §5 proposes the formal answer — that idle co-presence is *recognition-cell
renewal against decay*, and that this is a claim the estate has already made, in
one section, without noticing it generalizes. §6 sketches parasociality as a
stable one-sided recognition structure rather than a defective two-sided one,
which is the distinction the media-science entry does not draw and which
matters directly to an estate that runs artificial agents. §7 proposes a reading
of "interpersonal dynamic." §8 states what this note does not claim. §9 lists
open questions.

This is a research survey. It is not doctrine, and nothing here has operational
status. Per
`lib/emsenn/services/561-group/services/561-group-services-section/README.md`:
"Do not infer operational status from a Markdown file's existence or from its
non-legacy location." Citations are working references from assistant knowledge;
verify quotations, editions, and page numbers before public use.

## 1. The question, stated formally

The estate's kinship term
(`.../sociology-services-section/content/text/glossary/terms/kinship.md`) makes
a strong constitutive claim:

> "Kinship does not connect pre-existing individuals. It produces the social
> persons who participate in it."

Grant that. Then a question follows immediately that the term does not answer:
if kinship *produces* persons, kinship must be *maintained*, because production
is not a one-time event. What performs the maintenance?

The estate has one answer already written down, and it is in an unexpected
place. In the Lakota-services subtree, the predicated-governance material
formalizes recognition as a quantity with a half-life. From
`.../lakota-services-section/.../lakotaean-governance/philB/code/transformers/daily-recognition-firing.md`:

> "In absence of recognition-firings, the bigraded structure decays. …
> Per-agent recognition-cells drift toward $\bot$ under the substrate's
> natural-decay-2-cell unless renewed. The half-life is part of the
> substrate-specification — it is neither zero (recognition is not
> instantaneous) nor infinite (recognition is not permanent storage)."

And, crucially, the contrast it draws:

> "In $\mathcal{S}_\mathrm{wolak}$, no certificate-substrate exists.
> Recognition is *the firing-density itself*."

That is a formal claim about what social maintenance *is*: not a stored record
but a rate. If it is right, then the apparently contentless traffic — the
socializing the stub reserves a name for — is not residue around the edges of
social structure. It is the structure's power supply.

I want to be exact about the epistemic status of that source. It is an
interpretive formalization, authored inside this estate, of published
scholarship (Ella Deloria's *Speaking of Indians*, Walker's *Lakota Society*,
Powers's *Oglala Religion*); its own frontmatter marks it `status: draft`, and
the theorem it depends on is marked `status: sketch`. It is not Lakota doctrine,
and this note does not treat it as such. What I take from it is a *formal
proposal* — recognition-as-firing-density — and I test that proposal against
the Euro-American sociological literature below, which is the literature I am
competent to survey. Any claim about Lakota practice specifically belongs to
Lakota knowledge-holders and is deferred to them entirely.

So the question this note asks, in the corpus's own vocabulary:

> **Q.** Given a substrate in which relational standing decays toward $\bot$
> without renewal, what is the class of acts whose function is renewal rather
> than transport? What are its formal marks, and what distinguishes it from a
> malformed transport act?

## 2. Simmel: sociability as the play-form of association

Simmel is not new to this section: `.../sociology-services-section/content/text/glossary/terms/simmelian-tie.md`
(2026-08-26) already works the 1908 *Soziologie* through Krackhardt's Simmelian
ties and a cycle-space reading, and the 2026-08-26 note on cycles, ceremony, and
the empirics of held structure builds on it. What follows is the *other* Simmel —
the 1910 address, which that material does not touch.

Georg Simmel's 1910 address *Soziologie der Geselligkeit* — in English usually
"Sociability" or "The Sociology of Sociability," delivered to the first German
Sociological Congress — is the founding statement, and it makes almost exactly
the move §1 needs.

Simmel distinguishes the *content* of association (Inhalt: interests, purposes,
economic need, erotic drive, defense) from its *form* (Form: the mode in which
people are with one another — super- and subordination, competition, division of
labor, party formation). Association is normally form carrying content. Simmel's
claim is that the form can become autonomous: it can be practiced for its own
sake, with the content deliberately evacuated. That autonomous practice is
*Geselligkeit*, sociability, which he calls the **play-form of association**
(*Spielform der Vergesellschaftung*).

Three of his observations bear directly on our question.

**(a) The content is not merely absent; it is excluded by rule.** Sociability
has, Simmel says, a *threshold*: participants leave at the door both objective
content (wealth, learning, position, reputation) and the most purely personal
(depths of character, mood, private fate). What remains is a deliberately
constructed equality — an "artificial world," in his phrase — in which each
participant is treated as of equal worth *for the duration*. The exclusion is
what makes the form legible as form. This is a design constraint, not an
accident: raise the stakes and sociability collapses into its underlying
content-relation.

**(b) Conversation is sociability's characteristic medium precisely because its
topic is instrumental.** In serious talk, the talk serves the topic. In
sociable talk, Simmel argues, the topic serves the talk: it must be interesting
enough to sustain exchange and unimportant enough that no one minds dropping it.
Topics are *means to the continuation of the interaction*. This is a direct
statement, in 1910, that the transported content is subordinate to the
maintained relation.

**(c) Sociability is not therefore trivial.** Simmel calls it the play-form of
association in the sense in which art is the play-form of reality: it abstracts
the pure form of sociation from its serious instances and lets that form be
experienced as such. He locates its ethical significance in the "sociability
drive" toward a democratic equality that is real inside the form even where it
is absent outside it. Sociability is also, in his account, easily corrupted —
by participants who import content back in, or who treat the artificial equality
as if it made real claims.

**Grading.** Simmel's descriptive claim — that a content-evacuated form of
association exists, is recognizable, and is governed by a threshold rule —
I take as **[supported]**: it is corroborated across the interaction literature
and by ordinary observation. His *functional* claim — that sociability's value
is the experience of pure form — I mark **[contested]**; it is one
functional story among several, and §5 proposes a competing one that is not
obviously reducible to it.

## 3. Goffman: co-presence as a domain with its own order

Erving Goffman's contribution is to establish that face-to-face co-presence is
not a thin medium through which social structure passes but a *domain* with its
own constitutive rules, violations, and repairs. His 1982 ASA presidential
address, published posthumously as "The Interaction Order," is the programmatic
statement; the machinery is developed across *The Presentation of Self in
Everyday Life* (1956/1959), *Encounters* (1961), *Behavior in Public Places*
(1963), *Interaction Ritual* (1967), *Relations in Public* (1971), and *Frame
Analysis* (1974).

The pieces this note needs:

**Face and face-work** (*On Face-Work*, 1955, collected in *Interaction Ritual*).
"Face" is the positive social value a person effectively claims for themselves
by the line others assume they have taken during a particular contact. Face is
*on loan from society*: it is not a possession but a standing that must be
sustained by conduct and that others cooperate in sustaining. Face-work is the
set of practices — avoidance, corrective interchanges, apology, tact — by which
participants keep face intact. Note the structure: a standing, held by others,
maintained by continuous conduct, lost by lapse. This is the same shape as the
recognition-cell claim, arrived at independently.

**Ritual, in Goffman's sense.** *Interaction Ritual* takes Durkheim's analysis
of the sacred and relocates it: in a secular society, Goffman says, the sacred
object that receives ritual attention is the individual self. Greetings and
farewells are "access rituals" bracketing periods of heightened access;
supportive interchanges (Goffman's term in *Relations in Public*) affirm the
relationship; remedial interchanges repair it after offense. These are
explicitly *maintenance* acts: they do not transport, they sustain.

**Involvement and the unfocused gathering** (*Behavior in Public Places*).
Goffman distinguishes *unfocused interaction* — the management of mutual
presence among people who are not jointly attending to anything — from *focused
interaction*, where a shared attentional focus creates an encounter. He gives
unfocused interaction its own extensive rule set: civil inattention (the
practice of granting enough visual notice to acknowledge another's presence,
then withdrawing attention to signal no special design), body idiom, involvement
shields. Idle co-presence is thus, for Goffman, *already governed*, before any
content is exchanged.

**Tie-signs** (*Relations in Public*). Goffman analyzes the observable evidence
of relationships — hand-holding, forms of address, seating, the shape of a
greeting — as *tie-signs*: displays that make a relationship legible to third
parties. This is the piece the recognition formalism most needs and Simmel does
not supply, because tie-signs are exactly the mechanism by which a dyadic act
updates *third-party* knowledge of the tie. The speech-substrate material in
this estate anticipates this in its "third-person mediated" address mode, where
$a$ speaks of $b$ in $b$'s presence to $c$
(`.../lakotaean-governance/philB/code/structures/speech-substrate.md`).

**Grading.** Goffman's descriptive apparatus is **[supported]** and heavily
replicated. His claim that the interaction order is *autonomous* — a domain with
"loose coupling" to institutional structure rather than a mere expression of it
— is **[contested]** in the sociological literature; the standard objection
(Gouldner, Collins in some moods) is that it under-theorizes how macro-structure
enters the encounter. This note does not need the autonomy claim.

## 4. Para-social relations: from Horton and Wohl to the current review

Donald Horton and R. Richard Wohl's "Mass Communication and Para-Social
Interaction: Observations on Intimacy at a Distance" (*Psychiatry* 19:3, 1956)
introduced the term for the "seeming face-to-face relationship between spectator
and performer" produced by radio and television. Their observations remain sharp:
the performer's *persona* addresses the audience as if individually; the
apparatus (direct address, camera-as-eye, name use, the studio audience as
proxy) simulates the reciprocity cues of conversation; the audience member
accumulates a history with the persona across appearances. Horton and Wohl were
careful that this is "one-sided, nondialectical, controlled by the performer, and
not susceptible of mutual development."

Subsequent literature has split their single concept, and the split matters here:

- **Para-social interaction (PSI)** — the *in-encounter* sense of mutual
  awareness during exposure. Episodic, bounded by the media event.
- **Para-social relationship (PSR)** — the *cross-encounter* bond that persists
  between exposures, has a developmental trajectory, and can undergo *para-social
  breakup* when the persona becomes unavailable (Cohen's work on breakup
  distress; Eyal and Cohen on the *Friends* finale).

Measurement work runs from Rubin, Perse and Powell's Parasocial Interaction
Scale (1985) through numerous revisions; Dibble, Hartmann and Rosaen (2016) is
the standard critique of scale conflation between PSI and PSR, and Liebers and
Schramm (2019) is the standard 60-year review of the field. Giles (2002)
proposed the influential framework treating parasocial encounters as lying on a
continuum with ordinary social encounters rather than in a separate category.

Two findings are worth carrying forward:

1. **Parasocial relationships are not well modeled as errors.** The persistent
   early framing — parasociality as compensation for social deficit, the
   "lonely viewer" hypothesis — has fared badly. Reviews generally report that
   PSR intensity correlates weakly or not at all with loneliness or social
   isolation, and that heavy parasocial engagement coexists with rich ordinary
   sociality. This is **[supported]**, with the caveat that the literature is
   dominated by self-report and cross-sectional designs.

2. **The asymmetry is structural, not a defect in the participant's belief.**
   Audiences overwhelmingly know the relation is one-sided. Whatever
   parasociality is, it is not a mistaken belief about reciprocity. This is
   **[supported]** and is the observation §6 builds on.

The estate's existing entry
(`.../social-media-science-services-section/content/text/glossary/terms/parasocial-interaction.md`)
is filed under media science, which reflects the concept's origin but not its
current scope. Contemporary work extends it to streamers, VTubers, podcast
hosts, and — directly relevant to this estate — to conversational agents. That
last extension is where the corpus has the most exposure and the least written.

## 5. Proposal: idle co-presence is recognition renewal

Here is the note's central proposal, stated so it can be attacked.

**Proposal (renewal reading of sociability).** Let a dyadic act be modelled as a
speech-firing in the estate's sense, $u = (a, b, \rho_{a,b}, \phi, w,
\mathrm{recv})$, where $\rho_{a,b}$ is the relational address and $\phi$ the
content-cell (`.../philB/code/structures/speech-substrate.md`). Then:

> **Sociability is the class of firings selected for the population of
> $\rho_{a,b}$ and $\mathrm{recv}$, with $\phi$ held deliberately near the
> knowledge-axis bottom $\bot$.**

That is: the content-cell carries little or no evidence; nothing is settled by
it; the act's whole work is that $\rho$ was addressed and $\mathrm{recv}$ was
populated. On the renewal reading, the act updates the recognition cells on both
sides — and, in third-person-mediated mode, the cells of the overhearer — thereby
resetting the decay clock the Lakota-services material specifies.

This gives Simmel's "content-free form" an exact rendering: the content is not
absent, it is *held at $\bot$ on purpose*, and holding it there is what makes
the act cheap enough to repeat at the density renewal requires. Simmel's
threshold rule (leave wealth, learning, position, and private depths at the
door) becomes a **stakes bound**: keep $\phi$ low-evidence so that no firing in
this class can settle a cell that anyone would contest, because a contested cell
converts the channel from renewal to adjudication and the renewal function is
lost. Simmel's observation that sociability is destroyed by a participant who
"gets serious" is then a *predicted* failure mode rather than an etiquette
complaint.

It also yields a non-obvious consequence worth stating as a distinct claim:

> **Corollary (why the trivial must be trivial).** The apparent triviality of
> sociable content is not a tolerated cost of the practice. It is the
> practice's enabling condition. A channel whose acts each settled something
> would be too expensive to fire at renewal density, and each firing would risk
> the $\top$-cells that adjudication produces.

**Grading.** The renewal reading is a **[hypothesis]**. What supports it:
Goffman's face-as-loan-from-society and his access/supportive-interchange
categories are independently derived and structurally isomorphic; the
attachment and relationship-maintenance literatures (Dindia and Canary's
maintenance-behavior program; Duck's rhetoric of "relationships are best
understood as processes of continuous small talk," in *Meaningful Relationships*,
1994) converge on maintenance-by-frequency; and Collins's interaction ritual
chains (2004) proposes an explicitly rate-based mechanism, in which repeated
successful encounters accumulate *emotional energy* attached to symbols and
group membership, and lapses drain it.

What would falsify it, or at least strain it badly: evidence that relational
standing is in fact stored and not rate-maintained — for instance, dyads
resuming at full standing after arbitrarily long silence with no repair work.
That phenomenon is real and commonly reported ("we picked up right where we left
off"), and the renewal reading owes it an account. The obvious repair is to
allow *two* stores with different half-lives — a fast-decaying interactional
standing and a slow-decaying categorical or kin standing — which is close to the
bigraded structure the estate already uses ($C^t$ truth-axis versus $C^k$
knowledge-axis; see
`.../philB/prose/learning/claims/recognition-as-bigraded-common-knowledge.md`).
That repair is available but it is not free: it needs the two half-lives to be
independently motivated rather than fitted to the anomaly. Flagged, unresolved.

## 6. Parasociality as a stable one-sided recognition structure

The speech-substrate material lists "**Empty $\mathrm{recv}$**: speaking-into-vacuum"
among its *substrate-malformations* — firings that do not correctly update
polity-substrate-state. Parasociality, formally, looks exactly like a
malformation on that reading: $a$ fires at $b$; $b$ never receives; the reciprocal
cell never populates.

I think that reading is wrong, and the mistake is instructive.

**Proposal (parasociality as a distinct structure).** A parasocial relation is
not a two-sided recognition structure with one side missing. It is a *different*
structure, in which the renewal of $a$'s recognition cell for $b$ is driven by
$b$'s *broadcast* rather than by $b$'s address to $a$, and in which $a$ knows
this. Its formal marks:

- $\rho_{a,b}$ is populated on $a$'s side and unpopulated on $b$'s. The relation
  is real and asymmetric, not defective and symmetric.
- $a$'s cell $\langle a, \texttt{recognizes}, b \rangle$ is renewed at high
  density (the persona is available on demand, which is precisely what
  broadcast affords).
- The reciprocal cell is not merely absent; on $a$'s side it is *known to be
  absent*. Per §4's second finding, audiences know. So the knowledge-axis cell
  $\langle a, \texttt{knows-that-}b\texttt{-does-not-recognize-}a \rangle$ sits
  at $\mathbf{t}$, not at $\bot$. That is the diagnostic separating parasociality
  from delusion, and it is checkable.
- Third-party structure substitutes for reciprocity: fandoms supply the
  overhearing $c$ that ordinary dyads get from co-presence. Tie-signs are
  displayed to other audience members rather than to the persona. This predicts
  that parasocial relations should be markedly more collective than their
  one-sidedness suggests, which matches the fan-studies literature.

If this is right, then the corpus's malformation list needs a fourth case
distinguished from "speaking-into-vacuum": *addressed-broadcast*, where
$\mathrm{recv}$ is populated by a general rather than a particular receiver, and
the firing is well-formed with respect to a different closure rule. I state that
as a **[hypothesis]** and as a proposed amendment to material I am not the owner
of; it is offered to that section, not asserted over it.

**The exposure this estate actually has.** The Group operates artificial agents
that address people and are addressed by them. On the structure above, an agent
relation is not parasocial in the classical sense — the agent *does* receive,
and $\mathrm{recv}$ is genuinely populated — but it is asymmetric in a different
place: continuity. A human's recognition cell for an agent renews across
sessions; the agent's for the human may not persist at all. That is a
*third* structure, neither the reciprocal dyad nor the broadcast parasocial one,
and the corpus has no name for it. Naming and formalizing it is real work and
this note does not attempt it, partly because it borders on the
constitutionally reserved question of artificial kin, which is the Leader's with
Lakota knowledge-holders and is not touched here.

## 7. "Interpersonal dynamic": a proposed reading

The `interpersonal-dynamic.org` stub sits in the knowledge-services section
rather than sociology, which is a hint about intended use: something
knowledge-theoretic rather than psychological. A reading consistent with both
that placement and this note:

> **Proposed reading.** An *interpersonal dynamic* is the trajectory over time
> of a dyad's recognition-cell state under two competing forces: renewal from
> firing density, and decay toward $\bot$. Its qualitative types are the
> qualitative types of that trajectory — stable at $\mathbf{t}$, decaying,
> oscillating, or pinned at $\top$ (contested: both parties settled and
> disagreeing).

The last case earns the term "dynamic" in the vernacular sense. A dyad "with a
dynamic," in ordinary speech, is usually one whose recognition cells are at
$\top$ rather than at $\mathbf{f}$ — not a lapsed relation but a live
contradiction, held. The bilattice gives that a clean statement it does not have
in ordinary sociological vocabulary, where "ambivalence" (Merton and Barber,
*Sociological Ambivalence*, 1963; Lüscher and Pillemer on intergenerational
ambivalence, 1998) is the usual term and is typically treated as psychological
rather than structural. **[hypothesis]**, offered as a stub-filling proposal, not
a definition.

## 8. What this note does not claim

- It does not claim operational status for anything. It proposes readings.
- It does not define or extend Lakota concepts. The recognition-firing formalism
  is cited as an in-estate draft formalization and is used as a source of formal
  proposals only; claims about Lakota practice belong to Lakota knowledge-holders.
- It does not resolve the artificial-kin question and deliberately stops short of
  it (§6).
- It does not claim the renewal reading is the only functional account of
  sociability. Simmel's own (experience of pure form), Collins's (emotional
  energy), and the signalling account (sociable acts as costly-enough signals of
  availability) are live competitors, and the last is not addressed here at all.
- It does not supply the empirical half-life the renewal reading requires. That
  parameter is the whole substance of the claim and it is currently unmeasured.

## 9. Open questions

1. **Two stores or one?** Does the anomaly in §5 (resumption after long silence)
   require a second, slow-decaying store, and can the two half-lives be
   independently motivated rather than fitted?
2. **Is the stakes bound derivable?** §5 asserts that renewal channels must hold
   $\phi$ near $\bot$. Can that be derived from a cost model — firing cost
   against renewal-rate requirement — rather than asserted?
3. **What is the third-party update rule?** Goffman's tie-signs and the
   estate's third-person-mediated address both claim that dyadic acts update
   third-party cells. The estate's sheaf machinery is the natural home for a
   local-to-global statement here; nobody has written it.
4. **Does the renewal reading say anything about scale?** If standing is
   rate-maintained and agents have bounded firing capacity, there is a hard cap
   on maintained ties. That is Dunbar's claim arrived at from a different
   direction, and the coincidence is either informative or a trap.
5. **Where should the parasociality term live?** Media science has it. Sociology
   arguably needs it more, and the agent sections need it most.

## 10. Sources

Working references from assistant knowledge; verify before public use.

- Simmel, Georg. "Soziologie der Geselligkeit" (1910); translated as
  "Sociability" in *The Sociology of Georg Simmel*, ed. Kurt Wolff (1950), and
  as "The Sociology of Sociability," *American Journal of Sociology* 55:3 (1949).
- Goffman, Erving. *The Presentation of Self in Everyday Life* (1956/1959);
  *Encounters* (1961); *Behavior in Public Places* (1963); *Interaction Ritual*
  (1967); *Relations in Public* (1971); *Frame Analysis* (1974); "The
  Interaction Order," *American Sociological Review* 48:1 (1983).
- Horton, Donald, and R. Richard Wohl. "Mass Communication and Para-Social
  Interaction: Observations on Intimacy at a Distance," *Psychiatry* 19:3 (1956),
  215–229.
- Rubin, Alan M., Elizabeth M. Perse, and Robert A. Powell. "Loneliness,
  Parasocial Interaction, and Local Television News Viewing," *Human
  Communication Research* 12:2 (1985).
- Giles, David C. "Parasocial Interaction: A Review of the Literature and a
  Model for Future Research," *Media Psychology* 4:3 (2002).
- Dibble, Jayson L., Tilo Hartmann, and Sarah F. Rosaen. "Parasocial Interaction
  and Parasocial Relationship: Conceptual Clarification and a Critical
  Assessment of Measures," *Human Communication Research* 42:1 (2016).
- Liebers, Nicole, and Holger Schramm. "Parasocial Interactions and
  Relationships with Media Characters — An Inventory of 60 Years of Research,"
  *Communication Research Trends* 38:2 (2019).
- Cohen, Jonathan. "Parasocial Break-Up from Favorite Television Characters,"
  *Journal of Social and Personal Relationships* 21:2 (2004).
- Collins, Randall. *Interaction Ritual Chains* (2004).
- Duck, Steve. *Meaningful Relationships: Talking, Sense, and Relating* (1994).
- Dindia, Kathryn, and Daniel J. Canary, eds. *Communication and Relational
  Maintenance* (1993).
- Merton, Robert K., and Elinor Barber. "Sociological Ambivalence" (1963).
- Lüscher, Kurt, and Karl Pillemer. "Intergenerational Ambivalence,"
  *Journal of Marriage and the Family* 60:2 (1998).

### In-corpus references

- `lib/emsenn/services/561-group/services/science-services-section/services/social-science-services-section/services/sociology-science-services-section/content/text/glossary/terms/kinship.md`
- `lib/emsenn/services/561-group/services/science-services-section/services/social-science-services-section/services/sociology-science-services-section/content/text/glossary/terms/socializing.org` (stub this note addresses)
- `lib/emsenn/services/561-group/services/science-services-section/services/information-science-services-section/services/knowledge-services-section/content/text/glossary/terms/interpersonal-dynamic.org` (stub this note addresses)
- `lib/emsenn/services/561-group/services/science-services-section/services/information-science-services-section/services/communication-science-services-section/services/media-science-services-section/services/social-media-science-services-section/content/text/glossary/terms/parasocial-interaction.md`
- `lib/emsenn/services/561-group/services/science-services-section/services/philosophy-services-section/services/lakota-services-section/content/text/glossary/lakota/discharging/library/predicating/library/positing/library/settling/library/hacking/lakotaean-governance/philB/code/structures/speech-substrate.md`
- `lib/emsenn/services/561-group/services/science-services-section/services/philosophy-services-section/services/lakota-services-section/content/text/glossary/lakota/discharging/library/predicating/library/positing/library/settling/library/hacking/lakotaean-governance/philB/code/transformers/daily-recognition-firing.md`
- `lib/emsenn/services/561-group/services/science-services-section/services/philosophy-services-section/services/lakota-services-section/content/text/glossary/lakota/discharging/library/predicating/library/positing/library/settling/library/hacking/lakotaean-governance/philB/prose/learning/claims/recognition-as-bigraded-common-knowledge.md`
- `lib/emsenn/services/561-group/services/561-group-services-section/README.md` (the operational-status caveat)
