---
description: "Scans recent changes across all departments for induced technical debt — violations, stale references, broken assumptions, and missing follow-through — and routes each finding as a Message to the owning department's INBOX. Use at the start of any session after significant multi-department work."
skill-closure-kind: inquiry
---

# review-recent-work

domain: `since` — a git ref, date, or description of the recent work period to review
(e.g., a commit hash, "last session", "today")

territory: recent changes across all departments; what those changes broke, made
stale, or left incomplete; whether assumptions made during the work still hold

termination: every file touched in the review period has been checked for induced
debt; all findings have been routed as Messages to the owning department's INBOX

---

## Step 1 — Identify the change set

Collect all files modified since `since` across the repository. Group by department:
- `math/` files
- `proof/` files
- `spec/` and `spec/skills/` files
- `src/` files
- Root-level files (`skills/`, `AGENTS.md`, `SOUL.md`, `PLANS.md`, etc.)

---

## Step 2 — Check each changed file for induced debt

For each changed file, ask:

**Cross-references broken?**
Does the file link to or name anything that has since been renamed, deleted, or
moved? Check: skill file names, spec `id:` values, department context file paths.
→ Finding: `FixNeeded` — broken reference in [file], pointing to [target]

**Assumptions invalidated?**
Does the file describe behavior (MUST, CANNOT, preconditions) that a different
change in this period violated or superseded?
→ Finding: `FixNeeded` — [file] claims [X] but [change] means [X] no longer holds

**Format violations introduced?**
Does the file now violate a spec that was clarified or tightened during this
period? (New `spec/name.md` rules, new `skill-closure-kind` requirements, etc.)
→ Finding: `FixNeeded` — [file] violates [spec] as now stated

**Follow-through missing?**
Did a change in one department imply work in another department that was not
done — e.g., a new spec was written but src was not notified; a math unit was
renamed but proof files still use the old name?
→ Finding: `GapFound` — [change] implies [follow-through] in [department]

**Hardcoded data that can now be derived?**
Did a change create a situation where something is now stored in two places?
→ Finding: `FixNeeded` — [file] now duplicates [source of truth]

---

## Step 3 — Route findings

For each finding:
- If the owning department is the current one: add a WorkItem to that
  department's PLANS directly.
- If the owning department is different: call `skills/deposit-message-in-agent-inbox.md`
  with the finding as a `FixNeeded` or `GapFound` Message to the owning
  department's INBOX.

Batch systemic findings: if the same violation type appears in more than three
files of the same kind, send ONE Message describing the pattern and the full
set of affected files, not one Message per file.

---

## Step 4 — Summarize

Produce a brief summary:
- Files reviewed: N
- Findings: N (N FixNeeded, N GapFound)
- Departments messaged: list
- Any finding that should be elevated to the user's attention (blocking, or
  involves a decision the agent cannot make alone)
