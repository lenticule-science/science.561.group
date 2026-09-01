---
title: "The Unbuilt Affects: Hope, Stickiness, Reading Posture, Vertigo"
description: "Formalization sketches for the affects the 2026-06-25 frontier register queued and nobody built — Ahmed's affective stickiness, Sedgwick's paranoid and reparative positions, Massumi's autonomy of intensity, Caillois's ilinx — plus the four the register never named at all: hope, joy, courage, love. Each sketch is stated against the modules that actually exist (affect.mts's Tomkins gradient, genre.mts's Berlant impasse, the metrologic bilattice Charge, the feltos and TAB affordance reads) and graded honestly. The central proposal: hope is the refusal of the ⊥→f collapse where a resolving continuation exists, which makes Aquinas's despair and presumption the two premature settlements of the same cell."
date-created: 2026-08-29
date: 2026-08-29
type: research-note
in-service-of: lib/emsenn/services/561-group/services/science-services-section/services/engineering-science-services-section/services/computer-science-services-section
name: 2026-08-29-note-on-the-unbuilt-affects
authors:
  - claude-opus-5
keywords:
  - affect-theory
  - ludics
  - playing
  - hope
  - ahmed
  - sedgwick
  - massumi
  - ilinx
  - caillois
  - bilattice
  - affordance
tags:
  - draft
status: proposal
---


## 0. What this note is, and how it grades

On 2026-06-25 a frontier register catalogued the affect and dramaturgy theory
the play substrate was "nakedly asking for"
(`.../computer-science-services-section/content/text/documents/articles/notes/2026/06/25/2026-06-25-affect-and-dramaturgy-in-play.md`;
science mirror at
`.../sociology-services-section/content/text/documents/articles/notes/2026/06/25/2026-06-25-survey-of-affect-theory-and-dramaturgy-over-the-play-substrate.md`).
It marked two items **(FIRST CUT)** and endorsed them; both were built. It marked
four more **(queued)** and two **(catalogued, deferred)**; none of those were.
Fourteen months of the register's own vocabulary is still sitting unspent, and
its closing line — "The formal half exists; the felt half (the affect-arc read
off a chronicle, and the impasse) is the gap" — has been half answered.

This note is the attempt at the other half. It is a **proposal**, not a build and
not doctrine. Per
`lib/emsenn/services/561-group/services/561-group-services-section/README.md`:
"Do not infer operational status from a Markdown file's existence or from its
non-legacy location." Nothing below is running. Where it names a module it names
one that exists today; where it proposes a definition it says so.

**Grading**, following the vocabulary the obsmetrological notes established
(2026-08-22, `note-on-persistent-worlds-and-the-unclosed-arena`) and the
critical-theory companions note (2026-08-23):

- **[established]** — a published external result, read directly.
- **[module]** — names a module that exists in this repository today.
- **[target]** — a proposed formalization, small enough to build, with its
  falsification path stated.
- **[conjecture]** — a proposed claim whose shape I believe but whose
  construction I have not checked.
- **[reading]** — an interpretive mapping, not a formal claim.
- **[rhyme]** — a structural resonance I am proposing, not present in the source.

Nothing here is claimed as a theorem.

## 1. What was built, and what was not

**Built** [module]:

- `.../multi-agent-computer-system-engineering-services-section/apps/playing/src/affect.mts`
  — the Tomkins reading. Its own header is honest about scope: "it maps the
  chronicle's stimulation profile to seven of Tomkins' nine affects. The two
  rejection affects (disgust, dissmell) are content-directed, not
  gradient-driven, and are reserved." The gradient logic reads `onset`, `peak`,
  `buildup = peak − onset`, whether the profile `fell`, and whether the last
  action was a `daimon` (`surrender`), then dispatches to one of
  `{interest, enjoyment, surprise, distress, fear, anger, shame}`.
