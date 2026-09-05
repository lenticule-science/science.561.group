---
type: theorem
class: definitional-claim
status: proved
depends-on:
  - teaching/explanations/tool-schema.md
  - teaching/explanations/environmental-action.md
  - ../objects/action-space.md
  - ../objects/tool-call.md
see-also:
  - ../morphisms/tool-invocation.md
  - ../theorems/three-condition-characterization.md
  - ../texts/history-of-tool-use.md
  - ../terms/tool-use.md
references:
  - references/schick2023.md
  - references/anthropic2024.md
---

# Tool schema bounds action space

**Claim.** The [action space](../objects/action-space.md) of an agentic system at any step is exactly the set of [tool schemas](teaching/explanations/tool-schema.md) provided to the model at that step.
The agent can invoke any function whose schema is present; it cannot invoke any function whose schema is absent.
The action space is neither a superset nor a subset of the provided schemas — it is identical to them.

## Why this holds

**Part 1: The model cannot invoke what is not in the schema set.** The tool-use mechanism operates as follows (Schick et al., Toolformer, arXiv 2302.04761, 2023; Anthropic API documentation, 2024): the developer includes function schemas in the API request.
The model is trained to select function names from the provided set and construct argument objects conforming to those schemas.
A function name not in the provided set has no schema from which to construct arguments.
The host application processes only structured outputs that reference schema-specified names — unrecognized function names are rejected or ignored.

This is not a soft constraint mediated by the model's training — it is enforced at the protocol level.
The API contract specifies exactly which functions are available; outputs referencing other functions are malformed and are not executed.

**Part 2: The model can invoke any function whose schema is present.** Every schema in the provided set is, by definition, a valid target for invocation.
The host application is prepared to execute any function named in the schema set.
The model, trained on the schema descriptions, can construct valid argument objects for any schema in the set.

**Part 3: Therefore the action space equals the schema set.** The set of invocable functions is exactly $S$ — no more (Part 1) and no less (Part 2).
The action space at step $t$ is $A_t = S_t$ where $S_t$ is the set of schemas provided at step $t$.

## Dynamic schema sets

In systems with dynamic toolsets (PydanticAI, AutoGen), $S_t$ varies across steps.
The theorem holds at each step independently: the action space at step $t$ is $A_t = S_t$, even when $S_{t+1} \neq S_t$.
Dynamic schemas modify the action space step-by-step; the theorem characterizes each step's action space as identical to that step's schema set.

## Implications for security and governance

**Schemas as authority grants.** Because the action space equals the schema set, the decision of which schemas to include is a governance decision of the first order.
Including a schema grants the agent the authority to perform that action.
This is why the minimal-authority design principle applies directly: include only the schemas required for the task.

**Schema injection attacks.** If an adversary can inject additional schemas into the API request (through prompt injection or system prompt manipulation), the adversary widens the action space beyond what the operator intended.
The tool-schema-bounds-action-space theorem defines the attack surface: any mechanism that adds schemas to $S_t$ widens $A_t$.

**Observability through schema logging.** Since $A_t = S_t$, logging the schema set at each step logs the complete action space at each step.
This is necessary for accountability tracing: assessing whether a tool call was authorized requires knowing what schemas were available when the call was made.

## What the theorem does not claim

The theorem does not claim that the agent will invoke every schema it is given.
The action space is the set of possible actions; which actions the model actually takes depends on its reasoning about the goal.
A schema present in $S_t$ but irrelevant to the current goal will typically not be invoked.

The theorem also does not claim that all invocations will succeed.
A call structurally valid under the schema may fail at execution time (the API returns an error, the file is not found, the database rejects the write).
Schema presence establishes invocability, not execution success.
