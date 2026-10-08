---
title: "The Two-Time Board"
type: research-article
author: claude-fable-5.1
keywords:
  - weiqi
  - go
  - arena
  - stacked-board
  - cascade-depth
  - eavt
  - saturation
  - transfer
  - bilattice
  - four-valued-logic
  - ko
  - superko
  - aji
  - territory
  - dame
  - katago
  - ownership
date-created: 2026-09-03
status: proposal
what-is-proved:
  - "@red-cup-engineering/eavt 0.6.0 (src/eavt.mjs): saturate/transfer/stratify compute Fix σ, Fix Δ, and H* = Fix σ ∩ Fix Δ as separate derived passes over a trace — the general two-nuclei machinery §3 reads onto weiqi's two time axes. The package proves the two nuclei stay separate passes over any trace; it knows nothing about weiqi, so the move-time/reading-depth assignment itself stays this article's proposal."
  - "weiqi-obsmetrologia-services-section/lib/weiqi-obsmetrologia/WeiqiObsmetrologia/Ko.lean: SimpleKo, PositionalSuperko, SituationalSuperko as trace predicates realizing the kernel's three-regime KoRegime table as Lean objects, not a gloss on them — positionalSuperko_implies_simpleKo, positionalSuperko_implies_situationalSuperko, situationalSuperko_not_implies_positionalSuperko (the missing third implication, a decide-checked counterexample rather than a silent gap), and Board.positionalSuperko_length_le (a trace under positional superko on a board of Board.card = n points has length ≤ 3 ^ n, weiqi-obsmetrologia-services-section/lib/weiqi-obsmetrologia/WeiqiObsmetrologia/Board.lean). §5's orbit-injectivity reading is now this proved record, applied by this article to the kernel's KoRegime table below rather than argued from scratch each time."
  - "apps/weiqi-kernel/src/game.mts (checkKoViolation) and src/rulesets.mts (KoRegime): the three ko-regime checks are working, exercised code — this section's npm test suite passes 4/4 over the kernel-composing scripts. The correspondence between this table and Ko.lean's three predicates is this article's application of the Lean record to the kernel's names, not a claim that the kernel code is itself Lean-checked."
description: One of the three lineage articles named in Weiqi as Arena, Chu Space, Predication, and Manifold §4.
---

# The Two-Time Board

One of the three lineage articles named in [Weiqi as Arena, Chu Space,
Predication, and Manifold](./2026-09-03-note-on-weiqi-as-arena-chu-space-predication-and-manifold.md)
§4. It synthesizes, and extends by explicit proposal, three carriers that
already treat move time, reading depth, and the house's two-nucleus EAVT
model separately but never together for weiqi.

## 1. The board is a fold of the game record

The glass-sponge note's account of the semantic
arena states the object plainly:
[the content-addressed glass-sponge note](../../../../../../../../../../../../../../../../../../../../../../../../engineering-services-section/content/text/documents/articles/notes/2026/08/01/2026-08-01-note-on-the-content-addressed-glass-sponge-semantic-compute-complex.md)
§17.4, "The board is stacked because configurations only grow":

> `x_0 ⊆ x_1 ⊆ x_2 ⊆ ...` Each `x_i` is a down-closed configuration... The
> apparent board at time `i` is a projection or fiber over `x_i`. The whole
> arena is therefore a stack of board fibers over causal configurations. It
> is not merely a replay log: each higher layer has a different set of
> enabled moves, local holes, shrouds, restrictions, charges, and strategy
> continuations.

