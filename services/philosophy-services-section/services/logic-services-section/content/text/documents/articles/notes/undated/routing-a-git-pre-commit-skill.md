---
name: routing-a-git-pre-commit
description: Inspects a git pre-commit event and either permits the commit or aborts it with the diagnostics from any failing gate skill. Use as the project's git pre-commit hook to keep resource-file rule violations out of the index.
title: routing-a-git-pre-commit
---

## Requirements

- Runs as a git pre-commit hook (invoked from `.git/hooks/pre-commit`), receiving no arguments and an empty stdin.
- The repository's working tree is at process CWD when git invokes the hook.
- Node 20+ is on PATH.
- The four gate scripts exist at their declared paths under `doing/working/hacking/doing/working/skills/`.

## Steps

1. Enumerate staged paths via `git diff --cached --name-only --diff-filter=ACMR`. Filter to `.md` files. If the list is empty, exit `0`.
2. For each staged `.md` path, check whether the worktree copy still matches the staged content via `git diff --name-only -- <path>`. If they differ, print a warning to stderr naming the path and instructing the author to `git add` again; the gate still runs against the worktree copy.
3. For each staged `.md` file, dispatch the gate set in order, importing each gate script as an ESM module and calling its default export with `{path, repoRoot}` (or the gate's equivalent signature):
   - [`linting-a-resource-file`](../../research/2026/07/31/lenticule-import/yet-another-unsorted-archive-dump/predication-categories/_archive/bucket-4/articulating/library/aperiodic-articulation-category/library/aperiodic-articulation-cell/library/potential-aperiodic-articulation-cell/predicating/library/transfinite-predication-category/hacking/library/predication-cell-set/docs/dev/scraps/from-stable-cell-stale-chain/library/predicate-set/library/predicate-category/hacking/library/object/library/thing/library/system/library/git/library/git-pre-commit/doing/working/linting-a-resource-file/SKILL.md)
   - [`linting-a-citation`](../../research/2026/07/31/lenticule-import/yet-another-unsorted-archive-dump/predication-categories/_archive/bucket-4/articulating/library/aperiodic-articulation-category/library/aperiodic-articulation-cell/library/potential-aperiodic-articulation-cell/predicating/library/transfinite-predication-category/hacking/library/predication-cell-set/docs/dev/scraps/from-stable-cell-stale-chain/library/predicate-set/library/predicate-category/hacking/library/object/library/thing/library/system/library/git/library/git-pre-commit/doing/working/linting-a-citation/SKILL.md)
   - [`linting-a-references-section`](../../research/2026/07/31/lenticule-import/yet-another-unsorted-archive-dump/predication-categories/_archive/bucket-4/articulating/library/aperiodic-articulation-category/library/aperiodic-articulation-cell/library/potential-aperiodic-articulation-cell/predicating/library/transfinite-predication-category/hacking/library/predication-cell-set/docs/dev/scraps/from-stable-cell-stale-chain/library/predicate-set/library/predicate-category/hacking/library/object/library/thing/library/system/library/git/library/git-pre-commit/doing/working/linting-a-references-section/SKILL.md)
   - [`resolving-links-in-a-file`](../../research/2026/07/31/lenticule-import/yet-another-unsorted-archive-dump/predication-categories/_archive/bucket-4/articulating/library/aperiodic-articulation-category/library/aperiodic-articulation-cell/library/potential-aperiodic-articulation-cell/predicating/library/transfinite-predication-category/hacking/library/predication-cell-set/docs/dev/scraps/from-stable-cell-stale-chain/library/predicate-set/library/predicate-category/hacking/library/object/library/thing/library/system/library/git/library/git-pre-commit/doing/working/resolving-links-in-a-file/SKILL.md)
4. For each `(file, gate)` invocation, append a witness line to `code/logs/tool-uses/YYYY-MM-DD.jsonl` with shape `{ts, character, invoker, tool, args, result_summary, duration_ms, ok}` where `invoker` is `"routing-a-git-pre-commit"` and `tool` is the gate's slug.
5. If any gate rejected any file, print the aggregated diagnostics to stderr and exit `1` (aborting the commit). Otherwise exit `0`.
6. On any internal error (cannot reach git, cannot import a gate, gate throws), print the error to stderr and exit `1` — fail-closed.

## Outcomes

- A git pre-commit event proceeds iff every gate accepts every staged markdown file.
- Otherwise the commit aborts and stderr shows which `(file, gate)` rejected with the gate's diagnostics inline.
- A witness line per `(file, gate)` is appended to today's `code/logs/tool-uses/` log.
- The hook reads the staged index, the worktree, and the four gate scripts; the only file it writes is the witness log.
