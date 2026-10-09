---
description: "Orchestrates a multi-department operator prompt by interpreting it into typed PromptUnits and routing each to its correct queue. Use when an operator prompt spans more than one department, or when a single-department agent has escalated a prompt it cannot fully handle."
skill-closure-kind: procedure
title: do-work
---

# do-work

domain: - `prompt` — raw operator text; may span any number of departments and concern math, proof, spec, src, or structural/workflow questions

1. Read root context files in order: `SOUL.md` → `AGENTS.md` → `MEMORY.md` → `INBOX.md` → `PLANS.md` → `IDEAS.md`.
  Triage any unread INBOX messages before proceeding (set status to `acknowledged` or `deferred` as appropriate).

2. Call `skills/interpret-prompt.md` with `prompt`.
   - Receives: a list of PromptUnits (see `spec/prompt-unit.md` for the type).
   - If `interpret-prompt` returns an empty list: halt. Record in root MEMORY.md
     that the prompt was received but produced no actionable units.

3. Call `skills/route-prompt-units.md` with the PromptUnit list.
   - Receives: a routing report listing where each unit was placed.

4. Call `skills/post-work-update.md` with:
   - `work_summary`: "interpreted and routed operator prompt"
   - `files_touched`: all files modified during routing
   - `findings`: any structural gaps or missing skills surfaced during steps 2–3

5. Append a MemoryEntry to root `MEMORY.md` recording:
   - date
   - "do-work run: {N} PromptUnits routed from operator prompt"
   - the routing report summary from step 3

codomain: a routing report — for each PromptUnit, its type and the queue or file it was placed in; plus a root MEMORY.md entry confirming the session.
