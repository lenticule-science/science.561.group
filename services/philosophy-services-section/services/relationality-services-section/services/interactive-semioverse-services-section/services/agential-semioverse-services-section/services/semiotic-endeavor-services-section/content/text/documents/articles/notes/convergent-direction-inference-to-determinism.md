---
title: "Convergent direction: inference to determinism"
date-created: 2026-03-08T00:00:00
authors:
  - emsenn
  - claude
type: text
keywords:
  - SemioticEndeavor
  - ProgressiveAutomation
  - SkillMaturity
  - MetaDirection
description: "The movement from inference to determinism, the goal of specifying the endeavor, and reducing LLM token usage all converge on the same direction — and this convergence gives meta-direction to goal 006."
---

Three apparently independent objectives converge on the same
direction. Recognizing the convergence gives meta-direction to the
endeavor's primary goal.

## The three trajectories

### 1. Inference → determinism (skill maturity)

The skill maturity concept describes how skills move from
inference-heavy (a capable agent reads instructions and exercises
judgment) to procedural (a deterministic script encodes the exact
steps) to tool (an MCP endpoint callable by any agent). Each
promotion makes the skill cheaper, faster, more reliable, and more
composable.

This is policy 001 (progressive automation) operationalized.

### 2. Specifying the endeavor (goal 006)

The primary goal is to fully specify the emsemioverse endeavor:
what an endeavor is (semiotic-endeavor), what an implementation must
do (semiotic-endeavor-specification), and how each aspect of the
method fits into the whole. Specifications make the system
measurable — you can check conformance, identify gaps, and improve
systematically.

This is the content trajectory: knowledge moves from implicit
practice to explicit specification.

### 3. Reducing LLM token usage

As skills mature and specifications stabilize, less inference is
needed per unit of work. A procedural script uses zero tokens. A
delegable skill uses tokens from a small, cheap local model. Only
genuinely novel work requires a high-capability agent's full
attention.

This is the economic trajectory: the system becomes cheaper to
operate as it matures.

## The convergence

All three trajectories point the same direction:

```
implicit → explicit → measured → automated
```

- Skill maturity: inference → structured → delegable → procedural → tool
- Specification: practice → method → specification → conformance check
- Token usage: high → medium → low → zero

They are not three separate efforts. They are the same effort seen
from three angles: operational (what agents do), epistemic (what the
system knows about itself), and economic (what the system costs).

## Meta-direction

Goal 006 (specify the endeavor) gives meta-direction to plans: it
tells you which plans are highest-leverage by answering "does this
plan move us closer to a fully specified endeavor?"

The convergence of these three trajectories gives meta-direction to
goal 006 itself. It tells you which specifications to prioritize by
answering: "does specifying this move work from inference toward
determinism? Does it reduce the tokens needed for the next agent to
do this work?"

Specifications that enable automation are higher leverage than
specifications that remain dead letter. A semiotic-triage spec that
enables scripted enrichment (replacing inference-based enrichment)
is higher leverage than a semiotic-triage spec that just documents
what we do.

This is the direction: **every specification should be written with
the question "what does this enable me to automate?" as a first-class
concern.** The purpose of a specification is not just documentation —
it is the precondition for the next promotion on the skill maturity
axis.

## Relationship to existing concepts

- **Closure pressure** (ASR concept): the formal version of this
  convergence — skills under repeated execution pressure tend toward
  closure (deterministic, idempotent operations)
- **Progressive formalization** (agent-skill-interaction theory):
  knowledge moves from conversation → specification → skill → script
  → formal proof
- **Operational closure** (ASR theory): satisfaction relation connects
  the predicate graph to formal semantics; each layer of checking
  replaces inference with computation
- **Escalation of communication** (emsenn, 2019): ideas move from
  private to public venues, gaining rigor at each stage — parallel
  to knowledge moving from esoteric (fragment-internal) to exoteric
  (cross-fragment)
