import ObsmetrologiaManual.DocSetup
import ObsmetrologiaManual.PartVI.ScopeGuide
import ObsmetrologiaManual.PartVI.ConceptIndex
import ObsmetrologiaManual.PartVI.PathGuide
import ObsmetrologiaManual.PartVI.DocumentationArchitecture
import ObsmetrologiaManual.PartVI.DiataxisCoverage
import ObsmetrologiaManual.PartVI.ContributorGuide
import ObsmetrologiaManual.PartVI.DocumentationStyle
import ObsmetrologiaManual.PartVI.TheoryOverviewTemplate
import ObsmetrologiaManual.PartVI.WorkedExampleTemplate

open Verso.Genre Manual InlineLean

#doc (Manual) "Documentation instruments" =>

# Back Matter B: Documentation Instruments

The mathematical ascent of the manual comes first: claim-sites, descent,
recurrence, recovery, frontier, and library atlas. This section is different. It
contains the instruments that keep that ascent maintainable.

Obsmetrologia needs documentation at the scale of a major Lean library, but with a
different center of gravity. Lean and Mathlib have useful surfaces: language
reference, API documentation, contribution guidance, naming conventions,
documentation style, declaration search, library overviews, theory pages, tactic
documentation, and tutorials. Obsmetrologia should have analogues of all of these, but
they must be subordinate to the generated claim-site base.

But Obsmetrologia can make better choices because it is young enough to design the
documentation surfaces together. The docs should not grow as afterthoughts around
whatever files happen to exist. They should be part of the mathematical instrument.

## The instruments we need

Obsmetrologia should maintain the following documentation layers.

* *Foundations manual.* The book you are reading: patient exposition over
  generated claim-sites, written for mathematically serious readers.
* *Scope guide.* A map of what belongs in Obsmetrologia, what belongs in the
  documentation manual, and what belongs only in triage or archive.
* *Theory overviews.* One page per generated domain: predication, positing,
  settling, hyperdoctrine, cohomology, dynamics, geometry, and so on.
* *Declaration reference.* API-style generated docs for every Lean declaration.
* *Concept index.* Human terms mapped to their generated objects and Lean names.
* *Path guide.* How corpus paths, Lean modules, blueprint nodes, and manual
  chapters correspond.
* *Proof status guide.* How to read derived, modeled, frontier, red, green, and
  archived claims.
* *Contributor guide.* How humans and agents should add prose, formalization,
  examples, and frontier nodes.
* *Style guide.* Naming, docstrings, chapter prose, examples, scope language, and
  forbidden shortcuts.
* *Worked examples.* Small examples that begin with plain language, pass through
  the generative path, and end at Lean declarations.

This list is intentionally bigger than the current manual. A foundations program
needs more than a table of contents. It needs a disciplined ecology of documents.

## Scope is mathematical, not administrative

In Mathlib, scope often means whether a topic belongs in a broad community library:
is it mathematics-department material, is there maintainer expertise, will it be
maintainable, should it live in a standalone repository? Obsmetrologia needs a different
scope test.

The first Obsmetrologia question is:

> What generates this?

If the generating path is known and belongs to the Obsmetrologia descent, the topic is
in mathematical scope. If the path is not known, the topic may be in research
scope but not yet in manual-foundation scope. If the topic is merely adjacent by
resemblance, it is not in scope until the generating path is found.

This gives four practical statuses:

* *Foundation scope.* The generating path is known, and the concept is part of the
  normative Obsmetrologia descent.
* *Recovery scope.* The concept is received mathematics recovered as a downstream
  projection: for example category, order, equality, sheaf, cohomology, or linear
  logic.
* *Frontier scope.* The concept has a credible generating path, but the proof or
  bridge is not yet complete.
* *Provenance scope.* The concept is useful background, historical intake, or
  exploratory material, but not yet normative.

The scope guide should make these statuses visible. A reader should never have to
infer whether a page is foundational doctrine, recovered mathematics, active
frontier, or provenance.

## Better than a conventional library overview

A conventional library overview is usually topical: algebra here, topology there,
category theory somewhere else. Obsmetrologia needs a generated overview. Each overview
page should answer:

* Which earlier object generates this domain?
* Which new object appears here?
* Which familiar mathematical discipline is recovered here?
* Which Lean modules carry the formalization?
* Which blueprint nodes are still frontier?
* Which examples show the concept at small scale?

This makes the overview a proof map rather than a subject index.

## Better than ordinary API docs

Generated API docs are necessary, but not sufficient. They answer "what
declarations exist?" They do not answer "why does this declaration live here?"

Every important declaration should eventually be reachable from three directions:

* from the API page by Lean name;
* from the concept index by human vocabulary;
* from the manual by generative role.

For example, a reader looking for equality should be able to discover that Obsmetrologia
does not treat equality as an ambient primitive of the mathematics. They should be
guided to the derived classical and paraconsistent equality constructions and to
the stage where the relevant adjoint systems exist.

## Better than ordinary contribution docs

The contributor guide should not merely say how to format a file or run a build.
It should teach the mathematical discipline of contributing:

* Do not add a received concept by resemblance.
* Find the generating point.
* State whether the contribution is foundation, recovery, frontier, or provenance.
* Write prose before relying on analogy.
* Link the prose to Lean declarations or blueprint nodes.
* Keep examples small enough to teach.
* Keep frontier claims red until proved.

This is especially important for agentic work. Agents can produce enormous amounts
of plausible prose and Lean. The docs must make it harder to generate plausible
wrong structure than to generate slower faithful structure.

## Best-available choices in 2026

Starting now lets Obsmetrologia choose a modern documentation stack deliberately:

* Verso for checked long-form foundations prose.
* Blueprint for dependency graphs and frontier honesty.
* Generated API docs for declaration lookup.
* Search over both prose and declarations.
* A concept index that maps human vocabulary to generated objects.
* Small literate Lean examples embedded in exposition.
* Status metadata for every claim.
* Clear separation between normative manual, frontier graph, development notes,
  and archive.

The most important design choice is that these surfaces should cross-link. A page
about settling should link to the Lean declarations, the blueprint theorem nodes,
the generated API page, the concept index entries, and the worked examples. The
reader should not have to become an archaeologist to move between prose and proof.

## Initial instrumentation backlog

This section is the charter for the maintenance system, not the mathematical
spine itself. The next documentation infrastructure work should create:

1. `Scope Guide`: what belongs in Obsmetrologia and under which status.
2. `Concept Index`: human vocabulary to generated object to Lean declaration.
3. `Path Guide`: corpus path, Lean module, blueprint node, manual chapter.
4. `Contributor Guide`: how to add faithful prose and formalization.
5. `Documentation Style`: naming, status words, examples, and scope warnings.
6. `Theory Overview Template`: a repeatable shape for every generated domain.
7. `Worked Example Template`: plain-language example to generated path to Lean.

These should become separate chapter modules, not sections in this file forever.

{include 1 ObsmetrologiaManual.PartVI.ScopeGuide}

{include 1 ObsmetrologiaManual.PartVI.ConceptIndex}

{include 1 ObsmetrologiaManual.PartVI.PathGuide}

{include 1 ObsmetrologiaManual.PartVI.DocumentationArchitecture}

{include 1 ObsmetrologiaManual.PartVI.DiataxisCoverage}

{include 1 ObsmetrologiaManual.PartVI.ContributorGuide}

{include 1 ObsmetrologiaManual.PartVI.DocumentationStyle}

{include 1 ObsmetrologiaManual.PartVI.TheoryOverviewTemplate}

{include 1 ObsmetrologiaManual.PartVI.WorkedExampleTemplate}
