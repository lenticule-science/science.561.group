---
title: "Weiqi as Arena, Chu Space, Predication, and Manifold"
description: "Program carrier for the owner's 2026-09-03 movement on the house theories of weiqi: what the corpus holds per lineage (the semantic arena, Chu space, Fregean predication, the spatiotemporal knowledge manifold, quantum foam, obsmetrologic strategy), with each claim's carrier and status; how weiqi structure reads onto agentics, enterprises, and Hoare programs; what is executable today; and the current edge."
date-created: 2026-09-03
date-updated: 2026-09-03
type: text
authors:
  - claude-fable-5.1
keywords: ["weiqi", "arena", "chu-space", "predication", "spatiotemporal-manifold", "cohomology", "hoare-program", "agentics"]
---

## 0. The movement this carries

Owner, 2026-09-03 (verbatim, from the session transcript): "we want to visit
the scientific theories we have on weiqi, including those trapped in triage or
legacy directories. There's lots of cool research on weiqi in the real world,
but WE have cool thoughts on its like, spatiotemporal manifold, weiqi as chu
space, weiqi as *fregean predication*, the underlying foundation of quantum
foam, etc. And so basically however it's best for us to invest in our theories
of weiqi, the better. One weird angle we can take is how weiqi can influence
how we approach agentics, enterprising agentics, hoare programs, and other
applications of semiotic and relational theory across our corpus."

