---
title: Plan-Keyed Session Logs
description: Redesign session save/resume so logs accumulate per-plan instead of per-date.
date-created: 2026-03-31
type: note
name: plan-keyed-sessions
keywords:
  - session-logs
  - plan-keyed
  - save-session
  - resume-session
  - file-structure
  - migration
specialization: plan
department: engineering
---


## Problem

Session logs are currently dated files (`2026-03-31-descriptor.md`). Multi-session work on the same plan produces a stream of disconnected files. Resuming requires finding the most recent file, which may not be the right one if multiple plans are in flight. Context accumulates across files rather than within one.

## Design

Session files are keyed by **plan**, not by date. One session file per plan. `/save-session` updates the existing file; `/resume-session` finds it by plan path.

**File naming:** `session-{plan-slug}.md` (e.g., `session-library-domain-restructure.md`)
**Location:** `operations/command/endeavor/records/session-logs/`

**Session file structure:**

```markdown
---
title: "Session: {plan title}"
plan: {path to plan file}
form: session-log
status: active | paused | completed
date-started: YYYY-MM-DD
date-updated: YYYY-MM-DD
---

## Objective
[Stable — set once, updated only if the goal evolves]

## Current state
[Overwritten each save — latest snapshot only]

## Accomplished
[Append-only log, newest entries at top, grouped by date]

### YYYY-MM-DD
- [thing done]

### earlier date
- [thing done]

## Decisions made
[Append-only, with dates]

## Failed or abandoned
[Append-only — what not to retry and why]

## Next step
[Overwritten each save — one specific action]
```

**Key changes from current design:**
- `Accomplished`, `Decisions`, `Failed` are append-only (prepend new entries)
- `Current state` and `Next step` are overwritten (only latest matters)
- `Objective` is stable (rarely changes)
- Status tracks the plan's session state, not the file's creation

**Planless sessions:** Work not tied to a plan gets saved as `session-{descriptor}.md` with `plan: none`. If it later grows a plan, rename the file and add the plan path.

## Steps

### Step 1: Update /save-session command

Rewrite `.claude/commands/save-session.md`:

1. Check for active plans (same as now)
2. If plan identified, look for existing `session-{plan-slug}.md`
   - If exists: read it, append new accomplishments/decisions/failures, overwrite current state and next step, update `date-updated`
   - If not: create new file
3. If no plan: use descriptor-based naming, same create-or-update logic
4. Update plan step markers (same as now)
5. Confirm with user

### Step 2: Update /resume-session command

Rewrite `.claude/commands/resume-session.md`:

1. Find session file:
   - If user provides plan name or path: find matching `session-*.md`
   - If no argument: show all session files with `status: active` or `paused`, let user choose
   - If only one paused session: use it
2. Read session file, present briefing (same format as now but richer — full history in one file)
3. Check active plans (same as now)
4. Wait for confirmation

### Step 3: Migrate existing session logs

Consolidate existing dated session logs into plan-keyed files:
- The three `2026-03-31-*` files all relate to the library-domain-restructure plan or its predecessors
- Merge into `session-library-domain-restructure.md`
- Archive originals or delete

### Step 4: Update session-start hook if needed

Check if `operations/engineering/fars/hooks/session-start.js` references session log paths or naming conventions. Update if so.

## Open questions
- Should completed sessions be archived (moved to a `completed/` subdirectory) or just marked `status: completed`?
- Should `/resume-session` with no args default to the most recently updated paused session, or always prompt?
