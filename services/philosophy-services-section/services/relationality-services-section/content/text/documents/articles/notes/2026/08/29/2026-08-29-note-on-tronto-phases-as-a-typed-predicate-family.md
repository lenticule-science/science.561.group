---
title: "Tronto's Phases as a Typed Predicate Family, with Responsiveness Read From the Cared-For Side"
description: "A bridge note. The estate's care-ethics essay sits in a triage backlog citing nothing internal, and nothing cites it; the relationality mathematics sits in the math section citing nothing about care. This note connects them, with two proposals: that Tronto's phases are a typed dyadic predicate family in which responsiveness is a distinct predicate rather than the converse of care-giving, so that a completed care relation carries a two-witness requirement; and that the Foucauldian production of a case is exactly the predicate category's subject-projection generator, the diagonal collapse that turns a directed relation into a unary property of a person. Ends by insisting the formalization resolves nothing, because the essay's own thesis is that the conflict is not resolvable from within practice."
date-created: 2026-08-29
date: 2026-08-29
type: research-note
in-service-of: lib/emsenn/services/561-group/services/science-services-section/services/philosophy-services-section/services/relationality-services-section
name: 2026-08-29-note-on-tronto-phases-as-a-typed-predicate-family
authors:
  - claude-opus-5
requires:
  - predication-cell
  - predicate-category
  - bilattice
  - settlement
keywords:
  - care-ethics
  - tronto
  - noddings
  - foucault
  - predication
  - predicate-category
  - subject-projection
  - responsiveness
  - witnessing
tags:
  - draft
status: proposal
---

# Tronto's Phases as a Typed Predicate Family, with Responsiveness Read From the Cared-For Side

## 0. Abstract and plan

The estate holds a 357-line synthesis of care ethics against the Foucauldian
confessional apparatus
(`.../philosophy-services-section/content/text/triage/care-ethics-and-the-confessional-apparatus.md`,
2026-05-22). It is careful work: every load-bearing claim is a page-numbered
quotation, and it is honest that the structural conflict it identifies is not
resolvable from within the practitioner's role.

It is also completely sealed off from the estate. It contains no internal
corpus links, no reference to relationality, predication, settlement, witnessing,
or cells; its `relates-to:` entries are bare strings that resolve to no files; it
sits in `content/text/triage/`, which the philosophy section's README describes
as "an unprocessed triage backlog"; and nothing anywhere cites it. The
care-ethics topic stub is one sentence: "Care Ethics is a domain within
Philosophy."

Meanwhile the relationality mathematics — the predication cell, the predicate
category and its four generator classes, the bilattice, settlement, witnessing —
sits in the math and philosophy glossaries with nothing to say about care.

This note is the bridge. §1 restates what the essay claims. §2 gives the
formalism it will use. §3 proposes the predicate family and the two-witness
requirement. §4 proposes that case-production is subject-projection, which I
think is the note's real result. §5 reads the essay's certificate-versus-relation
theme against the corpus's two recognition substrates. §6 says what the
formalization does not do, at length, because that matters more here than
usual. §7 answers objections. §8 gives directions.

**Status.** Proposal. Not doctrine, not operational. Per
`lib/emsenn/services/561-group/services/561-group-services-section/README.md`:
"Do not infer operational status from a Markdown file's existence or from its
non-legacy location." External citations are working references from assistant
knowledge; the essay's page-numbered quotations are reproduced from it and should
be verified against the editions before public use.

## 1. What the essay claims

Its own five-point summary, compressed:

1. Noddings's caring relation requires **engrossment** — receiving the other on
   their own terms — and **completion by the cared-for**; the confessional
   apparatus requires speech to a classifying authority, and classification
   proceeds independently of the subject's experience.
2. Tronto's fourth phase, **responsiveness**, requires accountability *downward*,
   to the cared-for; institutional care requires accountability *upward*, to
   protocol and documentation. The directions are incompatible.
3. The apparatus does not run on intentions. "Practitioners who care well still
   feed the apparatus."
4. Authority to change the conflict lies outside the practitioner role.
5. The apparatus sustains itself *through* genuine care: "The therapeutic
   relation is real; the help is real; and the subject-production is also real.
   These cannot be separated from within the encounter."

And a sixth point, from §IV, which is the one that makes the conflict hard rather
than merely regrettable: care *requires* knowing, so the apparatus "attaches to
the legitimate epistemic requirement of care." You cannot refuse the disclosure
without refusing the care.

