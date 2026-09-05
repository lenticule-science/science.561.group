---
name: selecting-cone-by-player-action
description: The player's next action selects which cone is taken; emits a timeline-fork-record recording the selection.
category: paracosmic-emulator
inputs:
  - name: arg1
    type: bypass-cone-record
  - name: arg2
    type: candidate-action-message-record
output:
  type: timeline-fork-record
---
