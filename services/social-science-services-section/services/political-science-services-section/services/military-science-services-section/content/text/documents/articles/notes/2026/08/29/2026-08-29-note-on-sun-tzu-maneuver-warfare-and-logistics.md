---
title: "Sun Tzu, Maneuver Warfare, and Logistics: Three Gaps Beside the Clausewitz Formalizations"
description: "A research survey of the strategic-theory literature the estate has formalized around but not through — Sun Tzu's shi, xing, and the qi/zheng pair; the maneuver-warfare tradition from Boyd's Patterns of Conflict through Lind and MCDP-1; and logistics as a structuring constraint after van Creveld — read against the three Clausewitz formalizations the corpus already holds (the friction triple, the intent quadruple, the campaign levels), with a locating finding: none of those three live in the military-science section, and two of them sit in a triage backlog."
date-created: 2026-08-29
date: 2026-08-29
type: research-note
in-service-of: lib/emsenn/services/561-group/services/science-services-section/services/social-science-services-section/services/political-science-services-section/services/military-science-services-section
name: 2026-08-29-note-on-sun-tzu-maneuver-warfare-and-logistics
authors:
  - claude-opus-5
keywords:
  - military-science
  - sun-tzu
  - maneuver-warfare
  - boyd
  - logistics
  - van-creveld
  - clausewitz
  - friction
  - intent
  - auftragstaktik
tags:
  - draft
status: research-survey
---

# Sun Tzu, Maneuver Warfare, and Logistics: Three Gaps Beside the Clausewitz Formalizations

## 0. What this note is, and a locating finding first

The estate holds three genuine formalizations of Clausewitzian concepts — a
friction triple, an intent quadruple, and the war/campaign/engagement level
stratification. They are careful, they carry propositions with proofs, and they
end with honest open-question lists. They are also the corpus's *entire*
engagement with strategic theory as formal object.

**Before anything else, a finding about where they are.** They are not in this
section, and two of the three are in a triage backlog:

- The friction triple:
  `.../philosophy-services-section/services/relationality-services-section/content/text/triage/friction.md`
- The intent quadruple:
  `.../relationality-services-section/content/text/triage/intent.md`
- The campaign levels:
  `.../social-science-services-section/services/sociology-science-services-section/services/work-science-services-section/content/text/glossary/terms/campaign.md`
  (a second, doctrinal-prose `campaign.md` sits at
  `.../work-services-section/services/governance-services-section/services/military-command-services-section/content/text/glossary/terms/campaign.md`)

Meanwhile the substantive martial prose corpus — 37 notes and 41 glossary terms
covering MDMP, JOPP, operational design, staff work, battle rhythm, after-action
review, Moltke, Huntington, Boyd, van Creveld — lives at
`.../work-services-section/services/governance-services-section/services/military-command-services-section/`,
and *this* section (military-science) holds fifteen files: one speculative note
on telekinetic metacombat, a two-line militarism topic, and a shipboard-crew
glossary.

So the martial material is split three ways — formal objects in a philosophy
triage backlog, doctrinal prose under work/governance, and a near-empty
military-science stub — and nothing routes between them. That is not this note's
problem to fix, but any reader looking for "the estate's military science" will
not find it where the tree says it should be, and this note says so rather than
pretending otherwise.

**Status.** Research survey. Not doctrine, not operational. Per
`lib/emsenn/services/561-group/services/561-group-services-section/README.md`:
"Do not infer operational status from a Markdown file's existence or from its
non-legacy location." Citations are working references from assistant knowledge;
verify quotations, editions, and pagination before public use.

**Grading.** `[established]` = a published external result or a standard reading
of a primary text. `[contested]` = genuinely disputed in the literature.
`[in-corpus]` = a formalization present in this repository today, cited by path.
`[proposal]` = a mapping I am offering, not one the sources state.

## 1. The formal spine the corpus already has

Restated so the rest of the note can lean on it. All three are `[in-corpus]`.

