---
name: running-a-computer-operating-system
description: Run a computer-operating-system. Spawns a child process as the supervised subsystem, inherits stdio, forwards signals, exits with the child's status. Emits EAVT cells at each lifecycle step.
---

## Requirements

- Node 20 or later with ESM enabled.
- Caller supplies `{ instance, child, logPath }` where `instance` names the running instance (e.g. `561`), `child` is the absolute path to the child script, and `logPath` is the EAVT log file.
- The log file at `logPath` is writable.

## Steps

1. Compose a run identity slug `run-<instance>-<iso-timestamp>`.
2. Emit a `starting` cell.
3. Emit a `binding-stdio` cell.
4. Emit a `spawning` cell with the child path.
5. Spawn the child process inheriting stdio and environment.
6. Forward SIGINT and SIGTERM to the child; emit a `forwarding-signal` cell for each.
7. On child exit: emit a `stopping` cell with the child's `{code, signal}`; resolve the returned promise.

## Outcomes

- The child process runs as a subsystem of this script's process.
- EAVT cells per [the running schema](running.schema.json) accumulate in the supplied `logPath`.
- The returned promise resolves with `{ code, signal }`.
  The caller decides whether to re-raise the signal or exit with the code.
