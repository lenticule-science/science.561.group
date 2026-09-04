---
title: "Whole-Board Reading as a Gluing Problem, and Lineages as Signatures"
type: research-article
author: claude-fable-5.1
keywords:
  - weiqi
  - go
  - coordination-cohomology
  - ladder
  - sociality
  - executive-function
  - lineage
  - teaching
  - termref
  - rmn
date-created: 2026-09-03
status: proposal
what-is-proved:
  - "Obsmetrologia/Cohomology/CoordinationCohomology.lean: the cover-nerve cycle rank Ȟ¹ = |E| − |V| + |C|, and tree_coordination_free (Ȟ¹ = 0 on any FinTree). §1's reading of a regional-strategy gluing failure as this obstruction is this article's conjectured application of a proved combinatorial identity to Go regions, not itself proved of Go."
  - "scripts/derive-shared-liberty-nerve.mts + @lenticule-science/metrologic/obstruction/cochain: the adjacency-baseline nerve (rank H¹ = cells − groups + components) is working, tested code (this section's npm test, 4/4 pass) that computes the same rank formula CoordinationCohomology.lean proves — over liberty adjacency, not yet the readout-pullback edges §1 and the companion article's §4 call for."
  - "apps/weiqi-kernel/src/events.mts: the termRef law (every semantic event names its glossary term) is shipped code this article's §3 extends, by proposal, from rules predicates to the two-nuclei readings — the extension is not itself implemented."
---

# Whole-Board Reading as a Gluing Problem, and Lineages as Signatures

One of the three lineage articles named in [Weiqi as Arena, Chu Space,
Predication, and Manifold](./2026-09-03-note-on-weiqi-as-arena-chu-space-predication-and-manifold.md)
§4.

## 1. Whole-board reading as a gluing problem

This section links an owner-stated empirical claim to a
proved combinatorial identity; the empirical claim is not verified
against this section's own bibliography, stated plainly below. The
owner reported, 2026-09-03 (owner-stated; no further carrier verifies
this specific finding), a neuroimaging finding: a player can hold a
whole board in view but cannot strategize over it as a whole, and
strategizes in regions instead.

This section's own bibliography, verified by a prior Bibliography stage,
holds four sources on Go and the brain:
[chen2003](../bibliographies/chen2003.md) (task-activation fMRI, dorsal
prefrontal/parietal/occipital/temporal cortex during play),
[jung2013](../bibliographies/jung2013.md) (gray-matter morphometry and
resting-state connectivity in Baduk experts),
[sohn2017](../bibliographies/sohn2017.md) (resting-state network
reorganization in professional players), and
[kim2025](../bibliographies/kim2025.md), a 2025 narrative review of Go
training's cognitive and neural impacts. **None of the four states the
owner's specific whole-board-versus-regional-strategizing finding.**
`chen2003` reports *where* cortical activity differs during play, not
whether strategy is computed regionally or globally.
`jung2013` and `sohn2017` report structural and connectivity differences
in expert players, not a regional-decomposition finding. `kim2025` — the
2025 study — is, by its own bibliography carrier's account, "a narrative
review... not a primary neuroimaging study," synthesizing claims about
executive function, memory, and visuospatial reasoning generally; its own
"What it does not settle" section states it "does not itself report new
data, effect sizes, or a quantitative meta-analysis." **The 2025 study is
therefore not verified as a source for the owner's regional-reading
claim**; it is cited below only for the independently verified, narrower
claim that whole-board Go reading is executive-function-demanding in a
measurable sense — its own "Why this is central" section states this
gives "an independent empirical frame for treating strategic reading...
as cognitively demanding in a measurable, domain-general sense, not
merely a house metaphor." The owner's regional-strategizing claim itself
remains owner-stated and unverified against a specific primary study by
this section.

Read as a mathematical shape regardless of the empirical claim's
verification status: a regional strategy is a local section, and
regional strategies failing to glue into one whole-board strategy is
exactly the cover-nerve obstruction
[Obsmetrologia/Cohomology/CoordinationCohomology.lean](../../../../../../../../../../../../../../../../../../../../../../information-science-services-section/services/math-services-section/services/obsmetrological-services-section/lib/obsmetrologia/Obsmetrologia/Cohomology/CoordinationCohomology.lean)
proves, for its cover-nerve domain:

> `Ȟ¹` = the cycle rank `|E| − |V| + |C|` (cells − entities + components)...
> counts the cells in excess of a spanning forest — the irreducible
> coordination obstructions, each a cell that needs a total order;
> coordination-free ⟺ `Ȟ¹ = 0`.