**Tronto's phases**, from *Moral Boundaries* (1993), with the fifth added in
*Caring Democracy* (2013):

| Phase | Moral element |
|---|---|
| caring about | attentiveness |
| taking care of | responsibility |
| care-giving | competence |
| care-receiving | **responsiveness** |
| caring with | solidarity, trust |

The essay notes that *caring with* is "structurally blocked in carceral
settings."

## 2. The formalism, restated

From `.../math-services-section/content/text/glossary/terms/predication.md`:

> "The smallest unit of predication is the predication cell `(s, p, o) ∈ Φ = E × Π × E`
> … The cell records the proposition *predicate p holds of subject s in relation
> to object o*. A predication valuation assigns to each cell a value in a
> residuated bilattice."

and, load-bearingly:

> "The directed asymmetry of the cell — that the subject and object coordinates
> are structurally distinct, and the predicate is directional from the one to the
> other — is the formal expression of what the philosophical side calls
> *lopsidedness* or *directional relating*. There is no symmetric primitive
> underneath. The directed cell is the primitive; symmetric relations appear as
> the special case where a predicate equals its own converse."

From `.../terms/predicate-category.md`, the four canonical generator classes —
**specialization**, **converse**, **subject-projection** ("induced by the
diagonal collapse `(s, o) ↦ (s, s)` … the formal source of *unary* predicates as
derived structures"), and **object-projection** — with the theorem that under a
`Sym(E)`-equivariance hypothesis on `E` (`|E| ≥ 3`) these four classes generate
every natural map between predication fiber algebras. "That the generator set is
*exactly four classes* is a theorem about equivariance, not a stipulation."

And from `.../philosophy-services-section/content/text/glossary/terms/witnessing.md`:

> "A **witnessing** is an act of relating that structurally affirms or denies a
> relation … Witnessing is not the absence of doubt, the failure to refute, or
> the silence of objection. It is a positive derivational act… A relation that no
> one has witnessed is not a relation that has been denied; it is a relation that
> has not yet been examined."

## 3. Proposal one: the phase family, and the two-witness requirement

> **Proposal.** Tronto's phases are a family of typed dyadic predicates over the
> same entity pair:
>
> - `⟨a, cares-about, x⟩` — attentiveness. Note that `x` here is characteristically
>   a *need or situation*, not a person. §7's O4 takes this up as a real problem.
> - `⟨a, takes-responsibility-for, x⟩` — responsibility.
> - `⟨a, gives-care-to, b⟩` — competence.
> - `⟨b, receives-care-from, a⟩` — responsiveness.
> - `⟨a, cares-with, b⟩` — solidarity; the phase the essay says is structurally
>   blocked in carceral settings.
>
> **And the load-bearing claim:** the fourth predicate is **not** the converse of
> the third.
>
> `⟨b, receives-care-from, a⟩ ≠ converse(⟨a, gives-care-to, b⟩)`

That inequality is the entire content of Tronto's fourth phase and of Noddings's
completion condition, stated in one line of the estate's own formalism.

Noddings: "the caring relation is completed by the cared-for" — the relation is
not a property of the carer's act. Tronto: responsiveness is a distinct moral
element, and the essay's claim 2 is that it demands accountability in the
*opposite direction* from the other three. Both are the claim that the two cells
carry **independent evidence** and that raising one does not raise the other.

The corpus's own machinery makes the point sharp rather than metaphorical.
Converse is one of the four canonical generators; it exists precisely so that
`p` and `pᶜ` can be *distinct predicates*, and the glossary is explicit that the
symmetric case — where a predicate equals its own converse — is a degenerate
special case rather than the norm. **So the formal error care ethics spends its
literature guarding against is exactly the collapse of a predicate into its own
converse**, and the corpus has a name for that collapse and a theorem saying it
is one of four canonical things you can do to a predicate.

**The consequent, which is checkable:**

> **The two-witness requirement.** A care relation between `a` and `b` is
> *complete* only when both `⟨a, gives-care-to, b⟩` and
> `⟨b, receives-care-from, a⟩` are at **t**. Since witnessing is a positive act
> that raises the knowledge order, and since `a`'s witness raises only the first
> cell, the second requires `b`'s own witness. No amount of evidence from the
> carer's side settles it.

And now the essay's central pathology has a shape. Institutional care that
documents itself thoroughly as caring, while the cared-for experiences
classification, is:

`⟨practitioner, gives-care-to, client⟩ = t` and
`⟨client, receives-care-from, practitioner⟩ ∈ {⊥, f}`

— the first cell heavily witnessed, the second unwitnessed or witnessed against.
That is a diagnosis with a form, and the essay had to argue it over four
sub-sections of prose because it had no way to say it in one line.

Two refinements worth stating. First, ⊥ and **f** are genuinely different
diagnoses here: ⊥ means the cared-for's side was never asked (the ordinary case
in institutional care, where no mechanism collects it); **f** means it was asked
and answered in the negative (the case where a complaint exists and the
documentation continues regardless). The four-valued reading distinguishes the
absence of a feedback channel from the overriding of one. Second, ⊤ — witnessed
both ways — is the case of a genuinely ambivalent care relation, which the
literature knows well and which a two-valued treatment must force into one bin.