This note is the durable carrier for that program. It records, per lineage,
what the corpus already holds and where, with each claim labelled by what it
is (asserted, agent-authored correspondence, Lean-checked, or code), then
the applications, then what was made executable, then the edge. It replaces
nothing; it points. Owner statements on weiqi that precede it: the
2026-08-19 board question ("Is there anything the Obsmetrologia mathematics
contributes to the strategy of Go that is potentially novel and opens new Go
strategy spaces?"), the 2026-08-29 attention-collapse reframe recorded in
[Reframe and Standards](../notes/2026-08-29-note-on-reframe-and-standards.md), and the
2026-09-01 remark that language learning will be "learning language
topologies and grammar spatiotemporal HTT", and the earlier 2026-09-03
statement persisted in `.claude/skills/build-the-semiotic-language-model/SKILL.md`
that the spine runs "Fregean predication → Belnap FOUR → Chu space →
tessellated gyrobifastigium → spatiotemporal knowledge manifolds that
correspond with real quantum, causal, and thermal physics". That spine is
asserted; its application to weiqi is stated for the first time in the
message above. No carrier before it says weiqi as Chu space, weiqi as Fregean
predication, or weiqi as the foundation of quantum foam (whole-tree search,
2026-09-03, current and legacy generations). That is a search miss recorded
as a cold spot, not a refutation. The owner also ruled, the same day: "we
generally never want ONE canonical thing, unless it's one of our real core
protocols like RMN (which probably should be the universal weiqi language we
use)" — applied in [Reframe and Standards](../notes/2026-08-29-note-on-reframe-and-standards.md).

## 1. What the corpus holds, per lineage

### 1.1 The semantic arena (densest carrier)

`engineering-services-section/content/text/documents/articles/notes/2026/08/01/2026-08-01-note-on-the-content-addressed-glass-sponge-semantic-compute-complex.md`
§17, "The monotone, stacked, and twisted Weiqi arena." The conceptual
correspondence is not a claim that the software is a Go board. The note extends
the arena paper's five-tuple `(E, ≤, #, pol, Sym)` (Definition 6.1, author emsenn) with
site, valuation, and closure. Its content:

- The arena `A = (E, <=, #, polarity, symmetry, site, valuation, closure)`
  from the arena paper
  (`gaming-services-section/content/text/documents/articles/notes/2026/07/07/2026-07-07-note-on-gaming-arenas.md`).
  A strategy is "a nonempty prefix-closed family of positions which is
  receptive to every lawful Opponent move".
- §17.4 the board is **stacked**: configurations only grow,
  `x_0 ⊆ x_1 ⊆ x_2 ⊆ ...`; "the whole arena is therefore a stack of board
  fibers over causal configurations". Capture removes a group from the active
  projection, never from the addressed history.
- §17.5 the board is **monotone in knowledge, not in truth**: FOUR charges
  `(positive, negative)`, knowledge order coordinatewise, truth order
  antitone in the second slot. "The game does not monotonically approach one
  player's truth. It monotonically accumulates the evidence from which truth
  and contest are read."
- §17.6 event conflict `#` and informational contest `⊤` are different
  relations; ordinary weiqi forbids two colours on one point, the arena must
  not.
- §17.7 the correspondence table: intersection = typed locus; stone = durable
  commitment event; liberty = "lawful locally available continuation which
  keeps a group/strategy admitted"; atari = one admissible continuation left;
  capture = loss of every active continuation; eye = protected internal
  continuation region; territory = future moves controlled because invasion
  "cannot settle acceptably at available cost"; ko = prevention of an
  unproductive repeated position.
- §17.8 stones (durable evidence) and pebbles (movable verifier resources) are
  not the same object; Go's colours, dependency-pebble colours, and FOUR
  polarity must not be equated.
- §17.10 an **earned proof eye** is a causal hole relative to the opponent's
  success readout (Obsmetrologia `Hole_R`, `Shroud_R`); the "two eyes live"
  theorem is explicitly not yet earned: "Two regions which only look separate
  in one projection may share a fatal causal cut."
- §17.12 ko is the no-nontrivial-cycle shape of the closure corpus: "a genuine
  earlier state cannot recur after new evidence has been admitted".
- §17.13 a pass "cannot be represented as an invisible no-op if it contributes
  to settlement"; it is an explicit event with coverage evidence.
- §17.14 concurrent weiqi: serialize only actual conflict or authority
  boundaries.

Lean and code behind pieces of it, verified on disk: `Obsmetrologia/
CausalSets/BlackHoles/Deshrouding.lean` (§17.11), `Obsmetrologia/GameTheory/
VerificationTournament.lean` (§17.12), and `@red-cup-engineering/gaming`
(`agent-computer-system-engineering-services-section/apps/gaming`, 25 verbs:
arena, strategy, settle, compose, parallel, symmetry). The gaming app carries
no weiqi example; the weiqi kernel imports nothing from it. The theory-practice
bridge note (`epistemology-services-section/.../2026-08-11-note-on-the-theory-practice-bridge.md`)
files §17 as "design correspondence, not proved theorem".

### 1.2 Chu space

- The Chu pair is in §17.3: a transformer is a strategy on `A^⊥ ‖ B`,
  "forward point map: produced values and evidence A -> B / backward state
  map: output tests and contexts B -> A".
- The Lean carrier: `Obsmetrologia/Calculus/Logic/LinearLogicChu.lean`
  defines `ChuSpace` with `r : pts → sts → Charge` and `ChuMap` with the
  adjointness `D.r (fwd a) y = C.r a (bwd y)`, per the
  Gyrobifastigial Chu–Hoare Territory Audit (the 2026-07-18 executive-office note; its legacy snapshot is no longer in the tree)
  (2026-07-18, Leader-prompted, provisional synthesis). That audit's type
  correction binds here: "A Chu space is an evaluation object; it is not by
  itself a geometric base or a tiling."
- The Node carrier: `@red-cup-engineering/metrologic/chu` (registry 0.2.0),
  `chuSpace(points, states, valueAt)` over FOUR with `row`, `extension`,
  `dual`, `chuTransform`.
- The manifold link: the MASH note (§1.3 below) records Jakl's
  `2 ⊗ 2 ≅ Chu(2, 0)` and that each predicate fiber is a Chu object.
- The one prior weiqi-specific ruling:
  [Obsmetrologia and Go Strategy](./obsmetrologia-and-go-strategy.md) rejected
  "Chu-space / concurrent-game semantics for sente and gote" because the
  2026-06-18 concurrent-game note
  (`obsmetrological-services-section/.../2026-06-18-mysterious-machines-strategy-self-and-the-concurrent-game.md`)
  derives Conway's combinatorial game theory as the finite/agon regime of the
  same category: the machinery subsumes existing theory, it does not exceed
  it there. That rejection stands and is not reopened here.

What "weiqi as Chu space" can mean without contradicting the audit or the
rejection: the board carries several honest Chu spaces (evaluation objects),
of which the smallest is the **liberty Chu space**, points = empty
intersections, states = groups, `r(point, group) = t` iff the point is a
liberty of the group. A column is a group's liberty set; a row with two or
more `t` entries is a shared liberty, the point whose one move changes several
strategies at once. This is now code (§3). It is a construction; the Stone
gamut question of whether the whole game is faithfully a Chu object over FOUR
(with `#` and `⊤` kept distinct per §17.6) is open, and the audit's note that
the repository's Chu dual "transposes and negates FOUR values" while the
standard dual is a plain transpose is an open equivalence question.

### 1.3 Predication, Fregean

- The house predication paper,
  `math-services-section/content/text/documents/articles/research-articles/the-adjoint-structure-of-predication-on-bilattice-valued-fibers.md`
  (author emsenn), opens §1: "Frege (1879) established that a predicate is an
  unsaturated function: it takes a subject and returns a value. In a
  subject-predicate-object triple ⟨S, P, O⟩, the predicate P combines S and O
  into an assertion." The paper's predicate fibers over `2 ⊗ 2` are the
  objects the manifold and the Chu fibers are built from.
- The weiqi kernel's own law, board-approved in
  [the platform plan](../notes/weiqi-platform-plan.md) and executed in
  `apps/weiqi-kernel/src/events.mts`: "the engine is the executable form of
  the glossary. Each glossary term corresponds to a named predicate or event
  in the rules kernel"; every semantic event carries a `termRef` to the term
  file. The kernel's events (`atari-given`, `capture`, `ko-started`,
  `connection`, `eye-formed`, ...) are predicates over positions that fire on
  the move that saturates them.