[Obsmetrologia and Go Strategy](./obsmetrologia-and-go-strategy.md)'s
surviving candidate 1 already conjectures this nerve, built from Go
regions and shared-effect points, as "a formalization of whole-board
vision"; this article's conjecture adds a second, independent link — from
the same cover-nerve rank to the owner-reported neuroimaging claim above
— **without treating either link as thereby proved**: candidate 1's own
conjecture status and this claim's unverified empirical status are two
separate open questions, not one settled chain.

**One small worked example.** The cycle-rank formula is not only a claim
about Go — this section's own kernel-composing scripts already compute
it — and the smallest position where the rank is nonzero is three groups
that share liberties pairwise, so no two can be read independently of
the third. On a 3x3 board:

```sgf
(;GM[1]FF[4]SZ[3]RU[chinese];B[aa];W[];B[ca];W[bb])
```

Replaying this (`node scripts/derive-liberty-chu-space.mts --sgf
<file>`) gives three states — `B@A1`, `B@C1`, `W@B2` — and three
`sharedLiberties` rows: `B1` (all three groups at once), `A2` (`B@A1`
and `W@B2`), `C2` (`B@C1` and `W@B2`). Read as a nerve (cells = the
pairwise sharings the rank formula counts, vertices = the three groups,
one component), `|E| = 5` group-pairings across the three rows (three at
`B1`, one each at `A2` and `C2`), `|V| = 3`, `|C| = 1`, so `Ȟ¹ = 5 − 3 +
1 = 3` by the proved formula itself — a cycle, not a spanning forest, on
a position small enough to read by eye. This is the same shape the
section's own test suite exercises directly (`three mutually adjacent
groups carry a cycle the nerve reads as H1 = 3`, over
`derive-shared-liberty-nerve.mts`); the SGF block here reaches the
identical position through a replayed record rather than a
programmatically constructed board, so anyone can regenerate the number
without touching the kernel's internals. This is the adjacency
baseline's own cycle, not yet the readout-pullback nerve §1's conjecture
needs — it is offered here as a concrete instance of the *proved* half
of §1's claim, independent of whether the neuroimaging half holds.

**Ladders are the smallest case.** A ladder is the minimal position in
which a regional reading — the local capturing sequence — is not itself
sufficient: whether the ladder works at all depends on a single stone,
the ladder breaker, that may sit many intersections away and shares no
liberty with the ladder's group.
[Readouts as a Chu Space, Coordination as Cohomology](./readouts-as-a-chu-space-coordination-as-cohomology.md)
§4 and the 2026-09-03 program note both already use the ladder breaker as
the acceptance test any coordination nerve must pass; this article's
proposal is that a ladder is the smallest instance of the general
gluing failure §1 names — the smallest cell that "needs a total order"
across two regions a purely regional reading treats as independent.

## 2. Society as coordination that fails to glue globally

The owner remarked, 2026-09-03 (owner-stated,
Discord), that Go may be a generalized aptitude test for sociality. Read
against §1's mathematics, as this article's own conjecture: a society is
also local coordination — individuals' and groups' regional
understandings of a shared situation — that fails to glue into one global
understanding. The nonvanishing `Ȟ¹` of §1's cover nerve, generalized
from board regions to social groups and their locally-agreed
"readouts" (in the sense of the companion article's §1), is a formal name
for exactly the gap a purely regional, locally-coherent-but-globally-
inconsistent set of understandings leaves open. On this reading, the
executive function §1's (unverified) empirical claim associates with
whole-board Go reading is, specifically, the handling of nonvanishing
first cohomology: noticing, and acting across, a coordination gap that no
single region's own reading reveals. This is offered as conjecture only;
no carrier in this section's sociology or governance custody is consulted
or cited here, and none is claimed to already state this generalization.

**What would refute it.** The generalization only earns its keep if
nonvanishing `Ȟ¹` names a gap that locally-coherent understandings can
in fact leave permanently open — not merely slow to close. If every
empirical case of locally-agreed-but-globally-inconsistent
understandings turned out, on closer inspection, to be resolvable by
enough local communication alone (each region's section extending to
cover its neighbour's, with no residual disagreement surviving), the
cover-nerve obstruction would have nothing to name in the social case:
a `Ȟ¹` that always reduces to zero given enough time is not doing the
same work the Go nerve's genuinely irreducible cycles do. Finding a
social coordination failure that always dissolves under more local talk,
with no case that stays split the way a ladder's cycle stays split,
would be the observation against this section.

## 3. Lineages as clusters of readout signatures

The kernel's semantic event layer already commits
to one law, stated verbatim in its own header,
[apps/weiqi-kernel/src/events.mts](../../../../../apps/weiqi-kernel/src/events.mts):

> the engine is the executable form of the glossary... Each event type
> here corresponds to a named glossary term, and carries that term's
> path (as `termRef`)...

Every move the kernel plays therefore already fires a distribution over
the fixed set of rules predicates (`atari-given`, `capture`,
`ko-started`, `connection`, `eye-formed`, ...) named by `termRef`. As
proposal, extending this from rules predicates to the two-nuclei readings
of [The Two-Time Board](./the-two-time-board.md) §3–4 (territory, aji,
dame, contested) and the readout Chu space of
[Readouts as a Chu Space, Coordination as Cohomology](./readouts-as-a-chu-space-coordination-as-cohomology.md)
§1: a player's move stream, read against the full readout space rather
than only the kernel's rules predicates, is a distribution over that
readout space — which readouts a player's moves tend to settle, hold
open, or leave contested, and how often. A **lineage**, on this reading,
is a cluster in that distribution space: a group of players (or a
teacher and the students taught from one line) whose move streams project
to nearby distributions. Teaching, on this reading, is moving a student's
own signature — their distribution over the readout space — toward a
lineage's.

The platform design already carries two pieces of surface this proposal
reads as a step toward such a classifier, without either document stating
the classifier framing itself. [Opponent Cast](../../../../../services/weiqi-platform/content/text/documents/articles/design/opponent-cast.md)
specifies eight named opponents, each built around "one flaw stated
precisely enough to test for," firing "the same way every game" rather
than probabilistically — in this article's terms, each opponent is
already an engineered attractor at one point of the readout-signature
space, consistent enough to be learned. [Lineage and Clubs](../../../../../services/weiqi-platform/content/text/documents/articles/design/lineage-and-clubs.md)
specifies the teaching-lineage graph itself: a directed teacher → student
edge, confirmed only by the student, sourced from one completed teaching
game. Read together, as proposal: an opponent's fixed flaw is a
hand-authored point in signature space; a confirmed lineage edge is
empirical evidence that a student's signature moved toward a teacher's.
Neither document states or requires this reading; both were written, and
remain correct, purely as social- and difficulty-design specifications.

**Lakota weiqi strategy**, on this same proposal, is the empirical
signature that would emerge from Lakota players' games with each other —
a cluster this section does not yet have the data, or the readout-space
instrument of §1–2 above, to compute. The owner's stated interest in
this (owner-stated, Discord, 2026-09-03: "I wanna know what lakota weiqi
strategy is") names the general capability this proposal describes — a
signature-space clustering over real games — rather than a specific,
already-computed answer; no carrier in this or any other section states
what that signature is, and this article does not claim to.

**One consequence.** If a lineage really is a cluster in the readout-space
distribution, then two players confirmed by [Lineage and
Clubs](../../../../../services/weiqi-platform/content/text/documents/articles/design/lineage-and-clubs.md)'s
graph as sharing a teacher should project to distributions closer to
each other, on average, than either projects to a player from an
unrelated lineage — a within-lineage-versus-between-lineage separation,
not merely a shared vocabulary of moves. This is a testable inequality
over real game corpora once the readout-space instrument exists (§1–2's
open edge and the companion article's §4); it is stated here, not
computed, because the instrument it needs is not built. A lineage graph
whose confirmed edges show no more signature similarity than random
pairs of players would refute the clustering claim without touching
whether teacher → student edges are otherwise real or useful.

## 4. Why SGF cannot carry this, and RMN can

SGF carries stones: a sequence of moves and
board positions, per its FF[4] specification. It has no field for a
readout — no place to record "does this group live" or a `⊤`/`⊥`
distinction on a point, only the stones themselves and standard game-info
properties. The distribution over readout space §3 needs to cluster
players is therefore not something an SGF archive can carry, however
large. [Readouts as a Chu Space, Coordination as Cohomology](./readouts-as-a-chu-space-coordination-as-cohomology.md)
§3 already establishes, per
[Reframe and Standards](../notes/2026-08-29-note-on-reframe-and-standards.md)'s
owner ruling, that RMN — not SGF, GTP, or the KataGo JSON analysis
protocol — is the house's one canonical carrier for a position, a move,
or an analysis result; §3 of that article proposes the readout envelope
itself, `(position, readout, charge)` with a `ni:` identity, as the
concrete shape crossing those boundaries. A lineage signature, computed
over a corpus of games, is a distribution over exactly those envelopes —
which is why RMN, and not SGF, is the carrier this proposal requires.

**What would refute it.** This section's claim about SGF is a claim
about a fixed, published specification (FF[4]), not a conjecture about
the world — so what would refute it is narrow and checkable: a
standards-track SGF property, in the FF[4] specification or a widely
implemented extension of it, that records a per-point valuation carrying
a `⊤`/`⊥`-shaped distinction (contested versus unwitnessed) rather than
a single ownership scalar or a move annotation. No such property is
known to this section as of this writing; if one exists, this section's
"SGF cannot carry this" claim narrows to "SGF as this section has read
it does not carry this," which is a smaller and different claim.
