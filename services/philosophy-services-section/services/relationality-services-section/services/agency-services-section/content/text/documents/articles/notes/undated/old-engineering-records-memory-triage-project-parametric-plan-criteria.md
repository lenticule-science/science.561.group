---

name: project_parametric-plan-criteria
description: Plans should carry structured completion criteria in frontmatter that hooks can evaluate against commits — the inference→determination pipeline applied to plan management.
udc-id: ["004.8"]
arxiv-id: ["cs.MA"]
title: project_parametric-plan-criteria
---

Plans and tasks should have frontmatter encoding what criteria must be met for completion. When a commit touches relevant files, hooks can either:
1. Update the plan deterministically (parametric resolution — e.g., "file exists at path X with field Y")
2. Flag for human review (when criteria can't be resolved automatically)

This is the inference→determination pipeline applied to plan management itself. Plans start with prose criteria (derivation — human judges completion), mature into structured criteria (procedure — hook flags, human confirms), and some criteria become fully parametric (process — hook updates plan automatically).

**Why:** Emerged from 2026-04-01 session. The user noted this connects to the broader settlement path — moving plan management from inference toward computation, same as the harness does for agent orchestration.

**How to apply:** This is part of Phase 7 (computational bridge) in the agentic-orchestration plan. When designing plan/task schemas, include a `completion-criteria` field with both machine-evaluable and prose criteria. The boundary between parametric and inference-requiring criteria is where the system learns.
