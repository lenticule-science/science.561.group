---
description: "Runs the standard AgentLoop for any department: bootstraps context files, triages INBOX, mines IDEAS into PLANS, executes work items via the provided executor skill, runs optional compliance and discovery checks, and loops until all exit conditions hold. Use as the shared loop body called by each department's improvement skill."
skill-closure-kind: procedure
---

# run-agent-loop

domain:
- `department` — directory name of the department (`math`, `proof`, `spec`, `src`)
- `executor` — path to the skill that executes one PLANS WorkItem;
  receives `(item_text, department)`, returns `work_report`
- `compliance_skill` — (optional) path to skill that checks compliance;
  receives `department`, returns `violations[]`
- `discovery_skill` — (optional) path to skill that finds missing work targets;
  receives `department`, returns `targets[]` (empty means nothing left to find)

## Phase 0 — Bootstrap

For each of the six required context files, if missing create it with a minimal
valid header and empty body:

```
{department}/SOUL.md
{department}/AGENTS.md
{department}/MEMORY.md
{department}/INBOX.md
{department}/PLANS.md
{department}/IDEAS.md
```

## Phase 1 — Read context

Read `{department}/SOUL.md` → constraint model.
Read `{department}/AGENTS.md` → scope and permission model.
Read `{department}/MEMORY.md` → accumulated lessons.

## Phase 2 — Triage INBOX

Read `{department}/INBOX.md`. For each Message with `**Status:** unread`:

```
FixNeeded, immediately actionable
  → promote to {department}/PLANS.md as WorkItem (descriptive identifier, no numbers)
  → set message Status: acknowledged

GapFound or Discovery, not immediately actionable
  → add to {department}/IDEAS.md as Idea (descriptive identifier)
  → set message Status: deferred with one-sentence reason

Irrelevant or out of scope
  → set message Status: declined with one-sentence reason
```

## Phase 3 — Mine IDEAS into PLANS

Read `{department}/IDEAS.md`. For each Idea with `**Status:** active`:

- If no stated blocker, OR all stated blockers are now resolved:
  → promote to `{department}/PLANS.md` as WorkItem
  → delete the Idea entry from `{department}/IDEAS.md`
- If still blocked: leave in place.

## Phase 4 — Build plan queue

Read `{department}/PLANS.md`. Collect all items with `**Status:** open`
into `plan_queue` in document order. Deferred items are skipped unless their
blocker is explicitly resolved.

**Compliance-first rule:** If `compliance_skill` is provided AND no WorkItem
in `plan_queue` already addresses a compliance violation (i.e., no item with
prefix "batch-fix:" or "fix:"), run the compliance check now before executing
any work — even if `plan_queue` is non-empty. This prevents debt from
accumulating silently behind a full work queue. If violations are found, prepend
their WorkItems to `plan_queue` before proceeding to Phase 5.

## Phase 5 — Execute

IF `plan_queue` is non-empty:
  Take the first item as `current_item`.
  Call `executor` with `(current_item, department)`.

  IF success:
    → Delete `current_item` from `{department}/PLANS.md`.
    → Call `skills/post-work-update.md` with `work_report.findings`.
    → Reload `plan_queue` (post-work-update may have added items).
    → Go to Phase 5.

  IF SkillError MissingInput:
    → Identify missing input; add prerequisite WorkItem above `current_item` in PLANS.
    → Go to Phase 5 with the prerequisite.

  IF SkillError SkillNotFound:
    → Add Idea to `{department}/IDEAS.md`: "missing skill: [name]".
    → Mark `current_item` deferred with reason "missing skill".
    → Go to Phase 5 with next item.

  IF SkillError other:
    → Add WorkItem to PLANS: "fix error: [message]".
    → Go to Phase 5 with next item.

## Phase 6 — Compliance check

IF `plan_queue` is empty AND `compliance_skill` is provided:
  Call `compliance_skill` with `department`.
  For each violation in `violations[]`:
    → Add WorkItem to `{department}/PLANS.md`.
  IF any added: reload `plan_queue`; go to Phase 5.

## Phase 7 — Discovery

IF `plan_queue` empty AND compliance clean AND `discovery_skill` is provided:
  Call `discovery_skill` with `department`.
  For each target in `targets[]`:
    → Add WorkItem to `{department}/PLANS.md`.
  IF any added: reload `plan_queue`; go to Phase 5.

## Exit

All exit conditions hold simultaneously:
- `plan_queue` is empty
- `compliance_skill` returned empty (or was not provided)
- `discovery_skill` returned empty (or was not provided)

Produce `work_report`:
- `items_completed[]` — WorkItems deleted from PLANS this run
- `items_added[]` — WorkItems added to PLANS this run
- `inbox_triaged` — count of Messages processed in Phase 2
- `exit_condition`: `loop-complete` | `user-interrupted` | `skill-error-unrecoverable`

codomain: `work_report` as above; and updated context files for `department`
