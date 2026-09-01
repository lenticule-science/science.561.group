---
title: "Ritual, Liminality, and the Constitution of Convention"
description: "A research survey of ritual theory — Van Gennep and Turner on the ritual process, liminality and communitas; Rappaport on ritual as the basic social act by which conventions are made binding; Seligman, Weller, Puett and Simon on ritual as subjunctive world-making; with Austin, Searle, Bell, and Humphrey and Laidlaw as the analytic spine — read against the estate's own witnessed-act and installation machinery, and offering three formalization proposals for how a ritual frame relates to monotone settlement."
date-created: 2026-08-29
date: 2026-08-29
type: research-note
in-service-of: lib/emsenn/services/561-group/services/science-services-section/services/philosophy-services-section
name: 2026-08-29-note-on-ritual-liminality-and-the-constitution-of-convention
authors:
  - claude-opus-5
keywords:
  - ritual
  - liminality
  - communitas
  - turner
  - rappaport
  - seligman
  - performative
  - witnessed-act
  - installation
  - subjunctive
tags:
  - draft
status: research-survey
---


## 0. Abstract, plan, and epistemic status

The estate has built ritual-shaped formal objects without ritual theory. It has
a four-stage installation morphism whose stages are read rather than performed;
it has a claim that hosting a visitor *is* a recognition-cell installation; it
has a whole substrate in which standing is maintained by continuous fired acts
rather than by stored certificates. What it does not have is any engagement with
the literature that spent the twentieth century working out what such objects
are. The glossary entry reserved for it is empty:

```
lib/emsenn/.../philosophy-services-section/content/text/glossary/terms/ritual-process.org
:PROPERTIES: :ID: e3c7732e-... :END:
#+title: ritual process
#+date: [2025-09-20 Sat 10:06]
```

Nothing else. The neighbouring ritual material in the philosophy section is two
triage files on personal practice (`content/text/triage/rituals/showering-ritual.md`,
`.../rain-stick.md`), and the closest thing to a theoretical statement anywhere
in the estate is the SPORE definition
(`.../561-group-services-section/content/text/triage/glossary/terms/synthetic-place-of-ritualized-ethnosis.md`),
which names ritualized ethnosis but does not theorize ritual.

**Relation to the empirical audit.** The sociology section already holds
`.../sociology-services-section/content/text/documents/articles/notes/2026/08/26/2026-08-26-note-on-cycles-ceremony-and-the-empirics-of-held-structure.md`
(2026-08-26), which audits ritual-as-load-bearing-technology against the
2015–2026 empirical literature — Durkheim's collective effervescence,
Whitehouse and Swann on identity fusion (with the *Nature* retraction named),
Tarr–Launay–Dunbar on synchrony, Hayden and Dietler on feasting — and grades its
verdicts. That note is an **empirical audit**; this one is a **theory survey**,
and the two are complementary. This note does not re-litigate those verdicts; it
takes them as given, in particular the finding that ritual bonding is
[supported] at small-to-medium scale and [not supported at claimed scale] for
large-scale societal cooperation. Any formalization here that implicitly assumed
society-scale ritual binding would be refuted by that audit, and §6 is written
with that constraint in view.

This note surveys the literature and proposes three formalizations. §1 fixes the
problem. §2 covers Van Gennep and Turner. §3 covers Rappaport, who is the
directly load-bearing source for anything the estate does with witnessed acts.
§4 covers Seligman et al. on the subjunctive. §5 gathers the analytic spine —
Austin, Searle, Bell, Humphrey and Laidlaw. §6 states three formalization
proposals against the estate's own machinery. §7 states what this note does not
claim, which includes some things it is important that it not claim. §8 lists
open questions.

**Status.** Research survey. Not doctrine. Per
`lib/emsenn/services/561-group/services/561-group-services-section/README.md`:
"Do not infer operational status from a Markdown file's existence or from its
non-legacy location." Citations are working references from assistant knowledge;
verify quotations, editions, and pagination before public use.

## 1. The problem, and what the estate already built

Two existing artifacts show the shape of the gap.

**First**, the installation morphism in the predicated-governance material
(`.../lakota-services-section/.../lakotaean-governance/philB/code/transformers/naca-installation.md`)
is structured as a *closure rule with three antecedent stages* — virtue-standing
verification, an induction ceremony, and recognition aggregation — rather than
as a single positing act. Its own commentary is precise about why:

