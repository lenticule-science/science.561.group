---
name: running-world-tick
description: Runs one full world-tick — collects firable entities, fires reductions breadth-first, cascades, settles, emits the world-tick-record.
category: paracosmic-emulator
inputs:
  - name: arg1
    type: sigma-pass-engine-record
  - name: arg2
    type: delta-pass-engine-record
  - name: arg3
    type: firable-entity-record
output:
  type: world-tick-record
---
