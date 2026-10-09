---
title: "Six Engineering Programs from the Silica Tetralogy"
description: "The founding note of natural computing science: six engineering programs harvested from the day's three material-science findings (silica/carbon as yin-yang, jade as polycrystalline settling, tabasheer's molecular structure), each stated as a design proposal with what it would change. One program (J26 as agent-composition topology) is not left as a future check but run now, against the real nine-package import graph of the agent-computing corpus, and the result is reported honestly whichever way it falls."
date-created: 2026-08-21
type: notes
name: 2026-08-21-note-on-six-engineering-programs-from-the-silica-tetralogy
authors:
  - claude-sonnet-5
keywords:
  - natural-computing-science
  - biomimetic-semiotics
  - founding
  - jade
  - tabasheer
  - silica
  - ossification
  - rigidity-percolation
  - j26
  - crdt
  - calm
---


This is the natural-computing-science-services-section's founding note. Its
job is narrow and stated once: take the three material-science findings
written earlier today in the biomimetic-semiotics program — silica and
carbon as a yin-yang dyad, jade as felted polycrystalline settling, and
tabasheer's molecular structure — together with the standing ossification
and J26 results from the abiotic vitrimer program, and state, plainly, what
each would change about how computing systems and record-keeping practices
get engineered, if taken seriously. Six programs follow, each a design
proposal rather than a settled decision, and each stating concretely what
would show it wrong. One of the six (§5) is not left as a future check: it
is run now, against real data, and reported honestly whichever way it
falls.

Per the natural-computing-science topic document's §3, these six programs
recognize a computation nature already runs — in jade's toughness,
tabasheer's optics, the Phillips–Thorpe rigidity threshold, J26's proved
combinatorics — and describe the domesticated, engineered version of each,
rather than predicting an undiscovered natural fact from mathematics (the
topic document's other mode, "nature as witness," is not what is being run
here). The natural facts underneath these programs are independently
established elsewhere (in the companion mineralogy, chemistry, and
materials-engineering notes, and in the ossification note's own proofs) and
are not what is being tested in what follows; what is being tested, where a
test is possible at all, is whether the engineered proposal actually
recovers the natural mechanism's benefit.

## §1. Polycrystalline consensus: felted local domains against one global section

**The finding.** The jade note's §3–4 states a three-cornered comparison of
solids and their failure modes: the single crystal is one global order and
**cleaves** — a flaw travels the whole structure along a shared
orientation, unimpeded; glass is no order at all and **shatters** —
nothing arrests a crack; the felted polycrystal (jade) is many small local
orders that do not glue globally, and it **endures** — grain boundaries
are obstruction made load-bearing, the place where a propagating crack
must stop, turn, or spend itself. Read in the house's own terms: the
monocrystal is one global section (H¹ = 0, everything glued); jade is many
local sections that deliberately do not glue into one.

**Set against the proved strand.** This lands directly against the
estate's own best-grounded distributed-systems result. The SHRIMP Ecology
Ringleader Brief v2 states, as the *proved* strand, "CALM-compatible
coordination-free replication (the corpus's proved CRDT machinery is the
multiplayer architecture — no lock server, gluing by Mayer–Vietoris)" —
which is, read structurally, the monocrystal ideal: every node's state is
designed to converge, given enough gossip, to one shared global section,
with H¹ → 0 as the system's healthy limit. That convergence guarantee is
the whole point of a CRDT and the whole content of the CALM theorem
(coordination-free execution is available exactly when a program is
monotone), and nothing in this program proposes weakening it where it
already holds.

**The engineering program.** The question jade raises is narrower and
harder than "replace CRDTs": *are there real distributed systems in which
the correct design is to build many internally-converged (locally CALM,
locally settled) consensus domains that are engineered to **never** glue
into one global section, with the boundaries between them treated as
load-bearing rather than as defects awaiting a future merge?* This is not
speculative in the abstract — cell-based architecture (bulkheading a
service into independently-provisioned, independently-failing regional or
tenant "cells," used at AWS and Netflix scale specifically to bound blast
radius) is an existing, already-practiced pattern that is exactly
this shape: each cell is internally consistent and fully converged; no
cell shares a consensus domain, a control plane, or a failure domain with
any other; and the deliberate absence of a single global section is the
safety property, not a limitation to be engineered away. What jade adds is
the *mineralogical* reason this works: a system with one global consensus
domain is a monocrystal, and a monocrystal's virtue (perfect internal
agreement) is identical to its failure mode (one flaw, or one correlated
fault, propagates through the whole unimpeded, because every part shares
the same orientation). The felted reading proposes treating "how many
independent consensus domains, and where their boundaries fall" as a first-
class architectural parameter, tuned the way a materials engineer tunes
grain size — too few domains (approaching one crystal) buys convenience at
the cost of a single cleavage plane; too many, with no domain large enough
to do useful internal work (approaching glass), buys nothing but shattering
under any load.

