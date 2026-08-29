---
id: human-in-the-loop
description: "An orchestration pattern where execution pauses at designated points for human review before continuing — the primary mechanism for maintaining human control over agentic systems."
defines: human-in-the-loop
aliases: [HITL]
pattern-of: agent-orchestration
controls: agentic-system
patterns: pre-action-review, checkpoint-review, exception-escalation, output-review
tradeoff: autonomy, control
date-created: 2026-03-29
date-updated: 2026-03-29
---

Human-in-the-loop (HITL) is an [agent orchestration](./agent-orchestration.md) pattern where execution pauses at designated points for human review, approval, or modification before the agent continues.
The human inspects the agent's proposed action, the current state, or an intermediate result, then approves, edits, or rejects it.
Execution resumes with the human's decision incorporated.

HITL serves two functions.
First, it catches errors — [hallucinated](../../../terms/hallucination.md) tool calls, incorrect plans, unsafe actions — before they take effect.
Second, it provides a control mechanism: the human retains decision authority over actions that are irreversible, high-stakes, or outside the agent's competence.

### Implementation patterns

**Pre-action review.** The agent proposes an action (a tool call, a file write, a code change) and pauses for approval.
The human sees the proposed action and its arguments.
This is the most common HITL pattern and the default in tools like Claude Code, where certain operations require explicit user approval.

**Checkpoint review.** The agent executes a sequence of steps, then pauses at a checkpoint for the human to review accumulated state.
[LangGraph](./langgraph.md) implements this as a first-class API: execution pauses at designated graph nodes, the checkpoint state is presented for review, and the human can modify state before resuming.

**Exception escalation.** The agent executes autonomously until it encounters a condition it cannot resolve — an ambiguous instruction, a conflicting constraint, an unexpected error — and escalates to the human for guidance.
This is HITL triggered by the agent's own uncertainty rather than by a fixed checkpoint.

**Output review.** The agent completes its work and presents the final result for human approval before it takes effect — a pull request for review, a draft for editing, a plan for sign-off.

### The autonomy-control trade-off

More HITL checkpoints increase human control and reduce error rates.
They also reduce throughput — the agent blocks on human response time at every checkpoint.
The design question is where to place checkpoints: too few and the agent makes costly mistakes; too many and the human spends more time reviewing than doing the work directly.

The trend in agentic tooling as of 2026 is toward configurable autonomy: the operator sets a permission level that determines which actions require approval and which proceed automatically.
Claude Code's permission modes, [PydanticAI](./pydantic-ai.md)'s tool approval mechanisms, and LangGraph's interrupt nodes all implement this pattern.