No carrier before 2026-09-03 says "weiqi as Fregean predication". The reading
that follows from the two carriers above, stated as inference: a stone
placement is the saturation of the unsaturated predicate `occupied-by(−,
colour)` at an intersection; a group is the saturation of `connected(−, −)`
across stones; liberty, atari, capture are predicates on the group whose
values move in the knowledge order as stones are added (§17.5); the glossary
is the predicate vocabulary and the kernel is its fiber functor. The
2026-04-21 MASH note already reads the SPO substrate this way for knowledge
generally; weiqi is the smallest concrete world in which every predicate is
also a rule.

### 1.4 The spatiotemporal knowledge manifold

- `computer-science-services-section/.../2026/04/21/mash-as-4d-spatiotemporal-knowledge-manifold-and-oqra-as-nuclear-quartet.md`
  (agent-authored, from the predication paper): three spatial axes `(S, P,
  O)`, one temporal axis = cascade depth ("Time in MASH is cascade depth"),
  each predicate fiber a `Chu(2, 0)` object, and a Priestley-dual topology
  whose open sets are "natural region boundaries for things like permission
  scopes, perception horizons, 'what counts as here'".
- The research articles `spatiotemporal-knowledge-hyperdoctrines.md` and
  `spatiotemporal-knowledge-cohomology-via-paired-priestley-duality.md` in the
  math section (author emsenn) carry the formal object.
- §17.4's stacked board is the same shape seen from the game: a two-axis
  spatial base (intersection × colour-predicate) fibered over a causal
  configuration order, each fiber "a different set of enabled moves, local
  holes, shrouds, restrictions, charges, and strategy continuations".

