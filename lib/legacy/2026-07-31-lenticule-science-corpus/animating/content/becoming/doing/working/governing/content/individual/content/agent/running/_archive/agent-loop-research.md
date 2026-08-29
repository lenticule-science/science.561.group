---

description: "The self-improving agent workspace pattern: context files as live state, skills as programs, improvement skills as the loop that prevents drift."
defines: AgentLoop
domain: Department
codomain: ImprovedDepartment
---

# Agent Loop

## What this is

The repository is a **self-improving agent workspace**.
Every department directory follows the same pattern: context files hold the current state of knowledge about the department; skills hold the programs for operating in it; an improvement skill runs a loop that reads context, does work, extracts what was learned, and writes that learning back into context.
Nothing is ever a passive artifact — every document is either updated by the loop or the loop has failed.

## The department structure

A **department** is a directory that contains:

- `SOUL.md` — the *why* of this department.
  Core identity, principles, and what must never be compromised.
  Read before any other file on every agent entry.
  Changes rarely; when it does, it is a significant event.
- `AGENTS.md` — orientation.
  Scope, file inventory, permissions, entry-point skills.
  Updated whenever department structure changes.
- `MEMORY.md` — accumulated knowledge across sessions.
  Things learned that are not actionable (those go to PLANS) but that should inform all future work: patterns found, approaches that failed, concepts that are subtler than they appear.
  Appended to as knowledge accumulates; entries are never deleted.
- `INBOX.md` — incoming messages from other department agents.
  Each message arrives via `skills/deposit-message-in-agent-inbox.md` and sits here until the department's improvement skill triages it.
  INBOX is not PLANS — messages are triaged on arrival, not worked directly.
  Each department triages its own inbox in its own way.
- `PLANS.md` — the ordered work queue.
  Driven by the improvement skill.
  MUST be updated after each work unit and after each learning capture.
  Contains only items the department has committed to doing — not raw incoming messages.
- `IDEAS.md` — raw, unplanned material.
  Mined into PLANS each pass.
- `skills/` — skills that operate on this department's content.

A directory without SOUL, AGENTS, MEMORY, PLANS, and IDEAS cannot support a persistent agent and will drift.

## Cross-department coordination

When an agent in department A discovers something that belongs to department B, it MUST call `skills/deposit-message-in-agent-inbox.md` — never write to another department's files directly.
The message lands in department B's `INBOX.md`.

The improvement skill for department B MUST read `INBOX.md` during its orientation step (before PLANS, before IDEAS).
For each unread message, the agent triages it in whatever way makes sense for the department: - If actionable now: promote to PLANS, mark `[x] acknowledged`. - If not yet actionable: move to IDEAS with the source noted, mark `[x] deferred`. - If irrelevant: mark `[x] declined` with a one-sentence reason.

INBOX and PLANS are separate because triage is not the same as planning.
An agent that puts raw incoming messages directly into PLANS has skipped triage and will work on things that may not belong in its plan at all.

This is the message bus.
It requires no human relay.
An agent in proof/ can tell an agent in math/ about a new lemma; an agent in spec/ can tell src/ about a changed spec; any agent can tell any other.
The only constraint is the message format defined in `skills/deposit-message-in-agent-inbox.md`.

## The improvement loop

An improvement skill MUST follow this cycle and MUST loop until all three exit conditions hold simultaneously:

```
read context (AGENTS.md + PLANS + IDEAS)
    ↓
mine IDEAS → PLANS
    ↓
pick next plan item
    ↓
do work
    ↓
post-work-update (extract learnings → route to context files)
    ↓
update PLANS (mark ✓) + update AGENTS.md if department structure changed
    ↓
loop
    ↓ (when plan queue empty)
compliance audit → violations → new PLANS items → loop
    ↓ (when audit clean)
missing-concept discovery → new PLANS items → loop
    ↓ (when nothing found)
exit: PLANS empty, audit clean, no missing concepts
```

Exit is only valid when all three conditions hold.
A skill that exits before all three hold has not finished; it has stopped early.

## Post-work learning capture

After every work unit, the improvement skill MUST call `skills/post-work-update.md` with: - `work_summary` — one sentence: what was done - `files_touched` — list of files modified or created - `findings` — list of things noticed during the work that were not the primary task

`post-work-update` classifies each finding and routes it: - **Pattern finding** (e.g., "all skills of type X may have this problem") → add a compliance scan item to the department's PLANS - **Gap finding** (e.g., "concept Y has no spec") → add to department's IDEAS - **Fix needed** (e.g., "file Z is stale") → add to the owning department's PLANS - **Cross-department finding** → add to the appropriate department's PLANS or IDEAS, even if that department is not the current one (cross-department write permitted here)

Without this step, discoveries made during work vanish.
The loop accumulates knowledge only if every work unit feeds its learnings back.

## Why this is self-reinforcing

Every pass through the loop generates more work than it consumes, until the department reaches genuine consistency:

- Doing a compliance audit finds violations → new PLANS items
- Fixing a violation reveals a pattern → new PLANS items (check all similar files)
- Writing a spec reveals referenced concepts → new IDEAS items
- Updating AGENTS.md reveals what is missing from PLANS → new PLANS items

The loop converges because each category of work (PLANS, compliance, missing concepts) has a finite ceiling — there are only so many files and concepts.
But the ceiling is only reachable if learnings are captured at every step.

## MUST

- Every department that has an improvement skill MUST have AGENTS.md, PLANS.md, and IDEAS.md
- Every improvement skill MUST call `skills/post-work-update.md` after each work unit
- AGENTS.md MUST be updated whenever department structure or scope changes — not periodically, but as part of the work unit that caused the change
- PLANS.md MUST reflect current state at all times — completed items marked ✓, new items added before the pass that will complete them

## CANNOT

- An improvement skill CANNOT exit while PLANS has open items, compliance violations exist, or missing concepts are found — early exit is a bug in the skill
- AGENTS.md CANNOT describe files as "needed" that already exist — staleness in AGENTS.md is a compliance violation
- Learnings discovered during a work unit CANNOT be discarded — they must go to IDEAS, PLANS, or directly into a fix

## Pending

- Formal proof that the loop converges for finite departments — blocked by: skill-algebra construction
