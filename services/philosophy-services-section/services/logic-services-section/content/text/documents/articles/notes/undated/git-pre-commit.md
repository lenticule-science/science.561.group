---
name: git-pre-commit
description: The git pre-commit lifecycle event — git invokes .git/hooks/pre-commit before composing a commit object, giving the hook a chance to block the commit by non-zero exit status.
specializing: hook
runtime: git
fires-on-event-name: pre-commit
title: git-pre-commit
---

A **git-pre-commit** is the synchronous event git fires when a user runs `git commit` and the worktree has staged changes. Git invokes the script at `.git/hooks/pre-commit` (if present and executable) with no arguments and empty stdin. The hook's exit status decides: `0` lets the commit proceed; any non-zero status aborts the commit before the commit object is written.

## Characteristic predication-shape

- `precedes-write-of(git-pre-commit, commit-object)` — the commit object the event might let be written.
- `carries(git-pre-commit, staged-path-set)` — the set of paths the commit would include, readable via `git diff --cached --name-only --diff-filter=ACMR`.
- `decides(git-pre-commit, {permit, abort})` — the two outcomes the hook routes the event to, by exit status.
- `reads-staged-content-via(git-pre-commit, git-show-cached)` — staged content (not worktree) is read with `git show :<path>` so unstaged edits do not affect the gate's view.