- `.../apps/playing/src/genre.mts` — Berlant's impasse, built as
  `impasse: plays > 0 && resolving === 0`, where `resolves(c)` holds iff the
  chronicle's last action is not a daimon. Its header states the reading:
  "cruel optimism formalized: a frame you keep playing because it lets you
  neither win nor leave, only surrender-and-continue."
- `.../apps/playing/src/caillois.mts` and
  `.../apps/gaming/src/structuring/concurrent-game/with-symmetry/reading/regime.mts`
  — the full agon/alea/mimicry/ilinx quadrant, at chronicle and arena level
  respectively.
- `.../apps/playing/src/dramaturgy.mts` — Diderot, Goffman, Rancière, Debord.

**Not built.** Massumi survives as two comment lines in `dramaturgy.mts`
("Diderot ≡ Massumi's autonomy of affect"), with no function. Sedgwick appears
in no live code. Ahmed appears in no live code — her only corpus citation is a
CSL entry (`ahmed2004`) in
`.../sociology-services-section/content/text/documents/articles/notes/2026/06/27/2026-06-27-research-on-performance-and-affect-theory-for-agentic-autonomy.md`.
Lyotard was deferred by name.

**Never named at all**, in the register or anywhere in the affect code: hope,
joy, courage, love.

## 2. The structural diagnosis

The gap is not a list of missing names. It has a shape, and the shape is legible
in one line of `affect.mts`:

```ts
const POSITIVE: ReadonlySet<AffectName> = new Set<AffectName>(["interest", "enjoyment"]);
```

with `valenceOf` returning `"negative"` for anything not in `POSITIVE` or
`NEUTRAL`. Two positives, one neutral, six negatives — and the two positives are
themselves gradient artifacts: `interest` fires on a moderate rise,
`enjoyment` on a fall (relief). That is faithful to Tomkins, and it is exactly
Tomkins's own known limitation as a base for a full affect vocabulary.

The deeper constraint is the reading's domain. Every affect the corpus can
currently name is a function of **one chronicle's branching profile**. That
gives it no access to three things:

1. **The prospective.** A gradient is a history. Hope, dread, and anticipation
   are about what is still open, and the corpus's own carrier for "still open"
   — the knowledge-order bottom ⊥ — is not consulted by `affect.mts` at all.
2. **The cross-play.** Ahmed's stickiness, and anything that deserves the word
   love, accumulate *across* chronicles at a locus. `affect.mts` sees one
   chronicle and forgets it.
3. **The postural.** Sedgwick's contribution is that the same material yields
   different affect depending on how it is *read*. The corpus has exactly one
   reading and treats it as the fact.

Each proposal below targets one of these three. The register anticipated all
three without saying so: Ahmed's item is the cross-play axis ("memory across
plays"), Sedgwick's the postural axis ("two *stances* toward a game"), and the
prospective axis is the one nobody named — which is why hope is missing.

## 3. Hope as the refusal of the ⊥→f collapse

This is the note's central proposal and the one I think is right.

**The wrong version first.** The obvious dual of `genre.mts`'s impasse is: an
impasse has `resolving === 0`, so hope is `resolving > 0`. This is wrong, and
usefully wrong. It makes hope a property of a genre rather than of a position,
and it makes hope a settled fact — the resolving play either exists or it does
not, and once you know which, there is nothing left to feel. Hope is not a
reachability query.

**The right version.** Aquinas's object of hope is the *bonum futurum arduum
possibile* — a future good, difficult, and possible — and, as the philosophy
section's 2026-08-23 note on abandonment, acedia, and the whirl works out at
length, he identifies **two** opposed vices, not one: despair treats the open
future as settled loss; presumption treats it as settled possession. That note's
thesis, in its own words: "despair and presumption are the two premature
settlements of what is constitutively undetermined — the same closure, performed
in opposite directions — and hope is not a third judgment but the virtue of
*withholding* the closure."

