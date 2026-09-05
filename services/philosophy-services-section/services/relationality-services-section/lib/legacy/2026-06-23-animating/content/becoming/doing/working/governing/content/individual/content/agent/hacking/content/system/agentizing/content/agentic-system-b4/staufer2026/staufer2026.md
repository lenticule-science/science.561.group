---
type: reference
class: report
status: active
cites:
  - teaching/explanations/agentic-system.md
  - teaching/explanations/agentness-spectrum.md
  - ../theorems/three-condition-characterization.md
---

# Staufer et al. (2026) — 2025 AI Agent Index

**Full citation:** Staufer, A., Feng, B., Wei, B., Bailey, M., Duan, X., Yang, J., Ozisik, M., Casper, S., and Kolt, N.
"2025 AI Agent Index."
MIT, 2026.
Data as of December 31, 2025.

## Summary

The MIT AI Agent Index operationalizes "AI agent" with four requirements for inclusion: autonomy (minimal human oversight, consequential independent decisions), goal complexity (high-level objectives through planning and subgoal decomposition, at least three autonomous tool calls), environmental interaction (directly interacting with the world through tools and APIs), and generality (handling under-specified instructions and adapting to new tasks).

The "at least three autonomous tool calls" threshold is the most operationally specific element: it makes the autonomy dimension falsifiable by counting.

## Contribution to the agents theory

The four requirements in the MIT AI Agent Index are compatible with the [three-condition characterization](../theorems/three-condition-characterization.md): environmental interaction maps to environmental action, goal complexity maps to goal-directed planning, and the state persistence requirement implied by "consequential decisions" maps to persistent state.
Autonomy and generality are additional dimensions on the [agentness-spectrum](teaching/explanations/agentness-spectrum.md).

The three-tool-call threshold operationalizes the autonomy dimension of the spectrum.
It is noted in the [toward-a-falsifiable-definition](../texts/toward-a-falsifiable-definition-of-agentic-systems.md) text as the strongest operational falsifiability mechanism in the surveyed definitions.

## Relationship to the three-condition characterization

The MIT definition adds generality as a requirement that the three-condition characterization does not include.
The omission is deliberate: the three- condition characterization addresses the question "is this an agentic system?" while the MIT definition addresses "is this an agent worth indexing?"
The generality requirement — handling under-specified instructions across tasks — is a capability property above the floor rather than a structural property necessary for agentness.