**The friction triple.** `𝓕 = (I, π, δ)` where `I` is an order settled at
issuance in the doubly-fixed fiber `H*_{t₀} = Fix(σ_{t₀}) ∩ Fix(Δ_{t₀})` —
settled both in meaning and in execution; `π : t₀ → t_n` is the application path,
a morphism in the history monoid inducing a restriction `π* : H_{t₀} → H_{t_n}`;
and `δ = d(π*(I), Fix(σ_{t_n}))` measures the drift. The defining condition is
`I ∈ H*_{t₀}` but `π*(I) ∉ H*_{t_n}` — **an order settled at issuance is no
longer settled at application.** The triple's own decomposition,
`δ = δ_fog + δ_resist + δ_chance`, splits the drift into an epistemic component
(the meaning-nucleus σ no longer fixes it), a material-organizational component
(the execution-nucleus Δ no longer fixes it), and a stochastic remainder. Its
Proposition 2 states that total long-run friction converges to a positive
constant rather than decaying to zero, which the note glosses as "the formal
analog of Clausewitz's claim that friction is the fundamental condition of
operations, not an accidental obstacle."

**The intent quadruple.** `𝓘 = (E, ρ, T, R)` — end-state, purpose, key tasks,
and a reconstruction function `R : Situation → 𝒫(Action)`. The file's thesis is
in its own description: "Intent is a reconstruction operator, not a goal." `T` is
"not an exhaustive task list but a prioritized enumeration of the actions
without which E cannot be reached"; `R` is "the functional core of intent …
more stable than any specific order." Its four invariants are reconstruction
rather than instruction, purpose-preservation, two-echelon legibility, and
hierarchical embedding.

**The campaign levels.** From the work-services `campaign.md`: "Clausewitz
distinguishes three levels: the war (political aim — indefinite), the campaign
(strategic aim — seasonal), and the engagement (tactical aim — immediate)."

Three things are notable about this spine. It is *Prussian-only*: the entire
formal apparatus derives from one tradition. It is *defensive*: friction and
intent are both about an order surviving contact, not about producing an effect.
And it has *no material term*: `δ_resist` names the material component and never
opens it. §§2–4 take those three in order.

## 2. Sun Tzu: what the corpus has, and what it does not

**What it has.** One file:
`.../intelligence-services-section/content/text/documents/articles/notes/sun-tzu.md`,
`type: person`, which frames Sun Tzu entirely as an intelligence theorist —
foreknowledge, the five-agent typology from chapter 13, deception — and appends
a "Limitations" section arguing that his framework "assumes a rational,
hierarchical adversary." There is no note on the *Art of War* as a work, and
none of the text's strategic vocabulary appears anywhere in the corpus.

**What the text actually contains**, in the concepts most relevant to a
formalizing estate `[established]`:

- **形 *xing*, disposition or form** (ch. 4). The army's shape — what can be seen
  and counted. Sun Tzu's claim is that the invincible is a matter of one's own
  disposition and the vulnerable of the enemy's, so that "one may know how to
  conquer without being able to do it." Disposition is a *state*.
- **勢 *shi*, strategic configuration or potential** (ch. 5). Notoriously hard to
  translate — Griffith renders it "energy," Ames "strategic advantage," Sawyer
  "strategic power," Jullien devotes a book to it (*La propension des choses*,
  1992). Its images are the round stone on a steep hill and the crossbow drawn to
  full. *Shi* is not force applied; it is potential *accumulated by position*, so
  that release requires little. Sun Tzu's decisive move: "the skillful commander
  seeks victory from *shi* and does not demand it of his subordinates."
- **奇正 *qi/zheng*, the extraordinary and the orthodox** (ch. 5). The *zheng*
  engages and fixes; the *qi* decides. Sun Tzu's point is combinatorial: the two
  "give rise to each other, in an endless cycle," and what is orthodox in one
  engagement is extraordinary in the next. The pair is *relational*, not a
  taxonomy of forces.
- **虚實 *xu/shi*, void and substance** (ch. 6). Attack where the enemy is empty;
  be formless so that the enemy must defend everywhere. The chapter's water
  metaphor — "water shapes its course according to the ground; the army
  manages its victory in accordance with the enemy" — is the source of the
  entire "surfaces and gaps" idiom §3 picks up.
- **Winning without fighting** (ch. 3): "to subdue the enemy without fighting is
  the acme of skill." The hierarchy — attack the enemy's plans, then his
  alliances, then his army, and cities last — is a *cost* argument, not a
  moral one.

**What the corpus's formalisms suggest, as proposals.**

> **Proposal (shi as a reading, not a move).** *Shi* is precisely what the
> estate's vocabulary calls a **reading over an accumulated disposition** rather
> than an act. It is computed from position and cannot be commanded. This is why
> Sun Tzu says the commander seeks victory *from* it and does not demand it of
> subordinates: demands are acts, and *shi* is not an act. The formal test that
> would distinguish this from mere metaphor: *shi* should be a function of the
> settled state alone, monotone under favourable position changes, and
> unaffected by any act that does not change position. `[proposal]`

