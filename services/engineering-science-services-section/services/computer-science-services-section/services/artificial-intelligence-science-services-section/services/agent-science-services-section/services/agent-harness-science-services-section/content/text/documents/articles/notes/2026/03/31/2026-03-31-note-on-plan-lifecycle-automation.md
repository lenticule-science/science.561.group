---
title: Plan Lifecycle Automation
description: Outlines integrating plan-awareness into session workflows to automatically update plan status and progress based on completed steps.
date-created: 2026-03-31
type: note
name: plan-lifecycle-automation
keywords:
  - session-integration
  - plan-awareness
  - status-automation
  - step-markers
  - workflow-hooks
specialization: plan
department: engineering
---


## Goal

Plans have `status: draft | proposed | someday | later | soon | active | completed | abandoned | superseded` in frontmatter and steps marked `[DONE YYYY-MM-DD]`, but nothing in the session workflow checks or updates these. A plan can be fully executed and still say `status: draft`. Fix this by integrating plan awareness into the existing session hooks and commands.

## Context

The infrastructure already exists in pieces:
- `session-start.js` loads previous session context at conversation start
- `session-end.js` / `evaluate-session.js` fire at session boundaries
- `/save-session` and `/resume-session` handle continuity between sessions
- The blueprint skill defines the `[DONE]` / `[SKIPPED]` step markers and mutation log format
- Plans live in `operations/*/plans/` with structured frontmatter

What's missing is the glue: nothing connects "I just finished implementing the thing a plan asked for" to "update the plan file." The gap is behavioral (no prompt or hook reminds you) and structural (session logs don't reference which plan they advanced).

## Steps

### Step 1: Add plan-awareness to `/save-session` [DONE 2026-03-31]

Update `.claude/commands/save-session.md` so that when saving a session debrief, it asks: "Did this session advance any plan in `operations/*/plans/`?" If yes, the debrief should record which plan and which steps were completed or advanced. The session log frontmatter gets a `plan` field pointing to the plan file path.

This is a prompt change, not a code change — update the command template.

### Step 2: Add plan-status check to `evaluate-session.js` [DONE 2026-03-31]

The `evaluate-session.js` hook fires after ~10 interactions. Extend it to scan `operations/*/plans/` for any plan with `status: active`. If one exists, include a suggestion in its output: "Active plan exists at [path] — consider updating step status before ending session."

This is lightweight — just glob for `status: active` in plan frontmatter and emit a reminder. Don't parse step completion; just nudge.

### Step 3: Add plan progress display to `/resume-session` [DONE 2026-03-31]

Update `.claude/commands/resume-session.md` so that when resuming, it checks `operations/*/plans/` for plans with `status: active` or `status: draft`. For each, display: plan title, status, and count of steps marked `[DONE]` vs total steps. This gives the session a quick orientation on what's in flight.

### Step 4: Add a `/plan-status` command [DONE 2026-03-31]

Create `.claude/commands/plan-status.md` that scans all plans across departments, parses their frontmatter status and step completion markers, and produces a summary table. This is the "where are we" view. Format:

```
| Plan | Dept | Status | Progress |
|------|------|--------|----------|
| Library restructure | engineering | draft | 0/5 steps |
```

Also: if all steps in a plan are `[DONE]` but status isn't `completed`, flag it.

## Success Criteria

- After completing plan work, `/save-session` prompts to link the session to the plan
- Active plans surface automatically at session start via `/resume-session`
- `evaluate-session.js` reminds about active plans before session ends
- `/plan-status` gives a cross-department overview of all plans

## Open Questions

- Should `status: draft → active` happen automatically when the first step is marked `[DONE]`, or should that be an explicit user action?
- Should completed plans be moved to an archive directory, or just stay in `plans/` with `status: completed`?
