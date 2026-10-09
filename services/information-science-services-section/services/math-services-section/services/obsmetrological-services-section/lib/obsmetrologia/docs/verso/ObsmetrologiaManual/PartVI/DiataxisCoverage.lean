import ObsmetrologiaManual.DocSetup

open Verso.Genre Manual InlineLean

/-!
Diataxis coverage is the rule that turns formal nodes named by the Blueprint
into a complete reader-facing documentation program.
-/

#doc (Manual) "Diataxis coverage" =>

# Diataxis Coverage

Obsmetrologia should use Diataxis as the manual coverage discipline for formal nodes
named by the Blueprint. Every term, concept, and topic named by that graph is a
coverage scale over predication cells and their site-level refinements, and should
eventually have the four Diataxis surfaces:

* tutorials: learning paths through examples;
* how-to guides: task-oriented procedures;
* explanations: why the construction exists and what generates it;
* reference: compact facts, declarations, and status.

The mapping is:

* namespace equals topic;
* module equals concept;
* theorem, definition, lemma, proposition, corollary, and example equal term.

This is the practical way to keep Verso and Blueprint from duplicating each
other. Blueprint lists the formal graph. Verso supplies Diataxis coverage of the
graph.

## Topic

A topic is the namespace-scale region of the mathematics. It answers:

* which generating morphism produces this region?
* which regime or ordinal signature is active here?
* which concept modules belong under it?
* which Blueprint chapter or dependency subgraph names it?

Examples include primitives, predication, positing, settling, hyperdoctrine,
sheaf/cohomology, recurring FOUR, and aperiodicity frontier.

In Lean this may eventually become a namespace hierarchy. In documentation it is
already required: a topic page is the reader's first large-scale orientation.

## Concept

A concept is the module-scale unit. It answers:

* what object or morphism is being documented?
* what generates it?
* what does it generate next?
* which Lean module carries it?
* which Blueprint nodes depend on it?

Examples include mark, utterance, articulating, articulation cell, predication
cell, reading, valuation, closure, settling, sheaf, cohomology, and gauge.

Concept pages are where the main Explanations live. They should also include
short Tutorials and How-to paths when a reader needs to learn by doing.

## Term

A term is the theorem-scale unit. It may be a definition, theorem, lemma,
proposition, corollary, example, or named construction.

It answers:

* what is the precise claim?
* which concept owns it?
* which Blueprint label names it?
* which Lean declaration witnesses it?
* is it green, red, frontier, recovered, or provenance?
* what is the smallest checked example?

Term pages are not essays. They are compact reference entries with links outward:
to the concept explanation, to the Blueprint node, to API docs, and to provenance.

## Corpus Justification

This rule is not imported from ordinary documentation fashion. It is compatible
with the corpus rule that a path is a proof and that a thing belongs under the
morphism that generates it.

The archive note `content/_archive/computing-proof-pathing-explanation-placing-a-concept-by-its-generating-morphism.md`
states the placement procedure as a descent through articulating, predicating,
positing, and settling. `content/CLAUDE.md` states the stricter file rule:
generated-by, not is-a. This manual makes Diataxis surfaces the legitimate
per-node documentation coverage for that generated path.

So the Obsmetrologia documentation hierarchy should not be a topical shelf. It should
be a typed path:

```text
topic / concept / term / diataxis-surface
```

The point is not to imitate Mathlib's scale. The point is to exceed it with a
documentation grammar that matches the mathematics.

## Coverage Standard

For every Blueprint node, create or identify:

1. topic page;
2. concept page;
3. term reference entry;
4. explanation when the term is conceptually load-bearing;
5. tutorial when a new reader needs a worked path;
6. how-to guide when contributors need a repeatable action;
7. API declaration link;
8. corpus provenance path.

The minimum viable coverage is topic, concept, term reference, Lean declaration,
and status. Full coverage is all four Diataxis surfaces.

## Refactor Pressure

When a Blueprint node has no Verso concept home, the manual is missing a concept
page.

When a Verso concept has no Blueprint term nodes, the proof frontier is missing
claim topology.

When a Lean declaration has neither, the API surface is isolated from the
mathematics.

When a corpus source has none of the above, it is still provenance, not yet
documentation.
