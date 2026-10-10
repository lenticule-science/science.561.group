---
name: starting-a-git-session
description: Probes the git environment and reports divergence at the start of any session that will produce commits. Use as the first action to surface auth or divergence blockers before doing work.
---

## Requirements

- A git repository with an `origin` remote.

## Steps

1. Run `bash ${CLAUDE_SKILL_DIR}/scripts/session-start.sh`.
2. The script runs `probe-git-environment` and `inspect-divergence` in sequence.
3. Print a one-line verdict and exit: 0 (safe to commit and push), 1 (diverged — surface to captain or run `reconcile-divergence` first), or 2 (no auth — surface `$GITHUB_PAT` setup to captain before doing work).

## Outcomes

- A structured report covering environment capability and divergence state.
- Exit 0: safe to proceed with commits.
- Exit 1: divergence detected; do not commit until resolved.
- Exit 2: no push auth available; surface to captain.
