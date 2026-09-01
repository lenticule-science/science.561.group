---
title: "Diátaxis is the recurring FOUR: the documentation quartet as a bilattice of learning"
author: 561-group / RelMath
date: 2026-06-25
status: paper-I (formal witness green, axiom-free)
formal-witness: lean/RelMath/Positing/DiataxisFour.lean (`RelMath.Diataxis.diataxis_is_recurring_four`)
keywords: [diataxis, bilattice, Belnap four, Klein four-group, experiential learning, cognitive load, knowing-how, scaffolding, documentation theory]
---

# Diátaxis is the recurring FOUR

*The documentation quartet as a bilattice of learning*

## Abstract

Diátaxis (Procida) organises technical documentation into four modes — **tutorial,
how-to, explanation, reference** — on two binary axes (acquisition↔application,
action↔cognition). RelMath, our dependency-free Lean formalisation of the corpus,
proves a *recurring FOUR*: a single four-corner object met as articulation phase,
Belnap–Ginsberg bilattice charge, modal `{neither, ◇, □, both}`, and the predicate
generators, all conflated into one object by the keystone theorem
`quartet_recurrence`, and carrying a Klein-four symmetry `K₄ = ⟨~, −⟩`. This paper
argues — and *formally proves* — that **Diátaxis is not a documentation convention
laid over the mathematics; it is another incarnation of that same four-corner
object.** The bijection is forced by Diátaxis's own two axes: the documentation
coordinates `(application, cognition)` are exactly the articulation coordinates
`(token, claim)`. As a corollary, Diátaxis inherits the bilattice's two *graded*
orders, so the usual flat 2×2 is an under-description: the four modes carry a
**scaffolding/decontextualisation order** and an **actionability order**, and
Procida's two diagonals are the bilattice's two order-dualities. We ground each axis
in the public learning-science literature (Ryle's knowing-how/knowing-that,
Anderson's declarative/procedural memory, Sweller's cognitive-load and worked-example
effects, Kalyuga's expertise-reversal effect, Wood–Bruner scaffolding, Kolb's
experiential cycle) and exhibit an axiom-free Lean witness
(`RelMath.Diataxis.diataxis_is_recurring_four`). The result yields concrete,
falsifiable pedagogical predictions and a foundation for a sequel paper reading the
learning *cycle* as the closure dynamics on this bilattice.

---

## 1. The conjecture

The corpus already uses Diátaxis as a coverage discipline — every term, concept and
topic in the Blueprint graph should eventually carry the four Diátaxis surfaces
(`verso-docs/RelMathManual/PartVI/DiataxisCoverage.lean`). But it uses it as an
*overlay*: a documentation grammar chosen because it "matches the mathematics." The
conjecture here is sharper:

> **Conjecture (Diátaxis = FOUR).** The Diátaxis quartet is the *same* four-corner
> object that RelMath's `quartet_recurrence` exhibits as articulation phase,
> bilattice charge, modal four, and predicate generators — met once more, under
> documentation names, together with its full Klein-four symmetry.

"Same object" is meant literally, in the sense RelMath already uses for the other
faces: a bijection onto `Corner` that commutes with the structure each face carries
(§5–§7). This is the documentation analogue of the corpus's existing conflation
theorems `articulation_phase_is_charge` and `quartet_recurrence`.

The payoff is not taxonomic tidiness. It is that Diátaxis, transported onto the
bilattice, gains structure it is usually drawn without — two graded orders and a
duality group — and that structure makes contact with measured effects in the
cognitive science of instruction (§6, §8).

---

## 2. The recurring FOUR in RelMath

RelMath derives its mathematics as an inductive tree with no free data past the
articulating primitive. Two facts matter here.

**(2.1) The four-corner object.** Articulating an utterance records, for each of its
two sides, whether that side is yet articulated; the two binary statuses
`(token, claim)` give exactly four cells — `Corner = {potential, active, stable,
absurd}` (`RelMath/Articulating/ArticulationCell.lean`, `Corner.card_eq_four`).
Positing admits *value* on the very same four points: the **bilattice** of Belnap's
four truth values `{⊥ₖ, t, f, ⊤ₖ}` [Belnap 1977; Ginsberg 1988; Fitting 1991], with
two orthogonal bounded-lattice orders on one carrier —

