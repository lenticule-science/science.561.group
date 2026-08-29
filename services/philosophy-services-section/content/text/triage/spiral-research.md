---

title: "Spiral Research"
introduces: practice
description: A recursive research practice for producing well-grounded design decisions. Each cycle tightens the spiral by narrowing from open space to actionable specification.
keywords: ["research", "design", "epistemology", "practice"]
creators: [emsenn, claude-code]
date-created: 2026-03-12
instance-of: inquiry
requires: [observation, grounding]
produces: evaluation
---

A practice for designing things that must be simultaneously grounded in:
- existing standards and prior art (external)
- the project's own archive and constraints (internal)
- the current state of formal planning (prospective)

The practice is recursive. Each cycle produces a more detailed plan that
becomes the input to the next cycle.

## The Cycle

### 1. Check the leading edge of planning docs

Before researching externally, read the most recent planning output.
What do we already know? What are the open questions? What have we
committed to? What is still undecided?

This prevents re-deriving things we already know and constrains the
research to what is actually undecided.

**Artifacts consulted**: slop files, milestone docs, RFCs, AGENTS.md

### 2. Check external sources for best practices

Given the open questions from step 1, survey the relevant prior art:
- What do established standards say about this? (OWL, RDF, SHACL,
  schema.org, ActivityPub, IPFS, etc.)
- What naming conventions, predicate vocabularies, and formal structures
  already exist for things like this?
- What can we reuse directly, what do we need to extend, what are we
  deliberately departing from and why?

The goal is commensurateness: our designs should map cleanly to existing
standards at the points where we touch them, and extend formally where
existing standards are insufficiently precise.

**Artifacts consulted**: web sources, RFCs, W3C specs, academic papers

### 3. Check the archive for how we've done this before

Before designing something new, search the library for prior attempts:
- Have we tried to solve this before? What did we decide?
- What does the existing library content imply about what we need?
- What patterns in the archive predict what forms we need?

The archive is not authoritative about the current state of code — it
records thinking, not implementation. Read it as evidence of prior
reasoning, not as ground truth about current state.

**Artifacts consulted**: library/triage/, theories/, git history,
  prior slop files

### 4. Synthesize into a more detailed plan

Given the three inputs — current plan, external standards, archive
evidence — produce a more detailed specification:
- What are the concrete things we are defining?
- What are their mandatory properties?
- What are their constraints (expressed as SHACL shapes)?
- What are the tools/methods that operate on them?
- What open questions remain?

This output becomes the input to the next cycle's step 1.

**Artifacts produced**: updated slop, RFC drafts, kind declarations,
  SHACL shapes

## Convergence Criterion

The spiral has converged when step 4 produces a specification detailed
enough to implement without further research. Concretely:
- Every type has a name, description, and set of required/optional predicates
- Every required predicate has a type and cardinality constraint
- At least one example of a well-formed instance exists
- The mapping to at least one external standard (OWL/schema.org) is explicit

## Relationship to the Closure Engine

This practice is a manual instance of S_syn: we are surveying the pattern
space, identifying what types should exist by structural necessity, and
producing the specifications to fill the gaps. When the closure engine is
operational, S_syn will automate part of this cycle. Until then, the
spiral is how we close the gap manually.


---

<!-- source: archive/spiral-research.md -->

## Imported source: archive/spiral-research.md

---

title: "Spiral Research"
introduces: practice
description: A recursive research practice for producing well-grounded design decisions. Each cycle tightens the spiral by narrowing from open space to actionable specification.
tags: [research, design, epistemology, practice]
creators: [emsenn, claude-code]
date-created: 2026-03-12
instance-of: inquiry
requires: [observation, grounding]
produces: evaluation
---

A practice for designing things that must be simultaneously grounded in:
- existing standards and prior art (external)
- the project's own archive and constraints (internal)
- the current state of formal planning (prospective)

The practice is recursive. Each cycle produces a more detailed plan that
becomes the input to the next cycle.

## The Cycle

### 1. Check the leading edge of planning docs

Before researching externally, read the most recent planning output.
What do we already know? What are the open questions? What have we
committed to? What is still undecided?

This prevents re-deriving things we already know and constrains the
research to what is actually undecided.

**Artifacts consulted**: slop files, milestone docs, RFCs, AGENTS.md

### 2. Check external sources for best practices

Given the open questions from step 1, survey the relevant prior art:
- What do established standards say about this? (OWL, RDF, SHACL,
  schema.org, ActivityPub, IPFS, etc.)
- What naming conventions, predicate vocabularies, and formal structures
  already exist for things like this?
- What can we reuse directly, what do we need to extend, what are we
  deliberately departing from and why?

The goal is commensurateness: our designs should map cleanly to existing
standards at the points where we touch them, and extend formally where
existing standards are insufficiently precise.

