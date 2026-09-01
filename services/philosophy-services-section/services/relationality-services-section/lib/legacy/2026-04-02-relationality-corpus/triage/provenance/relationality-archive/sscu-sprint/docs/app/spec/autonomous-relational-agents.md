---
name: autonomous-relational-agents
keywords:
  - idea
  - agents
  - autonomous
part-of: relational-computer
description: "Agents that live inside the relational computer, acting only by invoking runbooks over recognitions under universal invariants."
---

Sketch of agents that live *inside* the universal relational computer, acting
only by invoking runbooks over recognitions under the same invariants as
everything else.

## 1. What is a relational agent?

An **autonomous relational agent** is a process that:

- sees a *slice* of the recognition graph,
- has a set of allowed runbooks/acts,
- is constrained by policy/topology/measurement/traceability,
- and pursues goals expressed as recognitions.

It is not outside the system; it is itself represented as recognitions and
subject to the same rules.

## 2. Core recognitions

- `AgentRecognition`
  - identity: name, description, domain focus (math, MUD, health, etc.).
  - capabilities: which runbooks/acts it may invoke.
  - resources: rate limits, concurrency, memory.
  - alignment: links to `ValueRecognition` / `NormRecognition`.

- `GoalRecognition`
  - a goal the agent is pursuing:
    - e.g., “stabilize this care plan,” “summarize today’s ActivityPub feed,”
      “expand this MUD region safely.”
  - linked to domains, constraints, and success criteria.

- `AgentStateRecognition`
  - current internal state: focus, pending tasks, last actions.

- `AgentActionRecognition`
  - records of actions:
    - which runbook was executed,
    - inputs/outputs,
    - recognitions touched,
    - measurements before/after.

## 3. How an agent acts (informal loop)

1. **Perceive**  
   - read from a constrained view of the recognition graph:
     - relevant recognitions (goals, measurements, topology, past actions),
     - new recognitions tagged for this agent (tasks, alerts).

2. **Decide**  
   - use its internal policy/logic to choose:
     - whether to act now,
     - which runbook to run,
     - with what inputs.
   - decision-making can be:
     - rule-based, ML-based, or guided by an LLM, but always producing *runbook
       invocations*, not arbitrary code.

3. **Act**  
   - invoke a runbook in the rewriter engine.
   - the runbook:
     - goes through normal validation,
     - respects topology/measurement constraints,
     - generates new/updated recognitions.

4. **Reflect**  
   - observe measurement changes and traceability outcomes,
   - update its `AgentStateRecognition` and possibly `GoalRecognition`:
     - success, partial progress, need for help, backoff.

This loop is continuous or event-driven, but every step is visible and
traceable.

## 4. Safety and alignment in this frame

Because agents are fully inside the relational universe:

- they cannot:
  - mutate state outside runbooks,
  - bypass intake/policy/measurement/traceability,
  - invent new acts or specs without going through the same earning process.

- they must:
  - work with recognitions and runbooks that already exist,
  - attach their actions to `AgentActionRecognition` with full provenance,
  - be evaluable via measurement and value/ethics recognitions.

An “alignment guardian” agent, for example, would be a relational agent whose
goals and capabilities are specifically about:

- inspecting runbooks and actions for policy/value violations,
- emitting warnings or blocking actions via existing policy mechanisms,
- maintaining summaries of where the system is drifting relative to your norms.

## 5. Multiple agents coexisting

Multiple agents can coexist over the same universe:

- each with:
  - different domains and goals,
  - different runbook libraries,
  - different views (e.g., one sees MUD, one sees medical, one sees newsfeeds).

- they coordinate via recognitions:
  - share `GoalRecognition` or `TaskRecognition`,
  - tag recognitions for each other (“review this,” “expand this region”),
  - negotiate via `AssignmentRecognition` and governance runbooks.

This looks less like a swarm of opaque black boxes, and more like a small party
of explicitly modeled helpers, each living under the same relational discipline
as everything else in your universe.