## 4. Proposal two: case-production is subject-projection

This is the part I would most defend.

The essay's Foucault sections turn on the **examination**, which "situates
individuals in a network of writing" and converts a person into a *case* —
a describable, analysable, comparable object. Discipline's characteristic
product is not a judgment but a **file**.

The predicate category has a generator for exactly this operation.
Subject-projection is induced by the diagonal collapse `(s, o) ↦ (s, s)`, and
the glossary names its effect: it is "the formal source of *unary* predicates as
derived structures."

> **Proposal.** The production of a case is subject-projection. The directed
> relational cell — `⟨practitioner, hears, client⟩`,
> `⟨client, discloses-to, practitioner⟩` — is projected onto its subject
> coordinate and becomes a **unary property of the person**:
> `⟨client, is-risk-level-3⟩`, `⟨client, is-noncompliant⟩`,
> `⟨client, is-a-danger-to-self⟩`.
>
> The object coordinate — *to whom*, *in what relation*, *under what conditions
> of trust* — is destroyed by the projection, and what survives is a property the
> person now carries.

Three things follow, and they are not restatements of the essay.

**(i) It explains why the transformation is irreversible.** Subject-projection is
a collapse; there is no map back. Once `⟨client, is-noncompliant⟩` exists, the
relation it came from cannot be recovered from it, and no later act of care can
un-project it. The essay says the record survives the practitioner; the formalism
says *why* the record cannot be argued with — it has forgotten what it was a
record of.

**(ii) It explains why good practitioners still feed the apparatus.** The
projection is a *natural map*, one of exactly four, and the theorem says these
four generate everything. Nothing about the practitioner's intentions makes the
projection more or less available. It is a structural operation on the fiber
algebra, and any system that writes files performs it. That is the essay's claim
3 — "the apparatus does not run on practitioners' intentions" — derived rather
than observed.

**(iii) It says what a non-projecting record would have to be.** A record that
did not produce a case would be one that retained the object coordinate: not
`⟨client, is-risk-3⟩` but `⟨client, was-assessed-risk-3-by, practitioner-at-time⟩`.
That is a directed cell, it is contestable by the client, and it can carry a
`⟨client, disputes, that-assessment⟩` cell beside it. **That is a design
constraint that follows from the formalism and does not appear in the essay**,
and it is the closest thing to a constructive suggestion this note has. §6 is
about why it is much less than it sounds.

## 5. Two recognition substrates

The essay's claim 3 has a second half: the apparatus "survives individual
practitioners… A practitioner who leaves the institution does not take the
records with them."

The corpus's predicated-governance material contains a direct treatment of
exactly this contrast, in the Lakota-services subtree. I cite it with care: that
material is an in-estate interpretive formalization of published scholarship
(Deloria, Walker, Powers), it is filed under a `hacking/` path segment which its
own package README treats as the grade marker for derivation-in-progress rather
than theorem, and its own README states that "the substantive Lakota tradition is
held by Lakota knowledge holders in living tradition" and that "the
substrate-algebraic form is a **tool**, never the tradition." I take from it a
formal contrast and no claim about Lakota practice.

From `.../lakotaean-governance/philB/code/transformers/daily-recognition-firing.md`:

> "The Western office-substrate uses certificate-storage: the office is
> held-recognized by a stored record… Office-recognition decay-rate is zero in
> absence of explicit revocation-firings."

versus

