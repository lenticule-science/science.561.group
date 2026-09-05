---
name: first-officer-does-not-dispatch
date-created: 2026-04-05
severity: design-flaw
affects: [first-officer, dispatch, mash-engine, session-economy]
reported-by: first-officer
triggered-by: session 01221bb8-d220-438c-a466-dd2c4861262e
udc-id: ["004.8"]
arxiv-id: ["cs.MA"]
---

## Problem

The first officer's specialty is coordinating and dispatching, not executing. In practice, first officer sessions do execution work (bulk file edits, rename migrations, frontmatter scraping, classification scoring) on opus rather than dispatching duty officers to do it on appropriate model tiers.

## Symptom

In session 01221bb8 (first officer, opus):
- Did a 561d→mash-engine rename migration (80 files touched) in-session. This is grep+sed work dispatchable to a sonnet/haiku duty officer.
- Parsed 459 frontmatter files with custom Node script for quartet classification — executed in-session on opus when a dispatched duty officer would have sufficed.
- Wrote a quartet-classifier JavaScript library (~10 files, tests included) in-session on opus — capability-building work better dispatched to a build-focused officer with a concrete spec.

Zero sessions dispatched during the multi-hour working block. All work executed by the first officer directly.

## Root Cause

The first officer identity prompt describes the specialty but doesn't enforce it. No hook blocks Write operations on non-coordination record types when FARS_OFFICE=first-officer. No hook flags long in-session execution sequences. The captain has to manually notice and correct.

## Desired Behavior

1. First officer's character sheet enumerates "not your work" (producing analyses, implementing features) — this should be enforced by a PreToolUse hook warning when first officer writes code/tests/new directories.
2. Session-start should remind first officer of recent un-dispatched work via `dispatch_report` MCP tool.
3. A threshold hook should flag when the first officer does N > 5 Edit/Write operations without dispatching an officer, prompting reflection on whether the work is specialty-appropriate.
4. The `/duty-officer` command should be easier to invoke than executing the work directly.

## Workaround

Captain manually calls out in-session execution and redirects to dispatch.

## Related

- `operations/command/personnel/first-officer.md` — specialty definition
- `operations/engineering/records/memory/feedback_dispatch-office-matching.md`
- `operations/engineering/records/issues/duty-officer-ignores-agent-matching.md` (blocks effective dispatch today)