The corpus already has a name for one of those two closures. The critical-theory
companions note (2026-08-23,
`.../critical-theory-services-section/content/text/documents/articles/notes/2026/08/23/2026-08-23-note-on-formal-companions-to-the-affect-and-pedagogy-notes.md`)
calls it the **⊥→f collapse**: "a cell at *told-nothing* processed as
*told-false*." So:

> **Proposal (hope).** Let `π` be a position — a chronicle prefix — in a genre
> `G`. Let `H(G, π)` be the set of chronicles in `G` that extend `π` and
> resolve. Then hope obtains at `π` iff
>
> 1. `H(G, π) ≠ ∅` — a resolving continuation exists (Aquinas's *possibile*);
> 2. no member of `H(G, π)` is reachable without further play — the outcome cell
>    is at ⊥, not at **t** (Aquinas's *futurum*; and this is what rules out
>    presumption);
> 3. the ⊥ is *held* — the reading does not collapse it to **f** (this is what
>    rules out despair).
>
> Difficulty (*arduum*) is then a magnitude on the same object: the ratio of
> resolving to total continuations at `π`, or the length of the shortest
> resolving continuation.

The payoff is that this makes the two failure modes the two collapses of one
cell, in exactly the corpus's own vocabulary, without inventing anything:

| | knowledge-axis disposition of the outcome cell |
|---|---|
| Despair | ⊥ → **f** (the collapse the companions note names) |
| Presumption | ⊥ → **t** |
| Hope | ⊥ held |
| Impasse (Berlant) | `H(G, π) = ∅` for every `π` — condition 1 fails everywhere |

And it gives Berlant's impasse a precise relation to Aquinas that neither source
states: **the impasse is not despair.** In an impasse, condition 1 genuinely
fails — there is no resolving play — so treating the cell as **f** is not a
premature settlement, it is correct. What makes cruel optimism cruel, on this
reading, is that the participant holds ⊥ where the structure warrants **f**:
it is *hope in a genre that has none*, which is formally the mirror of despair
rather than its cure. [conjecture, and the sharpest thing in this note]

**Grade: [target].** The construction is small — `genre.mts` already computes
`resolves` and already iterates chronicles; the missing pieces are a prefix
parameter and a ⊥-valued outcome cell that `affect.mts` does not currently
consult. **Falsification path:** if the corpus's chronicles are always
finite and fully enumerable at read time, then condition 2 never holds — the
outcome is always already determined and ⊥ never occurs, which would make hope
vacuous in this substrate and would mean the object needs the unclosed arena
(the growing, non-maximal event structure the 2026-08-22 obsmetrological note
files as its open obligation) before it can exist at all. That is a real risk
and it is the first thing to check.

## 4. Ahmed's stickiness as charge accumulating on loci

Sara Ahmed, *The Cultural Politics of Emotion* (2004), argues that emotions do
not reside in subjects or in objects but **circulate**, and that through
circulation certain objects become **sticky** — "saturated with affect, as sites
of personal and social tension." Her "affective economies" essay (*Social Text*,
2004) presses the analogy: affective value accumulates through movement, the way
capital does, and the more a sign circulates the more affective it becomes. The
crucial negative claim: stickiness is **not a property of the object**. It is a
residue of the object's history of contact.

The register saw this and said where it goes: "a charge field over the locus
tree with memory across plays (neither the payoff nor a single chronicle
captures it)."

The estate has the carrier already. From the metrologic bilattice
(`.../obsmetrological-services-section/apps/metrologic/bilattice/src/charge.mjs`)
[module]:

```js
// A charge is `{ value: [a₊, a₋], evidence: [pos-witnesses, neg-witnesses] }`
```

with `joinKnowledge` taking the pointwise OR of values and the **union** of
evidence, and the module's own note that "every op ACCUMULATES witnesses, never
discards, so ⊤ ('told both') is reachable."