Three house lineages share the words "manifold", "holes", and "foam" and are
not one theory: the MASH knowledge manifold above; the resolution-floor tower
(§1.5); and the causal-set lineage, which is the only one a weiqi carrier
explicitly uses. `Obsmetrologia/CausalSets/Dimension/Manifoldlikeness.lean`
states the causal-set Hauptvermutung cohomologically: "the cohomology of that
order complex *is* the topology of the reconstructed spacetime — its Betti
numbers are the holes of the approximated manifold", proves the invariance
half (pullback along a factor map is a cochain map) and the Euler
characteristic half (Hall's theorem, `hallSum = mobius`), and leaves the full
convergence as frontier. §17.10 imports that lineage's `Hole_R`/`Shroud_R`
for the eye; the same apparatus is reused unchanged in the LAGOON
architecture spec for unobserved remote deploys. So the manifold a weiqi game
reconstructs, in the house's own terms, is the causal-set one: the stacked
configurations are the causal set, the order complex's cohomology is the
board's topology, and eyes are its holes.

The link between that and the MASH manifold is stated in no carrier before
this one. As inference: a weiqi game
is a spatiotemporal knowledge manifold whose spatial axes are the board's
intersections and the colour predicate, whose temporal axis is move depth
(the causal configuration order, not clock time), whose fibers are the
kernel's positions, and whose Priestley-dual regions are territories and
eyes, the "what counts as here" of the board. Territory as a region of the
dual topology is the sharpest form of §17.7's "territory" row and is
unproved.

### 1.5 Quantum foam

- The owner's resolution-floor term
  (`emsenn-services-section/content/text/glossary/terms/resolution-floor.md`,
  prediction 2): "Gluing failures as 'quantum foam'. The observed foam-like
  structure of spacetime at sub-Planck scales ... is predicted to be
  topological: individual local measurements are internally consistent but
  globally incoherent due to J-gluing failure."
- `hole-regions-as-cells.md` (math research articles) audits and rejects the
  reading of a causal hole as a CW cell and lists spin foams among the near
  misses, so "foam" in the house sense is gluing failure, not a spin-foam
  complex.
- The weiqi carrier of the same object is
  [Obsmetrologia and Go Strategy](./obsmetrologia-and-go-strategy.md) surviving
  candidate 1: `CoordinationCohomology.lean` proves the cover nerve's
  `Ȟ¹ = |E| − |V| + |C|` "counts exactly the cells in excess of a spanning
  forest — the irreducible cross-region coordination"; the conjecture is that
  the nerve of Go regions and shared-effect points measures "how much, and
  exactly where, whole-board reading rather than regional reading matters".
  Candidate 2 reads aji as the inconsistency sheaf's gluing obstruction. The
  wilder-conceptions note
  (`gaming-services-section/.../2026-08-19-note-on-wilder-conceptions-01.md`)
  places a triple ko in the ilinx regime "for the identical structural reason
  — H¹≠0, unsettleable from within".

So "weiqi as the underlying foundation of quantum foam" reads, as inference
consistent with all three carriers: the foam is the nonvanishing first
cohomology of local readings that will not glue, and a Go position is the
smallest exactly-computable world in which that quantity has a name (aji,
whole-board vision) and a falsification path. The shared-liberty (adjacency)
nerve computes `H¹` over real positions as of this note (§3), but it measures
adjacency coordination only — a ladder breaker, a stone that decides a
distant group's status while sharing no liberty with it, is invisible to it.
Candidate 1's own instrument still needs edges by readout pullback (one move
changing readouts in two regions), with the ladder breaker as the acceptance
test; only once that reading nerve exists is whether the number tracks
anything a strong engine sees the open test.

### 1.6 Strategy

[Weiqi Strategic Theory](./2026-08-29-note-on-weiqi-strategic-theory.md)
supplies the vocabulary (influence, thickness, sente, gote, aji) the strategy
inquiry presupposed and names eleven glossary terms still missing; its §6
classification (readings over a board fiber, relations between moves, CGT)
is the seating guide for any further weiqi mathematics. The affects note
(`computer-science-services-section/.../2026-08-29-note-on-the-unbuilt-affects.md`
§3) reads hope as held-⊥, the same structure the strategy note proposes for
aji; whether that is one object or a rhyme is an open question both notes
name.

### 1.7 Legacy and triage inventory