- the **knowledge order** `≤ₖ`: `⊥ₖ ≤ₖ t, f ≤ₖ ⊤ₖ` (information increases: ⊥ = no
  information, ⊤ = over-determination);
- the **truth order** `≤ₜ`: `f ≤ₜ ⊥, ⊤ ≤ₜ t` (truth increases).

RelMath sets `Charge := Corner` *definitionally*: the value object **is** the
articulation partition (`charge_is_phase : (c : Charge) = c`). This is the seed
conflation `articulation_phase_is_charge`.

**(2.2) The Klein-four symmetry.** FOUR carries `K₄ = ⟨~, −⟩ ≅ ℤ/2 × ℤ/2`
(`RelMath/Positing/Four.lean`, `Charge.klein_four`): **negation** `~` (the coordinate
swap, `negate`) preserves `≤ₖ` and reverses `≤ₜ`; **conflation** `−` (the
complemented swap, `conflate`) preserves `≤ₜ` and reverses `≤ₖ`; their composite
`~∘−` reverses both. Each non-identity generator is an involution; `~` fixes the
`≤ₖ`-extremes `{⊥, ⊤}` and swaps the middles `{t, f}`, while `−` does the reverse —
"the two orders' duality made a group."

The keystone `quartet_recurrence` then conflates five readings of these four points —
articulation phase, `Bool × Bool` status, bilattice charge, nuclear-quartet corner,
and the modal four `{neither, ◇, □, both}` — into one object, each round-trip the
identity, with at most `{propext, Quot.sound}` (in fact no axioms). It is into *this*
record that we now insert Diátaxis.

---

## 3. Diátaxis and its two axes

Procida's Diátaxis [Procida, *Diátaxis*, diataxis.fr] places four documentation
modes on two independent binary axes:

- **acquisition ↔ application** ("study" vs "work"): *tutorials* and *explanation*
  serve a user **acquiring** skill/understanding; *how-to guides* and *reference*
  serve a user **applying** it at work;
- **action ↔ cognition** ("practical steps" vs "theoretical knowledge"): *tutorials*
  and *how-to* are about **action**; *explanation* and *reference* are about
  **cognition/knowledge**.

| | **action** (practical) | **cognition** (theoretical) |
|---|---|---|
| **acquisition** (study) | tutorial | explanation |
| **application** (work) | how-to | reference |

The two axes are not Procida's invention; they recapitulate two of the oldest
distinctions in the science of learning.

- **action ↔ cognition** is Ryle's [1949] distinction between **knowing-how** and
  **knowing-that**, operationalised by Anderson's ACT/ACT-R [1976; 1983] as the
  split between **procedural** and **declarative** memory. Tutorials and how-tos
  build procedures; explanation and reference state declaratives.