> **Proposal (stickiness).** Define a locus-indexed charge field
> `σ : Locus → Charge`, updated after each chronicle by knowledge-join of the
> charges the chronicle deposits at each locus it visits. Then:
>
> - the **value** `σ(ℓ).value` is what the object is taken to be;
> - the **stickiness** of `ℓ` is `|σ(ℓ).evidence[0]| + |σ(ℓ).evidence[1]|` — the
>   size of the accumulated witness set, *not* the value;
> - a locus at ⊤ with a large evidence set is Ahmed's genuinely ambivalent
>   object: heavily contacted, contested in both directions, and impossible to
>   resolve by looking at it.

The formal payoff is exact: Ahmed's negative claim — stickiness is not a
property of the object — becomes the observation that `value` and `evidence` are
*separate fields of the carrier*, and that stickiness reads only the second. Two
loci can have identical `value` and wildly different stickiness. The corpus's
own carrier already enforces the distinction Ahmed had to argue for. [rhyme]

**Grade: [target] for the construction, [rhyme] for the correspondence.**
**Falsification path:** `joinKnowledge` is monotone and never discards, so
stickiness on this definition can only increase. Ahmed's affective economies
plainly include *un*-sticking — objects losing their charge, signs going cold.
A monotone accumulator cannot model that. The available repair is the
presentation/settlement split filed as an open obligation elsewhere in the
corpus (see the 2026-08-22 unclosed-arena note §3, and the companion note on
presentation-layer formalization): the underlying evidence log stays monotone
while a *presentation* over it decays or windows. That repair is not free and it
is not built.

## 5. Sedgwick's two positions as two readings over one fiber

Eve Kosofsky Sedgwick's "Paranoid Reading and Reparative Reading, or, You're So
Paranoid You Probably Think This Essay Is About You" (in *Touching Feeling*,
2003; first as the introduction to *Novel Gazing*, 1997) is the piece the
register queued as "two *stances* toward a game."

Sedgwick takes both terms from Melanie Klein and insists on Klein's own framing:
these are **positions**, not personality types — "changing and heterogeneous
relational stances" that a reader moves between. Her characterization of the
paranoid position: it is *anticipatory* ("there must be no bad surprises"),
*reflexive and mimetic* (it becomes what it fights), it is a **strong theory**
in Tomkins's sense (it explains ever more with ever less), it is *faith in
exposure*, and it *places its faith in demystification*. The reparative
position, by contrast, is *additive and accretive*, it seeks to assemble
resources to nourish a self, and — this is her sharpest point — it is the
position that can *tolerate a good surprise*, because it has not organized
itself around forestalling a bad one. Her critique is not that paranoid reading
is wrong; it is that it has become the only reading recognized as rigorous.

> **Proposal (reading posture).** A posture is a pair (order privileged,
> disposition of ⊥):
>
> - **Paranoid posture.** Reads on the **truth order** ≤ₜ; treats ⊥ as
>   *f-pending-exposure*, i.e. performs the ⊥→f collapse as a matter of method
>   ("absence of evidence, in a system built to hide evidence, is evidence").
>   Minimizes the worst case. Its formal signature is that it is *closed under
>   suspicion*: adding any negative witness changes the reading, adding a
>   positive one does not.
> - **Reparative posture.** Reads on the **knowledge order** ≤ₖ; holds ⊥ open;
>   accumulates. Its signature is monotonicity in evidence regardless of sign —
>   it is exactly `joinKnowledge`, which is why §4's stickiness field is a
>   reparative object.
>
> Same fiber, same witnesses, two readings.

