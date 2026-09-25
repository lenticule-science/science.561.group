---
type: narrative
class: conceptual-walkthrough
status: active
depends-on:
  - ../teaching/explanations/agentic-system.md
  - ../teaching/explanations/environmental-action.md
  - ../teaching/explanations/goal-directed-planning.md
  - ../teaching/explanations/persistent-state.md
  - ../theorems/three-condition-characterization.md
see-also:
  - ../teaching/explanations/agentness-spectrum.md
  - ../teaching/explanations/tool-schema.md
  - ../texts/toward-a-falsifiable-definition-of-agentic-systems.md
references:
  - ../references/bent2025.md
  - ../references/anthropic2024.md
title: "From chatbot to agent: walking the three conditions"
description: The path from a chatbot to an agentic system passes through three gates.
---

# From chatbot to agent: walking the three conditions

The path from a chatbot to an agentic system passes through three gates.
Each gate corresponds to one of the conditions in the [three-condition characterization](three-condition-characterization.md).
A system that passes all three gates is an agentic system.
A system that fails at any gate is not — no matter how sophisticated its language generation, how many tools it appears to call, or how often it is marketed as an "AI agent."

## Gate 1: Environmental action

A chatbot returns text.
The text appears in a conversation interface and the conversation ends.
Nothing outside the conversation has changed.

Add a search function.
The chatbot can now call a web search and return results.
The search happened — but nothing was modified.
The search results were observed by the chatbot and relayed to the user.
The environment before and after the search is unchanged.
A RAG system with tool calling fails Gate 1.

Add a write function — file creation, database record insertion, API POST.
Now the chatbot modifies external state.
The file exists after the conversation ends.
Remove the system: the file remains.
Gate 1 is passed.

**What fails here:** Chatbots.
RAG systems.
Read-only retrieval agents.
Any system whose tool calls are purely queries.

## Gate 2: Goal-directed planning

The system can now write to its environment.
But it follows a script: the developer specified which tool to call and when.

```
Step 1: Call search("topic")
Step 2: Call write_file(search_result)
Step 3: Return confirmation
```

This system acts on its environment — it writes the file.
But it does not plan.
The developer planned.
The system executes.
When the execution path ends, the system stops.
If a step fails, the system does not adapt.
Gate 2 is not passed.

Replace the fixed steps with model-directed sequencing.
The model receives a goal: "Research topic X and write a report in the appropriate directory."
The model decides which searches to run, in what order, when results are sufficient, what to include in the report, and where to put it.
When a search returns surprising results, the model adjusts its plan.
This is goal-directed planning.
Gate 2 is passed.

**What fails here:** Predefined workflows.
RPA scripts.
Deterministic pipelines.
Any system where the execution path is fixed by the developer rather than selected by the model.

## Gate 3: Persistent state

The system can write to its environment and can plan.
But when the conversation ends, everything the model knows about its progress disappears.
Start a new conversation: the model does not know what it already searched, what it wrote, or what the goal was.
It must start over.

Add checkpointing.
After every significant step, the model writes its current state to a file: what the goal is, what has been done, what remains.
When interrupted and resumed, the model reads its state file and continues.
Gate 3 is passed.

**What fails here:** Stateless tool-calling sessions.
LLM-in-a-loop scripts where state is held only in the conversation context.
Any system that cannot resume after process termination without re-deriving its plan.

## The complete picture

A system that passes all three gates:

- **Writes to its environment:** its actions outlast the conversation.
- **Plans its own actions:** the model selects and sequences tool calls toward the goal without a developer-specified path.
- **Tracks its own progress:** it can be interrupted and resumed; it knows what it has done and what remains.

This is an agentic system.
The marketing language — "AI agent," "autonomous AI," "agentic AI" — is irrelevant.
The three tests are what matter.

## Why the three-gate framing is useful

The framing resolves definitional disputes without reference to implementation details.
Whether the system uses Claude, GPT-4, or an open model; whether it runs on LangGraph, PydanticAI, or a custom framework; whether it is marketed as an agent or a workflow — none of this determines whether it is agentic.
The three tests determine it.

This matters for safety assessment, risk management, and regulatory compliance.
An agentic system requires different treatment than a chatbot: observability infrastructure, accountability assignment, checkpoint design, and scope management.
Knowing whether a system is agentic by testing the three conditions tells you which treatment category it falls into before examining any implementation details.
