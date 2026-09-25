---
type: object
class: structural
status: active
depends-on:
  - teaching/explanations/agentic-system.md
  - teaching/explanations/environmental-action.md
see-also:
  - ../objects/action-space.md
  - ../objects/agent-session.md
  - ../objects/execution-trace.md
  - teaching/explanations/persistent-state.md
  - ../terms/agent-observability.md
references:
  - references/russell-norvig2020.md
  - references/bent2025.md
title: Observation space
description: The observation space of an agentic system is the set of world-states the agent can represent at any given step.
---

# Observation space

The observation space of an agentic system is the set of world-states the agent can represent at any given step.
An observation is a specific element of the observation space: a concrete representation of environment state as visible to the agent at a particular moment.

## Structure

In the traditional PEAS (Performance measure, Environment, Actuators, Sensors) formulation (Russell and Norvig, 2020), observations are what sensors deliver.
For LLM-based agentic systems, the analogous structure is:

- **Sensors** are tool calls that read from the environment: file reads, database queries, web fetches, API GETs.
- **Observations** are the results of those reads, delivered as text in the conversation turn.
- **Observation space** is the set of all possible results that tool reads can return.

## What the agent can observe

An LLM-based agent can observe only what enters its context window:

1. **The goal specification** given at session start.
2. **Tool results** from calls made during the session.
3. **Conversation history** accumulated in the context.
4. **Memory contents** loaded explicitly through read operations.
5. **Background information** injected at prompt time (system prompt, retrieved documents).

The agent cannot observe the external environment directly — it observes only what its tools read and report.
This means the observation space is determined by the tool schemas provided: the agent can observe only what its read-capable tools can surface.

## Partial observability

Real agentic environments are partially observable: the environment contains state the agent's tools cannot see.
A file the agent has no schema for reading is unobservable.
An API behind a tool schema that returns only summary data yields partial observations.
Database rows the agent's query does not cover are invisible.

Partial observability is a source of agent error: the agent may plan on the basis of incomplete observations, execute actions that conflict with unobserved state, or fail to detect that its prior actions produced unexpected effects.

## Observability for accountability

From an accountability perspective, the observation space has a secondary meaning: what the agent could have seen at each step.
Accountability tracing asks whether the delegating principal had sufficient visibility into the agent's operation.
This requires asking what observations the agent received at each decision point — which is precisely a question about the observation space at each step and what the agent's tools returned.

A [complete execution trace](execution-trace.md) records every observation received at every step, making accountability tracing possible.
