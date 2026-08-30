---
title: Lightweight Ideas Capture System
description: Proposes a lightweight system for capturing pre-plan ideas with status lifecycle, markdown format, and integration with planning workflows.
date-created: 2026-03-31
type: note
name: ideas-system
keywords:
  - idea-capture
  - idea-lifecycle
  - ideas-to-plans-pipeline
  - planning-integration
  - department-structure
specialization: plan
serves-system: foah
department: engineering
project: generative-harness
---

## Goal
Create a lightweight system for capturing ideas — things that aren't ready to be plans yet. An idea has a direction but no steps. It might become a plan, get absorbed into an existing plan, or be abandoned. Right now ideas either evaporate between sessions or get prematurely formalized into blueprints.

## Current gap
- **Plans** (`operations/*/plans/`) are structured, step-by-step, cold-start executable
- **Session logs** (`operations/command/endeavor/records/session-logs/`) capture what happened
- **Learned patterns** (`operations/command/endeavor/records/learned/`) capture reusable knowledge
- **Nothing** captures "we should do X sometime" or "what if Y?" — the pre-plan stage

## Proposed design

### Location
`operations/{department}/ideas/` — same department structure as plans.

### Format
```markdown
---
title: "[Idea title]"
date-created: YYYY-MM-DD
enacts: idea
status: open | exploring | promoted | dropped
promotes-to: [path to plan, if promoted]
department: engineering | science | command
---

# [Idea title]

## The idea
[1-3 sentences. What and why, not how.]

## Origin
[Where this came from — a session, a conversation, a problem encountered.]

## Open questions
- [What would need to be true for this to become a plan?]
- [What do we not know yet?]

## Related
- [Links to existing plans, terms, texts, or other ideas]
```

### Lifecycle
1. **open** — captured, not yet explored
2. **exploring** — actively thinking about it, gathering information
3. **promoted** — became a plan (set `promotes-to:` to the plan path)
4. **dropped** — decided against it (add a reason to the file)

### Integration points
- `/learn` could deposit ideas (not just patterns) when a session surfaces a "we should..." moment
- `/plan` could check `ideas/` before creating a new plan — maybe the idea already exists
- Session-start hook could list open ideas (like it lists learned patterns) — but only if the list is short

## Steps

1. **Create the directories** — `operations/{command,science,engineering}/ideas/`
2. **Seed with existing ideas** — review session logs for "we should..." moments that weren't captured. The library restructure blueprint's open questions are a good source.
3. **Add to /plan command** — check ideas/ before creating a plan, offer to promote an existing idea
4. **Optionally add to session-start.js** — list open ideas at session start (cap at 3-5 to avoid noise)

## Ideas-to-Plans Pipeline (from ideas/ideas-to-plans-pipeline.md)

The captain's directive: we have accumulated ideas (in operations/command/ideas/, operations/engineering/ideas/, triage content, captain's verbal directives) that describe what the system is growing into. Many reference real plans. But they're not connected to the planning system.

The processing methodology:
1. Survey all idea files across operations/
2. For each: is it ready for a plan? Needs research? Overlaps with existing plan?
3. Ready ideas → create plans with tasks
4. Research-needed ideas → create research tasks
5. Overlapping ideas → merge and cross-reference
6. Ideas that have been fully incorporated into plans → mark as `status: promoted` with `promotes-to:` pointing to the plan

This pipeline should run periodically (e.g., as part of weekly review) to prevent idea accumulation without integration.

## Open questions
- Should ideas be department-scoped or repo-wide? Department-scoped matches plans, but some ideas cross departments. **Current practice:** ideas are in operations/command/ideas/ regardless of department.
- Should session-start.js show ideas? It already shows learned patterns. Adding ideas risks noise if there are many.
- Should there be a `/idea` command for quick capture, or is writing the file directly sufficient?
- Should this pipeline be automated as a periodic chief-of-staff task?
