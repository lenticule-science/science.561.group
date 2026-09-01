---
name: git
description: The git content-addressed version-control system — a distributed object database whose objects (blobs, trees, commits, tags) are Merkle-DAG nodes addressed by SHA-1/SHA-256 hash. Provides the pre-commit/post-commit/pre-push lifecycle hooks the 561 OS gates on.
specializing: system
having-purpose: version-control
---

**git** is a content-addressed distributed version-control system organized as a Merkle DAG of objects (blobs, trees, commits, tags) addressed by SHA-1 (legacy) or SHA-256 (modern) hashes. Specializes [system](../system.md) as a version-control system; intermediate `version-control-system` parent may be earned later. Its lifecycle hooks (pre-commit, commit-msg, post-commit, pre-push, etc.) are the events the 561 OS gates on to keep its substrate conformant. Sub-structures under [library/](library/) name specific git events and the installer payloads that bind to .git/hooks/.