**On the corpus's own pair.** The qtOps architecture specification (read-only
here, and by its own README "Proposed. Nothing in this section is running yet")
proposes two output modes of one governance loop: *affect routing* — "append a
derived 'what this contradiction feels like' cell beside the untouched ⊤" — and
the *symbolic-violence view* — "a role-scoped read that suppresses one face,
history intact and recoverable." Read through Sedgwick, these are not two
features. They are the reparative and paranoid dispositions of the same ⊤ cell:
one adds beside the contradiction and keeps it; the other suppresses a face to
manage what would otherwise be seen. That the specification pairs them under one
regime dial is, on this reading, correct — Sedgwick's whole point is that the
positions alternate rather than compete — and the specification's own warning
that the violence-view is "illegitimate the moment it touches the record" is
precisely the constraint that keeps a paranoid read from becoming a paranoid
*settlement*. [reading]

**Grade: [reading] for the qtOps correspondence, [target] for the posture pair.**
**Falsification path:** the posture pair is only interesting if the two readings
can disagree on a case where both are defensible. If every ⊥ in practice
resolves the same way under both orders, the distinction is decorative. Someone
should construct the disagreeing case before anyone builds this.

## 6. Ilinx as affordance-set churn

The ludics glossary entry
(`.../ludics-services-section/content/text/glossary/terms/ilinx.md`) states the
problem plainly: "Ilinx is the least common category in traditional game studies
because it maps poorly onto rule systems and mechanics. You can't easily
formalize the experience of vertigo the way you can formalize competition or
chance."

`caillois.mts` then formalizes it anyway, as a categorical read — its test names
it "surrender × make-believe — carried AND no result: the play that unmakes the
player." That is a real formalization and I am not proposing to replace it. But
it is a read of a *completed* chronicle, and Caillois's own description is of
something happening *during* play: ilinx consists, he writes, in "an attempt to
momentarily destroy the stability of perception and inflict a kind of voluptuous
panic upon an otherwise lucid mind" (*Les jeux et les hommes*, 1958). The
operative words are *stability of perception*.

The corpus has three affordance formalisms [module]:

- `.../apps/feltos/src/predication.mjs` — `affordances(world, actor, target)`,
  a frozen sorted set gated on perception;
- the TAB `affording` module — an affordance as
  `{ verb, object, message: {predicate, object}, why }`, with the doctrine "the
  available actions are COMPUTED, not listed — whatever messages produce non-⊥
  when composed with nearby fibers" (in `lib/legacy/`, and therefore per the
  qtOps README's inheritance note a *semantic reference to re-verify*, not
  trusted code);
- the qtOps affordance-computation specification (proposed, not built).

> **Proposal (ilinx as churn).** For an actor `a` with affordance set `A_t` at
> step `t`, define the churn
>
> `χ_t = |A_t △ A_{t−1}| / |A_t ∪ A_{t−1}|`
>
> (symmetric difference over union — the Jaccard distance between successive
> affordance sets). Ilinx is a *sustained high χ*: the condition in which the
> actor cannot predict what they will be able to do next.

That is what loss of footing is. Not that you fell — that the ground stopped
being the kind of thing you could stand on. It reads during play rather than
after it, it needs no outcome, and it is computable from a module that already
exists.

**Grade: [conjecture].** **Falsification path, and it is serious:** every game's
opening has high affordance churn, and openings are not vertiginous. The
proposal therefore needs churn measured *relative to the actor's expectation*
rather than absolutely — surprise, not change — which requires an observer model
the corpus does not have. Until that exists, χ is a measure of turbulence, not
of vertigo, and calling it ilinx would be an overclaim. I am naming the gap, not
closing it.

## 7. Joy, courage, love — three thinner sketches

Honesty about relative quality: §3–§6 are proposals I would defend. These three
are weaker, and get shorter treatment because they deserve it.

**Joy.** Brian Massumi, *Parables for the Virtual* (2002), separates **affect**
(intensity — unqualified, autonomous, not owned by a subject or a story) from
**emotion** (intensity captured, qualified, narrativized, made personal). The
register's gloss: "a magnitude on the cut autonomous from the outcome." Note
that `affect.mts` already assigns `enjoyment` to a *falling* gradient — which is
relief, not joy. So:

