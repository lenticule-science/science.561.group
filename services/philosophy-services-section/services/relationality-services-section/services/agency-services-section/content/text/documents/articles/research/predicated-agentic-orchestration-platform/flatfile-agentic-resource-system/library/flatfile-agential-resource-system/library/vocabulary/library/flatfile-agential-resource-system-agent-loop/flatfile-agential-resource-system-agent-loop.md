---
id: flatfile-agential-resource-system-agent-loop
description: "The self-improving agent workspace pattern: context files as live state, skills as programs, improvement skills as the loop that prevents drift."
component-of: FlatfileAgentialResourceSystemLocale
uses: Plan, Skill
takes: FlatfileAgentialResourceSystemLocale
writes: FlatfileAgentialResourceSystemLocale
date-modified: 2026-03-19
params:
  locale: relational-universe
  improvement-skill: relational-universe-morphism
output: relational-history-fiber-fixed-layer
ast:
  convergent-improvement-loop:
    - locale
    - improvement-skill:
        - context-read
        - mine-ideas
        - do-work
        - post-work-update
        - compliance-audit
        - missing-concept-discovery
title: Flatfile Agential Resource System Agent Loop
---

# Flatfile Agential Resource System Agent Loop

## What this is

The repository is a **self-improving agent workspace**.
Every locale directory follows the same pattern: context files hold the current state of knowledge about the locale; skills hold the programs for operating in it; an improvement skill runs a loop that reads context, does work, extracts what was learned, and writes that learning back into context.
Nothing is ever a passive artifact — every document is either updated by the loop or the loop has failed.

## The locale structure

A [FlatfileAgentialResourceSystemLocale](../flatfile-agential-resource-system-locale/flatfile-agential-resource-system-locale.md) is a directory that contains:

- `SOUL.md` — the *why* of this locale.
  Core identity, principles, and what must never be compromised.
  Read before any other file on every agent entry.
  Changes rarely; when it does, it is a significant event.
- `AGENTS.md` — orientation.
  Scope, file inventory, permissions, entry-point skills.
  Updated whenever locale structure changes.
- `MEMORY.md` — accumulated knowledge across sessions.
  Things learned that are not actionable (those go to PLANS) but that should inform all future work: patterns found, approaches that failed, concepts that are subtler than they appear.
  Appended to as knowledge accumulates; entries are never deleted.
- `INBOX.md` — incoming messages from other locales.
  Each message arrives via `skills/deposit-message-in-agent-inbox.md` and sits here until the locale's improvement skill triages it.
  INBOX is not PLANS — messages are triaged on arrival, not worked directly.
  Each locale triages its own inbox in its own way.
- `PLANS.md` — the ordered work queue.
  Driven by the improvement skill.
  MUST be updated after each work unit and after each learning capture.
  Contains only items the locale has committed to doing — not raw incoming messages.
- `IDEAS.md` — raw, unplanned material.
  Mined into PLANS each pass.
- `skills/` — skills that operate on this locale's content.

A directory without SOUL, AGENTS, MEMORY, PLANS, and IDEAS cannot support a persistent agent and will drift.
Every locale that has an improvement skill MUST have `AGENTS.md`, `PLANS.md`, and `IDEAS.md`.
`AGENTS.md` MUST be updated whenever locale structure or scope changes — as part of the work unit that caused the change, not periodically.
`AGENTS.md` CANNOT describe files as "needed" that already exist — staleness in AGENTS.md is a compliance violation.
`PLANS.md` MUST reflect current state at all times — completed items marked ✓, new items added before the pass that will complete them.

## Cross-locale coordination

When an agent in locale A discovers something that belongs to locale B, it MUST call `skills/deposit-message-in-agent-inbox.md` — never write to another locale's files directly.
The message lands in locale B's `INBOX.md`.

The improvement skill for locale B MUST read `INBOX.md` during its orientation step (before PLANS, before IDEAS).
For each unread message, the agent triages it in whatever way makes sense for the locale: - If actionable now: promote to PLANS, mark `[x] acknowledged`. - If not yet actionable: move to IDEAS with the source noted, mark `[x] deferred`. - If irrelevant: mark `[x] declined` with a one-sentence reason.

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
update PLANS (mark ✓) + update AGENTS.md if locale structure changed
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

`post-work-update` classifies each finding and routes it: - **Pattern finding** (e.g., "all skills of type X may have this problem") → add a compliance scan item to the locale's PLANS - **Gap finding** (e.g., "concept Y has no spec") → add to the locale's IDEAS - **Fix needed** (e.g., "file Z is stale") → add to the owning locale's PLANS - **Cross-locale finding** → add to the appropriate locale's PLANS or IDEAS, even if that locale is not the current one (cross-locale write permitted here)

Without this step, discoveries made during work vanish.
The loop accumulates knowledge only if every work unit feeds its learnings back.
Learnings discovered during a work unit CANNOT be discarded — they must go to IDEAS, PLANS, or directly into a fix.

## Why this is self-reinforcing

Every pass through the loop generates more work than it consumes, until the locale reaches genuine consistency:

- Doing a compliance audit finds violations → new PLANS items
- Fixing a violation reveals a pattern → new PLANS items (check all similar files)
- Writing a spec reveals referenced concepts → new IDEAS items
- Updating AGENTS.md reveals what is missing from PLANS → new PLANS items

The loop converges because each category of work (PLANS, compliance, missing concepts) has a finite ceiling — there are only so many files and concepts.
But the ceiling is only reachable if learnings are captured at every step.

## Open questions

- Formal proof that the loop converges for finite locales — blocked by: skill-algebra construction
