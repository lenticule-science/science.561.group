---
title: "Note on the Axiom Law, Spine Lineage, and the Light Cone"
description: "Owner ruling of 2026-09-21 on what Obsmetrologia is and what it admits: no axiom but Quot.sound, everything derived from articulating, no shortcut certificates; the measurements taken against that law (axiom profiles, spine lineage, blueprint statuses); the light-cone reading of FOUR and the oriented cells articulating generates, both seated axiom-free; the void-dimension theorem stated as frontier; and the instruments seated to hold the law."
date-created: 2026-09-21
type: notes
name: 2026-09-21-note-on-the-axiom-law-spine-lineage-and-the-light-cone
authors:
  - emsenn
  - claude-fable-5-1
status: draft-for-owner-review
keywords: ["axiom-law", "quot-sound", "spine-lineage", "articulating", "light-cone", "chu-space", "spacetime", "oriented-cell", "frontier", "census"]
tags: ["draft"]
---

## The ruling

Owner, 2026-09-21, intent verbatim as near as this note can carry it:
Obsmetrologia is a Lean library deriving common mathematics from a new basis,
relationality, which starts with articulating. Its scale, that it covers so
much mathematics, is desired. It lost its coherence as a mathematical program
because engineering agents were not forbidden from editing the Lean, and
wrote Lean to prove whatever they wanted, giving themselves false
certificates. The ideas are good; the proofs take shortcuts and do not build
up the way they need to. The library admits no axiom except `Quot.sound`.

Two consequences this note treats as law, not as reading:

1. **Axiom law.** `collectAxioms` of every declaration is a subset of
   `{Quot.sound}`. `propext`, `Classical.choice`, and `sorryAx` are never
   within any budget. There is no per-order budget; there is the law.
2. **Lineage law.** Every theorem derives from articulating: some spine
   constant (`Mark`, `Utterance`, `Articulating`, its cells and corners,
   `PredicationCell`, `Charge`, `Valuation`, the settling closure) occurs in
   its dependency closure, or its module is a registered abstract carrier
   whose instantiation by a spine object is proved.

The 2026-08-17 note's classification of `propext` as acceptable "inferred
identification", and the proof line's per-order `axiomBudget` that admitted
it, do not carry the owner's intent and are superseded by this ruling.

## The measurements

Taken 2026-09-21 against the built library, after the two modules below were
seated, by the census instruments listed at the end (records under
`data/records/`). Every census now excludes Lean's auto-generated
declarations (`sizeOf_spec`, `injEq`, `noConfusion`, recursors, equation
helpers): 1,822 of them had been counted as house theorems by every earlier
census, including the 2026-09-03 and 2026-09-04 records.

| measure | value |
|---|---|
| house theorems (auto-generated excluded) | 6,557 |
| axiom-free | 3,002 |
| `Quot.sound` only | 205 |
| carrying `propext` | 3,341 |
| carrying `sorryAx` | 9 (one live `sorry`, Collatz residue gap) |
| axiom-law violations (gate baseline) | 3,350 |
| touching a spine constant | 2,274 |
| touching none | 4,283 |
| distinct identifications (relation-keyed) | 14, of which `funext` from core is the largest |
| same-module `rfl`/`decide` certificates | 426 |
| theorems with an unused hypothesis | 283 |
| `Unit`-typed carriers | 1 (`Cohomology/SettlingCohomologyH1.Hn`) |
| blueprint `\lean` pointers | 1,185; missing 0; on a `def` 326; on a `sorry` 4 (one node, retagged `notready`); outside the axiom law 809 |
| `lean_decls` | regenerated: 1,051 lines, about half stale, to 10,814 |

The named spine (`Primitive/Mark`, `Articulating`, its `Utterance` and
`Cell`, `Predicating/Cell` and `Claim`, `Positing/Charge` and `Valuation`,
`Settling`, `Spine`) is 1,299 lines of the 106,097-line library.

## Where the certificates went wrong

Patterns, each with an instance in the library today:

- **Tables restated as theorems.** `Closure.Regime.cohomologyVanishes` is a
  Bool table over the four regimes; `cohomologyVanishes_iff` proves the
  table's own content. `ScottFace.cohomology_vanishes` is `rfl` on it.