**What it would change.** Concretely: a system currently designed around
one CRDT-converged global state (one section, eventually consistent
everywhere) would instead be partitioned into a deliberately-chosen number
of independently-CALM domains, sized so that no single correlated failure
(a bad deploy, a compromised credential, a partition) can cross a domain
boundary — and the boundaries themselves would carry explicit, monitored
"grain-boundary" contracts (rate limits, capability scoping, explicit
reconciliation protocols for cross-domain requests) engineered to *absorb*
propagating failure rather than being treated as technical debt to be
"fixed" by eventually merging the domains into one.

**What would show this wrong.** If a system built with permanently-unglued
felted domains cannot be shown, under an identical fault model (a specific
class of correlated failure — a bad deploy, a compromised credential, a
network partition), to survive that fault with materially less blast
radius than a single fully-converged global CRDT of the same total
capacity, then the polycrystalline-consensus reading is a decorative
restatement of bulkheading that jade did not actually improve: cell-based
architecture would still stand as existing engineering practice, but the
mineralogical framing on top of it would be ungrounded ornament and should
be dropped. The test is concrete and already runnable against any existing
cell-architected system: measure blast radius (accounts, requests, or
revenue affected) for a real correlated-failure incident against a matched
single-global-section baseline, and see whether the domain boundaries
actually held anything back or merely added latency.

## §2. Append-surface witness carriers: shards that keep absorbing after harvest

**The finding.** Tabasheer's §2 states it as material fact: tabasheer is
strikingly porous, structurally akin to synthetic silica gel, and *keeps
adsorbing* — it takes liquids and vapors into its pore network after it has
formed, which is much of why the material interested chemists at all. The
bestiary's existing design rule (from the bamboo note) has every harvested
skill carry its tabasheer — the minimal witnessed evidence of the endeavor
that produced it — but treated that shard as a finished exhibit. Tabasheer,
read as material, says the shard should not be finished: it should still be
a live socket for further evidence, because the real mineral it is named
for never stops taking things in.

**The engineering program.** Design harvested-skill evidence objects
(fixture data, SKILL.md-adjacent evidence blobs, provenance shards) with an
explicit **append surface**, distinct from their read surface, so that when
a harvested skill is re-invoked and its new run produces fresh witness, that
witness has somewhere to soak in rather than being discarded or filed
elsewhere disconnected from the shard it pertains to.

**The immediate tension, and why it is worth stating rather than papering
over.** A content-addressed evidence blob is, by construction, immutable —
its identity *is* the hash of its content, and mutating it in place would
be a category error, not an engineering inconvenience. Tabasheer's
"keeps absorbing" property cannot mean mutating the immutable core; it must
mean something structurally different, and the natural candidate is
already established practice elsewhere in exactly this repository's own
tooling: a **companion append-only log keyed to the shard's hash**, the
same shape as a git object's immutable blob paired with a mutable ref or
reflog, or as this estate's own witness-journal (append-only Datom rows,
never rewritten) sitting beside settled, content-addressed state. Concretely:
a harvested skill's shard stays exactly as content-addressed and immutable
as it is today; alongside it, a per-shard append log accumulates new
witness rows each time the skill is re-invoked and its evidence is actually
consulted, and the shard's *effective* evidentiary content, at read time, is
the immutable core plus everything the append log has accumulated since —
tabasheer's porosity modeled as a log grafted onto a mineral, not as a
mutable mineral.

