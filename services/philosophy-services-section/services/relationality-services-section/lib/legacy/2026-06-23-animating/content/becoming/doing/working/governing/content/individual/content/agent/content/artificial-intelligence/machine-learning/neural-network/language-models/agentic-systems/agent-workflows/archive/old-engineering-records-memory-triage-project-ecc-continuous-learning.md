---
name: project_ecc-continuous-learning
description: ECC has continuous learning features that could work much better with our structured duties/offices/graph infrastructure
udc-id: ["004.8"]
arxiv-id: ["cs.MA"]
---

Captain identified 2026-04-04 that ECC's continuous learning system could be significantly improved in our context. Our infrastructure (structured offices, duties, knowledge graph, operations graph) enables a tighter loop than ECC's generic pattern:

failures → research → updates to duties/skills/hooks

Not just "observe and create instincts" but: agent fails at task → system identifies what knowledge was missing → researcher investigates → duty definition or skill gets updated → next agent dispatched for similar work succeeds.

**Why:** This is the feedback stage of the operations loop made concrete. ECC does generic pattern detection; we can do causal diagnosis because we have structured work types, office definitions, and a knowledge graph.

**How to apply:** When mining ECC features, prioritize the continuous learning pipeline (observer agent, instinct system, skill creation). Adapt to our architecture rather than porting wholesale. The everything-claude-code source is at operations/engineering/fars/src/everything-claude-code/.
