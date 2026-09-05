---
type: reference
class: book
status: active
cites:
  - teaching/explanations/agentic-system.md
  - teaching/explanations/goal-directed-planning.md
---

# Wiener (1948) — Cybernetics

**Full citation:** Wiener, N. *Cybernetics: Or Control and Communication in the Animal and the Machine.* MIT Press, 1948.
(Second edition: 1961.)

## Summary

Wiener's foundational text establishes cybernetics as the study of control and communication in animals and machines.
The central concept is negative feedback: a goal-seeking system observes the gap between its current state and its goal state, takes action to reduce the gap, and adjusts based on the results of its action.
The feedback loop enables goal-directed behavior in any physical system.

The book predates LLM-based agentic systems by 75 years but provides their theoretical antecedent.
Wiener's characterization of goal-seeking systems maps directly onto contemporary agentic systems: the goal state is the natural- language objective, the gap-observation is the agent's assessment of task progress, the action is the tool call, and the adjustment is the model's response to the tool result.

## Contribution to the agents theory

The cybernetic framework appears in the [agentic-system](teaching/explanations/agentic-system.md) concept as the theoretical lineage connecting contemporary agentic AI to classical control theory.
The [goal-directed-planning](teaching/explanations/goal-directed-planning.md) concept is the generalization of Wiener's negative feedback to the case where the goal is natural-language-specified and the action space is arbitrary tool calls.

The key difference between classical cybernetic controllers and contemporary agentic systems: generality of goal specification (reference signal → natural language) and breadth of action space (fixed actuator set → arbitrary tool schemas).
Agentic AI is cybernetics on a general-purpose substrate.
