---
title: "Agents"
component-of: artificial-intelligence
type: theory
class: engineering-theory
status: active
discipline: >
  The formal study of agentic systems: computational systems that act on their
  environments through tool use, pursue goals through multi-step planning, and
  maintain state across interactions. The theory covers the structure of individual
  agents (action spaces, memory types, observation-state-action loops), the
  algebra of multi-agent coordination (topologies, overhead, saturation
  thresholds), the accountability structure of delegation chains, and the
  engineering consequences of these structural facts.
position: >
  This theory is grounded in the 2024–2026 literature on LLM-based agentic
  systems. It is positioned as a foundational engineering theory within the
  artificial-intelligence branch: it does not presuppose predicated-computing
  machinery, but its concepts are compatible with the predication-categories
  framework and can be coordinated with AOP when agentic systems are deployed on
  the predicated substrate. The theory draws on cybernetics (goal-seeking
  feedback loops), distributed systems (non-interference, accountability), and
  empirical agent benchmarking (MASFT, MIT AI Agent Index) for its claims.
---

The agents theory gives formal structure to the phenomenon of LLM-based agentic systems.
It answers three questions precisely:

**What is an agentic system?** A system that satisfies three conditions jointly: it performs actions that modify persistent state outside itself (environmental action), it decomposes goals into causally-dependent action sequences and selects among alternatives (goal-directed planning), and it maintains representations of its environment and progress that survive process boundaries (persistent state).
See [three-condition-characterization](theorems/three-condition-characterization.md).

**How do multiple agents coordinate, and at what cost?** Multi-agent systems organize into coordination topologies (orchestrator-workers, peer-to-peer, pipeline, debate).
Coordination overhead grows superlinearly with agent count.
Performance gains saturate at approximately four agents.
Below the saturation threshold, best-of-N sampling from a single agent frequently matches or exceeds multi-agent performance.
See [coordination-overhead-grows-superlinearly](theorems/coordination-overhead-grows-superlinearly.md) and [saturation-threshold](theorems/saturation-threshold.md).

**Who is accountable when a multi-agent system errs?** Accountability always attaches to a human principal.
Delegation transfers authority; it does not transfer accountability.
The accountability chain must be total: every outcome within a scope must be assigned to exactly one accountable party.
See [delegation-does-not-transfer-accountability](theorems/delegation-does-not-transfer-accountability.md).

## Structure

- **[concepts/](concepts/_index.md)** — semantic anchors: the ideas the theory is organized around.
- **[objects/](objects/_index.md)** — defined structures: the entities the theory reasons about.
- **[morphisms/](morphisms/_index.md)** — operators: the transformations and operations the theory defines.
- **[theorems/](theorems/_index.md)** — proved claims grounded in the literature.
- **[narratives/](narratives/_index.md)** — rhetorical walk-throughs of the theory's core results.
- **[references/](references/_index.md)** — annotated bibliography.
- **[questions/](questions/_index.md)** — open problems and research targets.
- **[terms/](terms/_index.md)** — glossary-level vocabulary (source material for the theory entities).
- **[texts/](texts/_index.md)** — survey texts and research literature (source material for the theory).

## Subtheories

- **[theories/tool-use/](theories/tool-use/_index.md)** — agents augmented with external tools (function calling, code interpreters, computer use, browser automation), the operational structure of action traces and effect propagation, and the safety question of bounding tool-use side effects.
- **[theories/agentic-orchestration-platforms/](theories/agentic-orchestration-platforms/_index.md)** — platforms that coordinate agents (human and AI) through structured dispatch, scheduling, and governance.
  Sub-theories specialize to particular substrate and architectural commitments.