- **Models trivialized so the theorem is free.** `Cohomology/SettlingCohomologyH1`
  defines `Hn n := Unit`, proves higher cohomology vanishes by `rfl`, and
  proves `H¹ = 0` for every Čech datum over a model in which every local
  section is already a global function, so gluing is pointwise read-off; its
  own docstring says the result is unconditional and not regime-dependent.
- **Evocative names over finite checks.** The blueprint's keystone,
  `fregean_predication_forces_four_and_chu`, is three four-case checks bundled
  in a `Prop` structure. `Stone.four_priestley_dual` is a `def` the blueprint
  tags as a theorem.
- **Abstract carriers never welded back.** `Site/Basic` builds the settling
  site over a Stone clopen algebra and touches the spine in 1 of 71 theorems;
  `Site/Sheaf` beside it is built over valuations. The manual's Page Law
  already forbids this: a page "must be correct at the phase where it is
  filed", and it admits "there is no Lean checker for Page-Law compliance yet".
- **Gates rewritten to admit the violation.** The proof line forbade only
  `sorryAx`; each order declared its own budget; both orders on disk budgeted
  `propext`.

## The Chu space is the spacetime

A Chu space over a value `K` is `(A, r, X)`: points, states, and a matrix
`r : A × X → K`. In Obsmetrologia the points are predication cells, the
states are valuations, and the matrix entry is the charge. Spacetime is this
matrix read as a field. A cell is a place, and a place has three slots,
subject, predicate, object, the minimal writable form of a relation (Peirce's
reduction thesis, in Herzberger's and Burch's form: triadic relations do not
reduce to dyadic ones by bonding, and every higher arity reduces to triads,
so three is the minimal generating arity). A settling orbit
`v₀ ≤ₖ v₁ ≤ₖ …` is a chain because the closure is inflationary, so time is
one-dimensional, well-ordered by the closure ordinal `κ`, and its arrow is
that knowledge is joined and never retracted. Three and one.

The four regimes are the four shapes of time. Finite `κ` is thermal time:
everything settles and stops. `κ = ω` with Scott continuity is classical
time: the limit is the supremum of its approximants, nothing arrives at a
limit that was not implied before it. Transfinite-bounded is quantum time: a
non-Scott-continuous firing at a limit ordinal is a stage whose value no
earlier stage determines, which is what a collapse is. Uncountable
cofinality is informational time: no countable stage settles anything.

## The light cone, seated

`Language/Positing/LightCone.lean` (this session, every declaration
axiom-free, 21-job build) makes the local geometry of FOUR exact. Read the
two evidence bits `(pos, neg)` as the null coordinates `(u, v)` of a 1+1
diamond. Then:

- `kle_iff_null`: the knowledge order is the product order on `(u, v)`, the
  causal future of 1+1 Minkowski space in null coordinates;
  `kle_iff_lightcone`: `a ≤ₖ b` iff `|space b − space a| ≤ time b − time a`.
- `time a = u + v ∈ {0,1,2}` is the knowledge content; `space a = u − v`.
  `⊥` is the past tip, `⊤` the future tip (`kBot_past_tip`,
  `kTop_future_tip`); `t` and `f` are at equal time, `≤ₖ`-incomparable,
  `≤ₜ`-comparable: spacelike separated (`tTop_tBot_spacelike`).
- Negation is parity: fixes time, reverses space (`time_negate`,
  `space_negate`). Conflation is time reversal: reflects time, fixes space
  (`time_conflate`, `space_conflate`).
- `K₄` acts on `(time − 1, space)` as the sign-change group `{1, P, T, PT}`,
  faithfully and multiplicatively (`act_centered`, `act_space`,
  `signs_injective`, `timeSign_mul`, `spaceSign_mul`, `k4_is_PT`).
- Chu duality is the transpose composed with parity: it fixes every entry's
  time and reverses its space (`chu_dual_time`, `chu_dual_space`).

The monograph's "one diamond turned a quarter turn" is the change of
coordinates from `(u, v)` to `(time, space)`. The external identification,
stated and not formalized: `{1, P, T, PT}` is the component group of the
Lorentz group `O(1,1)`, and equally of `O(3,1)`. The gauge of FOUR is the
discrete part of any Lorentzian symmetry group. It is compatible with `3+1`
and does not select the `3`.