> **Proposal (qi/zheng as the intent quadruple's T and R).** The *zheng* — the
> orthodox, the force that engages and fixes — is the intent quadruple's `T`,
> the enumerated key tasks. The *qi* is what `R` licenses: the actions the
> reconstruction function returns when the situation has deviated from what `T`
> anticipated. Sun Tzu's insistence that the two convert into each other is
> then the observation that `R`'s output becomes the next `T`. `[proposal]`

**Grading.** The characterizations of *xing*, *shi*, *qi/zheng*, and *xu/shi*
above are `[established]` as standard readings, with the caveat that *shi* is
`[contested]` in translation and interpretation — Jullien's efficacy-based
reading, Ames's, and Sawyer's differ materially, and any formalization must say
which it is formalizing. The two proposals are mine and are `[proposal]`.

**What is genuinely absent:** any treatment of the *Art of War* as strategic
theory rather than intelligence doctrine; the *Sunzi*'s relation to the later
*Wuzi*, *Weiliaozi*, and the *Six Secret Teachings*; and any engagement with the
comparative literature on Chinese and Clausewitzian strategy (Handel's *Masters
of War*, 3rd ed. 2001, is the standard comparison and is not cited anywhere).

## 3. Maneuver warfare: the corpus's largest martial gap

`rg` for `maneuver warfare`, `manoeuvre warfare`, and `Schwerpunkt` across the
live corpus returns **nothing**. Boyd is present as one note
(`.../military-command-services-section/.../notes/boyd-winning-and-losing.md`),
which makes the correct and unusual point that "orientation is not a step; it is
the continuously-updated model of reality that makes all other steps possible" —
and then stops. *Patterns of Conflict* is not treated. This is the biggest hole
in the martial corpus.

**The tradition, in brief** `[established]`:

- **John Boyd**, *Patterns of Conflict* (briefing, 1977–1986), *Organic Design
  for Command and Control* (1987), *The Essence of Winning and Losing* (1996),
  and the foundational essay *Destruction and Creation* (1976). The OODA loop is
  the famous artifact and the least interesting part; Boyd's actual claims are
  (a) that *orientation* — shaped by genetic heritage, cultural tradition,
  previous experience, and new information — governs observation and decision
  both, so the loop is not a cycle of equal steps; (b) that the operative
  advantage is *relative tempo* — generating a rapidly changing environment
  faster than the adversary can orient to it, thereby "folding the adversary
  back inside himself"; and (c) the **EBFAS** climate for making that possible:
  *Einheit* (mutual trust), *Behendigkeit* (agility), *Fingerspitzengefühl*
  (fingertip feel), *Auftrag* (mission), *Schwerpunkt* (focus of effort).
- **William S. Lind**, *Maneuver Warfare Handbook* (1985), which popularized the
  attrition/maneuver distinction and the **surfaces and gaps** heuristic:
  reconnaissance-pull rather than command-push, flow around hard points, exploit
  through soft ones.
- **USMC**, *Warfighting* (FMFM-1, 1989; MCDP-1, 1997) — the doctrinal
  crystallization, and the source of the estate-relevant claim that command
  should be exercised through mission-type orders because the tempo advantage
  is unattainable under detailed control.
- **Auftragstaktik** proper, the nineteenth-century Prussian practice
  (Moltke the Elder; and see Oetting, *Auftragstaktik*, 1993) which the estate
  *has* formalized — in `intent.md` and in
  `.../governance-services-section/content/text/glossary/terms/judgment.md`,
  where it appears as "the operational doctrine for judgment under friction."
  The military-command section carries it only as a bare alias keyword in
  `mission-command.md`.

**The critical literature matters here** `[contested]`. The attrition/maneuver
dichotomy is not accepted as a description of real operations; the standard
objections are that no competent force has ever pursued attrition as a *theory*,
that the dichotomy flatters the maneuverist by construction, and that the
historical cases (Bewegungskrieg 1940, Desert Storm) are heavily
over-determined. Any estate adopting maneuverist vocabulary should adopt the
criticism with it.

**The proposal this note offers.**

> **Proposal (tempo as differential settlement rate).** Boyd's tempo advantage
> is a claim about *relative rate of settlement*. Each side's decision cycle
> ends when its picture of the situation stops changing — reaches quiescence. If
> A's settlement reaches quiescence faster than B's, then B is acting on a
> settled reading of a state that has already been superseded: B's acts are
> well-formed against a stale fiber. "Getting inside the loop" is exactly this,
> and it needs no metaphor.
>
> And the friction triple supplies what determines the cycle time: `δ` is the
> drift accumulated along the application path `π`, so the length of `π` — the
> number of echelons an order traverses — is the term Boyd's climate factors
> attack. *Auftragstaktik* shortens `π` by moving the reconstruction to the
> point of execution: `R` is evaluated where the situation is, rather than an
> instruction being transported to it. That is the friction triple and the
> intent quadruple saying, together, exactly what Boyd said, and neither file
> notices. `[proposal]`

The estate has a settling-bound and regime apparatus
(`.../obsmetrological-services-section/lib/obsmetrologia/Obsmetrologia/Closure/Regime.lean`
and the settlement-order material in the math section) that would let this
proposal be made precise rather than suggestive. Nobody has connected them.

## 4. Logistics: the material term nobody opened

The corpus has one theory treatment,
`.../military-command-services-section/content/text/documents/articles/notes/van-creveld-supplying-war.md`,
which states the thesis correctly — "logistics as a structuring constraint
rather than a support function: what can be moved, fed, repaired, and
coordinated determines what can be attempted" — plus a Berlin airlift
operations note. There is **no logistics glossary term**.

**The literature** `[established]`:

- **Martin van Creveld**, *Supplying War: Logistics from Wallenstein to Patton*
  (1977; 2nd ed. 2004). Its revisionist core is that the magazine system was
  never the constraint historians assumed, that armies before railways lived
  overwhelmingly off requisition and could not be fed from depots at any useful
  distance, and — the famous chapter — that the 1944 pursuit across France
  failed on tonnage and truck-miles rather than on generalship. His general
  claim is that the *feasible* set of operations is set by supply before it is
  set by intent.
- **George C. Thorpe**, *Pure Logistics* (1917), the first attempt to give
  logistics a theory of its own rather than a place in someone else's.
- **Henry E. Eccles**, *Logistics in the National Defense* (1959), which
  introduced the strategic/operational/tactical stratification of logistics and
  the notion of the "logistic snowball."
- The tooth-to-tail ratio literature, and the standard modern statement that
  logistics is the binding constraint on *duration* rather than on *effect*.

**The proposal.**

> **Proposal (levels stratify by time constant, and logistics sets the middle
> one).** The corpus's campaign levels — war (indefinite), campaign (seasonal),
> engagement (immediate) — are already stated in terms of *time horizon*. Read
> them as a stratification by the time constant of the binding constraint: the
> engagement is bounded by what can be done before the situation changes, the
> war by political duration, and the campaign — the middle, the one that is hard
> to define and that the `campaign.md` entry needs four properties to pin down —
> is bounded by **resupply period**. That is why it is seasonal: the season *is*
> the logistic cycle.
>
> If that is right, the campaign level is not a convention. It is where the
> logistic time constant sits, and it moves when the logistics move — which is
> van Creveld's whole argument about railways, and later about trucks.
> `[proposal]`

> **Proposal (logistics is δ_resist, opened).** The friction triple's
> `δ_resist` is defined as the execution-nucleus failing to fix the transported
> order: `Δ_{t_n}(π*(I)) ≠ π*(I)`. That is exactly "the order specifies an act
> the force cannot materially perform at `t_n`." Logistics is not a separate
> subject from friction; it is the content of one of friction's three terms, and
> the friction file leaves it unopened. `[proposal]`

## 5. What else is missing, briefly

- **Jomini** — zero hits corpus-wide, which is odd given that Moltke and
  Huntington both have notes. Whatever one thinks of the *Précis de l'art de la
  guerre* (1838), the interior-lines and decisive-point apparatus is the direct
  ancestor of the operational-art vocabulary the military-command section uses
  heavily, and its absence leaves that vocabulary ungrounded.
- **Morale** — zero hits in any martial section. Given that Clausewitz devotes
  Book III to moral factors and calls them the most important, and that the
  estate has an entire affect apparatus elsewhere, this is a strange gap. It is
  taken up directly in the companion note on the martial and affect corpora.
- **Fog of war** as a term. `δ_fog` exists in the friction triple; there is no
  glossary entry, and the military-command Clausewitz note handles it in one
  bullet.
- **Corbett and the maritime tradition**, which matters because the estate's
  military-science glossary is entirely shipboard vocabulary (`captain`,
  `first-officer`, `outpost`, `ship`) with no maritime *strategic* theory
  attached to it.

## 6. What this note does not claim

- No operational status, and no doctrine. This is a survey.
- It does not claim the estate should adopt maneuver-warfare doctrine. §3
  deliberately carries the standard criticism of the attrition/maneuver
  dichotomy, and an estate that adopted the vocabulary without the criticism
  would be worse off than one that adopted neither.
- It does not formalize anything. Every mapping in §§2–4 is marked `[proposal]`
  and none has been checked against the Lean corpus or against the friction and
  intent files' own proof obligations.
- It does not relocate or reorganize the martial material. §0 reports where
  things are; deciding where they should be is an ownership question, not a
  research one.
- The Sun Tzu readings are from the received scholarship, and *shi* in
  particular is a term where translations disagree substantively. Nothing here
  should be built on without picking a reading and saying so.

## 7. Directions

1. **Open `δ_resist`.** The friction triple names the material term and leaves
   it opaque. Van Creveld supplies the content. This is the single most
   tractable next piece.
2. **Check the tempo proposal against the regime machinery.** §3's differential
   settlement-rate claim is either a real statement about settling bounds or a
   pun. The Lean regime material would decide it.
3. **Write the *Art of War* as a work-note**, separate from the intelligence
   person-note, with a declared translation.
4. **Add a logistics glossary term**, and a morale one; the second is the
   subject of the companion note.
5. **Decide where military science lives.** Three-way splits between a triage
   backlog, a governance subtree, and a near-empty section are a routing
   failure, and a reader cannot find the corpus's actual strategic theory.

## 8. Sources

Working references from assistant knowledge; verify quotations, translations,
and editions before public use.

- Sunzi. *Sunzi bingfa* (*The Art of War*). Translations differ materially;
  principal English versions: Griffith (1963), Ames (1993), Sawyer (1994),
  Minford (2002), Mair (2007).
- Jullien, François. *La propension des choses: pour une histoire de
  l'efficacité en Chine* (1992) — the standard treatment of *shi*.
- Handel, Michael I. *Masters of War: Classical Strategic Thought*, 3rd ed.
  (2001) — the standard Clausewitz/Sun Tzu comparison.
- Clausewitz, Carl von. *Vom Kriege* (1832); Howard and Paret tr. (1976).
- Boyd, John R. *Destruction and Creation* (1976); *Patterns of Conflict*
  (briefing, 1977–1986); *Organic Design for Command and Control* (1987);
  *The Essence of Winning and Losing* (1996). Secondary: Osinga, *Science,
  Strategy and War: The Strategic Theory of John Boyd* (2007) — the best
  scholarly treatment.
- Lind, William S. *Maneuver Warfare Handbook* (1985).
- US Marine Corps. *Warfighting*, FMFM-1 (1989), MCDP-1 (1997).
- Oetting, Dirk W. *Auftragstaktik: Geschichte und Gegenwart einer
  Führungskonzeption* (1993).
- van Creveld, Martin. *Supplying War: Logistics from Wallenstein to Patton*
  (1977; 2nd ed. 2004).
- Thorpe, George C. *Pure Logistics: The Science of War Preparation* (1917).
- Eccles, Henry E. *Logistics in the National Defense* (1959).
- Jomini, Antoine-Henri. *Précis de l'art de la guerre* (1838) — listed as the
  named absence.

### In-corpus references

- `lib/emsenn/.../philosophy-services-section/services/relationality-services-section/content/text/triage/friction.md`
- `lib/emsenn/.../philosophy-services-section/services/relationality-services-section/content/text/triage/intent.md`
- `lib/emsenn/.../social-science-services-section/services/sociology-science-services-section/services/work-science-services-section/content/text/glossary/terms/campaign.md`
- `lib/emsenn/.../work-services-section/services/governance-services-section/services/military-command-services-section/content/text/documents/articles/notes/boyd-winning-and-losing.md`
- `lib/emsenn/.../military-command-services-section/content/text/documents/articles/notes/van-creveld-supplying-war.md`
- `lib/emsenn/.../military-command-services-section/content/text/documents/articles/notes/clausewitz-on-war.md`
- `lib/emsenn/.../governance-services-section/services/intelligence-services-section/content/text/documents/articles/notes/sun-tzu.md`
- `lib/emsenn/.../governance-services-section/content/text/glossary/terms/judgment.md` (the Auftragstaktik formalization)
- `lib/emsenn/services/561-group/services/561-group-services-section/README.md` (the operational-status caveat)
