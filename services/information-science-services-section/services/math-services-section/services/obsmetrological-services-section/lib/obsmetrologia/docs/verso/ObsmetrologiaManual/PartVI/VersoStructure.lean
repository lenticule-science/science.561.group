import ObsmetrologiaManual.DocSetup

open Verso.Genre Manual InlineLean

/-!
The Verso structure chapter states the required shape of the manual as the
primary prose territory over Obsmetrologia claim-sites.
-/

#doc (Manual) "Verso structure" =>

# Verso Structure

Verso is the primary prose territory of Obsmetrologia. It is where a reader learns how
the generated mathematics breathes before they inspect a declaration, audit a
dependency graph, or chase an archive path.

That does not make Verso a free essay space. A Obsmetrologia Verso page is a typed
piece of exposition over a claim-site. It may be lyrical in movement, patient in
teaching, and strange when the mathematics is strange, but it must still tell the
reader which claim-site it is carrying and which other surfaces witness that
site.

The manual should therefore be structured like a literate atlas over the claim
base: a reader can enter by story, by concept, by theorem, by example, by Lean
name, by frontier pressure, or by corpus path, and still arrive at the same
mathematical address.

## Structural Law

Every durable Verso page must answer five questions.

* What claim-site does this page carry?
* What generates that claim-site?
* What does this claim-site generate or enable next?
* Which carriers currently witness it: Lean, Blueprint, API docs, corpus
  provenance, or only prose?
* What kind of incompleteness is allowed here?

If a page cannot answer these questions, it is not yet a manual page. It is a
note, intake, archive, or frontier sketch.

## Page Scales

The manual has four stable scales.

Topic pages orient a region of the generated mathematics. They name the
generating act, the active regime, the concept modules below the topic, and the
reader routes through the region.

Concept pages teach one generated object, construction, or morphism. They state
what earlier object produces it, what new lawful vocabulary appears there, which
Lean module carries it, which Blueprint nodes depend on it, and which received
mathematics is recovered only later.

Term entries record precise definitions, theorems, lemmas, examples, interfaces,
or invariants. They are compact reference pages or sections: statement, status,
Lean witness, dependency node, smallest example, and links outward.

Worked paths teach motion through the system. They begin in ordinary language,
pass through the generated path, show a checked Lean witness when one exists, and
end by telling the reader what concept or theorem has become available.

These scales are not optional decorations. They are how the manual avoids
becoming either a theorem dump or a cloud of beautiful but unaddressed prose.

## Page Kinds

Each page should declare, implicitly or explicitly, which documentary job it is
doing.

Tutorial pages teach a first movement through examples.

How-to pages teach a repeatable operation: place a concept, promote a claim,
read a Blueprint node, add a checked example, audit drift.

Explanation pages teach why a construction exists, what it refuses to assume, and
what familiar object it later recovers.

Reference pages provide compact facts: names, statements, statuses, declarations,
dependencies, examples, and provenance.

Theory overviews summarize a generated domain as a whole: inputs, outputs,
received comparison, non-identifications, Lean surface, frontier, and provenance.

The same claim-site may need several page kinds. The page kinds are profiles over
one base, not separate objects.

## Required Welds

A mature Verso concept page should include these welds whenever they exist.

* Claim-site identifier: the topic, concept, or term being carried.
* Status: normative, recovered, frontier, conjectural, computational witness,
  prose only, Lean checked, or archived.
* Generated-by: the earlier Obsmetrologia object or path that produces this site.
* Generates-next: the later objects, routes, or theorem families this site
  enables.
* Lean carrier: module and declarations.
* Blueprint carrier: labels for dependency nodes and proof status.
* API carrier: declaration lookup path or generated-docs name.
* Provenance carrier: corpus path, archive path, note, paper, or agent run.
* Reader route: where to start before this page and where to go after it.
* Drift note: what would count as failed gluing for this site.

Missing welds are allowed only when their absence is named. A frontier page may
say that the Lean carrier is absent. A provenance page may say that no promoted
claim-site exists yet. A concept page may say that Blueprint coverage is still
missing. Silence is what produces drift.

## Manual Spine

The book spine should stay generated, not encyclopedic.

Part I orients the reader to the program, the free-data boundary, the generator
discipline, and how to read.

Part II walks the descent: mark, utterance, articulating, predicating, positing,
and settling.

Part III follows recurrence: the four-corner cell as it reappears across phase,
reading, gauge, modal shape, nuclear quartet, and regime.

Part IV recovers received mathematics in-chain: category, order, equality,
residuation, hyperdoctrine, sheaf, cohomology, dynamics, geometry, computation,
and physics only where Obsmetrologia has generated the right carrier.

Part V records frontier and method: how claims become precise, how red nodes stay
red, how proof pressure is represented, and how not to overclaim.

Part VI governs the documentation system itself: scope, paths, architecture,
Diataxis coverage, contribution, style, templates, and this structure contract.

Part VII indexes the existing library by generated domains and topics, with
theory overviews as the reader's bridge from book to declarations.

Appendices hold proof trees, migration tables, coverage audits, and other
supporting instruments.

The spine is allowed to grow, but new parts should justify themselves as new
profiles over the claim base, not as topical shelves.

## Navigation

Verso should provide several routes through the same claim-sites.

The learner route begins with orientation, then the descent, then worked paths,
then recovered mathematics.

The formalizer route begins with primitive boundaries, Lean carriers, examples,
and proof-status language.

The frontier route begins with scope, promotion flow, Blueprint nodes, and drift
audits.

The corpus route begins with provenance, concept index entries, and promoted
readings.

The maintainer route begins with this structure contract, the path guide,
coverage rules, templates, and style guide.

Routes are important because Obsmetrologia is too large to pretend that every reader
should traverse it in one line. But routes must cross-link into common
claim-sites so that the manual remains one object.

## Promotion Discipline

Verso is not where speculative pressure becomes true by eloquence.

Unsettled material may appear in Verso when the page marks its status and names
the missing carrier. But durable teaching prose should prefer settled or clearly
frontier claim-sites. When a note is only evocative, it belongs in corpus intake
or archive. When a claim is precise but unproved, it belongs as a red Blueprint
node. When a declaration is checked but unexplained, Verso should add the
expository carrier. When a page teaches a concept with no formal address, the
next task is to name the claim-site.

The healthy motion is:

```text
provenance -> claim-site -> Blueprint pressure -> Lean settlement -> Verso teaching -> API lookup
```

The loop may begin at any carrier, but it should eventually close around the
same address.

## Drift Checks

Run these checks during documentation work.

If Verso says "proved" but there is no Lean declaration, the page is drifting.

If Verso teaches a concept but names no claim-site, the page is drifting.

If Blueprint has a green node with no teaching surface, the proof is isolated
from learners.

If API docs expose a declaration with no concept page, the declaration is
settled but not yet integrated.

If provenance remains rich but no claim-site has been promoted, the material is
latent rather than documented.

If a page relies on received terminology before showing what generates it, the
reader has been moved onto the wrong foundation.

These checks are deliberately simple. The mathematics can be intricate; the
maintenance discipline should be executable by a tired human and a literal
agent.