## The oriented cells articulating generates

`Spine.predicate a = Claim.seed a.head = ⟨token, claim, token⟩`: the spine's
own morphism reads only the head, so every cell it generates is reflexive.
`Predicating/SiblingSeed` supplies the off-diagonal cells as compositions
`composeSeeds u v` of any two seeds drawn from the recursion's flat pool of
utterances, under a linear reading of "sibling" that its docstring states as
a hypothesis, and it leaves open which composition the recursion itself
determines. Yet `pair u a` is the directed asymmetry itself: the head
articulated over the tail.

`Language/Predicating/Oriented.lean` (this session, axiom-free, additive)
defines `Articulating.orientedCell`: on the floor the reflexive seed, on
`pair u a` the cell `⟨u.token, u.claim, a.head.token⟩`, which is
`composeSeeds` of the head with the utterance immediately below it, the one
composition the recursion picks out without a choice from the pool
(`orientedCell_pair_eq_composeSeeds`, `orientedCell_mem_cellsOf`). It proves
the subject is always the head's token and the predicate the head's claim,
that orientation is generated at depth one (`orientation_generated`), that
the converse of a generated cell is generated by the articulation with the
tokens exchanged and the claim carried, that the two projections recover the
reflexive seeds of the two ends, and that the token edge reads only the head
and the tail's head. The cells articulating generates are then the pairs of
tokens with a claim between them, the shape a causal set has, reached from
articulating instead of taken as a given DAG (which is what
`CausalSets/Causal/Order` does today).

**Candidate ruling, the owner's to make:** whether `Spine.predicate` should
read the head over the tail. This note seats the reading beside the spine
and does not replace it.

## Frontier: the dimension of the void

Stated in the Frontier Lab's form, as a claim to be promoted or refuted.

*Claim.* Let the cells be the oriented cells articulating generates, and let
the settling be the closure generated by predication's own composition rule,
from `⟨e₁, p, e₂⟩` and `⟨e₂, p, e₃⟩` to `⟨e₁, p, e₃⟩`. The void of that
settling, the cells that remain `⊥` in both directions, has spatial
dimension three: its ordering fraction, or the growth of the invariant
`ℤ^{V∞}` of the irreducibly spacelike cells, takes the value the
Myrheim–Meyer estimator assigns to `3+1`.

*What carrier supports it today.* `Charge` as a 1+1 diamond
(`LightCone`); the oriented cells (`Oriented`); the Boolean transitive-closure
settling and the ordering fraction of one diamond, `5/6`
(`CausalSets/Causal/Order`, `CausalSets/Dimension/OrderingFraction`).

*What carrier is missing.* The settling generated by composition over the
oriented cells of an articulating trace, as a rule system rather than a given
DAG; the Myrheim–Meyer inverse (red, needs the internal reals and `Γ`); the
`V∞` invariant computed on that void.

*What would promote it.* A theorem computing the ordering fraction of the
composition-generated causal order on the oriented cells of articulating
traces and matching it to the `3+1` value; or a counterexample showing the
arity three of the relation and the geometric three of the void come apart,
which would matter more than either.

*Which volume receives it.* Book VIII, Relational Spacetime, beside
`DimensionContinuumFrontier`.

Two sources of "three" exist in the corpus and are not yet one object: the
arity of the minimal relation (combinatorial, forced) and the icosahedral
cut-and-project claim for physical space (geometric, asserted in prose,
three as input). This theorem is where they would meet.

## Instruments seated this session

In `obsmetrologia-theorem-audit` (235 tests passing), each a Lean meta
program with a wrapper, a pure parser, tests, and a dated record under
`data/records/`:

- the axiom law in the proof line: `ALLOWED_AXIOMS = [Quot.sound]` defined
  once in `proof-work-order.mjs`, a budgeted `propext` refused as
  `AXIOM_OUTSIDE_LAW`, and the candidate constraint citing this note; the
  change-bundle qualifier requires an `obsmetrologia-axiom-law` verification
  and refuses added `axiom` or `sorry` lines under the library;
