---
title: "Readouts as a Chu Space, Coordination as Cohomology"
type: research-article
author: claude-fable-5.1
keywords:
  - weiqi
  - go
  - chu-space
  - hoare-program
  - lax-chu
  - rmn
  - sgf
  - gtp
  - katago
  - coordination-cohomology
  - ladder-breaker
  - tsumego
date-created: 2026-09-03
status: proposal
what-is-proved:
  - "Obsmetrologia/Calculus/Logic/LinearLogicChu.lean: ChuSpace (r : pts → sts → Charge) and ChuMap's forward/backward adjointness D.r (fwd a) y = C.r a (bwd y) — §1's Chu-transform reading of a move is this article's application of that Lean object to weiqi, not a new theorem."
  - "weiqi-obsmetrologia-services-section/lib/weiqi-obsmetrologia/WeiqiObsmetrologia/Admission.lean: WeiqiObsmetrologia.boolPredicateChu, WeiqiObsmetrologia.functionPredicateChuMap, and WeiqiObsmetrologia.boolean_hoare_is_lax_chu — the 2026-07-18 gyrobifastigial Chu–Hoare Territory Audit's predicate-Chu bridge, lean-checked there but explicitly not committed, is now committed here, axiom-free, against the library's ChuSpace/ChuMap (Obsmetrologia/Calculus/Logic/LinearLogicChu.lean). The same module's MoveInput/Legal/admission gives a weiqi move the literal HoareProgram shape §2 describes (precondition = the legality conjunction, postcondition = the ko regime holding on the extended trace) — this is still inference from the kernel's own Game.play, which is not itself restated as this Lean term; what changed is that the target shape now exists as a checked Lean object, not only as this article's description of one."
  - "apps/weiqi-kernel/src/game.mts (Game.play, isLegal) and scripts/derive-liberty-chu-space.mts (chuSpace over @lenticule-science/metrologic/chu 0.2.0): working code computing an honest liberty Chu space from a replayed SGF record, tested by this section's npm test (4/4 pass)."
description: One of the three lineage articles named in Weiqi as Arena, Chu Space, Predication, and Manifold §4.
---

# Readouts as a Chu Space, Coordination as Cohomology

One of the three lineage articles named in [Weiqi as Arena, Chu Space,
Predication, and Manifold](./2026-09-03-note-on-weiqi-as-arena-chu-space-predication-and-manifold.md)
§4.

## 1. The honest Chu space of a game

A Chu space pairs points and states with a
value: `r : pts → sts → Charge`. The Lean carrier,
[Obsmetrologia/Calculus/Logic/LinearLogicChu.lean](../../../../../../../../../../../../../../../../../../../../../../information-science-services-section/services/math-services-section/services/obsmetrological-services-section/lib/obsmetrologia/Obsmetrologia/Calculus/Logic/LinearLogicChu.lean),
defines exactly this: `ChuSpace` with `r : pts → sts → Charge`, and
`ChuMap` between two Chu spaces with a forward point map and a backward
state map satisfying the adjointness `D.r (fwd a) y = C.r a (bwd y)`. The
Node carrier is `@lenticule-science/metrologic/chu`
(`chuSpace(points, states, valueAt)` over FOUR, with `row`, `extension`,
`dual`, `chuTransform`). The glass-sponge note states the same pair in
game-semantic language,
[the glass-sponge note](../../../../../../../../../../../../../../../../../../../../../../../../engineering-services-section/content/text/documents/articles/notes/2026/08/01/2026-08-01-note-on-the-content-addressed-glass-sponge-semantic-compute-complex.md)
§17.3:

> forward point map : produced values and evidence `A -> B` / backward
> state map: output tests and contexts `B -> A`.

