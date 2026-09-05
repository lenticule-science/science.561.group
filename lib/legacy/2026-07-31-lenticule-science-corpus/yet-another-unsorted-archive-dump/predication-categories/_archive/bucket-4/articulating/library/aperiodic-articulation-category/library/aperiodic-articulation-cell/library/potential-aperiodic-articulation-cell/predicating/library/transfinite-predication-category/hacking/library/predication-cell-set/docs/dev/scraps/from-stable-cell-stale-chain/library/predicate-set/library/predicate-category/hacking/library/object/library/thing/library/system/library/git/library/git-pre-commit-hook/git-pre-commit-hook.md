---
name: git-pre-commit-hook
description: The executable script file at .git/hooks/pre-commit that git invokes on a git-pre-commit event. The byte-level installer payload bearing the installer face of the hook structure.
specializing: hook
fires-on: git-pre-commit
installed-at: .git/hooks/pre-commit
---

A **git-pre-commit-hook** is the file at `.git/hooks/pre-commit` inside the repository's `.git/` directory. Git treats the file as a hook iff it is present and executable; when present, git invokes it on every `git commit` attempt, and the file's exit status decides the commit's fate per the [git-pre-commit](../git-pre-commit/git-pre-commit.md) event.

A 561-installed pre-commit hook is a thin shim: it `exec`s the routing-a-git-pre-commit skill's script and propagates its exit status. The shim is short by design — substantive routing logic lives in the skill, where it is tracked in the repo and editable under the resource-file rules; the file in `.git/hooks/` is unmanaged by git itself and is rewritten by the installing-a-git-pre-commit-hook skill.

## Distinguishing predication-shape

- `installed-at(git-pre-commit-hook, posix-path)` — typically `.git/hooks/pre-commit`.
- `execs(git-pre-commit-hook, skill)` — the routing skill the shim execs.
- `installed-by(git-pre-commit-hook, skill)` — the installer skill that wrote this hook.
- `permissions(git-pre-commit-hook, mode-bits)` — POSIX mode bits (at minimum `S_IXUSR`).
- `installed-at-time(git-pre-commit-hook, time)` — when the installer wrote the file.