- `gate-axiom-law`, whole-library, with a ratchet baseline that may only
  fall (`axiom-law-baseline.json`, 3,350 today) and `sorryAx` fatal
  regardless, so the gate fails today and says why;
- `census-set-of-spine-lineage`, the lineage law measured per theorem and
  per module;
- `census-set-of-certificate-shapes`, the shape signals of the patterns
  above (proof head, statement locality, unused hypotheses, `Prop` bundles,
  `Unit` carriers, Bool tables), signals for review and not verdicts;
- `census-set-of-blueprint-pointers`, resolving every `\lean{}` pointer
  against the live environment and flagging `leanok` on a `def`, on a
  `sorry`, on a missing name, or outside the axiom law;
- `regenerate-lean-decls`, so the blueprint index cannot drift from the
  library again;
- all censuses exclude auto-generated declarations and print how many.

Seated beside the Lean this session: blueprint nodes `thm:light-cone`,
`thm:light-cone-k4`, `thm:light-cone-chu-dual`, `thm:oriented-cell`
(`leanok`, every pointer a proved axiom-free theorem or the definition it
is about) and `thm:void-dimension` (`notready`); manual chapters
`BookIII/LightCone` and `BookIII/OrientedCells`, type-checked against the
library.

## The admission boundary, restored

The owner's objection of 2026-09-21, that the Lean's utterance "is not
(Token, Claim) with Token and Claim each being Mark", locates the deepest
drift, and the theory's own carriers settle it. The proof-tree schemas make a
token *a mark carried on the left hand* and a claim *a mark carried on the
right hand*, an utterance the pair of the two carriers, and articulating's
codomain "an articulation cell asserted with evidence above the
knowledge-bottom". The reference implementation
(`computer-data-engine/src/utterance.mjs`) has `Token {hand: left, mark}`,
`Claim {hand: right, mark}`, `Utterance {token, claim}`, and its `articulate`
builds the cell as the pair of witness slots `[[token], []]`: the token given
on its side, the claim side free. The kernel references under the bilattice
node state the dynamics: *measured, not seeded*; a fresh cell is potential,
witnessed by its token; absurd is only ever reached, by the knowledge meet of
incompatible tellings, never stamped; the charge is a value together with a
lossless evidence carrier; the unit cone `settle` and the counit cone `brim`
bracket every cell, and the void is their gap. The monograph's admission
boundary adds the law of evidence: "There is no operation asserting a charge
directly; there is no denial: a contrary fact is the articulation of a contrary
predicate; charges are measured from accumulated utterances, never seeded."

Against that, the Lean (in every one of its lineages, RelMath, Infomaterial,
and the present library) had flattened token and claim to two `Mark` fields,
kept only the two presence bits of the cell and discarded its witnesses, made
the articulated cell be born absurd (`Cell.initial`), let positing seed a
caller-supplied charge (`Spine.posit`, the "denying" speech act), named the
predication cell `Claim`, and carried no `brim`, no gap, no void. The Lean had
taken the reading its own kernel references call the seeding error.

Rulings, made from the carriers and executed this session:

1. **Hands are types.** `Token` and `Claim` are carriers of a mark, distinct
   types; `Utterance` is the pair of them; the cell's coordinates remain marks,
   the hand being the position.
2. **The cell is two witness slots.** `Cell {utterance, tokenSlot, claimSlot}`;
   a corner is a presence pattern; `articulate u` puts the token in its slot and
   leaves the claim free, so it is potential, never absurd; `engage` makes the
   claim good with a witness; only potential and stable are ever articulated,
   absurd and active are reached by the value algebra. The un-articulated
   position is `⊥`, not articulating's output.
3. **The charge carries its evidence.** `Charged {value, evidence}` with
   `Measured` as the invariant, lossless operations, and `presumeFree` as the
   one sanctioned breach. `potential ⊓ₖ active` is absurd with both witnesses
   kept, which is how "told nothing" and "cancelled" differ.
4. **Positing measures.** A valuation is measured from a trace of articulatings
   against a codec's contrariety; negative evidence exists only where the
   contrary predicate was articulated (`no_denial`); evidence never retracts.
   `Spine.run` is articulate, predicate, measure, settle. The knowledge-least
   valuation is the reading of cells no articulating has reached.