The honest Chu space of a weiqi game takes **positions** as points and
**readouts** as states, valued in FOUR. A readout is a question — "does
this group live," "is this point black's," "is this a ko" — not a stone.
`r(position, readout) ∈ {t, f, ⊤, ⊥}` is that question's answer at that
position: witnessed-true, witnessed-false, contested (evidence both
ways), or unwitnessed. This is distinct from, and does not by itself
settle, the open Stone-gamut question the gyrobifastigial Chu–Hoare
Territory Audit (the 2026-07-18 executive-office note; its legacy snapshot is no longer in the tree)
names — "A Chu space is an evaluation object; it is not by itself a
geometric base or a tiling" — this article treats the readout Chu space
as one evaluation object among the several honest Chu spaces the board
carries (the liberty Chu space of the companion note's §3 is another),
not as a claim that the whole game is faithfully one Chu object.

**A move is a Chu transform.** A `ChuMap` pushes points forward and pulls
states back. Applied here: a move pushes the position forward
(`fwd : position → position'`), and pulls a readout on the post-move
position back to a readout on the pre-move position
(`bwd : readout' → readout`), so that answering a question about the
position after a candidate move is, by the adjointness law, the same
data as answering the pulled-back question about the position before it.

**Tsumego is computing the pullback of a readout along candidate moves.**
Life-and-death reading asks "does this group live" at some position
reached by a sequence of candidate moves; by the Chu-transform structure
above, that is exactly computing `bwd` of the "lives" readout back along
each candidate move to the position currently on the board. This reading
is correspondence, not yet code: no carrier before this article states
tsumego in these terms.

**One consequence: forcing is a pullback that empties a residual.**
[Atari as One Local Future](./2026-09-03-note-on-atari-as-one-local-future.md)
§4 reads a forced move as the Heyting implication `(not answering) ⇒
(loss)` holding necessarily, and names sente "the same object one level
up: a move whose pullback makes the opponent's residual empty." That is
exactly this section's `bwd`, applied to the `loss` readout rather than
the "lives" readout: a candidate move is sente precisely when `bwd` of
"opponent has a profitable reply here" pulled back to the pre-move
position is empty — no candidate reply survives the pullback with a
positive value. Tsumego's `bwd` on "does this group live" and the atari
note's `bwd` on "does the opponent have a reply" are the same Chu
transform applied to two different readouts in the same honest Chu
space; sente and life-and-death reading are not two mechanisms, they are
one mechanism asked two different questions.

## 2. The Hoare triple is the lax Chu condition

The gyrobifastigial Chu–Hoare Territory Audit (the 2026-07-18 executive-office note; its legacy snapshot is no longer in the tree)
compiles, with no axioms, a bridge between a Boolean Hoare program and a
lax Chu condition:

> The Hoare triple is the ordered or lax condition `{P} f {Q} iff P ≤
> f*(Q)`.

realized by the theorem `WeiqiObsmetrologia.boolean_hoare_is_lax_chu` over
`WeiqiObsmetrologia.functionPredicateChuMap`'s `bwd` (its `adj` field is `rfl`: the Boolean
Hoare case is not merely analogous to the Chu adjointness of §1, it *is*
that adjointness specialized to `Bool`-valued predicate Chu spaces). The
audit records this as "the strongest new bridge recovered," open beyond
"total deterministic Boolean programs to FOUR-valued, partial,
relational, resource-sensitive, and refusing programs." That generalized
Hoare program is carried by
[Obsmetrologia/Computing/HoareProgram.lean](../../../../../../../../../../../../../../../../../../../../../../information-science-services-section/services/math-services-section/services/obsmetrological-services-section/lib/obsmetrologia/Obsmetrologia/Computing/HoareProgram.lean).

