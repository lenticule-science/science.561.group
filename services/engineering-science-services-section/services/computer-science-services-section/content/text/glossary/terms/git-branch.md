---

name: Git branch
aliases:
  - "Git branch"
  - "git branch"
date-created: 2026-02-28
tags: []
---
A git branch is a movable pointer to a [commit](git-commit.md), representing an independent line of development within a [Git repository](git-repository.md). Branches allow concurrent work on different features or tasks without affecting the main development line. Creating a branch is a lightweight operation: git stores a branch as a 41-byte file containing only the hash of the commit it points to. Branches can be [merged](git-merge.md) back into the main line when their work is complete. In this vault, the `main` branch is the single development line; feature branches are not used unless explicitly requested, because emsenn edits the vault concurrently in Obsidian and a single-branch workflow avoids merge overhead.
