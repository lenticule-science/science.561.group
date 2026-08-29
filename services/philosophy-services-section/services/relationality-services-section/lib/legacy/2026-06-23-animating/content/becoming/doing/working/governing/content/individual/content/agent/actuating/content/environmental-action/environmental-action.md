---
type: concept
class: foundational
status: active
depends-on:
  - agentic-system.md
  - tool-schema.md
see-also:
  - ../objects/action-space.md
  - ../morphisms/tool-invocation.md
  - ../theorems/three-condition-characterization.md
  - ../theorems/tool-schema-bounds-action-space.md
  - ../terms/tool-use.md
  - ../texts/history-of-tool-use.md
references:
  - references/bent2025.md
  - references/schick2023.md
  - references/anthropic2024.md
---

# Environmental action

Environmental action is the capacity of an agentic system to modify persistent state outside itself.
It is the first of the three conditions constituting an [agentic system](agentic-system.md).
The mechanism by which environmental action is executed is [tool use](tool-schema.md): the agent emits structured calls that a host application executes against external systems.

## What "environmental" means

The environment of an agentic system is everything outside the model's context window and computation.
This includes: filesystems, databases, external APIs, operating system processes, web browsers, and other agents.
State is "environmental" if it persists when the agent's runtime is removed.

The test is removal: take away the system and observe whether the state changes it caused remain.
A file written to disk remains.
A web page submitted via form remains.
An API resource created via POST remains.
Text returned in a chat response does not: it exists only in the conversation and disappears when the conversation ends.

## What "persistent" means

Persistence is temporal: the modified state must outlast the interaction in which it was modified.
This requirement distinguishes environmental action from in-context computation.
A chatbot computing a result and displaying it in the conversation has not taken environmental action — the result lives in the conversation, which is volatile.

The persistence requirement also distinguishes environmental action from observation.
An agent that reads from a database has observed its environment; it has not acted on it.
Environmental action requires a write, a creation, a deletion, or a mutation — some change to external state that other systems can observe.

## The tool-use mechanism

Environmental action in contemporary LLM-based systems is realized through the tool-use mechanism (Schick et al., Toolformer, arXiv 2302.04761, 2023).
The model produces structured output — a JSON object specifying a function name and arguments — and a host application executes the function.
The host application's execution crosses the boundary between the model's context and the external environment.

The set of environmental actions available to an agent at any step is exactly the set of function schemas provided.
This is formalized in [tool-schema-bounds-action-space](../theorems/tool-schema-bounds-action-space.md).

## Gradations of environmental action sophistication

Bent (2025) places environmental interaction sophistication on a spectrum:

1. **Single API call.** One function call producing a discrete external state change.
  The simplest form.
2. **Multi-step API composition.** A sequence of calls where later calls depend on results from earlier ones.
3. **GUI and browser manipulation.** The agent navigates visual interfaces, clicking, typing, and reading rendered output.
4. **Cross-system orchestration.** The agent coordinates writes across multiple independent systems (database, filesystem, external service).
5. **Physical world interaction.** The agent actuates physical hardware (robotic control, industrial control systems).
  See the industrial architecture text for how this intersects with safety-critical system design.

A system at any point on this spectrum satisfies the environmental-action condition, provided the actions produce persistent external changes.
