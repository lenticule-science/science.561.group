import ObsmetrologiaManual.DocSetup

open Verso.Genre Manual InlineLean

/-!
The documentation architecture resolves the apparent duplication between Verso
and Blueprint. They are different projections of one mathematical documentation
system, not rival books.
-/

#doc (Manual) "Documentation architecture" =>

# Documentation Architecture

Obsmetrologia currently has two powerful documentation surfaces that can look
confusingly similar:

* Verso manual pages, written as Lean modules.
* Blueprint pages, written as theorem and definition nodes with dependency edges.

That duplication is a design smell. The correct architecture is not two
disconnected prose books. It is one documentation system carried by several
surfaces over the same base.

## Predication Cells, Site Points, And Carriers

The base formal object is the predication cell: a typed position where a
mathematical, technical, or conceptual claim can first live. Once the settling
site is present, that point can be placed as a predication-cell site point with
stratum and clopen support.
The manual's older phrase "claim-site" should now be read as shorthand for this
two-layer structure, not as a primitive name.

A documented claim may be broad, like a topic; intermediate, like a concept or
construction; or narrow, like a named definition, theorem, lemma, example,
interface, or invariant. It is not identical to any one representation of it. It
is the shared address around which proof, exposition, dependency, lookup, and
provenance cohere.

Lean is the settlement carrier.  It carries a claim-site as a declaration, type,
theorem, proof, example, or checked construction.  Its job is to say what has
actually been admitted to the kernel, what depends on what, and what is stable
enough to compute, elaborate, or verify.

Blueprint is the incidence carrier.  It carries the same claim-sites as nodes
and edges: which claims depend on which others, which are stated, which are
proved, which are frontier, which are blocked, and where the mathematical
pressure lies.

Verso is the expository carrier.  It carries claim-sites as readable sections,
explanations, tutorials, examples, and reference entries, with welds back to the
formal carrier so prose remains attached to the thing it explains.

Generated API docs are the interface carrier.  They expose names, signatures,
docstrings, imports, and searchable declaration structure.

Provenance is the origin carrier.  It records where a claim came from, why it was
introduced, what earlier language generated it, and what conceptual pressure it
preserves.

These carriers form a fibered documentation/proof system over predication cells
and their site-level refinements. Over one such address there may be a Lean fiber, a
Blueprint fiber, a Verso fiber, an API fiber, and a provenance fiber. A mature
claim is a glued section across the fibers: the formal name exists, the
dependency graph points to it, the exposition explains it, the API exposes it,
and the provenance remains recoverable.

Drift is failed gluing.  A theorem marked proved in Blueprint but missing from
Lean is drift.  An explanation with no precise claim-site is drift.  A
declaration visible in API docs but absent from the dependency graph or teaching
surface is isolated settlement.  A concept with history but no promoted
claim-site remains latent rather than documented.

Different outputs are profiles over the same base.  A reference profile may
require declarations, signatures, and compact status.  A teaching profile
requires exposition, examples, and conceptual sequencing.  A frontier profile
requires dependency edges and explicit unsettled status.  A publication profile
requires formal settlement, exposition, dependency audit, and stable
identifiers.  None of these profiles creates a new object; each selects which
fibers must exist, how strongly they must be welded, and what incompleteness is
allowed.

## Ownership

Verso owns teaching exposition.

The manual should explain the mathematics slowly: what is being generated, what
the reader is allowed to assume, which familiar concepts are recovered, which
mistakes are tempting, and how the Lean modules fit the corpus. Verso is where a
reader learns. More precisely, Verso owns Diataxis coverage of the Blueprint
graph: tutorials, how-to guides, explanations, and reference for every topic,
concept, and term that the graph exposes.

Blueprint owns claim topology.

The blueprint should be a graph of precise mathematical claims: definitions,
lemmas, theorems, conjectures, frontier nodes, and their dependencies. It should
say exactly what the claim is, what Lean declaration witnesses it, and which
earlier claims it uses. Blueprint is where the frontier is audited.

Generated API docs own declaration lookup.

API docs should answer: what declarations exist, what are their signatures, and
where are their docstrings? They should not be asked to teach the program.

Corpus and archive docs own provenance.

`content/` and `content/_archive/` are not polished manual chapters. They are the
ancestral material, alternate framings, research notes, and semantic sediment from
which the formal project is being extracted.

## No Parallel Books

The same paragraph should not be maintained in both Verso and Blueprint.

If a passage teaches a concept, it belongs in Verso. The corresponding Blueprint
node should compress that passage to a precise claim and point to the same Lean
declaration.

If a passage states a theorem frontier, it belongs in Blueprint. The Verso manual
may summarize it, but should link to or name the Blueprint node rather than
reproducing the whole frontier proof sketch.

If a passage is provenance or older language, it belongs in corpus intake notes
until promoted. The manual may cite the source path and explain the promoted
reading.

## Shared Identifiers

To make the projections act like one system, every important concept should have
stable identifiers across surfaces:

* a corpus path, such as `content/mark/mark.md`;
* a topic namespace;
* a Lean module, such as `Obsmetrologia.Mark`;
* one or more Lean declarations, such as `Obsmetrologia.Mark` and `Obsmetrologia.Kind`;
* a Verso concept page or section;
* zero or more Blueprint nodes, such as `def:mark` or `lem:two-kinds`;
* a status label: foundation, recovery, frontier, provenance, archived.

The documentation work is to maintain those correspondences, not to write more
untracked prose.

## Promotion Flow

Archive note to corpus intake:
an old note is identified, summarized, and given provenance.

Corpus intake to Verso:
the note's stable mathematical reading is taught in the manual.

Verso to Blueprint:
the taught concept is factored into precise claims with dependency edges.

Blueprint to Lean:
green nodes point to compiled declarations; red nodes remain explicit frontier.

Lean back to Verso:
once a claim is formalized, the manual can include checked examples and explain
what the proof buys.

This loop is the healthy shape. Anything else tends to produce either decorative
manual prose with no proof frontier or a theorem graph that no human can learn
from.

## Immediate Refactor Rule

When Verso and Blueprint appear to say the same thing, keep the longer teaching
version in Verso and shorten the Blueprint version to:

1. the formal claim,
2. the dependency labels,
3. the `\lean{...}` declaration,
4. the red or green proof status,
5. a pointer to the manual section for exposition.

This is how Obsmetrologia gets deep documentation without maintaining two divergent
copies of the same book.