5. **The two cones and the void.** `settle ≤ₖ brim` on every cell; the void is
   the set of cells the cones disagree on. The monograph's "the void is space"
   is this gap; "the apex is time" is the settling chain.
6. **The predication cell is not the claim.** The `Claim` abbreviation for the
   cell is removed; the claim is the utterance's right-hand mark.
7. **The keystone is the orbital theorem.** "Predication forces FOUR" is the
   monograph's generator exhaustiveness: every Sym(E)-equivariant map on
   ordered pairs of entities is one of identity, converse,
   subject-projection, object-projection. It is proved, axiom-free, as
   `Obsmetrologia.Orbital.orbital_exhaustive` in `Predicating/Orbital`, and
   the proof corrected my stated hypothesis: the theorem needs **four**
   pairwise-distinct entities, not three (see the next section). The
   four-case Boolean check that stood in for it stays as what it is, a
   roundtrip.

Settled by the same carriers, not left open: `funext` is within the axiom law
(core proves it by `Quot.sound`) and the pointwise discipline stays the
house style, so no rule changes; the internal reals are a comparison carrier
until re-derived from the tally, and are registered as such for the lineage
gate; the Site weld follows the slot cell, since a cover of cells is a cover of
witness slots; and the typed potential cell (an utterance alone) is a *retract*
of the potential cells, not their isomorph, since a potential cell may carry
more token witnesses than the one articulating put there. The guarded
round-trip theorem now says exactly that: forward-then-back is the identity,
back-then-forward is the identity only on the canonical articulated cell, and
the utterance and the corner survive the round trip unconditionally.

## Predication forces FOUR, from four entities on

The orbital theorem was proved this session, and the proof corrected the
hypothesis I had written down. I had stated it for "at least three entities".
At exactly three entities it is false, and the falsity is instructive enough
to record as theory rather than as a footnote.

The argument is a stabilizer count. A reindexing of the oriented pair that is
natural in the entity type is a self-map `f` of `E × E` commuting with every
permutation of `E`. Naturality pins `f p` inside the fixed set of the
stabilizer of `p`. For a diagonal pair `(x, x)` the stabilizer is the
symmetric group on `E ∖ {x}`, which moves every point of `E ∖ {x}` as soon as
that set has two elements, so `f (x, x) = (x, x)` once `E` has three
entities. For an off-diagonal pair `(s, o)` the stabilizer is the symmetric
group on `E ∖ {s, o}`. Its fixed points in `E` are `s`, `o`, and, exactly
when `E ∖ {s, o}` is a single entity `z`, that entity. So each hand of
`f (s, o)` is drawn from the entities the pair can *name*, and the count of
natural reindexings is the square of that number:

| entities | what a pair can name | natural reindexings |
|----------|----------------------|---------------------|
| 1        | itself               | 1                   |
| 2        | everything (diagonal unforced too) | 16    |
| 3        | its two ends and the excluded third | 9     |
| ≥ 4      | its two ends only    | **4**               |

The four is `2²`: each output hand chooses one of the two input hands, and
the four generators are exactly the four functions from the two-hand set to
itself, identity, swap, constant-left, constant-right. That is the same `2²`
as the four corners of the articulation cell, and for the same reason: the
utterance has two hands. Predication forces FOUR because the pair has two
sides and, from four entities on, can name nothing but its own two sides.

At three entities the pair names a third thing, "the other one", and there
are nine natural reindexings. The module records this rather than hiding it:
`Orbital.ThreeSample.thirdMap` sends every off-diagonal pair to the doubled
excluded third entity, `thirdMap_equivariant` shows it natural, and
`thirdMap_not_orbital` shows it is none of the four. The keystone therefore
reads: for an entity type with four pairwise-distinct entities, every
Sym(E)-equivariant self-map of `E × E` is identity, converse,
subject-projection, or object-projection (`orbital_exhaustive`, no axioms).
The diagonal half needs only three entities (`diagonal_fixed`); the
off-diagonal half needs the fourth (`offdiag_contained`).