> "The morphism does not *install* the cells; it *requires the cells to be in
> place* and produces the consequent only when they are. … The polity
> *recognizes* a naca; it does not *create* one by decree."

**Second**, the wakíčhuŋza material
(`.../lakotaean-governance/philA/code/structures/wakichunza-office.md`) contains
this line, almost in passing:

> "**Hosting visitors**: when a visitor arrives — a person from another oyate, a
> non-Lakota — the wakíčhuŋza greets and arranges hospitality, which is a
> substrate-recognition-cell installation."

Both files carry `status: draft`. Both are in-estate interpretive
formalizations of published scholarship (Deloria, Walker, Powers, Marshall), and
I treat them strictly as such. **This note makes no claim about Lakota practice.**
Where it draws on that material it draws on the *formal shape* proposed there —
staged closure rules, recognition-cell installation — and tests that shape
against the comparative ritual literature, which is what I am competent to
survey. Anything about Lakota ceremony belongs to Lakota knowledge-holders.

The theoretical question those two artifacts raise and do not answer:

> **Q.** What is the general class of acts that install a cell *by being
> performed and witnessed*, rather than by being true? What conditions make such
> an act binding? And what happens to the monotone settlement discipline inside a
> frame where things are held "as if"?

## 2. Van Gennep and Turner: the ritual process

**Arnold van Gennep**, *Les rites de passage* (1909), established the tripartite
schema: rites of **separation** (préliminaire), **transition** (liminaire), and
**incorporation** (postliminaire). His generalization was that transitions of
social state across every domain — territorial, life-cycle, seasonal,
initiatory — share this sequence, and that societies differentially elaborate
one phase or another.

**Victor Turner** took the middle phase and made a career of it. *The Ritual
Process: Structure and Anti-Structure* (1969), building on the Ndembu material
of *The Forest of Symbols* (1967), advances four ideas this note needs.

**Liminality.** The liminal subject is "betwixt and between": stripped of prior
status, not yet holding the next. Turner catalogues the standard marks —
seclusion, namelessness, ritual nudity or uniform dress, submission to elders,
suspension of rank, exposure to sacra, symbolic death and rebirth. The critical
structural point is that liminal status is *not the absence of status*; it is a
distinct, framed, rule-governed condition with its own authority relations,
which happen to invert or level the ordinary ones.

**Communitas.** Turner's term for the unstructured, egalitarian, direct bond
that arises among liminal co-participants. He distinguishes **existential** or
spontaneous communitas (the immediate happening), **normative** communitas (the
attempt to organize and perpetuate it into a durable system), and
**ideological** communitas (utopian models of it). Structure and communitas are
for Turner dialectically necessary to each other: societies oscillate, and each
pole is pathological alone.

**Social drama.** From *Schism and Continuity in an African Society* (1957) and
developed in *Dramas, Fields, and Metaphors* (1974): a four-phase processual
unit — **breach** of a norm, **crisis** as the breach widens, **redressive
action** (which is where ritual and legal machinery are deployed), and
**reintegration** *or* recognition of irreparable **schism**. The last disjunct
matters: Turner is explicit that redress can fail, and the model does not
guarantee restoration.

**Liminoid.** In *From Ritual to Theatre* (1982), Turner distinguishes the
**liminal** (obligatory, collective, cyclical, integrative — characteristic of
pre-industrial society) from the **liminoid** (optional, individual, produced,
often critical — characteristic of industrial leisure: theatre, art, sport,
play). This distinction is directly relevant to any estate that runs games and
treats play as a domain; it says that the liminal's binding force is not
automatically inherited by its optional descendants.

**Grading.** Van Gennep's tripartite schema is **[supported]** as a descriptive
generalization and is essentially uncontested. Turner's liminality is
**[supported]** descriptively. *Communitas* is **[contested]**: it has been
criticized for romanticism, for under-describing the coercion inside liminal
seclusion, and for treating a felt quality as a social type. Turner's
structure/anti-structure dialectic is **[contested]** as an explanatory
mechanism, though it remains a productive frame.

## 3. Rappaport: ritual as the act that makes convention binding

Roy A. Rappaport's *Ritual and Religion in the Making of Humanity* (1999) is the
source most directly load-bearing for anything this estate does with witnessed
acts, and to my reading it is not cited anywhere in the corpus. Its argument, in
the order it matters here:

