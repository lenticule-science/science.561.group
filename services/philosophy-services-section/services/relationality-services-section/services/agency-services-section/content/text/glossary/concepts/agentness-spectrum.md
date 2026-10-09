---
type: concept
class: measurement
status: active
depends-on:
  - agentic-system.md
  - environmental-action.md
  - goal-directed-planning.md
  - persistent-state.md
see-also:
  - ../theorems/three-condition-characterization.md
  - questions/agentness-spectrum-metric.md
  - ../terms/agent-evaluation.md
references:
  - references/bent2025.md
  - references/sapkota2025.md
  - references/staufer2026.md
title: Agentness spectrum
description: The agentness spectrum is Bent's (2025) five-dimensional characterization of how agentic a system is, applicable above the three-condition floor that defines agentic systems.
---

# Agentness spectrum

The agentness spectrum is Bent's (2025) five-dimensional characterization of how agentic a system is, applicable above the three-condition floor that defines [agentic systems](../../documents/articles/research/2026/07/31/lenticule-import/animating/content/becoming/doing/working/governing/content/individual/content/agent/_archive/agentic-system.md).
The spectrum provides useful gradation for systems that have crossed the threshold and differ in their degree of agentness.

The spectrum does not replace the three-condition definition.
A system must satisfy all three conditions before registering on the spectrum at all.
Below the floor, the spectrum dimensions are not applicable: a chatbot does not have a low level of environmental interaction sophistication — it has none.

## The five dimensions

**1.
Environmental interaction sophistication.**

The range from simple discrete API calls to cross-system orchestration to physical-world actuation.
A system that calls one weather API has low sophistication on this dimension.
A system that writes code, executes it, browses web results, and coordinates with a database has high sophistication.

**2.
Goal-directed behavior complexity.**

The range from two-step causal chains to hierarchical planning with contingency.
A system that retrieves a document and summarizes it has a two-step plan.
A system that autonomously implements, tests, debugs, and deploys software across days has hierarchical planning with complex contingency handling.

**3.
Temporal coherence.**

The range from session-scoped state to indefinitely persistent memory.
A system with only in-session state has low temporal coherence: it cannot accumulate knowledge across sessions or operate on goals that span weeks.
A system with structured knowledge bases that persist indefinitely has high temporal coherence.

**4.
Learning and adaptation.**

The range from no learning (fixed behavior) to in-context learning (behavior changes within a session based on feedback) to persistent fine-tuning (behavior changes across sessions based on experience).
As of early 2026, most agentic systems operate at the in-context learning level.

**5.
Autonomy.**

The range from human-in-the-loop at every step (the agent produces proposals and a human approves each one) to fully autonomous operation (the agent completes multi-week tasks without human review).
The autonomy dimension is the most consequential for risk: higher autonomy means errors propagate further before detection.

## Relation to the MIT AI Agent Index definition

Staufer et al. (MIT AI Agent Index, 2026) operationalize autonomy using a threshold: at least three autonomous tool calls without human intervention.
This operationalizes the autonomy dimension at a specific point — three calls without review — making it falsifiable by counting.
The MIT definition's operationalization is a measurement instrument; the agentness spectrum is the underlying structure being measured.

## The spectrum is not a total order

The five dimensions are not reducible to a single score.
A system with high environmental interaction sophistication and low autonomy is not comparable to a system with low sophistication and high autonomy on a single scale — they have different capability profiles appropriate for different use cases.
This is an open research question formalized in [agentness-spectrum-metric](../../documents/articles/notes/undated/agentness-spectrum-metric.md).
