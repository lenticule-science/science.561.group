---
type: object
class: contemporary
status: active
depends-on:
  - teaching/explanations/embedded-agency.md
see-also:
  - teaching/explanations/naturalized-induction.md
  - ../morphisms/embedding.md
references:
  - references/demski-garrabrant2019.md
---

# Agent-environment boundary

The **agent-environment boundary** is the (often ill-defined) interface separating the agent from the rest of the world.
Classical decision theory treats this boundary as given by fiat: the agent has actions, the environment has states, observations cross from environment to agent, actions cross from agent to environment.
For [embedded-agency](teaching/explanations/embedded-agency.md), the boundary is not given by physics and the question of *where to draw it* becomes substantive.

## The problem

For a physical agent, candidate boundaries proliferate:

- The agent's central reasoning component?
  (Excludes the sensors and effectors.)
- The agent's whole body?
  (Includes sensors, effectors, but excludes notebooks and tools.)
- The agent's skin plus tools currently in hand?
  (Where do tools start and stop being part of the agent?)
- The whole causal cone of computations the agent is currently performing in the environment?
  (Includes work done by allies, delegations, scaffolding.)

Each choice yields a different decomposition of "what the agent does" vs. "what happens to the agent".
Different choices produce different decision problems with different optimal acts.

## The Cartesian frame

Garrabrant (2020) proposes the formalism of **Cartesian frames**: a representation of agent-environment boundaries as morphisms in a category.
A frame is a triple $(A, E, \cdot)$ where $A$ is the set of agent strategies, $E$ is the set of environments, and $\cdot : A \times E \to W$ produces a world-state.
Different frames correspond to different choices of "what is the agent".
Operations on frames (refinement, coarsening, composition) let one compare agency at different levels of granularity.

## Why this matters

The boundary choice is consequential for:

- **Subagent identification.** Is a learned submodel inside the agent its own agent (a mesa-optimizer) or part of the host?
  See [mesa-optimization](../../alignment/concepts/mesa-optimization.md).
- **Delegation analysis.** Is a delegated subagent part of the delegating agent's accountability surface?
  See [delegation-does-not-transfer-accountability](../../agents/theorems/delegation-does-not-transfer-accountability.md).
- **Robust delegation.** A reflectively-stable agent contemplating self-modification must specify where the *successor agent* begins and ends.
- **Tool-use accounting.** Is a tool an extension of the agent's action space or a separate agent the agent interacts with?

## Status

The agent-environment boundary is conceptually central but formally underspecified.
Cartesian frames give a formal language; they do not provide a principled rule for picking the right frame in any particular setting.
The choice often has to be made by appeal to the application: what question are you asking about the agent?
