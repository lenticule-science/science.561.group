---
id: flatfile-agential-resource-system-agent
description: "An entity that submits steps to a system's RelationalMachineInterface and receives output from its Observation Layer — the actor in the relational machine architecture."
extends: Entity
component-of: FlatfileAgentialResourceSystemLocale
uses: RelationalMachineInterface
date-created: 2026-03-18
date-modified: 2026-03-19
params:
  step-alphabet: relational-universe
  interface: relational-machine-interface
  observation-layer: relational-universe
output: relational-universe-morphism
ast:
  submit-receive-pair:
    - step-alphabet
    - interface:
        - history-extension-map
    - observation-layer:
        - global-sections-functor
title: Flatfile Agential Resource System Agent
---

# Flatfile Agential Resource System Agent

## Formal definition

A **FlatfileAgentialResourceSystemAgent** is a pair $(\mathrm{submit}, \mathrm{receive})$:

$$\text{Agent} = (\mathrm{submit} : \Sigma \to I,\; \mathrm{receive} : O \to H^*_t)$$

where: - $\Sigma$ is the **step alphabet** — the set of named steps the agent can submit - $I$ is the **RelationalMachineInterface** — the intake boundary accepting steps $s \in \Sigma$ and extending the current history $t \mapsto s \star t$ - $O$ is the **Observation Layer** — the output channel returning newly settled global sections $x \in H^*_{t'}$ - $\mathrm{submit}$ sends a step $s$ into $I$, advancing the machine from history $t$ to $t' = s \star t$ - $\mathrm{receive}$ consumes the observation output at $t'$

**Agent loop.** The agent's interaction with the machine is a sequence of (submit, receive) cycles: $s_1, o_1, s_2, o_2, \ldots$ Each cycle extends the history by one step and returns one settled observation.
The agent's behavior is fully characterized by the sequence of steps it chooses given the observations it receives — a strategy in the game-theoretic sense: a function from observation history to next step.

**Agent-agnostic.** Human and AI agents are FlatfileAgentialResourceSystemAgents in the same formal sense: both submit $s \in \Sigma$ and receive $o \in H^*_{t'}$.
The distinction is in how they choose steps, not in the interface structure.

## What this is

A **FlatfileAgentialResourceSystemAgent** is an entity that submits steps to a [RelationalMachineInterface](../../../../../../../../../../../../../../../../../../engineering-science-services-section/services/computer-science-services-section/content/text/glossary/terms/relational-machine-interface.md) and receives output from an Observation Layer.

In the [RelationalMachine](relational-machine.md) architecture, the [RelationalMachineInterface](../../../../../../../../../../../../../../../../../../engineering-science-services-section/services/computer-science-services-section/content/text/glossary/terms/relational-machine-interface.md) receives steps s ∈ Σ that extend the current history t to t' = s★t.
The FlatfileAgentialResourceSystemAgent is what originates those steps — the source of input to the machine.
The Observation Layer returns newly settled global sections to the FlatfileAgentialResourceSystemAgent as output.

A FlatfileAgentialResourceSystemAgent is not defined by being human or artificial.
A FlatfileAgentialResourceSystemAgent is defined by its relation to the machine: it submits steps to an interface and receives settled sections back.

## Agent types in this system

Two kinds of FlatfileAgentialResourceSystemAgent operate in a [FlatfileAgentialResourceSystem](../../../../flatfile-agential-resource-system.md):

**Human** — reads files directly, issues instructions, reviews output, makes judgment calls that require interpreting intent or resolving ambiguity.

**AI assistant** — reads entity files, follows skills, executes runbooks, invokes scripts, and deposits messages.
Operates within the permissions declared in `AGENTS.md`.

Both are FlatfileAgentialResourceSystemAgents in the same sense: both submit steps to interfaces and receive output.
The distinction is in capability and permission scope, not in role within the machine architecture.

A [FlatfileAgentialResourceSystemLocale](../flatfile-agential-resource-system-locale/flatfile-agential-resource-system-locale.md) is also a FlatfileAgentialResourceSystemAgent at its own scope: it submits steps to other locales' interfaces via [deposit-message-in-agent-inbox](../../../../../../../library/relational-hyperverse-repository/skills/deposit-message-in-agent-inbox.md) and receives steps at its own interface.

## In the FARS

In a [FlatfileAgentialResourceSystem](../../../../flatfile-agential-resource-system.md), the FlatfileAgentialResourceSystemAgent's interaction is:

- **Input**: writing to files, invoking skills, running runbooks — each is a step submitted to a locale's [RelationalMachineInterface](../../../../../../../../../../../../../../../../../../engineering-science-services-section/services/computer-science-services-section/content/text/glossary/terms/relational-machine-interface.md) (`INBOX.md` or the improvement loop entry point)
- **Output**: reading settled entity files, receiving skill results, reading messages written to `INBOX.md`

A FlatfileAgentialResourceSystemAgent operates within exactly one locale at a time.
Cross-locale actions are permitted only when a skill explicitly instructs them.
A FlatfileAgentialResourceSystemAgent must not write to another locale's files directly — it submits a step to that locale's interface via `skills/deposit-message-in-agent-inbox.md`.
A FlatfileAgentialResourceSystemAgent must operate within the permissions declared in the locale's `AGENTS.md`.
A FlatfileAgentialResourceSystemAgent must not modify content in a locale it depends on.

## Open questions

- How does the User/Operator/Agent three-way distinction derive from the RelationalMachine structure?
  Operator is the entity with configuration authority (writes SOUL.md/AGENTS.md); User is the entity whose goals the system serves.
  Neither is fully derived yet.
