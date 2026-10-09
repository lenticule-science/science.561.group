---
type: object
class: contemporary
status: active
depends-on:
  - tool.md
  - tool-result.md
see-also:
  - teaching/explanations/tool-augmented-generation.md
references:
  - references/yao-react2022.md
title: Action trace
description: An action trace is the sequence of (thought, tool-call, observation) triples constituting an agent's tool-use history within a session or task.
---

# Action trace

An **action trace** is the sequence of (thought, tool-call, observation) triples constituting an agent's tool-use history within a session or task.
It is the data structure that records *what the agent did*; the unit of analysis for debugging, evaluation, and auditing.

## Structure

A canonical trace entry:

```
step n:
  thought: "I need to find the user's email."
  tool_call: get_user_email(user_id=42)
  observation: {"email": "alice@example.com"}
```

A full trace is a sequence of such entries plus the final response.

## What traces enable

- **Debugging.** Diagnosing why the agent did what it did; which step went wrong.
- **Evaluation.** Computing task-completion metrics, efficiency, side-effect counts.
- **Auditing.** Reviewing high-stakes agent actions for compliance.
- **Learning.** Training data for fine-tuning agents on successful traces (or correcting failed ones).
- **Replay.** Re-executing a trace to test changes.

Traces are the fundamental observability artifact in agentic systems.

## Trace properties

Important properties to track:

- **Length.** Number of tool-use steps.
- **Branching.** Whether the agent considered alternatives.
- **Reflection points.** Where the agent reasoned about results.
- **Errors and recovery.** Failed calls and how the agent responded.
- **Side effects.** Cumulative environmental changes.
- **Token cost.** Generation tokens used per step.

These metrics characterize trace efficiency and quality.

## Trace patterns

Common patterns:

- **Linear.** One tool call after another, no backtracking.
- **Iterative refinement.** Same tool called multiple times with refined arguments.
- **Search.** Multiple branches explored, best selected.
- **Plan-execute.** Plan upfront, then execute steps.
- **Reflective.** Periodic stops to assess progress.

Different patterns suit different task types.

## Trace failure modes

- **Loops.** Same tool call repeated indefinitely without progress.
- **Drift.** Trace wanders from original goal.
- **Premature termination.** Agent stops before task completion.
- **Hallucinated success.** Agent reports success without evidence.
- **Side-effect cascade.** Each step causes more side effects than necessary.

Trace analysis is the standard tool for diagnosing these.

## In contemporary AI

Trace logging is universal in production agentic systems:

- LangSmith, LangFuse, Weights & Biases for trace logging.
- AgentOps, Helicone for observability.
- Built-in trace export from major LLM platforms.

Standardized trace formats (OpenTelemetry semantic conventions for AI agents) are emerging.

## Limits

- **Storage cost.** Comprehensive traces are large.
- **Privacy.** Traces may contain sensitive data.
- **Reasoning opacity.** Even with traces, *why* the agent reasoned as it did may be unclear.
- **Reproducibility.** Replaying may not produce same outcome due to model nondeterminism.

## Status

Standard concept and practice.
Foundational observability artifact for agentic systems.