- **acquisition ↔ application** is the distinction between **learning** (encoding,
  in a context built for the learner) and **performance/transfer** (retrieval in
  the user's own working context). It is the axis along which cognitive-load theory
  predicts opposite optimal designs (§6).

So Diátaxis is a 2×2 whose two axes are independently well-motivated in the public
literature. A 2×2 with two bipolar axes is the minimal home of a Klein-four group of
axis-reflections — which is exactly what FOUR is.

---

## 4. The forced bijection

Identify Diátaxis's axes with the articulation coordinates by the only assignment
that respects their meanings:

> **`token`-articulated ≡ application.** The *token* is the concrete operational
> object one acts *with*; articulating it orients the document to *use/work*.
>
> **`claim`-articulated ≡ cognition.** The *claim* is the proposition/*why*;
> articulating it orients the document to *theoretical knowledge*.

This assignment is forced and Procida-faithful — it reproduces his compass exactly:

| Diátaxis | `Corner` | `(token, claim)` | `Charge` | Procida axes |
|---|---|---|---|---|
| **tutorial** | `potential` | `(no, no)` | `⊥ₖ` | acquisition + action |
| **how-to** | `active` | `(yes, no)` | `t` | application + action |
| **explanation** | `stable` | `(no, yes)` | `f` | acquisition + cognition |
| **reference** | `absurd` | `(yes, yes)` | `⊤ₖ` | application + cognition |

Check the groupings: the `token = yes` column is `{how-to, reference}` = Procida's
**application/work** side; the `claim = yes` row is `{explanation, reference}` =
Procida's **cognition/theory** side. Both are theorems in the witness
(`application_iff`, `cognition_iff`), and the compass pair `(application, cognition)`
*is* the corner's status (`axes_eq_fourCorner`).

The two extreme corners acquire a documentation reading that sharpens Procida:

- **tutorial = `⊥ₖ` (no information / `potential`).** The tutorial presupposes the
  least: neither the bare task nor the abstract claim is yet articulated *to the
  learner* — both are co-created in guided experience. It is the corpus's "neither
  side articulated" cell.
- **reference = `⊤ₖ` (over-determination / `absurd`).** Reference articulates *both*
  sides exhaustively and context-free; it presupposes a fully-formed need and answers
  every case at once. In the bilattice this is the over-determined corner — and that
  is the right reading of an exhaustive spec: it states more than any single use
  needs, the documentation analogue of `⊤ₖ`'s "too much information."

The two middle corners each articulate exactly one side: **how-to** articulates the
task (`token`) but not the why; **explanation** articulates the why (`claim`) but not
a concrete task.

---

## 5. Diátaxis is a bilattice, not a flat 2×2

Because the bijection lands on `Charge`, Diátaxis inherits the bilattice's **two
graded orders**. Procida draws the four modes as a flat square; FOUR says they carry
order. This is the paper's main structural claim, and each order is a measured
quantity in instructional science.

**(5.1) The knowledge order `≤ₖ` = the scaffolding / decontextualisation gradient.**

```
        reference  (⊤ₖ)          most decontextualised / spelled out
        /        \
   how-to      explanation       one side articulated
        \        /
        tutorial   (⊥ₖ)          most scaffolded / situated
```

Ascending `≤ₖ` is ascending *how much the document spells out versus co-creates with
the reader's context*: the tutorial is maximally scaffolded and situated; the
reference is maximally decontextualised. This is precisely the variable
cognitive-load theory manipulates. Worked examples and heavy guidance — the tutorial
pole — minimise extraneous load for novices and produce the **worked-example effect**
[Sweller 1988; Sweller, van Merriënboer & Paas 1998, 2019]. The **expertise-reversal
effect** [Kalyuga, Ayres, Chandler & Sweller 2003] then states that the *same*
scaffolding that helps novices *hurts* experts, who should be moved toward
low-guidance, decontextualised material. In bilattice terms: **the optimal
documentation corner ascends `≤ₖ` as the reader's expertise grows** — tutorial →
how-to/explanation → reference. Scaffolding itself is Wood, Bruner & Ross's [1976]
construct and is meant to *fade*; fading is upward motion in `≤ₖ`. The flat 2×2
cannot say this; the bilattice does.

**(5.2) The truth order `≤ₜ` = the actionability / definiteness gradient.**

```
   how-to  (t)            maximally definite: "do exactly this; it works"
   /     \
 tutorial  reference      incomparable middles
   \     /
 explanation (f)          maximally non-committal: "it depends; here is why"
```

The truth order ranks *commitment to a single correct action*. A how-to is a recipe
with a guaranteed outcome (`t`); an explanation is discursive, admits alternatives and
disagreement, commits to no one action (`f`) — matching Procida's own description of
explanation as the mode that "can consider and weigh different views." Tutorial and
reference are the incomparable middles (`⊥, ⊤`): the tutorial is not yet committed
(it is open, exploratory under guidance), the reference is over-committed (it states
every case, a completeness that reads as `⊤`).

**(5.3) The K₄ symmetry = the two Diátaxis diagonals.** The bilattice's two
order-dualities are *not* the row/column flips of the square; they are its two
**diagonals**, and each is a meaningful documentation operation:

- **`conflate −` : tutorial ↔ reference** — the **learning↔lookup** duality (main
  diagonal). It reverses `≤ₖ` (maximal scaffolding ↔ maximal decontextualisation) and
  fixes how-to/explanation. This is the trade a reader makes when they stop being
  taught and start looking things up.
- **`negate ~` : how-to ↔ explanation** — the **doing↔understanding** duality
  (anti-diagonal). It reverses `≤ₜ` (the definite recipe ↔ the open why) and fixes
  tutorial/reference. This is the trade between executing and understanding.
- **`~∘−`** is the antipode (both diagonals at once): tutorial↔reference *and*
  how-to↔explanation, the full opposition of the square.

That the *natural* symmetry of Diátaxis is the diagonal Klein-four — not the naive
row/column reflections — is itself a finding: the documentation operations that
preserve the structure are "switch between learning and lookup" and "switch between
doing and understanding," exactly the bilattice's `−` and `~`.

---

## 6. The formal witness

The conjecture is discharged as an axiom-free Lean theorem,
`RelMath.Diataxis.diataxis_is_recurring_four`
(`lean/RelMath/Positing/DiataxisFour.lean`). It bundles:

- `Diataxis ≃ Corner` (`cornerBij`) — so Diátaxis is the same object as every other
  face in `quartet_recurrence` (and, via the keystone, as `FourCorner`, `Charge`,
  `Modal`, `Generator`);
- `card_four` — exactly four modes, no fifth surface;
- `axes_are_status` — the compass `(application, cognition)` **is** the `(token,
  claim)` partition (Procida's two axes are the two articulation coordinates);
- `lookup_is_conflate`, `doing_is_negate` — the two diagonals **are** the bilattice's
  `conflate`/`negate`, with `klein_four` proving they are commuting involutions whose
  composite is the antipode — `K₄` re-met on `Diataxis`;
- `toModal` — a Diátaxis mode names a modal corner (`tutorial ↦ neither`, `howTo ↦
  ◇`, `explanation ↦ □`, `reference ↦ both`), tying the documentation square to the
  keystone's modal reading.

`lean_verify` reports **zero axioms** for the headline. In the corpus's sense of
"formal," Diátaxis is now a checked face of the recurring four, not a prose analogy.

---

## 7. Predictions and consequences

Because the structure is now explicit and graded, it makes claims that the flat 2×2
does not, several of them empirically testable against existing instructional-science
paradigms:

1. **Expertise-reversal is `≤ₖ`-ascent.** For a fixed learning goal, the corner that
   minimises total cognitive load should move monotonically up `≤ₖ`
   (tutorial → how-to/explanation → reference) as measured expertise increases. This
   is a re-statement of Kalyuga et al. [2003] in bilattice coordinates, and predicts
   that documentation sets which let a reader *climb the same diagonal* outperform
   sets that force a mode switch.
2. **The diagonals are the natural edit operations.** Converting a tutorial into a
   reference (`conflate`) or a how-to into an explanation (`negate`) are the
   structure-preserving transformations; converting along a *row or column* crosses
   an order and should be harder/leakier. (Procida's well-known warning against
   "tutorials that drift into reference" is the empirical projection of `conflate` being a
   diagonal, not a neighbour move.)
3. **Coverage is `K₄`-orbit completeness.** A topic is fully documented iff its four
   corners are all present *and* the two diagonals are coherent — a stronger criterion
   than "has four pages," and exactly the orbit-completeness `klein_four` encodes.
4. **`⊤ₖ` over-determination is a measurable reference failure mode.** Reference sitting
   at `⊤ₖ` predicts that reference docs fail by *over-determination* (stating more,
   and more contradictory-seeming, detail than any use needs) rather than by gaps —
   the opposite failure mode from tutorials at `⊥ₖ` (which fail by under-specification).

---

## 8. Relation to prior 2×2 models of learning

Diátaxis is not the first four-fold on two bipolar axes in learning theory; the
nearest neighbour is **Kolb's experiential learning cycle** [Kolb 1984; Kolb & Kolb
2017], whose two axes — perception (concrete↔abstract) and processing
(active↔reflective) — give four modes (CE/RO/AC/AE) and four styles. Kolb is also a
Klein-four object in the present sense, and the resemblance is not accidental:
Kolb's *processing* axis (active↔reflective) aligns with Diátaxis's action↔cognition
(`claim`) axis, and his *perception* axis (concrete↔abstract) aligns with the
scaffolding/decontextualisation reading of `≤ₖ`. The crucial difference is that Kolb
gives a *cycle* (a dynamics on the four), whereas the present result gives the *static
algebra* (the four points, two orders, and `K₄`). The bilattice already carries the
machinery to add the dynamics — its **closure operators** settle a seed up an order to
a fixed point — which is the subject of the sequel.

We make no claim about Kolb's contested learning-*styles* psychometrics [cf. Coffield
et al. 2004; Kirschner 2017]; the structural claim is about the *cycle's geometry*,
not about stable individual styles.

---

## 9. Limitations and the sequel

- **The orders are argued, not yet measured.** §5 grounds `≤ₖ` in cognitive-load and
  expertise-reversal results and `≤ₜ` in Procida's own characterisations, but a
  dedicated empirical program (e.g. cognitive-load measures across the four corners
  at graded expertise) is owed. The predictions in §7 are designed to be the start of
  that program.
- **Only the static face is formal.** The witness proves the *object* and its
  *symmetry*. The learning *cycle* — Kolb's dynamics, the spaced-practice and
  retrieval literature — is a story about *motion through* the four, which on the
  bilattice is closure dynamics (`Closure`, `TruthOrder.TClosure`,
  `ClosureOrdinalRegime`). **Paper II** will read the learning cycle as the
  composite closure `T_t ∘ T_k` settling a learner up both orders, and the four
  closure *regimes* (strict-finite, Scott-continuous, transfinite-bounded,
  aperiodic) as four depths of learning — a second four-fold, orthogonal to this one.
- **Other faces.** The keystone already carries `Modal` and `Generator` faces; §6's
  `toModal` ties Diátaxis to the modal square, but the relation to the predicate
  generators (specialization/converse/projections) as *documentation moves* is
  unexplored and may sharpen prediction (2).

---

## References

- Anderson, J. R. (1976). *Language, Memory, and Thought.* Erlbaum. — (1983). *The
  Architecture of Cognition.* Harvard UP. [declarative vs procedural; ACT-R]
- Belnap, N. D. (1977). "A useful four-valued logic." In *Modern Uses of
  Multiple-Valued Logic*, Reidel. [the FOUR / bilattice values]
- Coffield, F., Moseley, D., Hall, E., & Ecclestone, K. (2004). *Learning Styles and
  Pedagogy in Post-16 Learning.* Learning and Skills Research Centre. [critique]
- Carroll, J. M. (1990). *The Nurnberg Funnel: Designing Minimalist Instruction.* MIT
  Press. [minimalism; learn-by-doing]
- Fitting, M. (1991). "Bilattices and the semantics of logic programming." *J. Logic
  Programming* 11. [bilattice structure, two orders]
- Ginsberg, M. L. (1988). "Multivalued logics: a uniform approach to reasoning in AI."
  *Computational Intelligence* 4. [bilattices]
- Kalyuga, S., Ayres, P., Chandler, P., & Sweller, J. (2003). "The expertise reversal
  effect." *Educational Psychologist* 38(1). [`≤ₖ`-ascent with expertise]
- Kirschner, P. A. (2017). "Stop propagating the learning styles myth." *Computers &
  Education* 106. [styles critique]
- Kolb, D. A. (1984). *Experiential Learning.* Prentice-Hall. — Kolb, A. Y. & Kolb,
  D. A. (2017). *The Experiential Educator.* EBLS Press. [two-axis cycle]
- Miller, C. R. (1984). "Genre as social action." *Quarterly Journal of Speech* 70.
  [content types as genres]
- Procida, D. *Diátaxis: A systematic framework for technical documentation.*
  https://diataxis.fr [the documentation quartet and its two axes]
- Ryle, G. (1949). *The Concept of Mind.* Hutchinson. [knowing-how vs knowing-that]
- Sweller, J. (1988). "Cognitive load during problem solving." *Cognitive Science*
  12. — Sweller, van Merriënboer & Paas (1998; 2019). "Cognitive architecture and
  instructional design." *Educational Psychology Review*. [CLT; worked-example effect]
- Wood, D., Bruner, J. S., & Ross, G. (1976). "The role of tutoring in problem
  solving." *J. Child Psychology and Psychiatry* 17. [scaffolding; fading]

## Formal artifacts

- `lean/RelMath/Positing/DiataxisFour.lean` — the witness module (green, 0 axioms).
- `RelMath.Diataxis.diataxis_is_recurring_four` — the headline conflation theorem.
- Depends on `RelMath.Positing.QuartetRecurrence` (`quartet_recurrence`,
  `twistoring_eq_commutating`) and `RelMath.Positing.Four` (`Charge.klein_four`).