Swept 2026-09-03 with one reader and one refuter per claim. No
`content/text/triage` directory in the tree mentions weiqi. Every legacy
weiqi carrier is a copy of what this section already holds: the ten-term
glossary (atari, capture, connection, eye, handicap, ko, komi, liberty,
life-and-death, territory) and the four texts (overview, history, living
groups and eyes, komi and handicap) recur as markdown under the relationality
`2026-06-23-animating` snapshot and the science `2026-07-31-lenticule-science-corpus`
bucket-4 dump, and as emsenn.net HTML renderings in two places (the
game-ludics `2026-08-17-windows-library` archive and the lenticule corpus's
`library/arts/ludics/games/archive`), plus a five-term `go/` directory in the
same corpus. Where bodies were diffed (liberty, weiqi-history, living-groups-
and-eyes) every hunk is frontmatter or link-path only; the live files carry
more metadata (`requires`, `teaches`, `cites`). The legacy predicated-computer
material beside the relationality copy is cybernetics and predication theory
with no weiqi rules, engine, or play code. Disposition: duplicates superseded
by this section; nothing to revive; deletion inventory when that legacy
snapshot is closed as a whole.

## 2. Weiqi read onto agentics, enterprises, and Hoare programs

Every row below cites the carrier that already states the mapping; rows
marked "inference" are this note's and are unproved.

| weiqi | agentics / enterprise / program | carrier |
|---|---|---|
| Player and Opponent | polarities relative to an interface, not identities; "at a downstream consumer seam, the producer's output changes polarity" | glass-sponge §17.2 |
| a move `{P} f {Q}` | a Hoare program: `precondition`, `move`, `postcondition`, `preserves`; the Hoare triple is the lax Chu condition `P ≤ f*(Q)` | `Obsmetrologia/Computing/HoareProgram.lean` (restored to the live tree 2026-09-03, commit 3c76b4e15a6); territory audit, `boolean_hoare_is_lax_chu` (compiled, axiom-free, not committed) |
| stone then capture resolution | `KeratinousHoareProgram`: "lock the seed, then settle it" — irreversible locking followed by Tarski settlement to the least compatible section | `HoareProgram.lean` |
| the kernel's `Game.play` | the finite Boolean instance of that program: precondition = `isLegal` (occupied, suicide, ko regime), move = `applyStonePlacement`, postcondition = the position invariants the 73 kernel tests state | inference; `apps/weiqi-kernel/src/game.mts` |
| liberty | a duty's lawful available discharge that keeps the strategy admitted | §17.7 |
| atari | one admissible continuation left before operational defeat | §17.7 |
| capture | removal from active incarnation, never from addressed history (a dissolved enterprise keeps its ledger) | §17.4, §17.7 |
| eye | a hole relative to the opponent's success readout; a protected border under the distal-bypass law is the enterprise form | §17.10, §18 |
| two eyes | two independent readout-inaccessible regions immune to a single enclosing challenge; on the grid this is Benson's theorem (1976): unconditional life iff every chain has two vital regions, independence being vitality; the transport to the honeycomb is the open Lean lot | §17.10; [benson1976](../bibliographies/benson1976.md); [Strategy Spaces the Engines Cannot See](strategy-spaces-the-engines-cannot-see.md) §5 |
| seki | a contested `⊤` locus settled as a durable interface rather than one side winning | §17.13 |
| ko | no nontrivial cycle in the full monotone state; an oscillating process with no new addressed evidence is "either already at a fixed point, performing an unrecorded effect, or violating monotonicity" | §17.12 |
| pass | an explicit event "asserting that a player currently offers no admissible profitable move under a declared observation frontier", with coverage evidence | §17.13 |
| whole-board reading | `H¹` of the coordination nerve: the cross-region coordination a regional decomposition cannot see | obsmetrologia-and-go-strategy candidate 1 |
| aji | held ⊥ with option value; the inconsistency sheaf's gluing obstruction | candidate 2; strategic-theory §4; affects §3 |

One operational consequence follows from the pass row and was admitted as a
friction this session: the production work rail reports `ready=0` as an
absence, while §17.13 requires a pass to be an explicit, coverage-backed
event. An executor that finds no ready duty should admit a pass with the
frontier it covered, so that settlement (two consecutive passes, the game
over) is itself addressed evidence rather than silence.

## 3. What is executable as of this note

Two single-transformation scripts in this section, tested by `npm test`
(4 tests, 4 pass, counted 2026-09-03), composing the kernel with
`@red-cup-engineering/metrologic@0.2.0` (exact pin; the section's first house
dependency, closing the "island" shape named in org-layering):

