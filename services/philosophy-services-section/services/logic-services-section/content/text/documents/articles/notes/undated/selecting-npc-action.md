---
name: selecting-npc-action
description: Composes an NPC's goals fiber with its perception, producing the action the NPC's goals entail given what the NPC perceives.
category: paracosmic-emulator
inputs:
  - name: arg1
    type: npc-goals-fiber-record
  - name: arg2
    type: umwelt-projection-record
output:
  type: npc-action-selection-record
title: selecting-npc-action
---