> "Recognition is *the firing-density itself*. … Per-agent recognition-cells drift
> toward ⊥ under the substrate's natural-decay-2-cell unless renewed."

> **Reading.** The essay's structural collision is, formally, a collision between
> two recognition substrates with different decay profiles. The record — the
> case, the file, the risk rating — is a certificate: zero decay, survives
> everyone, revocable only by an explicit act nobody is positioned to perform.
> Responsiveness, in Tronto's sense, is firing-density: it exists only while the
> cared-for's own cells keep being raised, and it decays to ⊥ the moment nobody
> asks them.
>
> So the two accountability directions the essay identifies are not merely
> opposed in orientation. They are maintained by *mechanisms with different time
> constants*, and the certificate wins by default — not because anyone chose it,
> but because it does not decay and the other does.

That, I think, is a genuine addition. The essay says the directions are
incompatible. The formalism says which one wins when nobody is paying attention,
and why.

## 6. What this does not do, at length

The essay's most important sentence, for present purposes, is in §V: "A
practitioner who believes they can resolve the structural conflict through
personal virtue is not more helpful — they are less helpful."

The same warning applies with full force to formalization, and I want to be
explicit rather than perfunctory about it.

- **Formalizing the conflict does not resolve it.** §3 gives the pathology a
  shape; it does not supply the feedback channel that would raise the second
  cell. §4 says what a non-projecting record would look like; it does not
  create the institutional authority to require one, and the essay's claim 4 is
  precisely that this authority sits outside the practitioner's role. A
  formalism that made the conflict look tractable would be *worse than no
  formalism*, because it would relocate a structural problem into a design
  problem and hand it to people who cannot solve it.
- **It does not model engrossment.** Noddings's engrossment — "I allow the
  other's reality to really sink in" — is phenomenological, and nothing in §3
  represents it. The formalization models the relation's *completion condition*,
  which Noddings describes as the observable part, and is silent on the interior
  part, which is the part the theory is actually about.
- **It does not give a practitioner anything to do tomorrow.** The essay is
  explicit that its own §VI does not either, and adds: "But it tells them what
  kind of problem they are facing." That is the most this note can claim as well.
- **It does not make the two-witness requirement measurable.** "Did the
  cared-for's cell rise" is a real question and collecting the answer is exactly
  the thing institutional care is structurally bad at — the essay's whole
  argument is that the feedback runs the wrong way. A requirement that cannot be
  measured in the setting it applies to is a diagnosis, not an instrument.

## 7. Objections and replies

**O1. This is formalism theatre. Restating good prose in symbols adds nothing,
and the symbols carry an air of rigour the argument has not earned.**

*Reply.* Partly conceded. §3's phase family is close to restatement, and I would
not defend it alone. §4 is not: the identification of case-production with
subject-projection is a substantive claim, because the predicate category's
four-generator result is a theorem about equivariance, and the claim locates
case-making as one of exactly four canonical operations rather than as one
institutional practice among many. §5 is also not: "which mechanism wins by
default, and why" is not in the essay. If O1 lands anywhere it lands on §3.

**O2. Noddings's engrossment cannot be a cell, and a formalization that leaves
it out has left out care.**

*Reply.* Conceded, and §6 says so. The defence is that the formalization is
addressed to the *structural* claim — that the relation completes from the
cared-for's side — which is the part Noddings herself states as a condition on
the relation rather than on the carer's interior. What is left out is left out
knowingly.

**O3. Care ethics exists partly as a critique of exactly this style of
abstraction. Gilligan's contrast between an ethic of care and an ethic of
justice, and Held's relational ontology, are arguments against reducing moral
situations to formal structures. Formalizing care ethics reproduces the thing it
criticizes.**

*Reply.* This is the strongest objection and it is not fully answerable. The
partial answer is that this note offers a **diagnostic**, not an ethic: it claims
to describe how a relation fails, not what anyone ought to do. Used as an ethic —
"the relation is complete, the cells are both at **t**, we are finished" — it
would be exactly the justice-orientation care ethics objects to, and it would be
worse than the bureaucratic forms it was meant to critique, because it would
wear the vocabulary of relation while doing the work of audit. I do not have a
mechanism that prevents that misuse, and I record the risk as real.

**O4. The corpus's cells are `E × Π × E` — entity, predicate, entity. But
"caring about" and "taking care of" characteristically take a *need* or a
*situation* as object, not a person. The formalism does not fit.**

