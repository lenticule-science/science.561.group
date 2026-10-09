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
title: operating-system
---

A specialization of [system](system.md). An operating-system's run supervises subsystems — child processes, characters' respond loops, dispatch — and exposes a userland surface to callers. Subkinds — [computer-operating-system](../../research/2026/07/31/lenticule-import/yet-another-unsorted-archive-dump/predication-categories/_archive/bucket-4/articulating/library/aperiodic-articulation-category/library/aperiodic-articulation-cell/library/potential-aperiodic-articulation-cell/predicating/library/transfinite-predication-category/hacking/library/predication-cell-set/docs/dev/scraps/from-stable-cell-stale-chain/library/predicate-set/library/predicate-category/hacking/library/object/library/thing/library/system/library/operating-system/library/computer-operating-system/computer-operating-system.md) — bind to specific runtime standards (POSIX, ESM Node, the wire protocols).
