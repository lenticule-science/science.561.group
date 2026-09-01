---
name: running
description: Generic running of any system. Abstract — concrete behavior is provided by subkinds.
defined-at: ../../../../../code/transformers/running.md
applied-to-kind: system
schema: running.schema.json
witness-log: running.jsonl
script: scripts/running.mjs
---

Generic running of the [system](../../../system.md) kind. The transformer is defined at [code/transformers/running.md](../../../../../code/transformers/running.md). The [the running script](scripts/running.mjs) at this level is abstract — it throws and demands specialization by subkinds.