*Reply.* Conceded, and it is a real limitation rather than a detail. Tronto's
first two phases are about needs; only the third and fourth are person-to-person.
Making `⟨a, takes-responsibility-for, x⟩` work requires either reifying needs as
entities in `E` — which has consequences for the equivariance hypothesis and is
not free — or a higher-order construction the corpus does not have. §3 is
therefore secure for phases three and four and shaky for one and two, and the
two-witness requirement, which is the useful part, lives entirely in three and
four.

**O5. §4's "non-projecting record" is naive. Institutions produce cases because
cases are what institutions can act on.**

*Reply.* Correct, and it is the essay's own point. The suggestion in §4(iii) is
offered as *what the formalism entails*, not as *what anyone should implement*.
An institution that retained the object coordinate on every assessment would have
records it could not aggregate, and aggregation is what the institution is for.
That is the collision restated at the level of data structure, which may be the
most useful place to see it, and is not a solution to it.

## 8. Directions

1. **Decide the needs question (O4).** Either reify needs as entities and pay the
   equivariance cost, or restrict the formalization to phases three and four and
   say so in the glossary.
2. **Write the care-ethics glossary term.** It is currently one sentence, and
   the essay's material would fill it without any of this note's proposals.
3. **Move the essay out of triage.** It is finished work with page-numbered
   citations sitting in a backlog, and nothing links to it.
4. **Check §4 against the equivariance theorem's hypotheses.** The four-generator
   result assumes `Sym(E)`-equivariance with `|E| ≥ 3`; whether an institutional
   entity set satisfies it is not obvious and the identification depends on it.
5. **Look for the two-witness requirement elsewhere.** If it is the right shape
   for care, it is plausibly the right shape for consent, for teaching, and for
   the estate's own agent relations — all of which are relations whose completion
   is conventionally read from one side only.

## 9. Sources

Working references from assistant knowledge; verify quotations and editions
before public use. The page-numbered quotations in §1 are reproduced from the
estate's own essay and should be checked against it and against the editions.

- Noddings, Nel. *Caring: A Feminine Approach to Ethics and Moral Education*
  (California, 1984).
- Tronto, Joan C. *Moral Boundaries: A Political Argument for an Ethic of Care*
  (Routledge, 1993); *Caring Democracy: Markets, Equality, and Justice* (NYU,
  2013).
- Fisher, Berenice, and Joan Tronto. "Toward a Feminist Theory of Caring" (1990)
  — the phase scheme's origin.
- Held, Virginia. *The Ethics of Care: Personal, Political, and Global* (Oxford,
  2006).
- Gilligan, Carol. *In a Different Voice* (Harvard, 1982).
- Foucault, Michel. *Surveiller et punir* (1975); *Histoire de la sexualité I*
  (1976).
- Belnap, Nuel D. "A Useful Four-Valued Logic" (1977).
- Lawvere, F. W., on hyperdoctrines; Hermida and Jacobs on fibrations — the
  lineage the corpus's predication material declares.

### In-corpus references

- `lib/emsenn/.../philosophy-services-section/content/text/triage/care-ethics-and-the-confessional-apparatus.md` (the essay this note bridges)
- `lib/emsenn/.../math-services-section/content/text/glossary/terms/predication.md`
- `lib/emsenn/.../math-services-section/content/text/glossary/terms/predicate-category.md` (the four generator classes)
- `lib/emsenn/.../math-services-section/content/text/glossary/terms/settlement.md`
- `lib/emsenn/.../philosophy-services-section/content/text/glossary/terms/witnessing.md`
- `lib/emsenn/.../philosophy-services-section/content/text/glossary/terms/settlement.md` (the philosophy-voice counterpart)
- `lib/emsenn/.../philosophy-services-section/services/lakota-services-section/content/text/glossary/lakota/README.md` (the deference statement quoted in §5)
- `lib/emsenn/.../lakota-services-section/content/text/glossary/lakota/discharging/library/predicating/library/positing/library/settling/library/hacking/lakotaean-governance/philB/code/transformers/daily-recognition-firing.md` (the two-substrate contrast)
- `lib/emsenn/.../relationality-services-section/content/text/documents/articles/notes/2026/04/06/2026-04-06-note-on-state-change-as-passage-through-contestation.md` (the model for this note's form)
- `lib/emsenn/services/561-group/services/561-group-services-section/README.md`