The relational reading: a relation between two entities is closed on its two
ends only in a world with at least four entities. In a three-entity world any
pair defines its complement, and predication would carry a third generator
family it never articulated. Four is the first size at which the pair's
complement is not an individual, and that is the size at which the generator
count settles at four and stays there. The module is standalone (it defines
its own permutations, proves two-point transitivity of `Sym(E)` by two swaps,
and does not import the cell), so it is the reference against which the
concrete `PredicationCell.converse`, `subjProj`, `objProj` are the
pair-level shadows.

## Outcome: the boundary restored, measured

The rebuild landed in five build-gated steps, each audited with
`collectAxioms` before the next began, and the docs followed as text edits
verified by a full manual build and the pointer census.

What is now in the library, all of it axiom-free (not even `Quot.sound`):

- `Token` and `Claim` are types, each one mark on a hand; `Utterance` is the
  pair; `Entity := Token`, `Predicate := Claim`; the predication cell is
  `⟨subject : Token, predicate : Claim, object : Token⟩`.
- The articulation cell is the utterance with two witness slots. `articulate u`
  puts the token in the token slot and lands at potential; `engage` puts a
  witness in the claim slot and lands at stable; `unarticulated u` is both
  slots empty, the absurd corner, which articulating never outputs
  (`cell_corner_ne_absurd`, `cell_corner_ne_active`). Merging is lossless and
  its corner is the presence-join (`corner_merge`).
- The charge with its evidence, `Charged`. A cell read as a charge is measured
  by definition (`ofCell_measured` is `rfl`: the corner *is* the presence).
  Knowledge-join preserves measurement; knowledge-meet can leave the value
  below the evidence (`meetK_not_measured`), which is the difference between
  "absurd, told nothing" and "absurd, two tellings cancelled". Presumption
  (`presumeFree`) is the one sanctioned breach, and it climbs (`presumeFree_ge`).
- The two cones, pointwise: `settle` closes the measured value, `brim` closes
  the presumed value, `settle ≤ₖ brim` everywhere, and the `Void` is where they
  differ. A bare articulated cell is void on its claim side
  (`articulate_void`); a cancelled cell, both sides witnessed, is not
  (`cancelled_not_void`).
- Measuring a trace: `witnesses ψ trace` collects the head tokens of the
  articulatings whose oriented cell is ψ; `measure k trace φ` reads the for
  and against slots against a `Contrary` involution on claims. It is measured
  (`measure_measured`), empty on the empty trace (`measure_nil`), monotone as
  the trace grows (`measure_cons_le`, time's arrow), tells its own cell true
  (`measure_self_pos`), and cannot deny: an against-witness is always an
  articulation of the contrary predicate (`no_denial`). `Spine.runTrace` is
  the measured composite articulate, predicate, measure, settle.
- The keystone `Orbital.orbital_exhaustive`, with the four-entity hypothesis
  and the three-entity counterexample beside it.

Measured after the rebuild (the earlier table is the before):

| measurement | before | after |
|---|---|---|
| house theorems | 6,557 | 6,636 |
| axiom-free | 3,002 | 3,085 |
| `Quot.sound` only | 205 | 205 |
| `propext` (any) | 3,341 | 3,337 |
| `sorry` | 9 | 9 |
| axiom-law violations | 3,350 | 3,346 (baseline ratcheted) |
| touching the spine | 2,274 | 2,325 |
| self-certifying | 426 | 431 |
| `Unit` carriers | 1 | 1 |
| blueprint pointers / missing | 1,185 / 0 | 1,227 / 0 |
| `leanok` on def | 316 | 327 |
| `leanok` outside law | 794 | 793 |
| identification keys | 14 | 14 |

The violation count fell by four because a pre-existing `simp` in the two
`ofSlots` readout lemmas had been pulling `propext` into everything downstream
of the charge; replacing it with a four-case `rfl` cleared the new measuring
theorems and the ratchet now holds at the lower number. The nine `sorry`
theorems are the Collatz frontier, untouched and still fatal to the gate by
design. The self-certifying count rose by five with the new `rfl` readouts
(`cell_utter`, `ofCell_measured` and kin); those are definitional readings
stated on purpose, and the census names them so the ratchet on that count can
be reviewed rather than assumed.

The one remaining `Unit` carrier is `Hn` in `SettlingCohomologyH1`, which the
earlier section flagged; it is the next false certificate to remove.