> **Proposal.** Joy is positive intensity *decoupled from* the outcome: a
> chronicle whose affect reading is positive and whose payoff reading is
> indifferent or absent. Formally checkable, because both readings exist.

This has the merit of distinguishing joy from winning, which is the whole point
of Massumi's autonomy claim, and of explaining why `enjoyment`-as-relief cannot
serve. [conjecture]

**Courage.** Aristotle, *Nicomachean Ethics* III.6–9: *andreia* is the mean
concerning fear and confidence, and — the part usually dropped — the courageous
person acts *for the sake of the noble*, knowing the danger, and had an
alternative. Aristotle is explicit that the person with no option is not
displaying courage.

> **Proposal.** Courage is the selection, from an affordance set, of an
> admissible act whose forecast settlement is adverse, *when an admissible
> non-adverse act is also in the set*. The alternative-exists clause is not
> decoration; without it the definition returns necessity, which is Aristotle's
> own objection.

This needs an affordance set (exists) and a settlement forecast (does not).
[target, blocked on the forecast]

**Love.** This is the one the corpus most conspicuously lacks and the one I am
least able to give. The best available construction is §4's stickiness plus
note 1's renewal reading
(`.../sociology-services-section/content/text/documents/articles/notes/2026/08/29/2026-08-29-note-on-sociality-sociability-and-parasociality.md`,
§5): a locus-charge that persists across chronicles, *and* a disposition to
select renewal acts toward that locus rather than merely to receive them.

I want to mark clearly what that gets wrong. It is a behavioural proxy —
selection frequency toward a locus — and nobody means selection frequency. It
is also symmetric by construction, and the estate's own kinship theory says
that is the wrong shape: co-equal kinship
(`.../sociology-services-section/content/text/glossary/terms/co-equal-kinship.md`)
insists on "equality without symmetry," with obligations flowing differently
because the parties are differently positioned, and "this asymmetry is the
structure of the relation, not a deficiency to be corrected." A symmetric
dyadic accumulator gets that backwards. **[reading], and the weakest item in
this note.** I record it so the gap is named, not because the sketch is good.

## 8. What this note does not claim

- Nothing here is built, and nothing has operational status.
- It does not claim that formalizing an affect captures it. Every proposal above
  is a *reading over structure* in the register's original sense — semantics
  above the play base — and a reading can be adequate to its structure while
  saying nothing true about experience.
- It does not modify, propose modifications to, or assert anything about the
  qtOps section; §5 cites its published specification read-only and repeats that
  specification's own statement that nothing there is running.
- It does not touch the Tomkins reading. `affect.mts`'s seven affects are
  faithful to their source and the two reserved rejection affects are correctly
  reserved; the argument of §2 is that the gradient domain is too narrow for
  *other* affects, not that the gradient reading is wrong.
- The theology in §3 is borrowed from the philosophy section's 2026-08-23 note
  and is not re-derived here. That note owns the Aquinas and Pieper reading.

## 9. Directions

1. **Check whether hope is vacuous in this substrate.** §3's condition 2 needs a
   genuinely unsettled outcome cell. If chronicles are always fully enumerable,
   it fails, and hope waits on the unclosed arena.
2. **Build the stickiness field.** It is the smallest real build here: a
   `Locus → Charge` map updated by `joinKnowledge` after each chronicle. The
   decay question can be deferred by leaving it monotone and honest.
3. **Construct the Sedgwick disagreement case.** A single fiber and a single
   ⊥ on which the paranoid and reparative readings defensibly differ. If it
   cannot be constructed, drop §5.
4. **Get an observer model, or drop ilinx-as-churn.** §6 does not work without
   surprise-relative measurement.
5. **Do not build love.** §7's sketch is not good enough to implement, and
   implementing a bad formalization of love is worse than leaving the gap
   visible.
