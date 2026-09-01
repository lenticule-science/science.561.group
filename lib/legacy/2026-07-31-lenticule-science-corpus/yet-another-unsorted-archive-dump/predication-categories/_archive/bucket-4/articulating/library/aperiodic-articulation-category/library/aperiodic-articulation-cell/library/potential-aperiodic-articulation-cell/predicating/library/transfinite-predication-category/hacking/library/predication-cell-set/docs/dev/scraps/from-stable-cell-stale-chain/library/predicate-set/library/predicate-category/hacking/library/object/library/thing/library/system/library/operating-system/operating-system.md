---
name: operating-system
description: A system whose running supervises subsystems and exposes a userland surface.
kind-of: system
bears-transformer:
  - running
runs-at: doing/working/hacking/doing/working/running/
schema: operating-system.schema.json
witness-log: operating-system.jsonl
specialized-by:
  - computer-operating-system
exposes-userland: true
---

A specialization of [system](../../system.md). An operating-system's run supervises subsystems — child processes, characters' respond loops, dispatch — and exposes a userland surface to callers. Subkinds — [computer-operating-system](library/computer-operating-system/computer-operating-system.md) — bind to specific runtime standards (POSIX, ESM Node, the wire protocols).