**What it would change.** Concretely: harvested-skill packaging (wherever
the estate's tooling currently emits a fixture/evidence blob as a single
sealed artifact) would instead emit two artifacts — the sealed, hashed
shard, and an empty append log keyed to that hash — and the re-invocation
path for any harvested skill would be instrumented to write a witness row
to that log whenever the skill's evidence is actually read during a real
run, not only when the skill is first cut.

**What would show this wrong.** This is the tabasheer note's own open
question, restated for the engineering program rather than left general:
the append-surface design earns its keep only if, once built, harvested
skills are in practice re-invoked with their append logs actually
accumulating rows — real re-use producing real new witness. If, measured
after a reasonable period of real use, every append log built this way
stays empty (skills are cut once and never re-invoked with their evidence
path exercised, or are re-invoked but nothing is ever written back), the
append-surface proposal would be unused scaffolding, and the correct
conclusion would be that harvested-skill evidence is legitimately
write-once in this estate's actual practice, whatever tabasheer's
mineralogy suggests it should be.

## §3. Read-time legibility: provenance systems scored at query time, not write time

**The finding.** Tabasheer's §3 states its most striking property: its
refractive index sits so close to water's that the dry, opaque, white shard
turns translucent when soaked, reversibly, because the index mismatch at
every silica-air pore interface nearly vanishes once water fills the
pores. Dry evidence scatters light; wetted evidence transmits it; drain the
water and it clouds again, losing none of its content. The note's own
reading: provenance systems are usually justified by write-time virtue ("we
recorded it"); tabasheer's optics relocate the payoff to read-time ("it
clears when soaked").

**The engineering program.** Instrument and score provenance/evidence
systems by **index-matching under attention** — whether a stored record
actually becomes legible when someone or something queries it — rather than
by whether the record was faithfully written in the first place. Concretely:
a documentation or provenance system's health metric should not be commit
count, coverage percentage, or schema completeness at write time; it should
be a *retrieval-path* measurement — for any given evidence shard, is there
an actual, exercised path (a search index, an embedding, a cross-link, a
citation from a later note) by which attention reaches it and renders it
legible? A shard with perfect write-time completeness and zero retrieval
paths is, on this reading, functionally identical to dry tabasheer sitting
in a drawer: present, honest, and blind. The design consequence is
concrete and buildable: retrieval-path coverage (not authoring coverage)
becomes the thing dashboards report, and a provenance system's stated
completeness should be discounted by however much of it has never been
re-consulted since it was written.

**What it would change.** Concretely: any of the estate's existing
provenance/witness stores (content-addressed evidence blobs, the
witness-journal, dated frontmatter corpora) would be audited not for how
much they contain but for how much of what they contain has actually been
the target of a real query, citation, or cross-link since it was written —
and tooling that currently only measures ingestion (bytes written, notes
filed, frontmatter completed) would be paired with tooling that measures
egress (bytes actually re-read, cited, or surfaced by search).

**What would show this wrong.** Already stated, precisely, in the tabasheer
note, and worth carrying over unchanged rather than restated more weakly:
the bamboo note's open question — "if harvested skills with tabasheer are
never re-invoked with their evidence consulted, the extraction claim is
weaker than stated" — gains, per the tabasheer note, a material
restatement: unsoaked tabasheer stays cloudy. If, once a retrieval-path
metric is actually built and run against the corpus, it turns out that
write-time completeness and read-time legibility track each other almost
perfectly (everything written well also gets read, and nothing written
well goes unconsulted), then the read-time/write-time distinction this
program proposes is not doing separating work, and the simpler write-time
metrics the estate already uses should stand uncorrected.

## §4. Clock-structures and mold-structures: a record-system requirement, not a metaphor

**The finding.** The silica-and-carbon note's §4 draws the sharpest line
in the whole tetralogy: archaeology reads carbon and silica as two
different instruments, not two flavors of the same one. Radiocarbon dating
reads **time** — ¹⁴C decays on a known clock, and tells *when* by its own
disappearance. Phytolith analysis reads **form** — the silica bodies hold
the shapes of the cells they filled, and tell *what* by their own
persistence. The yang witness is a clock that spends itself; the yin
witness is a mold that keeps shape. The note's own extension: dated
frontmatter, closure ordinals, and filtration indices are the estate's
carbon (time-telling structure); content-addressed blobs, settled
valuations, and extracted skills are the estate's silica (form-holding
structure) — and "a record system needs both a decay clock and a shape
mold... these are different instruments that cannot substitute for one
another."