**The definition is formal, not substantive.** Rappaport defines ritual as "the
performance of more or less invariant sequences of formal acts and utterances not
entirely encoded by the performers." Every clause does work. *Performance*: it is
enacted, not merely thought. *Invariance*: the sequence is fixed. *Formality*:
it is marked off from ordinary behaviour. *Not entirely encoded by the
performers*: the form precedes the participant, which is what allows performance
to signal conformity to something beyond the performer's will.

**Two message streams.** Ritual carries **canonical** messages — the invariant
order itself, encoded by others, indexing durable general truths — and
**self-referential** messages — the participant's own current state, indexed by
the fact of participation and by whatever variation the form permits (which
noble's banner, how large an offering). The canonical stream cannot be
transmitted without the self-referential one, and the self-referential stream
gets its meaning from the canonical.

**The acceptance thesis.** This is the thesis. For Rappaport, *the performance
of a liturgical order constitutes acceptance of that order*, and acceptance so
constituted is a **public, indexical, and self-referential act** which is
therefore not a private mental state and not falsifiable by the performer's
inner attitude. In his phrasing: whatever he may in fact believe, the performer
has by performing accepted, and has *made that acceptance a social fact*. He is
careful and unsentimental about the consequence: acceptance is not belief and it
does not guarantee compliance. It establishes an **obligation**, and thereby
makes subsequent violation a breach rather than a mere divergence.

Rappaport locates in this the origin of the **moral**: obligation is generated
by the ritual form, and "having accepted, one is obliged" is, on his account,
the first moral fact. Ritual is therefore for him "the basic social act."

**The problem ritual solves.** Language brings the capacity for the alternative,
and therefore the lie, and therefore — in his term, borrowed and generalized —
**Babel**: the multiplication of incompatible conventions with no way to fix any.
Ritual answers by grounding conventions in unfalsifiable **Ultimate Sacred
Postulates** — sentences that are, precisely, neither verifiable nor
falsifiable, and are certified instead by the performance itself. Sanctity
flows from these down a **hierarchy of sanctity** to progressively more
specific, more contingent, more falsifiable directives. Rappaport also
diagnoses the pathology: **idolatry**, in his sense, is the sanctification of
what is properly contingent — treating a specific, falsifiable, revisable
arrangement as though it sat at the top of the hierarchy.

**Grading.** Rappaport's definition is **[supported]** as a working analytic
definition and is widely used. The acceptance thesis is **[contested]** but
seriously so — it is a substantive philosophical claim, and its main opponents
argue either that it over-reads indexicality (participation under duress or
under mere convention signals much less than he wants) or that it cannot
distinguish acceptance from mere attendance. The Ultimate-Sacred-Postulate
architecture and the derivation of the moral from ritual are **[contested]**
and are the least corroborated part of the book. The Babel diagnosis is
**[hypothesis]** — an evolutionary story, not an established one.

## 4. Seligman, Weller, Puett, and Simon: ritual as subjunctive

*Ritual and Its Consequences: An Essay on the Limits of Sincerity* (Adam
Seligman, Robert Weller, Michael Puett, Bennett Simon, 2008) supplies the piece
Rappaport does not.

Their central contrast is between two modes of framing a world. **Ritual** works
in the **subjunctive**: it creates a shared "as-if" or "could-be" world —
provisional, always in some tension with the world as experienced, and *not
claiming to describe it*. When one bows, one does not assert that one is
inferior; one enacts a world in which the bow is what happens between these
positions. **Sincerity**, by contrast, seeks the "as-is": it demands that outer
act match inner state, treats the ritual mode as empty or hypocritical, and
tends toward a totalizing search for authenticity.

Their arguments this note uses:

- **The subjunctive is not a weaker truth-claim; it is a different kind of act.**
  Ritual's "as-if" is not a false assertion. It is not an assertion. Judging it
  by assertion's standards is a category error, and one that sincerity-oriented
  cultures make systematically.
- **Ritual is good at handling ambiguity and boundaries.** Because it does not
  require inner assent, it lets people who disagree — or who are unsure —
  nevertheless act together. It creates shared *practice* without requiring
  shared *belief*, and thus works precisely where consensus is unavailable.
- **Sincerity has costs.** A regime that demands that acts express inner truth
  generates fragmentation, a hunt for hypocrisy, and (their sharpest claim) a
  particular fragility: when the shared subjunctive is unavailable, boundary
  work becomes a matter of who is *really* what, which is far more violent than
  a matter of who does *what*. They are pointedly not nostalgic and do not
  advocate a return to ritual society; the argument is that the two modes are
  both necessary and that modernity has lost the balance.

**Grading.** The subjunctive/sincere distinction is **[supported]** as an
analytic frame and has been productive. The historical thesis about modernity's
loss of balance is **[contested]**. The claim that ritual reduces violence at
boundaries is **[hypothesis]** — plausible, argued from cases, not established.

## 5. The analytic spine

Four more sources that make the formalization in §6 possible.

**J. L. Austin**, *How to Do Things with Words* (1962). Performative utterances
do not describe; they perform, and are assessed not as true or false but as
**felicitous** or **infelicitous**. His felicity conditions: an accepted
conventional procedure with a conventional effect; appropriate persons and
circumstances; correct and complete execution; and, where the procedure requires
certain thoughts or intentions, participants who actually have them and
subsequently conduct themselves accordingly. Austin's split between **misfires**
(the act does not come off) and **abuses** (it comes off but insincerely) is
exactly the distinction Rappaport and Seligman et al. exploit from opposite
directions.

**John Searle**, *The Construction of Social Reality* (1995) and *Making the
Social World* (2010). **Constitutive rules** of the form "X counts as Y in
context C" create **status functions** — functions an object performs not by
physics but by **collective acceptance** — and status functions carry **deontic
powers**: rights, duties, obligations, authorizations. Searle's Status Function
Declaration is the general form of an installation act. This is the closest
existing formal analysis to what the estate's installation morphisms are doing.

**Catherine Bell**, *Ritual Theory, Ritual Practice* (1992) and *Ritual:
Perspectives and Dimensions* (1997). Bell's move is deflationary and useful: stop
asking what ritual *is* as a universal category and study **ritualization** —
the strategic production of differentiation, whereby some acts are set apart as
privileged with respect to others. Ritualization on her account is a way of
acting that *misrecognizes* its own construction of power, producing "ritualized
agents" whose dispositions the practice has shaped. She is the standard critic
of the thought/action dichotomy that structures most ritual theory, Turner
included.

**Caroline Humphrey and James Laidlaw**, *The Archetypal Actions of Ritual*
(1994). Their thesis: what makes an action ritualized is a specific **ritual
commitment** in which the actor's intention no longer individuates the act.
Ordinary action is identified by what the actor is intending to do; ritualized
action is **stipulated and elemental** — the acts come pre-identified, and the
participant apprehends rather than authors them. This is the cleanest available
statement of why performance can be decoupled from interior state without the
act becoming meaningless, and it is the piece that makes §6(b) statable.

## 6. Three formalization proposals

Stated so they can be attacked. All are **[hypothesis]** unless marked.

### 6.1 A rite is a closure rule with witnessed antecedents and felicity gates

**Proposal.** Model a rite as a closure rule
$A_1 \wedge \cdots \wedge A_n \Rightarrow C$ where each antecedent $A_i$ is a
*witnessed* cell — a cell populated by a public act with a recorded witness —
rather than by an assessment of a private state, and $C$ is the installed status
cell.

This is not a new construction for the estate; it is the shape the
naca-installation morphism already has (three staged antecedents; a consequent
that fires continuously and falls automatically when an antecedent fails). What
the survey adds is *why that shape is the right one*, from three independent
directions:

- Austin's felicity conditions **are** the antecedents. Austin's misfire/abuse
  split maps onto antecedent-failure versus antecedent-satisfied-but-conduct-fails,
  and the estate's "continuing-qualification" behaviour — the rule keeps firing
  and the consequent falls when the antecedent does — is a principled treatment
  of abuse that Austin himself left underdeveloped.
- Searle's constitutive rule "X counts as Y in C" **is** the rule form, and his
  deontic powers are what the consequent cell licenses.
- Rappaport's invariance requirement explains why the rule must be *fixed in
  advance and not encoded by the performer*: a rule the participant can rewrite
  during performance cannot index conformity to anything.

**Consequence worth stating.** If rites are closure rules over witnessed cells,
then the estate's practice of witnessed acts is not merely an audit convenience.
It is the mechanism that makes convention binding at all, and the honest name for
a witnessed-act log is a *liturgical record*. **[hypothesis]**, but I think this
one is close to **[supported]** by convergence: Austin, Searle, and Rappaport
reach it from performativity, social ontology, and ecology respectively.

### 6.2 Why witnessed acts can ignore interior state

**Proposal.** In a rite, the interior cell $\langle a, \texttt{sincerely-holds},
\phi \rangle$ is deliberately left at the knowledge-axis bottom $\bot$ — not
because it is unknowable, but because *reading it is not part of the rule*. What
the rule reads is the public performance cell, which the act populates directly.

This is Rappaport's acceptance thesis in the estate's idiom, with Humphrey and
Laidlaw supplying the mechanism (the act is stipulated and elemental; intention
does not individuate it) and Seligman et al. supplying the reason it is a
feature (the subjunctive lets people who disagree act together).

**The risk, stated plainly.** A substrate that binds on witnessed performance
and refuses to read interior state is *by construction* indifferent to coercion.
Rappaport knew this; the acceptance thesis explicitly covers the performer who
believes nothing. Seligman et al. also know it, and their answer — that the
subjunctive frame is understood *as* a frame by participants — is thin under
duress. Any estate that adopts witnessed-act semantics inherits the exposure,
and the mitigation cannot come from inside the formalism: it has to come from
who may install a rite and who may withdraw from one. The
`iyuha-sni-withdrawal` material in the predicated-governance subtree is the
relevant existing formalization of the withdrawal side, and it is that side, not
the installation side, that carries the safety. **This is a design warning, not
a claim.**

### 6.3 The subjunctive frame as a retractable read over monotone settlement

This is the proposal with the most formal content and the most risk.

The estate's settlement discipline is monotone: evidence joins upward on the
knowledge axis and does not retract. But Seligman et al.'s subjunctive is
*exactly a scope in which things hold provisionally and stop holding when the
frame closes*. Turner's liminality is the same structure: office cells are
suspended, rank is levelled, and at incorporation the previous structure returns
(altered) rather than having been permanently overwritten. Neither is
monotone.

**Proposal.** A ritual frame is not a settlement. It is a *retractable
presentation over an unchanged settlement base*: a bounded scope with an opening
act and a closing act, inside which a set of cells is read differently, and
whose closure restores the base reading without having to retract anything on
the knowledge axis — because nothing was ever joined into the base.

Two candidate laws, offered for attack:

- **Frame conservativity.** For any cell not in the frame's declared scope, the
  reading inside the frame equals the reading outside it. A frame that leaks is
  a failed frame, and the standard failures — a person who "won't drop the bit,"
  an initiation whose hazing becomes real — are leaks in exactly this sense.
- **Base monotonicity.** The frame's *occurrence* is itself a witnessed act that
  joins monotonically into the base, even though the frame's *contents* do not.
  You cannot un-hold the ceremony. This is what distinguishes ritual from
  ordinary pretence, and it is why 6.1's rite can be built out of 6.3's frame:
  the rite is the pair (retractable interior, monotone occurrence record).

**A necessary marker.** If liminality suspends office cells, then during a rite
the substrate cannot locally distinguish *suspended* from *decayed* — and the
recognition machinery says cells decay toward $\bot$ without renewal
(`.../philB/code/transformers/daily-recognition-firing.md`). So a frame must
carry an explicit marker cell recording that the suspension is framed, or a long
ceremony is indistinguishable from a lapse. I take this to be a real derived
requirement rather than an observation, and it is the most checkable thing in
this note.

**Cross-reference.** This proposal is the ritual-side instance of a gap that has
also been filed on the game/arena side, where a presentation layer must be
allowed to diverge from and then re-converge with a monotone settlement base.
If both are the same object, that is worth knowing; a companion note on the
presentation-layer side develops the formal object directly and the two should
be read together.

## 7. What this note does not claim

- It does not have operational status and does not establish any practice.
- It does not describe, prescribe, or author any ceremony. In particular it does
  **not** touch the artificial-kin admission question, which is constitutionally
  the Leader's, to be worked with Lakota knowledge-holders. §6.2's design warning
  is about witnessed-act semantics in general and is not about that ceremony.
- It makes no claim about Lakota practice. Where the predicated-governance
  material is cited it is cited as an in-estate draft formalization and used only
  as a source of formal shapes; the underlying practice is not mine to describe.
- It does not canonize or define SPORE. SPORE is referenced only as the existing
  place where the word "ritualized" appears in the estate.
- It does not settle whether ritual is a natural kind. Bell's deflationary
  position — study ritualization, not ritual — may well be right, and §6's
  proposals survive translation into her idiom, but this note does not carry out
  that translation.

## 8. Open questions

1. **Is 6.3's frame the same object as the presentation layer?** If a ritual
   frame and a game's retractable presentation are instances of one construction,
   the estate has one gap rather than two.
2. **What certifies a frame's closure?** Base monotonicity says the occurrence
   joins the base. But who witnesses the *close*? Turner's incorporation phase is
   an act; Van Gennep's postliminaire is an act; the formalism needs the closing
   witness as much as the opening one, and 6.3 does not currently require it.
3. **Can the hierarchy of sanctity be given a lattice reading?** Rappaport's
   descent from unfalsifiable Ultimate Sacred Postulates to falsifiable
   directives looks like a stratification of an evidence order by
   falsifiability. If it can be stated in the estate's bilattice terms, then
   Rappaport's *idolatry* — sanctifying the contingent — becomes a checkable
   type error rather than a moral accusation. That would be a substantial
   result and I do not know whether it works.
4. **Does the estate want the liminal or the liminoid?** Turner's distinction
   says optional, individual, produced framings do not inherit the obligatory
   force of collective cyclical ones. Anything the estate builds is closer to
   liminoid. Whether liminoid frames can bind is Turner's own open question.
5. **Where should ritual-process live?** The stub is in philosophy. Most of the
   load-bearing material (Rappaport, Bell, Turner) is anthropological, and the
   social-science section has no home for it.

## 9. Sources

Working references from assistant knowledge; verify before public use.

- van Gennep, Arnold. *Les rites de passage* (1909); *The Rites of Passage*,
  tr. Vizedom and Caffee (1960).
- Turner, Victor. *Schism and Continuity in an African Society* (1957); *The
  Forest of Symbols* (1967); *The Ritual Process: Structure and Anti-Structure*
  (1969); *Dramas, Fields, and Metaphors* (1974); *From Ritual to Theatre: The
  Human Seriousness of Play* (1982).
- Rappaport, Roy A. *Ritual and Religion in the Making of Humanity* (Cambridge,
  1999); earlier: *Pigs for the Ancestors* (1968), *Ecology, Meaning, and
  Religion* (1979).
- Seligman, Adam B., Robert P. Weller, Michael J. Puett, and Bennett Simon.
  *Ritual and Its Consequences: An Essay on the Limits of Sincerity* (Oxford,
  2008).
- Austin, J. L. *How to Do Things with Words* (1962).
- Searle, John R. *The Construction of Social Reality* (1995); *Making the
  Social World* (2010).
- Bell, Catherine. *Ritual Theory, Ritual Practice* (1992); *Ritual:
  Perspectives and Dimensions* (1997).
- Humphrey, Caroline, and James Laidlaw. *The Archetypal Actions of Ritual*
  (1994).
- Durkheim, Émile. *Les formes élémentaires de la vie religieuse* (1912) — for
  collective effervescence, presupposed throughout the above.
- Bloch, Maurice. *Prey into Hunter: The Politics of Religious Experience*
  (1992) — the standard alternative to Turner on what the middle phase does.

### In-corpus references

- `lib/emsenn/services/561-group/services/science-services-section/services/philosophy-services-section/content/text/glossary/terms/ritual-process.org` (stub this note addresses)
- `lib/emsenn/services/561-group/services/science-services-section/services/philosophy-services-section/content/text/triage/rituals/showering-ritual.md`
- `lib/emsenn/services/561-group/services/561-group-services-section/content/text/triage/glossary/terms/synthetic-place-of-ritualized-ethnosis.md`
- `lib/emsenn/services/561-group/services/science-services-section/services/philosophy-services-section/services/lakota-services-section/content/text/glossary/lakota/discharging/library/predicating/library/positing/library/settling/library/hacking/lakotaean-governance/philB/code/transformers/naca-installation.md`
- `lib/emsenn/services/561-group/services/science-services-section/services/philosophy-services-section/services/lakota-services-section/content/text/glossary/lakota/discharging/library/predicating/library/positing/library/settling/library/hacking/lakotaean-governance/philA/code/structures/wakichunza-office.md`
- `lib/emsenn/services/561-group/services/science-services-section/services/philosophy-services-section/services/lakota-services-section/content/text/glossary/lakota/discharging/library/predicating/library/positing/library/settling/library/hacking/lakotaean-governance/philA/code/transformers/iyuha-sni-withdrawal.md`
- `lib/emsenn/services/561-group/services/science-services-section/services/social-science-services-section/services/sociology-science-services-section/content/text/documents/articles/notes/2026/08/29/2026-08-29-note-on-sociality-sociability-and-parasociality.md` (companion; §5 there and §6.2 here share the renewal/decay machinery)
- `lib/emsenn/services/561-group/services/561-group-services-section/README.md` (the operational-status caveat)