**Artifacts consulted**: web sources, RFCs, W3C specs, academic papers

### 3. Check the archive for how we've done this before

Before designing something new, search the library for prior attempts:
- Have we tried to solve this before? What did we decide?
- What does the existing library content imply about what we need?
- What patterns in the archive predict what forms we need?

The archive is not authoritative about the current state of code — it
records thinking, not implementation. Read it as evidence of prior
reasoning, not as ground truth about current state.

**Artifacts consulted**: library/triage/, library/theories/, git history,
  prior slop files

### 4. Synthesize into a more detailed plan

Given the three inputs — current plan, external standards, archive
evidence — produce a more detailed specification:
- What are the concrete things we are defining?
- What are their mandatory properties?
- What are their constraints (expressed as SHACL shapes)?
- What are the tools/methods that operate on them?
- What open questions remain?

This output becomes the input to the next cycle's step 1.

**Artifacts produced**: updated slop, RFC drafts, kind declarations,
  SHACL shapes

## Convergence Criterion

The spiral has converged when step 4 produces a specification detailed
enough to implement without further research. Concretely:
- Every type has a name, description, and set of required/optional predicates
- Every required predicate has a type and cardinality constraint
- At least one example of a well-formed instance exists
- The mapping to at least one external standard (OWL/schema.org) is explicit

## Relationship to the Closure Engine

This practice is a manual instance of S_syn: we are surveying the pattern
space, identifying what types should exist by structural necessity, and
producing the specifications to fill the gaps. When the closure engine is
operational, S_syn will automate part of this cycle. Until then, the
spiral is how we close the gap manually.


---

<!-- source: archive/texts/spiral-research.md -->

## Imported source: archive/texts/spiral-research.md

---
title: "Spiral Research"
type: practice
name: Spiral Research
description: A recursive research practice for producing well-grounded design decisions. Each cycle tightens the spiral by narrowing from open space to actionable specification.
tags: [research, design, epistemology, practice]
creators: [emsenn, claude-code]
date-created: 2026-03-12
instance-of: inquiry
requires: [observation, grounding]
produces: evaluation
---

# Spiral Research

A practice for designing things that must be simultaneously grounded in:
- existing standards and prior art (external)
- the project's own archive and constraints (internal)
- the current state of formal planning (prospective)

The practice is recursive. Each cycle produces a more detailed plan that
becomes the input to the next cycle.

## The Cycle

### 1. Check the leading edge of planning docs

Before researching externally, read the most recent planning output.
What do we already know? What are the open questions? What have we
committed to? What is still undecided?

This prevents re-deriving things we already know and constrains the
research to what is actually undecided.

**Artifacts consulted**: slop files, milestone docs, RFCs, AGENTS.md

### 2. Check external sources for best practices

Given the open questions from step 1, survey the relevant prior art:
- What do established standards say about this? (OWL, RDF, SHACL,
  schema.org, ActivityPub, IPFS, etc.)
- What naming conventions, predicate vocabularies, and formal structures
  already exist for things like this?
- What can we reuse directly, what do we need to extend, what are we
  deliberately departing from and why?

The goal is commensurateness: our designs should map cleanly to existing
standards at the points where we touch them, and extend formally where
existing standards are insufficiently precise.

**Artifacts consulted**: web sources, RFCs, W3C specs, academic papers

### 3. Check the archive for how we've done this before

Before designing something new, search the library for prior attempts:
- Have we tried to solve this before? What did we decide?
- What does the existing library content imply about what we need?
- What patterns in the archive predict what forms we need?

The archive is not authoritative about the current state of code — it
records thinking, not implementation. Read it as evidence of prior
reasoning, not as ground truth about current state.

**Artifacts consulted**: library/triage/, library/domains/, git history,
  prior slop files

### 4. Synthesize into a more detailed plan

Given the three inputs — current plan, external standards, archive
evidence — produce a more detailed specification:
- What are the concrete things we are defining?
- What are their mandatory properties?
- What are their constraints (expressed as SHACL shapes)?
- What are the tools/methods that operate on them?
- What open questions remain?

This output becomes the input to the next cycle's step 1.

**Artifacts produced**: updated slop, RFC drafts, kind declarations,
  SHACL shapes

## Convergence Criterion

The spiral has converged when step 4 produces a specification detailed
enough to implement without further research. Concretely:
- Every type has a name, description, and set of required/optional predicates
- Every required predicate has a type and cardinality constraint
- At least one example of a well-formed instance exists
- The mapping to at least one external standard (OWL/schema.org) is explicit

## Relationship to the Closure Engine

This practice is a manual instance of S_syn: we are surveying the pattern
space, identifying what types should exist by structural necessity, and
producing the specifications to fill the gaps. When the closure engine is
operational, S_syn will automate part of this cycle. Until then, the
spiral is how we close the gap manually.