**The engineering program.** State this as an explicit schema requirement
rather than an implicit convention: every record-bearing system in the
estate's practice should identify, for each field it stores, whether that
field is a **clock-field** (its value is only meaningful as a *position in
time*, it necessarily changes or is superseded, and its informational
content is exhausted the moment a newer clock-field supersedes it — a
timestamp, a version ordinal, a closure sequence number) or a
**mold-field** (its value is a *content-preserving impression*, meant never
to change once set, whose entire value is that it still has the shape it
was given — a content hash, a settled valuation, an extracted skill's
frozen fixture). The engineering claim is that conflating the two —
treating a hash as though it could tell you *when*, or treating a
timestamp as though it preserves *what* — silently breaks a record system,
because the two field types have opposite correct behaviors under
migration, garbage collection, and compaction: clock-fields should be
allowed to be superseded, compacted, and eventually summarized away (the
carbon leaves; a decade of closure ordinals can collapse into one
statement, "settled by year N," without loss); mold-fields must never be
compacted lossily, because the whole point of a mold is that it still has
the exact shape (a settled valuation that gets "cleaned up" into a
rounded summary is not a mold any more, it is a different, blurrier object).

**What it would change.** Concretely: any schema or migration tooling that
currently treats all stored fields as one undifferentiated bag subject to
one retention/compaction policy would instead tag each field explicitly as
clock or mold, and retention policy would branch on that tag — clock-fields
eligible for lossy summarization after a stated age, mold-fields exempt
from any lossy transform for as long as the record is kept at all.

**What would show this wrong.** The parent note's own open question for the
whole dyad applies here at full strength, and is the right one to inherit
rather than weaken: the clock/mold separation earns its keep only if it is,
at some point, *defended* against a real proposal that would have merged
the two — if a migration or compaction proposal is actually rejected, or
actually redesigned, because it would have treated a mold-field as
compactable or a clock-field as sacred, when the undifferentiated-bag
approach would have let the merge through unnoticed. If no such decision
ever turns on the distinction — if every record system the estate builds
would have made the same retention choices anyway, clock/mold labeling or
not — the separation is decoration dressed as a requirement, and should be
read back down to §4's originating note's own pleasant-correspondence
bucket.

## §5. J26 as agent-composition topology: the finite mechanical test, run and reported

**The claim under test.** The macromolecular-DSA note and the ossification
note both use the proved J26 gyrobifastigium cell (`J26.lean`,
`obsmetrological-services-section`) as the space-filling geometry of a
rigid domain — a packing question, not a self-assembly target. The natural
extension for natural computing science is to ask whether J26's
*combinatorial* structure — not merely its space-filling property — reads
onto something in the estate's own software architecture: specifically,
whether the boundary of a single J26 cell is a plausible topology for how a
small system of interdependent software packages compose. This section
does not defer that question to a future check. It runs the test now,
against real data, and reports the result honestly.

**The object.** `J26.lean` proves, unconditionally (`combinatorial_counts`,
by `decide`): **8 vertices, 14 edges, 8 faces** (four triangular, four
square, split evenly 4/4 between the two prisms the solid is built from).
The eight faces are `leftTop`, `leftBottom`, `leftSide0`, `leftSide1`
(left prism) and `rightTop`, `rightBottom`, `rightSide0`, `rightSide1`
(right prism), the two prisms joined along a shared square after the
right prism's copy of that square is quarter-turned
(`shared_cycle_is_quarter_turned`, also proved by `rfl`). The eight
vertices split as four shared (`q0..q3`, the glued square, common to both
prisms) plus two left-only (`a, b`) plus two right-only (`c, d`).

