---
title: "Write orchestration vs choreography survey"
specialization: task
date-created: 2026-04-03
plan: agent-governance-enrichment
produces: library/.../agents/texts/orchestration-and-choreography-survey.md
work-type: inquiry
contributes-to-milestone: agent-governance-enrichment-m2-surveys-and-gap-terms-written
task-done: 2026-04-05
---

**Action:** Write a survey covering the orchestration/choreography distinction — its origins in web services and process calculus, its formalization in session types, and its application to multi-agent AI systems.

**Why:** This distinction is fundamental to agent coordination design but currently only mentioned in passing in agent-orchestration.md.
Most practical systems mix both patterns — understanding when each applies determines harness architecture.

**Key sources:** - Milner, π-calculus (1999) — process algebraic foundation - W3C Web Services Choreography Description Language (2005) — the original distinction formalized - Honda, Yoshida, Carbone — multiparty session types (POPL 2008) — typed protocols - Anthropic Claude Agent SDK — TeammateTool as choreography, Agent tool as orchestration - ECC dmux — terminal-level orchestration with per-pane choreographic independence
