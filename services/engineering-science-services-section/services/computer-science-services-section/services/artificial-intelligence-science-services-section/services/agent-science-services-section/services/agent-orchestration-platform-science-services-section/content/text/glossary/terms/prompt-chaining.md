---
id: prompt-chaining
description: "The simplest orchestration pattern — a fixed sequence of LLM calls where each call's output becomes the next call's input."
aliases: [prompt chain, chain]
pattern-of: agent-orchestration
uses: structured-output
autonomy: none
control-flow: developer-specified
contrasts-with: multi-agent-system, agentic-system
date-created: 2026-03-29
date-updated: 2026-03-29
---

Prompt chaining is the simplest [agent orchestration](../../../../../../content/text/glossary/terms/agent-orchestration.md) pattern: a fixed sequence of LLM calls where each call's output becomes the next call's input. Between steps, the application may transform the output, validate it against a schema, call a tool, or inject additional context. The sequence is predefined by the developer; the LLM controls the content of each step but not the execution path.

Anthropic's "Building Effective Agents" (December 2024) places prompt chaining at the low-autonomy end of the orchestration spectrum:

| Pattern | Model autonomy | Control flow |
|---|---|---|
| **Prompt chaining** | None — fixed sequence | Developer-specified |
| Routing | Selection — model picks a branch | Developer-specified branches |
| Orchestrator-workers | Delegation — model assigns subtasks | Model-directed |
| Autonomous agent | Full — model directs all steps | Model-directed |

A prompt chain is a pipeline. Step 1 generates a plan, step 2 executes each item in the plan, step 3 reviews the results. Each step has its own [system prompt](../../../../../../../../content/text/glossary/terms/system-prompt.md) tailored to its role. The developer writes the steps; the model fills them in.

### When prompt chaining works

Prompt chaining works when the task decomposes into a fixed number of steps with known dependencies. Translating a document (extract → translate → format), generating structured reports (gather data → analyze → write sections → assemble), or processing forms (extract fields → validate → store) all fit the pattern.

### When prompt chaining breaks

Prompt chaining breaks when the number of steps or their order depends on the input. A debugging task requires an unknown number of investigate-hypothesize-test cycles. A research task requires following leads that may or may not pan out. These tasks need model-directed control flow — the model must decide whether to continue, branch, or stop — which is where [agent orchestration](../../../../../../content/text/glossary/terms/agent-orchestration.md) frameworks like [LangGraph](./langgraph.md) take over.

Prompt chaining also does not satisfy the definition of an [agentic system](../../../../../../content/text/glossary/terms/agentic-system.md) by itself: it lacks goal-directed planning (condition 2) because the execution path is developer-specified. A prompt chain that includes a tool call satisfies condition 1 (environmental action) but fails condition 2 unless the model selects which tools to call and in what order.