- `scripts/derive-liberty-chu-space.mts`: position → the liberty Chu space over
  FOUR via `metrologic/chu`; also `positionFromSgf`, replaying a record
  through the kernel so captures and ko are the kernel's.
- `scripts/derive-shared-liberty-nerve.mts`: liberty Chu space → the adjacency
  nerve (groups as vertices, one cell per pair sharing a liberty) → `H⁰`, `H¹`
  read by `metrologic/obstruction/cochain` (`rank H¹ = cells − groups +
  components`), with same-colour and opposite-colour cells counted separately.
  This is the adjacency nerve, not candidate 1's own instrument: adjacency
  edges cannot see a ladder breaker, a stone that decides a distant group's
  status while sharing no liberty with it. Candidate 1's instrument needs
  edges by readout pullback (one move changing readouts in two regions), with
  the ladder breaker as its acceptance test — that reading nerve is not yet
  built.

On a 26-move 9×9 sample the adjacency nerve had 7 groups, 5 shared liberties,
5 cells, 2 components, `H¹ = 0`. That number measures adjacency coordination
only; it is not yet the instrument the falsification path in
[Obsmetrologia and Go Strategy](./obsmetrologia-and-go-strategy.md) needs for
candidate 1 (correlate against engine review over real games; "no
correlation kills the idea") — the reading nerve over readout pullbacks is.

A seating finding was recorded through the record journal
(`data/logs/2026/09/03/`, category `import-stratification-finding`): the
kernel, the section's domain semantics, sits under `apps/` and the scripts
import it as `src`; relocating it is one bounded lot, not an en-passant fix.

## 4. Thread-mates and the edge

The five custodies this program must thread: **science** (this section and
the obsmetrological section: the carriers above); **engineering**
(`@red-cup-engineering/gaming`, which has no weiqi arena example, and the
kernel, which knows nothing of `HoareProgram.lean`); **operations** (nothing:
no runbook computes a weiqi readout); **561-group** (the rail's pass event,
admitted); **public** (`weiqi.561.group`, per the games deploy runbook).

Material uncertainties, in the order they block: the transport of Benson's
two-eyes theorem from the grid to the honeycomb (the grid case is proved,
1976); whether the reading nerve's `H¹`, once built over readout pullbacks,
predicts engine disagreement (candidate 1);
whether held-⊥ is one object across aji and hope; the Chu dual convention;
whether the liberty Chu space extends to a faithful Chu presentation of the
whole game with `#` and `⊤` distinct.

Current edge: build the reading nerve over readout pullbacks (edges where one
move changes readouts in two regions), with a ladder breaker as its
acceptance test, then run it over a real game corpus against an engine's
per-move review, the first experiment the 2026-08-19 inquiry asked for and
could not run. Behind it: a weiqi arena example in the gaming app, and the
kernel's move stated as a `HoareProgram` instance.

**The lineage articles.** Three research articles carry this program's
material forward into named, cited proposals and one falsifiable claim,
each in the shape of the math section's research articles:
[The Two-Time Board](./the-two-time-board.md) (§1's stacked board and §1.2's
cascade depth as two time axes, split by the saturation/transfer nuclei of
`org-layering.md`'s EAVT custody, giving territory/aji/dame/contested as
four readings, ko regimes as trace-projection injectivity choices, and a
falsifiable claim against KataGo's scalar ownership readout);
[Readouts as a Chu Space, Coordination as Cohomology](./readouts-as-a-chu-space-coordination-as-cohomology.md)
(§1.2's Chu pair as the honest Chu space of readouts, the Hoare triple as
its lax Chu condition per the 2026-07-18 audit, and SGF/GTP/KataGo-JSON as
the three non-canonical boundaries RMN's standing crosses); and
[Whole-Board Reading as a Gluing Problem, and Lineages as Signatures](./whole-board-reading-as-gluing-lineages-as-signatures.md)
(the cover-nerve rank of `CoordinationCohomology.lean` read against an
owner-reported neuroimaging claim this section's own bibliography does not
verify, and a teaching lineage read as a cluster in the space of readout
signatures). All three are proposal- and conjecture-labelled extensions of
the material above, not settlements of it.
