---
type: concept
class: classification
depends-on: [agent, dispatch]
see-also: [skill, runbook, formality-layer]
title: Operation kinds
description: The platform's operations decompose into a small number of structural kinds, each characterized by what it reads, what it writes, and what closure rule pattern produces it.
---

# Operation kinds

The platform's operations decompose into a small number of structural *kinds*, each characterized by what it reads, what it writes, and what closure rule pattern produces it.
The decomposition is operative engineering: a hardcoded hook performing a particular kind of operation can be lifted into a substrate operation by identifying its kind and writing it as the corresponding closure-rule pattern.

The seven kinds:

- **Observation.** Records what happened — predications about an event, a state change, an external input — without changing other state.
  An observation operation reads a session's recent activity (or an external arrival) and writes new event predications.
  It is the substrate-level reflection of "I noticed X."
- **Guard.** Checks whether an action is admissible against declared constraints.
  A guard reads the proposed action's predications, the targeted scope's constraints, the actor's authorization, and produces an admissibility value (true, false, or contested).
  A guard does not perform the action; it produces the value the [dispatch](dispatch.md) operator consults.
- **Accounting.** Tracks resource flows — value entering, value leaving, value transformed — across substrate events.
  An accounting operation reads an event's effect on a tracked resource (compute consumed, time elapsed, capacity used) and writes a corresponding ledger predication.
  The pattern is the substrate's analog of double-entry bookkeeping for any quantity the platform tracks.
- **Query.** Reads entity state without writing.
  A query reads the predications on an entity (or a region) and produces a structured response.
  Particular platform realizations may format responses for different audiences (for an agent, for a UI, for an external API); the substrate-level query is just the read.
- **Mutation.** Changes substrate state.
  A mutation reads an entity's current predications, applies a transformation, and writes the new predications.
  Every mutation produces a [witness](../../teaching/explanations/witness.md) per substrate discipline; mutations that don't are violations.
- **Analysis.** Inspects a set of entities (a scope, a sub-region, a search result) and produces summary or comparative predications.
  An analysis operation is a structured composition of queries plus a derivation; the result is itself substrate content.
- **Learning.** Self-composition — applying observation, analysis, and mutation to the substrate's own content (its event log, its operator specifications, its agents' behavior) to produce derived entities (skills, instincts, refined specifications) that the platform then uses.
  The learning kind is what makes [agential self-generation](../agent/agential-self-generation/agential-self-generation.md) operationally meaningful.

Each kind is a *channel-of-operation*: a class of operations sharing structural properties.
Particular platform operations may compose multiple kinds (a dispatch decision is a guard followed by a mutation; a runbook execution is a sequence of queries, mutations, and observations).
The classification's value is engineering: it tells the implementer what the operation should look like, what witnesses it should produce, what the kind's typical concerns are.

The classification arose from observing that a typical platform's hooks and tools — even when there are dozens of distinct named operations — fall into these seven kinds.
Lifting per-tool implementations into per-kind closure-rule patterns reduces duplication: rather than thirty different guard hooks each with its own admissibility logic, one guard kind with thirty admissibility-pattern predications.
