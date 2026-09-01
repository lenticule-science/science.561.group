---
name: wind-down

description: "Closes a work session cleanly: triages all department INBOXes, deletes completed work items from PLANS, writes behavioral MemoryEntries (not session summaries), and commits if dirty. Use at the end of any session."
skill-closure-kind: procedure
---

domain: `since` — git ref or description of the session's start (default: last commit)

codomain: clean context files across all departments; a session MemoryEntry in root
`MEMORY.md`; a final summary of what's open and what's ready for next session

---

## Phase 1 — Triage all INBOXes

For each department (`math`, `proof`, `spec`, `src`) and root:

1. Read `{department}/INBOX.md`.
2. For each `unread` Message: apply triage rules from `skills/run-agent-loop.md`
   Phase 2 — promote to PLANS, defer to IDEAS, or decline with reason.
3. Every Message MUST be given a status. Leave none unread.

## Phase 2 — Review recent changes for induced debt

Call `skills/review-recent-work.md` with `since`.

- For each finding: route as a Message to the owning department's INBOX
  (or directly to PLANS if it's the current department).
- Batch systemic findings: one Message per violation type, not one per file.
- Do NOT fix anything now — capture only. Fixing is next session's work.

## Phase 3 — Write MemoryEntries (behavioral only)

Do NOT write a session summary to MEMORY.md. That is a log, not a memory.

Write a MemoryEntry ONLY if this session produced a behavioral or relational
observation worth carrying forward — something about how to work with this
person or codebase that is NOT recoverable from git or PLANS.md.

Examples of what qualifies:
- User corrected a systematic pattern in how you frame math objects
- A collaboration preference was stated explicitly or demonstrated repeatedly
- A hard constraint was discovered that belongs in no spec yet

If nothing like this occurred, write nothing. An empty Phase 3 is correct.

Open threads go into PLANS.md as WorkItems, not into MEMORY.md.

## Phase 4 — Delete completed work items

For each department, read PLANS.md. For any WorkItem that was clearly completed
(the output exists, the action is done, the code is written):
- **Delete it.** Remove the entry entirely. Do not mark it done, do not add a
  "completed" status, do not leave a stub. It is gone.
- If the completion is worth recording for future sessions, write a MemoryEntry
  about the *pattern learned*, not the task done.
- Completed work is in git. PLANS.md is for open work only.

## Phase 5 — Commit if dirty

Run `git status`. If there are uncommitted changes:
- Stage all tracked files.
- Commit with message: "Wind-down: triage, memory, and housekeeping"
- Do not push unless the user asks.

## Phase 6 — Final report

State:
- Departments with messages in INBOX (after triage): count
- Open work items across all departments: count
- Top 3 things ready to work on next session (from PLANS, priority order)
- Anything blocking that needs user attention before next session

## MUST

- Triage every unread Message — do not exit with any INBOX showing `unread`
- Delete (not mark done) completed WorkItems from all PLANS.md files
- Promote open threads to PLANS.md WorkItems if they are not already there

## CANNOT

- Do new work — this skill observes, captures, and tidies; it does not build
- Fix findings from review-recent-work — log them to INBOXes only