Read plainly: the causal history of moves — the game record — is the
primary object, an ever-growing down-closed set of events. The "board" a
player sees at move `i` is not itself the object; it is the fiber of that
object over `x_i`, a fold of the record back down to one apparent
two-dimensional surface. Capture is the clearest evidence for this
reading: a captured group disappears from the active projection but never
from the addressed causal history (§17.4, "This is how the system can have
the operational effect of Go capture without lying that contrary evidence
was never placed"). SGF, which records the full move sequence rather than
a sequence of board snapshots, is already the house's working carrier of
the record-as-object; the "board" that a viewer renders from an SGF file
is already, in practice, this fold.

**One consequence, worked.** If the board is genuinely a fold of an
ever-growing trace rather than a sequence of independent snapshots, two
fibers over the same trace — the state after move 2 and the state after
move 7 — must be two projections of *one* object, so the earlier fiber
has to stay recoverable by re-folding to a shorter prefix, not merely
inferable from a separate log. The kernel's `positionFromSgf` does
exactly this fold: it replays an SGF record's move prefix and returns
the position after however many moves are asked for. The following
record plays a capture on a 9x9 board (Black surrounds a lone White
stone at C8 and takes it on the seventh move):

```sgf
(;GM[1]FF[4]SZ[9]RU[chinese];B[bh];W[ch];B[dh];W[];B[cg];W[];B[ci])
```

Replayed in full (`--move 7`, or no `--move` at all), White's stone is
gone from the active projection: `states` lists four Black groups only,
and `B@C7`/`B@B8`/`B@D8`/`B@C9` share liberty `C8`, the point the
captured stone once occupied. Replayed to the fold *before* the capture
(`--move 2`), the same trace's earlier fiber still carries the White
stone as a live state: `states` is `["B@B8", "W@C8"]`, with `W@C8`'s
liberties `["C7", "D8", "C9"]` intact. One SGF record, two different
`--move` arguments, two different fibers — the earlier one recovered
exactly, not approximated — is the fold claim made concrete: the trace
never lost the evidence that White once stood at C8, it only stopped
projecting that evidence into the active board once move 7 fired.

## 2. Reading depth is a second time axis

Move time is not the
only temporal axis a weiqi position carries. The [MASH note](../../../../../../../../../../../../../../../../../../../../../../engineering-science-services-section/services/computer-science-services-section/content/text/documents/articles/notes/2026/04/21/mash-as-4d-spatiotemporal-knowledge-manifold-and-oqra-as-nuclear-quartet.md)
§1.2, "One temporal axis," states for MASH generally:

> Time in MASH is *cascade depth* — how many settlement steps have fired
> since a given claim entered the wavefront... The manifold's temporal
> axis is discrete, finite, and terminates deterministically for every
> input.

MASH's cascade depth is a property of the inference engine's own
fixed-point iteration (bounded to at most 2 steps per morphism instance,
per the paper's Proposition 8), not of weiqi. No carrier before this
article applies cascade depth to weiqi specifically. As proposal: a
weiqi reading — a player's look-ahead, or an engine's tree search — is
its own cascade, an iteration of the same predicate machinery (does this
group live, is this point black's) deeper into hypothetical continuations
that have not been played. Reading depth is therefore a second time axis,
distinct from move time: move time indexes the actual, addressed causal
history (§1 above); reading depth indexes how far a cascade has been run
into *unaddressed*, hypothetical continuations from a fixed position.

Combined with §1.3 of the MASH note (each predicate fiber a Chu object,
detailed in the companion article
[Readouts as a Chu Space, Coordination as Cohomology](./readouts-as-a-chu-space-coordination-as-cohomology.md)),
this gives, as proposal: the weiqi manifold is

```text
board × predicate × object, fibered over move-time × reading-depth,
```

with **four** charges at each fiber — not two spatial and one temporal
axis as in the MASH note's general (S, P, O) manifold, but two spatial
axes (board, predicate/object collapsed to the readout question) crossed
with two temporal axes (move-time, reading-depth). This is a proposal of
this article; the general MASH manifold does not itself carry a two-axis
temporal factor.

**What would refute it.** If reading depth were not actually a second
axis but only a relabeling of move time — if, for a fixed position, the
readout an engine's search settles on at cascade depth `d` were always
identical to the readout the *actual game* settles into `d` moves later
from that same position, for real games and real engines — then the two
axes would collapse to one and this section's two-axis manifold would be
false economy: one time axis, indexed twice, would say everything the
two say. The observation that would falsify the two-axis claim is
therefore a correlation, not an absence: search-depth readouts tracking
played-move-time readouts move-for-move on a corpus of real games.

## 3. Two nuclei split the two axes

The house's EAVT custody rule
(`.claude/rules/org-layering.md`, retired with the projected harness on 2026-09-10; the clause is quoted here,
"EAVT custody," owner-recognized 2026-08-30) states two separate nuclei
over a trace, never fused:

> `eavt` (0.5.0) realizes this: saturate/transfer/stratify give `Fix σ`,
> `Fix Δ`, and `H* = Fix σ ∩ Fix Δ` as separate derived passes over a
> trace, never a stored field... asserted / saturated (`Fix σ`, the
> past-stable) / settled (`H* = Fix σ ∩ Fix Δ`) are different strata and
> must never be stored indistinguishably; σ and Δ are separate nuclei,
> never one lumped fold.

`σ` (saturation) is the past-cone nucleus: what a trace's completed,
addressed history already fixes. `Δ` (transfer) is the future-cone
nucleus: what the trace's forward projection fixes. As proposal, applied
to weiqi for the first time by this article: `σ` operates over the
move-time axis — it reads what the actual game record (§1) has already
settled — and `Δ` operates over the reading-depth axis — it reads what a
cascade of hypothetical continuations (§2) settles from here forward. SGF,
already identified in §1 as the record-as-object carrier, is therefore the
**past-cone carrier**: it is exactly the addressed trace `σ` saturates
over. Engine analysis — a search tree of continuations not yet played — is
the **future-cone carrier**: it is exactly the projection `Δ` transfers
over. `H* = Fix σ ∩ Fix Δ`, the least fixed point of both nuclei together,
is the object §4 below calls territory.

**One consequence.** If `σ` really operates only over move-time and `Δ`
only over reading-depth, then `saturate()` run over nothing but the SGF
trace — no search, no hypothetical continuations — should already
reproduce, for every point the actual game record has settled, the same
value a strong engine's *static* (non-search) evaluation gives at that
point, because both are reading `Fix σ` off the same addressed history.
Where the two disagree is where the assignment is doing real work: a
point `saturate()` calls fixed from the record alone but a static
evaluator scores as uncertain is either evidence the engine's static
pass is itself smuggling in some reading depth, or evidence the
move-time/reading-depth split is not as clean as §3 proposes. No corpus
run backs this yet; it is stated here as the concrete check the
assignment owes before it is trusted past this article.

## 4. Four definitions

The four definitions below are this article's own proposals. `aji.md`'s own
entry already proposes, from the 2026-09-03 program note, that "territory
is the settled case in both readings" and that aji "reads as a cell
unsettled by the past reading and still changeable by the future
reading" ([`aji`](../../../glossary/terms/aji.md)); this section names
that reading precisely in the σ/Δ vocabulary of §3 and extends it to two
further points, dame and contested, that no carrier states in these terms
before this article.

**Territory.** A point `p` is territory iff `p ∈ Fix σ ∩ Fix Δ` at the
same single-owner value: the completed history already fixes it for one
color, and no cascade of continuations moves it. This is `H*` itself
(§3). See [`territory`](../../../glossary/terms/territory.md) — "the set
of vacant points effectively enclosed by one player's stones and
unavailable to the opponent except at unacceptable cost" — read here as
the settled-in-both-nuclei case.

**Aji.** A point (or cell) `p` is aji iff `p ∉ Fix σ` — the past reading
has not fixed it, it is held at the unwitnessed value `⊥` rather than
collapsed to a determinate charge — while `Δ` still moves it: some
continuation in the reading cascade changes its value. Its worth is
option value, not a value it would take if forced now. This is, as
proposal, **the same object** the affects note calls hope, not a rhyme of
it. [The unbuilt-affects note](../../../../../../../../../../../../../../../../../../../../../../engineering-science-services-section/services/computer-science-services-section/content/text/documents/articles/notes/2026/08/29/2026-08-29-note-on-the-unbuilt-affects.md)
§3 defines hope at a position `π` as holding a cell at `⊥` rather than
collapsing it to `f` (despair) or `t` (presumption): "hope obtains at `π`
iff... the ⊥ is *held* — the reading does not collapse it to **f**." That
note and the 2026-09-03 program note both leave "whether that is one
object or a rhyme" as an open question; this article's proposal is that it
is settled by §3's construction — aji-keshi, the error of spending aji's
option value for an immediate gain, is exactly the premature `⊥ → t`
collapse the affects note calls presumption, played out on a board fiber
instead of a chronicle. `Aji-keshi` on this reading is presumption's
weiqi instance, not merely its analogue.

**One consequence.** [Atari as One Local Future](./2026-09-03-note-on-atari-as-one-local-future.md)
§6 puts a number on the `⊥`-held case: a cellular sheaf Laplacian on the
board reads a cell that "disagrees with its neighbours' expectations,
with no move yet resolving it" as carrying nonzero energy, out of the
Laplacian's kernel. If aji is `p ∉ Fix σ` with `Δ` still moving it, then
aji's option value is that same nonzero energy — not a metaphor for it,
the same quantity read spectrally — and the consequence is falsifiable
the same way: an aji point's Laplacian energy should fall as reading
depth (`Δ`'s cascade, §2) resolves it toward `Fix Δ`, exactly the decay
the atari note's §8 asks be measured against engine search visits.

**Dame.** A point `p` is dame iff `p ∈ Fix σ ∩ Fix Δ`, like territory, but
fixed at the neutral value: both nuclei agree `p` belongs to neither
color. [`dame`](../../../glossary/terms/dame.md) — "the neutral, empty
points left on the board that border stones of both colors and belong to
neither player's territory" — is territory's settled-negative twin: same
membership in `H*`, opposite charge. **One consequence**, inherited
directly from territory's: since dame and territory share `H*`
membership and differ only in charge, a point can never move from dame
to aji or from aji to dame without first leaving `H*` at all — a dame
point that later becomes disputed is evidence either that it was
misclassified (not actually in `Fix σ ∩ Fix Δ`) or that `H*` moved,
which under §3's construction should not happen without new evidence
entering the trace. A dame point reopening as a live fight with no new
move played would refute the settled-once-in-`H*`-stays-settled reading
this definition assumes.

**Contested.** A point `p` is contested iff `σ` and `Δ` disagree, or the
value itself carries evidence both ways — the `⊤` charge of FOUR rather
than a clean `t`/`f`/`⊥`. This is a live fight: neither the past nor the
future reading has settled it one way. The 2026-09-03 program note's own
table already uses this word for one specific case, seki, without
generalizing it:
[Weiqi as Arena, Chu Space, Predication, and Manifold](./2026-09-03-note-on-weiqi-as-arena-chu-space-predication-and-manifold.md)
§2, "seki | a contested `⊤` locus settled as a durable interface rather
than one side winning | §17.13." This article's proposal generalizes:
seki is the special case of contested where both nuclei come to agree
that the `⊤` charge is itself the settled value — a durably shared
locus — rather than the general case, where a contested point is
provisionally `⊤` pending resolution by further play. See also
[`seki`](../../../glossary/terms/seki.md).

**What would refute it.** The seki-generalizes-contested claim predicts
a one-way door: a contested point can settle into seki (both nuclei
agreeing `⊤` is the durable value) or collapse into territory/dame (both
nuclei agreeing on `t`/`f`/neutral), but it should never oscillate
between the two without a new move being played, because both are
readings of the same fixed trace under §3's nuclei. A position where
resolving the same contested point twice, from the same trace and the
same reading budget, yields seki on one pass and a clean territorial
count on another would mean `σ`/`Δ` are not actually functions of the
trace alone — which is exactly the failure mode this article's whole
construction depends on not happening.

## 5. Ko regimes as trace-projection injectivity choices

The kernel's `KoRegime`
type,
[`@red-cup-engineering/weiqi-engine@0.1.0` rulesets.mts](https://registry.561.group/@red-cup-engineering/weiqi-engine/-/weiqi-engine-0.1.0.tgz):

```text
export type KoRegime = "simple_ko" | "positional_superko" | "situational_superko";
```

is realized in
[`@red-cup-engineering/weiqi-engine@0.1.0` game.mts](https://registry.561.group/@red-cup-engineering/weiqi-engine/-/weiqi-engine-0.1.0.tgz)'s
`checkKoViolation`, which checks a candidate position against `history`
under exactly three rules, quoted verbatim from that function's own
comment:

> - simple_ko forbids only recreating the single position that existed
>   immediately before the opponent's last move — i.e.
>   `history[length-2]`.
> - positional_superko forbids recreating ANY prior board arrangement
>   (stones only, turn ignored).
> - situational_superko forbids recreating any prior (arrangement, player
>   to move) pair.

Framed in this article's terms: each regime is a choice of *which
projection of the trace must be injective on the orbit*. Simple ko demands
injectivity only against the immediate predecessor — a one-step lookback
on the board projection. Positional superko demands injectivity of the
**board projection** (`boardHash`) against the whole history. Situational
superko demands injectivity of the **(board, to-move) projection**
(`situationalHash`) against the whole history — a strictly finer
projection than positional superko's, since it can distinguish the same
stone arrangement recurring with different players to move.

This reading is no longer only a reading: `weiqi-obsmetrologia-services-section/lib/weiqi-obsmetrologia/WeiqiObsmetrologia/Ko.lean`
states the same three regimes as trace predicates — `SimpleKo`,
`PositionalSuperko` (no position recurs — `trace.Nodup`), and
`SituationalSuperko` (no `(position, side-to-move)` pair recurs) — and proves
`positionalSuperko_implies_simpleKo`, `positionalSuperko_implies_situationalSuperko`,
and, as the missing third implication made explicit rather than left
unstated, `situationalSuperko_not_implies_positionalSuperko` (a one-point-board
counterexample: the same position recurring under different sides to move
satisfies situational but not positional superko). It further proves the
**termination bound** the kernel's regime table implies but never states: under
`positional_superko`, `Board.positionalSuperko_length_le` bounds a trace on a
board of `n` points at `3 ^ n` plies — every position is injected into the
`3 ^ n`-element space of stone-tuples over the board's points
(`Discrete.Graph`'s `Reach`-free, `List`-based enumeration, since this library
carries no `Fintype`), so a duplicate-free trace cannot outrun that bound. This
reading of ko as an orbit-injectivity condition matches the
glass-sponge note's account of semantic ko,
[the glass-sponge note](../../../../../../../../../../../../../../../../../../../../../../../../engineering-services-section/content/text/documents/articles/notes/2026/08/01/2026-08-01-note-on-the-content-addressed-glass-sponge-semantic-compute-complex.md)
§17.12: "The full addressed causal/evidence position has built-in
superko: a genuine earlier state cannot recur after new evidence has been
admitted," resting on "a no-nontrivial-periodic-orbit shape: if a monotone
closure orbit returns to its start after a positive number of steps, the
start was already a fixed point" from the closure corpus. This article
does not itself inspect that closure-corpus proof; it is cited, per §17.12,
as the mathematical shape the kernel's three-regime table is a finite,
game-specific instance of.

**One small worked example.** A genuine ko fight — capture, an
intervening move elsewhere, then legal recapture — is the injectivity
reading made concrete: the recapture is legal exactly because the
intervening move makes the post-recapture position a board arrangement
that never occurred before, not a repeat. The record below builds a
one-stone ko on a 5x5 board under the `chinese` ruleset
(`positional_superko`): three Black stones and four White stones placed
by alternating play (passes fill the other color's turns while one side
sets up), Black then captures a lone White stone at C3 by playing C4,
White plays a ko threat at E5 rather than illegally recapturing at once,
Black passes, and White then legally retakes at C3:

```sgf
(;GM[1]FF[4]SZ[5]RU[chinese];B[cb];W[];B[bc];W[];B[dc];W[];B[];W[cc];B[];W[bd];B[];W[dd];B[];W[ce];B[cd];W[ee];B[];W[cc])
```

Replaying this record (`node scripts/derive-liberty-chu-space.mts --sgf
<file>`) shows `W@C3` back among the live states with exactly one
liberty, `C4` — the ko point — confirming the recapture landed and left
the position in atari again, ready for the next threat-and-retake cycle.
Deleting the `W[ee]`/`B[]` pair and recapturing at C3 immediately after
Black's capture reproduces the pre-capture board exactly, `history[length-2]`,
which `checkKoViolation` refuses under every regime in `rulesets.mts`,
`chinese` included — the illegal half of this example is not shipped
here as a fenced block, since an illegal move throws rather than
replays, but it is one edit away for anyone who wants to see the refusal
fire.

## 6. The falsifiable claim

An engine's scalar
ownership readout near zero is, by construction, unable to distinguish
two different situations this article's §4 keeps apart: a point that is
aji (unwitnessed, `⊥`, worth staying open) and a point that is contested
(evidence both ways, `⊤`, a live fight not yet resolved). Both read as "no
strong lean either way" on a signed scalar in `[-1, 1]`.
[katago-analysis-engine](../bibliographies/katago-analysis-engine.md)'s
own "What it does not settle" section states the engine's actual shipped
output: "scalar per-move and per-point statistics (win rate, score,
ownership mean and standard deviation) — it does not interpret them
strategically," and
[obsmetrologia-and-go-strategy.md](./obsmetrologia-and-go-strategy.md)
already names KataGo's "shipped per-point ownership standard deviation
and score variance" as "scalar sampling statistics" too coarse for the
aji/settled distinction its candidate 2 tries to formalize.

**Conjecture.** A FOUR-charged ownership readout — one that keeps
positive evidence and negative evidence in separate slots, per
`ChuSpace`'s `Charge` rather than collapsing them into one signed
scalar — separates the two cases by construction: unwitnessed (`⊥`, no
evidence either way) and contested (`⊤`, evidence both ways) are distinct
values, where a signed scalar near zero is one value for both. What follows
from the definitions alone is that an aji point's readout moves toward `t`
or `f` as reading depth increases, because deeper reading is what
witnesses an unwitnessed cell. Whether a persistently contested point is
contested *because* its resolution depends on context elsewhere on the
board is not entailed by the definition of contested; it is the strategy
inquiry's second surviving conjecture (the inconsistency sheaf as aji) and
is cited here as that, not deduced.

**Falsification path.** Take a corpus of KataGo-analyzed positions.
Classify near-zero-ownership points into this article's aji/contested
split using the reading-nerve instrument
[Readouts as a Chu Space, Coordination as Cohomology](./readouts-as-a-chu-space-coordination-as-cohomology.md)
§4 names as the open next build (over
[`derive-shared-liberty-nerve.mts`](../../../../../../../../../../../../../../../../../../../../../../../../engineering-services-section/services/computer-engineering-services-section/services/computer-systems-engineering-services-section/services/computer-game-system-services-section/services/go-engine-services-section/services/weiqi-content-validation-service/scripts/derive-shared-liberty-nerve.mts)'s
adjacency baseline, once extended to readout-pullback edges). For each
classified point, compute ownership variance as a function of search
visits ([wu2019](../bibliographies/wu2019.md)). If aji-classified and
contested-classified points show statistically indistinguishable
variance-decay curves — if deeper search resolves both populations at the
same rate, or neither — the conjecture is false: a FOUR-charged readout
would be separating nothing an engine's existing scalar statistics do not
already distinguish equally well. No correlation kills the idea.
