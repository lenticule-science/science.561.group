---
name: structure
description: Specification of a resource file under a theory's `structures/` directory. A structure is an entity-form the agentic substrate works with — a named, defined type of substrate entity. Mathematically grounded in AgOP's agential-self-generation invariant: every operative element of an agentic platform is itself a substrate entity, and the types of those entities are first-order structural commitments declared as structure resources.
---

A structure resource file presents one entity-form the substrate commits to.

## What a structure is, in an agentic substrate

Per the predicated-agentic-orchestration-platform's [agential-self-generation](../../../../agent/agential-self-generation/agential-self-generation.md), every operative element of the platform — every agent, skill, runbook, shape, office, governance rule, heartbeat record — is itself a substrate entity.
This is strictly stronger than substrate-level self-representation: AgOP commits that the *agential* operative elements (not just the substrate ones) are substrate entities.

The entity-forms the agentic substrate commits to — the types its content takes — are structures.
Each structure resource declares one such type and states the substrate's commitments about it: what fields it carries, what invariants it satisfies, what role it plays in the agentic algebra.

In FARS-scope agentic substrates, structures include — non-exhaustively, per the AgOP corpus:

- Substrate carriers: Note, Fiber, Edge, Witness, Event, Channel.
- Agentic entities: Agent, Office, Skill, Runbook, Shape, Mode, Persona.
- Dynamics records: HeartbeatRecord, SessionRecord, ObservationRecord, InstinctRecord.
- Closure machinery: ClosureRuleRecord, ClosureRuleSystem.
- Federation: SovereignNode, FederationGraph.

Each is one structure entity in some agentic theory; the structure file is where the substrate declares it.

## Math derivation in summary

A structure declares an entity-form.
Every defined entity-form is a mathematical structure in the predication-fibration setting: predicates are objects of the predicate category $\mathcal{C}$; bilattices, fibrations, hyperdoctrines, predication-settlings, and multi-observer systems are composite structures the theory commits to; agentic entity-forms (Note, Fiber, Agent, Office, …) are further composites under AgOP's [agential-self-generation](../../../../agent/agential-self-generation/agential-self-generation.md) — every operative element of the platform is a substrate entity whose type is one such structure.

Agentic structures are not a separate class from predication-category structures — they are richer composites built on the same fibration.
A Note is a structure carrying frontmatter (presentation) and a fiber (algebra); an Agent is a structure carrying capability, authorization, and session state; an Office is a structure carrying authority predications.
Each is a predication-category object in the broad sense.

## File location

`<theory>/structures/<structure-slug>.md`.
One file per structure.

## Frontmatter

### `name`

The slug naming this structure.
Required.

### `description`

One-sentence statement of what entity-form the structure declares.
Required.

### `realizes`

List of concepts (slugs of entries in the `concepts/` directory of this theory or an upstream one) that this structure realizes.
The substrate uses this to compute consensus across observers and to bridge structures across federation boundaries.
Optional, multi-valued.

## Body

Human-readable description: what fields the entity carries (as substrate predications), what invariants the substrate enforces on it, what closure rules read it, how it participates in the agentic algebra (dispatch, settling, federation, governance).

## What this specification does not pin

The structured frontmatter representing a structure's required fields and field-level invariants is deferred.
Per-kind sub-specs for the major agentic structures (note, fiber, witness, agent, office, …) will pin those once the FARS algebra and dispatch surfaces are stable enough to commit.
