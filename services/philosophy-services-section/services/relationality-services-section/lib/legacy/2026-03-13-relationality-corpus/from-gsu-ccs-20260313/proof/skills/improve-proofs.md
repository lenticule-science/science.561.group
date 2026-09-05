---
name: improve-proofs

description: "Advances the proof/ department by closing one Sorry or recording one obstacle. Use at the start of any Lean proof session to ensure work proceeds in priority order toward the current PLANS target."
skill-closure-kind: procedure
---

domain: the `proof/` department directory in known state

Entry point for all Lean proof work.

MCP tools (when `lean-lsp` is connected — see `.mcp.json`):
`lean_goal`, `lean_run_code`, `lean_multi_attempt`, `lean_diagnostic_messages`,
`lean_hover_info`, `lean_declaration_file`, `lean_loogle`, `lean_search`.

---

## Step 0 — Read context, triage inbox, mine ideas

1. Read `proof/SOUL.md`. Note the department principles.

2. Read `proof/INBOX.md`. For each message with `**Status:** unread`:
   - If `FixNeeded` about a spec claim conflicting with proof domain knowledge:
     run `spec-alignment` to resolve it, then set `**Status:** acknowledged`.
   - If `GapFound` or `Discovery`:
     add to `proof/IDEAS.md`, set `**Status:** deferred` with one-sentence reason.
   - If anything else: read, note, set `**Status:** acknowledged`.

3. Read `proof/PLANS.md` in full. Note the current priority target.

4. Read `proof/IDEAS.md`. For each idea with no open blocker:
   - If immediately actionable: move to `PLANS.md` as a new task.
   - If blocked: leave it; note the blocker.

Do not skip this step. Working without teleology produces arbitrary output.

---

## Step 1 — Orient

Run `orient` → `target_sorry`, `target_file`, `math_units`

If BLOCKED: run `post-work-update` with findings, report to user, stop.

---

## Step 2 — Read the math

For each unit in `math_units`: run `read-math`.

Do not skip. You will not know what you are proving otherwise.

---

## Step 3 — Close the sorry

Run `close-sorry` with `target_sorry` and the math content from Step 2.

---

## Step 4 — Build

Run `build`.

```
GREEN   →  Step 5
ERROR   →  run fix-error, re-run build (max 3 attempts)
TIMEOUT →  revert to sorry with a comment; go to Step 5
```

If 3 failed attempts: revert to sorry, comment stating the obstacle, go to Step 5.

---

## Step 5 — Update plans and close loop

1. Open `proof/PLANS.md`.
2. Update sorry count in §Active Sorries.
3. If a sorry was closed: remove its entry.
4. If an obstacle was found: record it.
5. Add entry to §Resolution Log.
6. Run `post-work-update` with:
   - `work_summary`: one sentence (what was closed or blocked)
   - `files_touched`: list of `.lean` files and plan files touched
   - `findings`: anything noticed that was not the primary task
7. Report: what was closed, what remains, what the next target is.

codomain: updated `proof/PLANS.md` with one Sorry closed or one obstacle recorded
