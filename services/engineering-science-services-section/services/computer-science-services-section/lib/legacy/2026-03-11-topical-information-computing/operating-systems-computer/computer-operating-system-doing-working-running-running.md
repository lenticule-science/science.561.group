---
name: running
description: Generic running of any computer-operating-system. Concrete — POSIX-specific behavior bound to the ESM Node runtime.
defined-at: ../../../../../../../../../code/transformers/running.md
applied-to-kind: computer-operating-system
schema: running.schema.json
witness-log: running.jsonl
script: scripts/running.mjs
extends: ../../../../../doing/working/running/running.md
---

Generic running of the [computer-operating-system](../../../computer-operating-system.md) kind.
Extends the [operating-system run](../../../../../doing/working/running/running.md) with POSIX-specific behavior: spawning a child process as the supervised subsystem, inheriting stdio, forwarding SIGINT and SIGTERM, exiting with the child's status.
The transformer's full definition is at [code/transformers/running.md](../../../../../../../../../code/transformers/running.md).
The exported [the running script](scripts/running.mjs) function takes `{ instance, child, logPath }` and emits EAVT cells to `logPath` per [the running schema](running.schema.json) at each lifecycle step.
