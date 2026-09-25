---

name: Git commit
aliases:
  - "Git commit"
  - "git commit"
date-created: 2026-02-28
tags: []
---
A git commit is a snapshot of the [repository](git-repository.md) state at a point in time. Commits form a directed acyclic graph (DAG) where each commit references its parent(s). Each commit records the author, timestamp, a message describing the change, and a tree object representing the file system state at that moment. Commits are identified by SHA-1 hashes computed from their contents, making them content-addressed and tamper-evident: altering any part of a commit changes its hash, which in turn invalidates all descendant commits. In an [Agential Semioverse Repository](../../../../../specifications/agential-semioverse-repository/index.md), commits serve as the provenance mechanism. Each change to the vault state is recorded as a commit with an author and a description, creating an audit trail of how the repository evolved over time.

---

## Supplementary formulation

```yaml
---
name: Git commit
aliases:
  - "Git commit"
  - "git commit"
date-created: 2026-02-28T00:00:00
tags: []
---
```

A git commit is a snapshot of the [repository](git-repository.md) state at a point in time. Commits form a directed acyclic graph (DAG) where each commit references its parent(s). Each commit records the author, timestamp, a message describing the change, and a tree object representing the file system state at that moment. Commits are identified by SHA-1 hashes computed from their contents, making them content-addressed and tamper-evident: altering any part of a commit changes its hash, which in turn invalidates all descendant commits. In an [Agential Semioverse Repository](../../../../../specifications/agential-semioverse-repository/index.md), commits serve as the provenance mechanism. Each change to the vault state is recorded as a commit with an author and a description, creating an audit trail of how the repository evolved over time.