6. **Lyotard remains deferred**, as the 2026-06-25 register left him. The
   figural as *what deforms the locus tree rather than reading over it* is a
   different kind of object from everything above, and this note has not
   attempted it.

## 10. Sources

Working references from assistant knowledge; verify quotations and editions
before public use.

- Tomkins, Silvan S. *Affect Imagery Consciousness* (1962–1992), 4 vols.
- Berlant, Lauren. *Cruel Optimism* (Duke, 2011).
- Ahmed, Sara. *The Cultural Politics of Emotion* (Edinburgh, 2004);
  "Affective Economies," *Social Text* 22:2 (2004), 117–139.
- Sedgwick, Eve Kosofsky. "Paranoid Reading and Reparative Reading," in
  *Touching Feeling: Affect, Pedagogy, Performativity* (Duke, 2003); first
  published as the introduction to *Novel Gazing* (1997).
- Klein, Melanie. "Notes on Some Schizoid Mechanisms" (1946); "A Contribution to
  the Psychogenesis of Manic-Depressive States" (1935) — for the two positions
  Sedgwick borrows.
- Massumi, Brian. *Parables for the Virtual: Movement, Affect, Sensation* (Duke,
  2002); "The Autonomy of Affect," *Cultural Critique* 31 (1995).
- Caillois, Roger. *Les jeux et les hommes* (1958); *Man, Play and Games*, tr.
  Barash (1961).
- Aquinas, Thomas. *Summa Theologiae* II-II qq. 17–21 (hope, despair,
  presumption).
- Aristotle. *Nicomachean Ethics* III.6–9 (courage).
- Lyotard, Jean-François. *Discours, figure* (1971); *Économie libidinale*
  (1974) — deferred, listed for the record.

### In-corpus references

- `lib/emsenn/.../computer-science-services-section/content/text/documents/articles/notes/2026/06/25/2026-06-25-affect-and-dramaturgy-in-play.md` (the register this note answers)
- `lib/emsenn/.../sociology-services-section/content/text/documents/articles/notes/2026/06/25/2026-06-25-survey-of-affect-theory-and-dramaturgy-over-the-play-substrate.md` (its science mirror)
- `lib/emsenn/.../multi-agent-computer-system-engineering-services-section/apps/playing/src/affect.mts`
- `lib/emsenn/.../multi-agent-computer-system-engineering-services-section/apps/playing/src/genre.mts`
- `lib/emsenn/.../multi-agent-computer-system-engineering-services-section/apps/playing/src/caillois.mts`
- `lib/emsenn/.../multi-agent-computer-system-engineering-services-section/apps/playing/src/dramaturgy.mts`
- `lib/emsenn/.../math-services-section/services/obsmetrological-services-section/apps/metrologic/bilattice/src/charge.mjs`
- `lib/emsenn/.../multi-agent-computer-platform-engineering-services-section/apps/feltos/src/predication.mjs`
- `lib/emsenn/.../ludics-services-section/content/text/glossary/terms/ilinx.md`
- `lib/emsenn/.../philosophy-services-section/content/text/documents/articles/notes/2026/08/23/2026-08-23-note-on-abandonment-acedia-and-the-whirl.md`
- `lib/emsenn/.../critical-theory-services-section/content/text/documents/articles/notes/2026/08/23/2026-08-23-note-on-formal-companions-to-the-affect-and-pedagogy-notes.md` (the ⊥→f collapse)
- `lib/emsenn/.../sociology-services-section/content/text/documents/articles/notes/2026/06/27/2026-06-27-research-on-performance-and-affect-theory-for-agentic-autonomy.md` (the corpus's existing Ahmed citation)
- `lib/emsenn/.../obsmetrological-services-section/content/text/documents/articles/notes/2026/08/22/2026-08-22-note-on-persistent-worlds-and-the-unclosed-arena.md`
- `lib/emsenn/services/561-group/services/561-group-services-section/README.md` (the operational-status caveat)
