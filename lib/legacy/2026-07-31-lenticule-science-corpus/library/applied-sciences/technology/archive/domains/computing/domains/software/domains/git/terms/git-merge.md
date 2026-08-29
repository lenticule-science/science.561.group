---
title: Git merge
aliases:
  - "Git merge"
  - "git merge"
date-created: 2026-02-28T00:00:00
type: term
tags: []
defines:
  - "Git merge"
---
A git merge combines two [branches](./git-branch.md) of development history into a single branch within a [Git repository](./git-repository.md). Git supports two merge strategies: fast-forward merges (when the target branch is a direct ancestor of the source, so the pointer advances without creating a new [commit](./git-commit.md)) and three-way merges (when both branches have diverged from a common ancestor). Three-way merges use the common ancestor to determine which changes to apply automatically and produce a new merge commit with two parents. Merge conflicts occur when the same region of a file was modified in both branches; these require manual resolution before the merge can complete. In an [Agential Semioverse Repository](../../../../../specifications/agential-semioverse-repository/index.md), merges represent the composition of concurrent agent work: two agents operating on disjoint file regions produce commits that merge cleanly, while overlapping edits may conflict and require human adjudication.