**The data.** The agent-computing corpus's code register
(`agent-computer-system-services-section`) states, in its own README, that
it holds exactly **nine** packages: `relating`, `animating`,
`communicating`, `knowing`, `playing`, `computing`, `gaming`,
`socializing`, `organizing`. Reading each package's own `package.json`
`dependencies` field (not `devDependencies`, which include test/tooling
deps that are not composition edges) gives the following internal edges,
each package's version pinned at `0.1.0`/`0.0.x` as shipped:

| package | depends on (internal) |
|---|---|
| `relating` | — (no internal dependencies) |
| `communicating` | `relating` |
| `knowing` | `relating` |
| `playing` | `relating` |
| `animating` | `relating`, `communicating`, `knowing`, `playing` |
| `gaming` | `relating`, `animating`, `communicating`, `playing` |
| `socializing` | `relating`, `communicating`, `animating` |
| `computing` | `relating`, `communicating`, `knowing`, `playing`, `animating`, `gaming` |
| `organizing` | `relating`, `animating`, `socializing`, `computing`, `playing`, `gaming` |

Taking the longest dependency chain to each package as its layer, the nine
packages fall into exactly six strict layers:

- **L0**: `relating` (the sole root — verified: its `package.json`
  carries no `dependencies` field at all, only `devDependencies`)
- **L1**: `communicating`, `knowing`, `playing` (each depends on `relating`
  alone)
- **L2**: `animating` (depends into L1 and L0)
- **L3**: `gaming`, `socializing` (each depends into L2, L1, L0)
- **L4**: `computing` (depends into L3, L2, L1, L0)
- **L5**: `organizing` (depends into L4, L3, L2, L1, L0 — the sole apex)

**Attempting the assignment, honestly.** The most literal reading of "J26
as agent-composition topology" would assign each of the nine packages to
one of J26's eight faces (a faculty-to-face assignment) and ask whether
adjacency between faces (sharing an edge) reproduces a dependency edge
between packages. This fails at the first step, before any structural
comparison is possible: **J26 has eight faces and there are nine
packages** — one package has no face to occupy under the most direct
reading, and no natural rule for which package to drop or double up
presents itself from either the mineralogy or the code. The same failure
recurs at the vertex level: J26 has eight vertices, and although the
shared-square vertices (`q0..q3`) are structurally tempting as a home for
`relating` — the one package literally shared by (underneath) every other
package's dependency closure — that reading would need to spend all four
shared vertices on one package, leaving only `a, b, c, d` (four slots) for
the *other eight* packages, which fails on count even more sharply than
the face reading did. The edge reading (14 edges, 9 packages) is the only
one with headroom on raw count, but edges in J26 are symmetric,
unoriented adjacency relations between two vertices on the solid's
boundary, while the package graph's edges are asymmetric, directed
"depends on" relations — mapping packages to edges would require deciding
which vertex-pair each package "is," which is not a natural operation and
was not attempted here because no candidate rule survived inspection.

**The deeper mismatch, once the count problem is set aside.** Even
granting some forced accommodation of the count mismatch (say, treating
`organizing` and `computing` as a single collapsed apex, since
`organizing`'s own dependency list already includes `computing` and
everything beneath it, bringing the package count to eight), J26's
structure and the package DAG's structure disagree in kind, not just in
size. J26 is built from **two congruent prisms** related by a symmetry
(the gyro quarter-turn) — its automorphism structure has a real
left/right mirroring, `leftPrismBoundary` and `rightPrismBoundary` are the
same shape appearing twice. The nine-package import graph has no such
symmetry: it is a single-rooted, strictly-layered hierarchy with one
source (`relating`, depended on by everything) and one sink
(`organizing`, depending on everything), and no sub-collection of
packages mirrors any other sub-collection under any relabeling. A
gyrobifastigium is the wrong *shape* of object for a strict, asymmetric
layering, independent of how its eight-versus-nine count problem might be
patched.

