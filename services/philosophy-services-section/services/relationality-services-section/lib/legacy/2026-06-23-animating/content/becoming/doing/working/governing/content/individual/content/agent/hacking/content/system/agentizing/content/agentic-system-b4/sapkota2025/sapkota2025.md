---
type: reference
class: preprint
status: active
cites:
  - teaching/explanations/agentic-system.md
  - teaching/explanations/coordination-topology.md
---

# Sapkota, Roumeliotis, and Karkee (2025) — AI Agents vs. Agentic AI

**Full citation:** Sapkota, S., Roumeliotis, M., and Karkee, M.
"AI Agents vs. Agentic AI: A Conceptual Taxonomy and Applications." arXiv 2505.10468, 2025.

## Summary

Sapkota et al. distinguish two levels of agentic systems:

- **AI Agents** — single-entity systems performing goal-directed tasks by invoking external tools, applying sequential reasoning, and integrating real-time information.
- **Agentic AI** — multi-agent systems where specialized agents collaboratively decompose goals, communicate, and coordinate.

Their five-dimensional taxonomy classifies systems along: autonomy level, task complexity, architectural composition, collaboration mechanism, and learning/adaptation.
The taxonomy provides gradation without specifying minimum thresholds for any dimension.

## Contribution to the agents theory

The AI Agents / Agentic AI distinction maps approximately onto the [agentic-system](teaching/explanations/agentic-system.md) concept (for "AI Agent") and the [coordination-topology](teaching/explanations/coordination-topology.md) concept structured as an [agent-composition](../morphisms/agent-composition.md) morphism (for "Agentic AI").
The five dimensions overlap partially with Bent's agentness spectrum but are formulated as classification axes rather than measurement dimensions.

The taxonomy is referenced in the [toward-a-falsifiable-definition](../texts/toward-a-falsifiable-definition-of-agentic-systems.md) text as an example of a gradient taxonomy that classifies without specifying necessary conditions — a useful complement to but not a replacement for the three-condition characterization.

## Limitations

The taxonomy classifies but does not specify thresholds.
A system "scores somewhere" on each of the five dimensions without a minimum qualifying score being defined.
This makes the taxonomy useful for characterization and comparison but not for the binary question "is this system agentic?"
