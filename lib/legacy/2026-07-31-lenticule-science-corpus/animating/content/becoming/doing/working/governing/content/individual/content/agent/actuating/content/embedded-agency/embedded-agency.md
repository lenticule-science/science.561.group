---
type: concept
class: contemporary
status: active
depends-on:
  - decision-theory.md
see-also:
  - naturalized-induction.md
  - reflective-stability.md
  - ../objects/agent-environment-boundary.md
  - ../theorems/embedded-agent-impossibility.md
references:
  - references/demski-garrabrant2019.md
---

# Embedded agency

**Embedded agency** is the research program that takes seriously the fact that real agents are *physical subsystems of the environments they reason about*, rather than Cartesian observers standing outside the world.

## The Cartesian assumption

Classical [decision-theory](decision-theory.md) and Bayesian inference presuppose a clean separation:

```
+----------+        observation         +-------------+
|          | <------------------------- |             |
|  AGENT   |                            | ENVIRONMENT |
|          | -------------------------> |             |
+----------+        action              +-------------+
```

The agent has a state space, a hypothesis space over environments, a utility function over outcomes.
The environment is a separate object the agent reasons about.
The interface is a clean input-output channel.

## Why this fails for real agents

Real agents — humans, AI systems, anything physical — violate this picture in concrete ways:

1. **Self-modeling.** The agent's hypothesis space must include *the agent itself* as one possible structure in the environment, but a strict Bayesian framework cannot coherently include itself in its own hypothesis space (see [embedded-agent-impossibility](../theorems/embedded-agent-impossibility.md)).

2. **No clean boundary.** The "agent-environment boundary" is not given by physics.
  Are the agent's eyes part of the agent or part of the environment?
  Its memory?
  A notebook on the desk?
  See [agent-environment-boundary](../objects/agent-environment-boundary.md).

3. **Source-code uncertainty.** The agent can be uncertain about its own source code, computational resources, and future actions in ways that classical decision theory has no apparatus for.

4. **Self-modification.** The agent can take actions that alter its own decision procedure, goals, or beliefs.
  See [self-modification](../morphisms/self-modification.md).

5. **Subagents.** Parts of the agent (subroutines, learned submodels) may themselves be optimizing for objectives that diverge from the whole agent's.
  This is the substrate of the [mesa-optimization](../../alignment/concepts/mesa-optimization.md) alignment failure.

## The four problems

Demski-Garrabrant (2019) organize the embedded-agency program around four problems:

- **Embedded decision theory** — what is rational choice when the agent is part of the world being decided about?
- **Embedded world models** — how does an agent represent a universe that contains itself?
  See also the larger [world-modeling](../../world-modeling/_index.md) theory.
- **Robust delegation** — how does an agent build successor agents (or self-modifications) that share its values?
- **Subsystem alignment** — how does an agent ensure its own subprocesses do not optimize against it?

Each problem has been the subject of substantial work; none has a complete solution.

## Status

Embedded agency is a *problem statement and partial framework*, not a finished theory.
It identifies failure modes of the Cartesian assumption and proposes substrate (logical induction, FDT, reflective oracles) that addresses some of them.
The research program remains open.
