---
description: "Runs lake build and produces a BuildResult. Use after writing to a Lean file to confirm the project compiles and to get an updated sorry count."
skill-closure-kind: process
title: build
---
# build

domain: a `.lean` file path (FAST) or the full project (FULL)

Two modes.
FAST for iteration; FULL only for final verification.

---

## FAST — check a snippet

Delegate to `check-term`.
It uses `lean_run_code` (MCP) or `lake env lean --stdin`.

**MCP only — check all current diagnostics in a file without a full build:** `lean_diagnostic_messages(file_path=<file>)`

---

## FULL — `lake build`

Use only when: - You have written to an actual `.lean` file and need to confirm nothing downstream broke - You want a final sorry count for `PLANS.md`

```sh
cd proof/RelationalHyperverse && lake build 2>&1
```

Classify output:
```
"Build completed successfully"  →  GREEN
"error:"                        →  ERROR
hangs > 2 minutes               →  TIMEOUT — kill, report to user
```

**If GREEN:** count sorries:
```sh
grep -c "sorry" proof/RelationalHyperverse/RelationalHyperverse/{filename}
```

**If ERROR:** extract `error_file`, `error_line`, `error_message`, classify as `error_class`, pass to `fix-error`.

codomain: BuildResult — status GREEN | ERROR (with error_file, error_line, error_message, error_class) | TIMEOUT