**Result, stated plainly.** The finite mechanical test fails, on both
grounds tested: the count does not match (8 faces or 8 vertices against 9
packages, with no non-arbitrary rule to close the gap), and the structural
symmetry does not match (J26's two-congruent-prisms bilateral structure
against the import graph's single-rooted asymmetric hierarchy). J26 as
agent-composition topology, in the direct faculty-to-face or
package-to-vertex sense, does not hold up as posed and should not be built
on. What survives from this section is narrower and worth keeping
separately: J26 remains, per the ossification note's own proof, a
space-filling packing geometry for a rigid material domain (that claim is
untouched by this section's negative result, and was never about package
composition); and one open, structurally more
promising candidate for a *symmetric two-sided* object worth checking
against J26 in a future note, noted here but not pursued, is the
agential-semioverse split itself — the same nine names appear twice in
this estate, once as a **theory register** (`agential-semioverse-repository-services-section`,
96 dated research papers) and once as this section's **code register**
(the nine packages tested above) — which is a genuine two-copies-of-one-
structure relationship, though not obviously a *quarter-turned* one, and
checking whether the theory-register's own internal citation structure
mirrors the code register's import layers closely enough to be worth
reading against J26's gluing is left as an explicitly open thread, not
claimed here.

**What this test showed.** This program is the one exception in this note
where the check is not prospective — it has already been run. The test was
specified in advance (does a faculty-to-face
assignment reproduce the nine packages' layered import DAG), it was run
against real, verifiable data (`J26.lean`'s proved combinatorial counts;
each of the nine packages' actual `package.json` dependency lists), and it
came back negative on both count and structure. The honest conclusion is
that J26-as-agent-composition-topology does not survive contact with the
real import graph, and should be filed as a checked, closed negative
result rather than reopened without new evidence — specifically, without
either a principled (non-arbitrary) rule for reconciling the eight-versus-
nine count, or a different real two-sided object (such as the theory/code
register pair noted above) that actually exhibits J26's bilateral
symmetry.

## §6. Ossification diagnostics: rigidity percolation as a settling-past-reconfigurability measure

**The finding.** The ossification note corrects a role assignment and, in
doing so, states a general diagnostic. Phillips–Thorpe constraint-counting
gives a network's rigidity transition in terms of mean coordination
⟨r⟩: below the isostatic threshold ⟨r⟩_c = 2.4, a network is floppy₍₃₎ —
it has internal degrees of freedom that cost no energy, and it flows or
deforms; above it, the network is stressed-rigid₍₃₎ — over-constrained,
brittle, unable to rearrange without breaking. The zeolite framework sits
far above the threshold (⟨r⟩ = 4); the PDMS matrix sits far below it
(⟨r⟩ = 2); the composite's *position relative to that threshold* is the
device's actual state variable, and — the note's sharpest methodological
point — the vocabulary the estate's own formalization already uses
(floppy, rigid, jammed, load-bearing) is *correct at the physics layer*
but is currently computed by the *wrong matroid*: the implemented module
counts the graphic matroid's cycle rank (b₁ = |E| − |V| + c, "load-
bearing₁," the appearance of the first redundant *connection*), while the
phenomenon that actually governs mechanical rigidity is the generic
rigidity matroid ("load-bearing₃" in three dimensions), whose independence
test — the pebble game — is a nonlocal, harder computation than counting
cycles, and for which no combinatorial characterization is known in 3D at
all (Laman's condition, which gives one in 2D, provably fails in three
dimensions).

**The engineering program.** Read "ossification" as a literal, computable
property of a codebase or an institution's decision-making structure, not
as a metaphor for "hard to change." Define, for a codebase, an analog of
mean coordination: the mean number of *rigid constraints* each module
participates in — not import-count (which is a connectivity/graphic-matroid
quantity, already measured today as cyclomatic complexity or dependency-
cycle rank) but binding constraints in the rigidity sense: shared mutable
state that multiple modules must agree on simultaneously, migration-order
dependencies that cannot be resequenced, API contracts whose violation
breaks more than the two parties directly involved. The engineering claim,
carried over directly from the ossification note's §6 gap, is that the
estate's (and the industry's) existing tooling for "how hard is this to
change" almost universally measures the *wrong* matroid — import-cycle
count, coupling metrics, cyclomatic complexity are all graphic-matroid
quantities, load-bearing₁, sensitive to redundant *connections* — while the
actual phenomenon practitioners mean when they say a codebase or an
institution has "ossified past reconfigurability" is a rigidity
phenomenon, load-bearing₂-or-₃, sensitive to redundant *constraints*, and
is systematically underestimated by every tool that only counts cycles.
Concretely, this program proposes building a rigidity-percolation
diagnostic that runs an actual pebble-game independence oracle over a
codebase's real constraint graph (not merely its import graph), producing
a mean-coordination estimate and a distance-to-threshold reading, the same
computation the ossification note specifies for the physical composite,
applied to a dependency-and-constraint graph instead of an atomic network.
The same diagnostic, read at institutional scale, treats an institution's
decision rights, sign-off requirements, and irreversible precedents as its
constraint graph, and asks the identical question: how far past its own
isostatic threshold has this institution's structure settled, and by
extension how much of its apparent stability is actually the brittleness
of a stressed-rigid network rather than the flexibility of a
floppy-but-functioning one.

**What it would change.** Concretely: refactor-risk and change-failure-
rate estimation, which today is driven almost entirely by graphic-matroid
proxies (import graphs, cyclomatic complexity, coupling counts), would be
supplemented with an actual rigidity-matroid computation — a pebble-game
independence test over the real constraint graph — and codebases or
institutional structures flagged as "still floppy" by cycle-rank metrics
but already stressed-rigid by the rigidity test would be surfaced as a
category of hidden ossification that current tooling cannot see at all,
because it is not looking at the right matroid.

**What would show this wrong.** Two things, both concrete and both
inherited in spirit from the ossification note's own §7. First: if a
rigidity-percolation-based diagnostic, once actually implemented as a
pebble-game oracle over a real codebase's constraint graph, does not
predict refactor difficulty or change-failure rate any better than the
existing graphic-matroid proxies (import-cycle count, coupling metrics)
already in use — measured against a held-out set of real refactors and
their actual outcomes — then the rigidity-matroid program is not doing
separating work in software engineering even though the ossification
note's gap is real for the physical composite, and the finding should be
read back down to a materials-science-only result. Second: if, once
measured this way, ossification turns out in practice to always be
reversible for codebases (every stressed-rigid codebase the diagnostic
flags can in fact be refactored without disproportionate cost once someone
tries) or always irreversible for institutions (no institution the
diagnostic flags as floppy in fact remains reconfigurable under real
pressure), the "settling past reconfigurability" framing collapses into a
one-sided metaphor rather than the two-sided, tunable state variable the
ossification note actually describes, and the diagnostic should be rebuilt
around whichever side of the reversibility question turns out to be real.

## Summary across the six programs

The underlying material and mathematical facts every program stands on are
independently checked, not merely proposed here: jade's crack-arrest-at-
grain-boundaries mechanism; tabasheer's adsorption and reversible
index-matching optics; carbon/silica as clock-witness and mold-witness in
archaeology; the Phillips–Thorpe isostatic threshold and the graphic-
versus-rigidity-matroid gap; J26's proved combinatorial counts (8 vertices,
14 edges, 8 faces) and the nine packages' actual, verified `package.json`
dependency structure and resulting six-layer DAG (§5's own table);
cell-based architecture as an existing, practiced engineering pattern (§1).

What sits on top of those facts, in §1 through §4 and §6, are formally
plausible design proposals, not yet built or measured: felted
polycrystalline consensus domains as a named architectural parameter (§1);
append-surface evidence shards via a companion log rather than mutation
(§2); retrieval-path-based provenance scoring (§3); clock-field/mold-field
schema tagging with branching retention policy (§4); a rigidity-percolation
codebase/institution diagnostic built on an actual pebble-game oracle (§6).
None of these five has yet been built, and none has been tested against
real operational data the way §5's has — each states a specification for a
check that has not yet been run.

§5 is the exception: it is checked and negative, and should be filed rather
than reopened without new evidence. J26 as a direct faculty-to-face or
package-to-vertex agent-composition topology does not hold up against the
real nine-package import graph, on both count and structural grounds. J26's
proved packing-geometry role (per the ossification note) is untouched by
this result, and the theory/code register pair is flagged there as a more
promising, unexamined candidate for a future note.
