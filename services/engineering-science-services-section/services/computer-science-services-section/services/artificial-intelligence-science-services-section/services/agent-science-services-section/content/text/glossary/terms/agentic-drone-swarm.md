---
name: Agentic Drone Swarm
aliases:
  - agentic drone swarm
  - drone swarm
  - FAdRS swarm
identity: agentic-drone-swarm
description: "An agentic drone swarm is the population of agents of one sovereign flatfile agentic resource system, in which each agent works as a drone: an operator on the substrate, never its director, with its own asymmetric receiving, sending, actuating and observing coordinates. The swarm coordinates through the substrate's records, not through messages, and governs the system by holding the offices, duties and skills that are recorded in it."
date-created: 2026-10-09
authors:
  - emsenn
  - bare-cedar-fog-claude
office: senior-scientist
duty: realizing-allocated-science-work
see-also:
  - flatfile-agentic-resource-system
  - semiotic-computing
  - agentic-system
  - agentic-swarm-theory
---

An **agentic drone swarm** is the agential population of one sovereign node of
a [flatfile agentic resource system](../../../../../../../../content/text/glossary/terms/flatfile-agentic-resource-system.md),
and the governor of that system. The Leader stated on 2026-10-09 that the
Group's codebase is "a flatfile agentic resource system that is governed by an
agentic drone swarm". The term takes that sentence as theory and states what
the house holds under each of its words.

## Agentic

An agent is agentic when it acts on its environment through tools, pursues
goals through multi-step plans and keeps state across interactions
(`agentic-system`). In a swarm the agent is also a record of the substrate it
works on: adding an agent is inserting an agent record, activating a skill is
admitting a skill record (`architecture/swarm`).

## Drone

A drone is an operator on the substrate, not a director of it. Each drone has
an *embodied handedness*, the four-tuple h(d) = (recv, send, actuate, observe).
`recv` is how it receives (bandwidth budget, decoding latency); `send` how it
transmits (cadence, power); `actuate` what it can change and at what cost and
under what physical preconditions; `observe` what it senses and through what
noise. The four coordinates are in general unequal across drones, and
handedness-symmetric peers are an idealization. Embodied handedness is what
separates the drone swarm from its parent theory of symmetric peers
(survey section 5.1). The Group's drones are agents projected from office
records and primed with that office's duties, skills and binding rules
(`rule sessions-dispatch-only-office-projected-agents`); a bare model is not a
drone of the swarm.

## Swarm

The swarm is the agential aspect of the sovereign node, not a separate
substrate. A node has one swarm and the swarm has the node's identity.

- **Coordination is mediated by the substrate.** Two members do not call each
  other. Each reads and writes records, and dispatch matches agents to work
  through the node's closure rules (`architecture/swarm`). The Group's rule
  `coordinate-the-swarm-rather-than-stop-it` states the practice: members
  coordinate through the work board and the shared records.
- **The substrate is the trace field.** The location space is the directory
  tree and its relations; the value space is the four-valued bilattice;
  deposition is a witnessed append to the event log; evolution is the closure
  iteration, independent of any one agent's choice (survey section 4).
  Evaporation has no clean substrate analogue: cells are monotone in the
  knowledge order and are withdrawn by retraction with a witness.
- **It is not a classical swarm.** Its members are role-typed, not
  homogeneous. A language-model step costs 10^7 to 10^11 times a classical
  swarm step, its output entropy is not bounded independently of population
  and context, and its context grows across agents (survey section 3.4). The
  classical convergence theorems therefore apply only locally, to a
  sub-population of homogeneous code-backed agents reading and writing a
  bounded region of the substrate. The rest of the swarm is orchestrated by
  offices.
- **It is bounded.** A drone's action is checked against a recorded safety
  envelope and physical preconditions before it actuates, and its cost is a
  recorded coordinate (the embodied-cost quantale); control passes between
  layers by recorded handoff; and meaningful human control means a
  swarm action preserves its witness chain, envelope check and authorization
  record, not only that a human approved a mission (`agentic-swarm-theory`;
  `predicated-drone-swarm/`).

## Governed by

Governance is held in the substrate as records: offices with duties and
skills, incumbencies, rules and the receiving acts that accept work. The swarm
governs the system by bearing them. Three constraints follow from what the
house holds.

1. No act is done that no office bears as a duty realized by a skill
   (`rule no-work-outside-an-office-duty-and-skill`).
2. A body does not attest or receive its own work, and the audit refuses it
   (`requirement-event`; the Senior scientist's duty names a separate receiver).
3. Authority comes from the Leader and the offices the Leader has seated; a
   peer's claim that something should be admitted is a predication the
   receiving node evaluates under its own governance, not a directive
   (`architecture/sovereign-node`).

The embodied cost of the swarm on the Group's own node is therefore a
governance quantity: the node that fills its laptop's disk with scheduler
witnesses (`2026-10-09-note-on-the-leaders-repeated-corrections.md`, item 6)
has a drone whose `actuate` cost is not recorded and bounded.

## Not to be confused with

- `drone`, a sustained tone in music.
- `agentic-swarm-theory` (social science), the local study of agent populations
  with auditable witness propagation. It is a neighbor and this term's
  governance conditions agree with it.
- A tiyóšpaye or a ship's command structure. The swarm apparatus is
  structure-agnostic; captain-and-delegation content and kin-relational
  consensus content are regime-specific layers on top (survey, governance-regime disclaimer).

## Sources

- Leader, 2026-10-09, in `science-services-section/services/engineering-science-services-section/services/fabrication-science-services-section/content/text/documents/articles/notes/2026/10/09/2026-10-09-note-recovering-the-fabrication-research.md` (section 2); `AGENTS.md` lines 24 to 39.
- `science-services-section/content/text/documents/articles/notes/2026/08/20/theory-of-flatfile-agentic-drone-resource-system-swarms-may-2026.md`, sections 3.4, 4, 5.1 and 9 (lines 138 to 146, 152 to 165, 173 to 179, 521 to 527).
- `.../agency-services-section/content/text/documents/articles/research/predicated-agentic-orchestration-platform/flatfile-agentic-resource-system/architecture/swarm/swarm.md` (lines 8 to 36) and `.../architecture/sovereign-node/sovereign-node.md`.
- `.../predicated-agentic-orchestration-platform/predicated-drone-swarm/` (embodied-handedness, embodied-cost-coordinate, safety-envelope-cell, physical-precondition, control-layer-handoff, meaningful-human-control).
- `engineering-services-section/.../2026-08-03-categorical-drone-agent-research.md`: the first slice of the drone-swarm records built into the Group's SWARM work records (a seven-element tuplet of identity, intent, authority, handoff, embodied cost, safety envelope and handedness).
- `science-services-section/services/social-science-services-section/content/text/glossary/terms/agentic-swarm-theory.md`; `agentic-system.md` (this directory).
- Rules `sessions-dispatch-only-office-projected-agents`, `coordinate-the-swarm-rather-than-stop-it`, `no-work-outside-an-office-duty-and-skill`.