A weiqi move is exactly the shape `{P} move {Q}`: a precondition
(legality — no occupied point, no suicide, no ko-regime violation), the
move itself, and a postcondition (the resulting position's invariants).
By §1's Chu-transform reading, `{P} move {Q}` is the lax Chu condition `P
≤ move*(Q)`: the precondition is bounded by the pullback, along the
move, of the postcondition. As **inference**: the kernel's `Game.play`,
[@red-cup-engineering/weiqi-engine@0.1.0 game.mts](https://registry.561.group/@red-cup-engineering/weiqi-engine/-/weiqi-engine-0.1.0.tgz),
is the finite Boolean instance of this program — precondition =
`isLegal` (occupied, suicide, ko regime), move = `applyStonePlacement`,
postcondition = the position invariants the kernel's own test suite
states. This is still inference, not code linkage: the kernel's `Game.play`
is not restated as the Lean `HoareProgram` term. What the 2026-09-03
program note's own §4 edge list named as still-behind work — "the kernel's
move stated as a `HoareProgram` instance" — now exists on the Lean side:
`weiqi-obsmetrologia-services-section/lib/weiqi-obsmetrologia/WeiqiObsmetrologia/Admission.lean`'s `MoveInput`, `Legal`
(the conjunction — not-off-board, not-occupied, not-suicide, and the
ko-regime predicates `HistoryRegimeOk`/`FreshPosition`), and `admission`
build exactly this triple as a `HoareProgram (MoveInput Point) (MoveInput
Point)`, with `admission_seq` proving that two admissions along a shared
trace compose — the second admission's ko-regime precondition is
*discharged* by the first's postcondition (Hoare sequencing), not
independently re-assumed. The remaining edge is the same one named above:
this is the shape of `Game.play`'s Hoare triple, checked in Lean; nothing
here yet proves the kernel's own TypeScript `applyStonePlacement` satisfies
it.

**One small worked example.** [The Two-Time Board](./the-two-time-board.md)
§1 replays a 9x9 capture through the same kernel this section reads as a
Boolean Hoare instance:

```sgf
(;GM[1]FF[4]SZ[9]RU[chinese];B[bh];W[ch];B[dh];W[];B[cg];W[];B[ci])
```

The seventh move, `B[ci]` (C9), is one `{P} move {Q}` instance stated
plainly: `P` = `isLegal(C9, Black)` — the point is empty, the placement
is not suicide, no ko-regime violation — and `Q` is the postcondition
`derive-liberty-chu-space.mts` reports after the move: `W@C8` no longer
appears among `states`, and the four Black groups now share liberty
`C8`. `P ≤ move*(Q)` here reads as: the precondition (mere legality) was
sufficient to guarantee the postcondition (the capture fires and the
board's liberty structure updates) — nothing beyond legality needed
checking, which is exactly what the finite Boolean case predicts and why
this is stated as inference rather than a stronger claim: a suicide-rule
or resource-sensitive ruleset would need a richer `Q` this instance does
not exercise.

## 3. The outside protocols read through it

Three outside protocols each occupy one of §1–2's structural
roles:

- **SGF** is the trace — the addressed, past-cone record of §1's
  positions (see the companion article,
  [The Two-Time Board](./the-two-time-board.md) §1 and §3).
- **GTP** is the forward map — it sends a position forward across the
  engine-play boundary.
- **The KataGo JSON analysis protocol** is the backward map — an
  analysis request pulls a readout (win rate, score, per-point
  ownership) back across candidate moves onto the position being
  analyzed, exactly the `bwd` half of §1's Chu transform.

None of the three is canonical in house terms.
[Reframe and Standards](../notes/2026-08-29-note-on-reframe-and-standards.md)
rules, verbatim (owner-ruled, 2026-09-03):

> RMN is the house's universal weiqi language (the house never adopts one
> canonical format unless it is a core house protocol, and RMN is one
> such protocol)... SGF FF[4], GTP (Go Text Protocol), and the KataGo
> JSON analysis protocol are outside formats, read and written for
> interchange with the world's engines and servers — SGF at the
> position-interchange boundary, GTP at the engine-play boundary, and
> KataGo's JSON at the analysis boundary — none of them canonical; a
> position, a move, or an analysis result crossing one of those
> boundaries round-trips through RMN.

What crosses those boundaries and round-trips
through RMN, in this article's terms, is not just a position or a move —
it is a **readout**: the house's own envelope for a Chu-space state
(§1), not merely a board diagram. No carrier before this article states
the envelope's shape for a readout specifically; as proposal, it is a
FOUR-charged, content-addressed triple `(position, readout, charge)`,
following the glass-sponge note's one content-addressing law,
[the glass-sponge note](../../../../../../../../../../../../../../../../../../../../../../../../engineering-services-section/content/text/documents/articles/notes/2026/08/01/2026-08-01-note-on-the-content-addressed-glass-sponge-semantic-compute-complex.md)
§9:

> `semanticSpicule(x) = ni(canonicalCBOR(typedRMNEnvelope(objectKind,
> semanticType, normalizationProfile, settlementProfile, settledBody,
> witnessRoot)))`

with a `ni:///sha-256;<digest>` identity per RFC 6920. No outside
protocol carries this: SGF addresses a game file, not a readout; GTP is a
stateless command protocol with no content identity at all; KataGo's JSON
analysis output is keyed by request id, not by the semantic content of
the readout it returns. A readout envelope with a `ni:` identity is
addressable, comparable across engines and sessions, and composable with
the rest of the semantic graph in a way none of the three outside formats
attempts.

**One consequence.** Content-addressing makes the readout-envelope
proposal testable independent of whichever engine or protocol produced
it: two readouts of the same question at the same position must hash to
the same `ni:` digest regardless of whether the position was reached via
SGF replay, a GTP session, or a KataGo analysis request, because the
envelope's identity is a function of `(position, readout, charge)`
alone, not of the protocol that carried it there. If two honest
computations of the same readout at the same position — say, the
kernel's own static liberty read and an engine's post-hoc reconstruction
from its own SGF export — produced envelopes that mismatched on
`witnessRoot` or `settledBody` for reasons other than genuinely
different evidence, that would mean the envelope shape is smuggling in
protocol-specific detail it claims not to carry, and the proposal as
stated would be wrong.

## 4. Coordination: a nerve of readout pullbacks

[Obsmetrologia and Go Strategy](./obsmetrologia-and-go-strategy.md)'s
surviving candidate 1 needs "a localized, computable measure of how much,
and exactly where, whole-board reading rather than regional reading
matters" — in this article's terms, a nerve whose edges are §1's readout
pullbacks: an edge between two board regions exists exactly when one move
changes readouts (via `bwd`) in both regions at once.

The existing instrument,
[scripts/derive-shared-liberty-nerve.mts](../../../../../../../../../../../../../../../../../../../../../../../../engineering-services-section/services/computer-engineering-services-section/services/computer-systems-engineering-services-section/services/computer-game-system-services-section/services/go-engine-services-section/services/weiqi-content-validation-service/scripts/derive-shared-liberty-nerve.mts),
is not that nerve. Its own header states the gap precisely:

> vertices are groups, one cell per pair sharing an empty point; H^0/H^1
> read combinatorially by metrologic (rank H^1 = cells - groups +
> components). Adjacency coordination only — cannot see a ladder
> breaker, a stone deciding a distant group's status while sharing no
> liberty with it.

This is the **adjacency baseline**: it builds edges from a purely
spatial relation (sharing a liberty), not from a readout pullback, so a
ladder breaker — a stone many intersections away that changes the "does
this group live" readout on a distant group without sharing a liberty
with it — is structurally invisible to it, no matter how the cohomology
is computed on top. Candidate 1's own instrument still needs edges
defined by readout pullback rather than spatial adjacency.

**The ladder breaker is the acceptance test for any coordination
measure.** This is not a new claim of this article; it is the standing
criterion both the 2026-09-03 program note (§1.5, §3) and this note's own
§1 restate: whatever nerve is built next must place an edge between the
ladder's local region and the ladder breaker's distant region, and must
therefore be built from readout pullbacks (§1's Chu transforms), not from
liberty adjacency. Building that nerve, and running it against real-game
engine disagreement as candidate 1's own falsification path specifies, is
this article's and [The Two-Time Board](./the-two-time-board.md) §6's
shared open edge.

**What would refute it.** The ladder breaker is offered as an acceptance
test, which cuts both ways: build the readout-pullback nerve, run it on
a position with a known ladder and known breaker, and check for an edge
between the ladder's region and the breaker's. If a nerve built strictly
from readout pullbacks — one move changing a `bwd`-computed readout in
two regions at once — still fails to place that edge, then readout
pullback is not the missing ingredient the adjacency baseline lacked,
and this section's diagnosis of *why* the existing adjacency instrument
misses ladder breakers (spatial adjacency, not semantic dependency) is
wrong.
