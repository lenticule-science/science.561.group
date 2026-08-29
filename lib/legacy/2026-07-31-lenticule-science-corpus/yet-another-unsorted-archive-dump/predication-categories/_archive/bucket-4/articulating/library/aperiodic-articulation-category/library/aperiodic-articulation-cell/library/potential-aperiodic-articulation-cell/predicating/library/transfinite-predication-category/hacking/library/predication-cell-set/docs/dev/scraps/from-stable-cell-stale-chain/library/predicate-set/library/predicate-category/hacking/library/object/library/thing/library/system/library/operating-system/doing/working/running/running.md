---
name: running
description: Generic running of any operating-system. Extends system's running with the subsystem-supervision contract; still abstract — POSIX-specific behavior lives at computer-operating-system.
defined-at: ../../../../../../../code/transformers/running.md
applied-to-kind: operating-system
schema: running.schema.json
witness-log: running.jsonl
script: scripts/running.mjs
extends: ../../../../../doing/working/running/running.md
---

Generic running of the [operating-system](../../../operating-system.md) kind. Extends the [system run](../../../../../doing/working/running/running.md) with subsystem supervision. The transformer's full definition is at [code/transformers/running.md](../../../../../../../code/transformers/running.md). The [the running script](scripts/running.mjs) at this level is abstract — concrete behavior is provided by the subkind.
