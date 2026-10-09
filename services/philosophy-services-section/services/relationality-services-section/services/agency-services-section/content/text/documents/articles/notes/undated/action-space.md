---
type: object
class: structural
status: active
depends-on:
  - teaching/explanations/tool-schema.md
  - teaching/explanations/environmental-action.md
see-also:
  - ../objects/tool-call.md
  - ../objects/observation-space.md
  - ../morphisms/tool-invocation.md
  - ../theorems/tool-schema-bounds-action-space.md
  - ../terms/tool-use.md
  - ../terms/model-context-protocol.md
references:
  - references/anthropic2024.md
  - references/schick2023.md
title: Action space
description: The action space of an agentic system at a given step is the set of tool schemas provided to the model at that step.
---

# Action space

The action space of an agentic system at a given step is the set of tool schemas provided to the model at that step.
It is the complete characterization of what the agent can do: the agent may invoke any function whose schema is present, with arguments conforming to the schema's input specification.
No function outside the action space can be invoked.

## Formal definition

Let $S$ be the set of tool schemas provided to the agent at step $t$.
The action space at step $t$ is $A_t = S$.
A valid action at step $t$ is a pair (schema $s \in A_t$, arguments $a$ valid under $s$).
An invalid action is any pair where the schema is not in $A_t$ or the arguments violate $s$'s input schema.

This is the content of [tool-schema-bounds-action-space](tool-schema-bounds-action-space.md): the action space is exactly $A_t$, not a superset.

## Dynamic action spaces

The action space can change across steps within a session.
Frameworks supporting dynamic toolsets (PydanticAI, AutoGen) modify the available schemas based on context: an agent in a "planning" phase may have only read tools; after validation, it gains write tools.
The action space is therefore a function of step rather than a fixed set.

Dynamic action spaces require tracking: the execution trace must record which schemas were available at each step to enable accurate accountability assessment.
A tool call that was valid at step 7 (schema present) but would be invalid at step 3 (schema not yet granted) cannot be evaluated correctly without knowing the action space at each step.

## Action space as a governance artifact

Because the action space bounds what the agent can do, populating it is a governance decision made by the system designer or operator.
Each schema added to the action space is an authority grant: it permits the agent to invoke that function.
This aligns with the [tool-schema](../../research/2026/07/31/lenticule-import/animating/content/becoming/doing/working/governing/content/individual/content/agent/actuating/content/environmental-action/action-space/teaching/explanations/tool-schema.md) concept's framing of schemas as authority grants rather than merely technical definitions.

The principle of least privilege applies: include only the schemas the agent needs for its designated task.
A research agent given write schemas for production databases has an unnecessarily wide action space; its accountability exposure is proportionally larger.

## Relation to the observation space

Action space and [observation space](observation-space.md) are dual: the observation space is defined by the read capabilities of the available tools, and the action space encompasses both read and write capabilities.
An agent whose action space includes only read tools can observe without acting — the useful degenerate case for monitoring or advisory agents.
