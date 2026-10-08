---
type: morphism
class: contemporary
status: active
depends-on:
  - ../objects/tool.md
  - tool-invocation.md
see-also:
  - teaching/explanations/tool-selection.md
references: []
title: Tool grounding
description: Tool grounding is the morphism that maps a high- level intent ("send the report to Alice") to a concrete tool call with concrete arguments (sendemail(to="alice@example.com", subject="Report", attachments=["report.pdf"])).
---

# Tool grounding

**Tool grounding** is the morphism that maps a high- level intent ("send the report to Alice") to a concrete tool call with concrete arguments (`send_email(to="alice@example.com", subject="Report", attachments=["report.pdf"])`).
It is the bridge between *what the agent wants* and *what the agent emits*.

## What grounding requires

- **Tool recognition.** Identifying which tool realizes the intent.
- **Argument resolution.** Determining concrete values for each parameter.
- **Reference resolution.** "Alice" → specific identifier; "the report" → specific file.
- **Type alignment.** Argument values matching declared types.
- **Constraint checking.** Arguments satisfying tool constraints.

Each can fail; failures produce calls that pass validation but don't realize the intent.

## Failure modes

- **Wrong tool grounded.** Intent → wrong tool.
- **Argument hallucination.** Plausible-looking but fictional arguments.
- **Reference misresolution.** "Alice" → wrong Alice.
- **Implicit-context loss.** Intent depends on context the agent forgot.
- **Underspecification.** Intent admits multiple valid groundings.

These are characteristic failure modes of LLM agents.

## Grounding aids

Strategies that improve grounding:

- **Rich descriptions.** Tool descriptions that clearly state when to use the tool.
- **Examples in schema.** Concrete invocation examples guide grounding.
- **Disambiguation prompts.** Asking clarifying questions when intent is ambiguous.
- **Verification calls.** Checking that arguments resolve to expected entities before destructive action.
- **Constraint enums.** Schema-level enums constrain valid values.

Production agents combine these.

## Grounding vs selection

Distinguish:

- **Selection.** Choosing the right tool among candidates.
- **Grounding.** Producing concrete arguments for the selected tool.

Selection error → wrong tool.
Grounding error → right tool, wrong arguments.
Both are common failure modes.

## Grounding for computer use

Computer-use grounding is especially fraught:

- "Click the submit button" → specific (x, y) coordinates.
- Visual grounding model must locate the right element.
- Errors compound: misperception → misclick → page state diverges from agent's model.

Grounding accuracy is the primary bottleneck for computer-use agents.

## In contemporary AI

- **Function-calling APIs** handle the syntactic side of grounding (format matching schema).
- **Validation layers** catch some grounding errors.
- **Visual grounding models** (for computer use): CogAgent, ScreenAI, etc.
- **Reference-resolution scaffolding** in agentic frameworks (entity tracking, context maintenance).

## Limits

- **Hallucination is persistent.** No complete solution.
- **Implicit-context dependency.** Grounding depends on context that may be lost.
- **Verification difficulty.** Whether a grounding is *correct* (matches user intent) is hard to verify without execution.
- **Ambiguity.** Many intents admit multiple valid groundings.

## Status

Active research and engineering area.
Foundational to reliability of agentic systems.
Distinct from selection and worth modeling separately.
