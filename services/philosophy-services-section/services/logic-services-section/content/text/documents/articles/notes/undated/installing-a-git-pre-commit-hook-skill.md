---
name: installing-a-git-pre-commit-hook
description: Writes `.git/hooks/pre-commit` to invoke the routing-a-git-pre-commit script and makes the file executable. Use when wiring the 561 pre-commit gate into a fresh checkout or refreshing the hook after a path change.
title: installing-a-git-pre-commit-hook
---

## Requirements

- The repository's `.git/hooks/` directory is writable.
- The host directory (`repoRoot`) defaults to the process CWD; for an MCP invocation, that's the repo root Claude Code was launched in.

## Steps

1. Resolve `repoRoot` from the supplied argument or process CWD; locate `.git/hooks/`. If `.git` is missing or not a directory, throw.
2. Compose the shim body: a `#!/bin/sh` script that `exec`s `node library/object/library/thing/library/system/library/git/library/git-pre-commit/doing/working/routing-a-git-pre-commit/scripts/route-a-git-pre-commit.mjs` from `$GIT_DIR/..`, propagating the node process's exit status. The shim's second line is the magic comment `# 561-managed pre-commit hook — installed by installing-a-git-pre-commit-hook`.
3. Inspect any existing `.git/hooks/pre-commit`. If it is a 561-managed shim (magic comment present), overwrite it. Otherwise refuse to overwrite unless `force: true` was supplied.
4. Write `.git/hooks/pre-commit` and `chmod +x` the file.
5. Return `{path, created, overwritten, force}` — the absolute hook path, whether the file was newly created, whether an existing file was overwritten, and whether `force` was honored.

## Outcomes

- `.git/hooks/pre-commit` is an executable shim that exec's the router on every `git commit`.
- The shim carries the magic comment identifying it as 561-installed so subsequent installs detect and refresh it.
- If the file existed and lacked the magic comment, the skill threw and wrote nothing unless `force: true` was supplied.
