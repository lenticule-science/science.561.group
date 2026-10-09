---
name: dispatching-a-script
description: Resolve a local script realization and compose sending-parameters-to-a-script with receiving-a-message-from-a-script.
source: work-item
target: message
composes:
  - sending-parameters-to-a-script
  - receiving-a-message-from-a-script
title: dispatching-a-script
---

# Dispatching a script

This transformer is the local script branch of the dispatch chain.
It resolves a work item's requested skill to a POSIX/ESM script realization, sends parameters to that script, receives the response envelope, and returns that envelope with the skill name attached.

Resolution is explicit: the caller supplies either an already-resolved script path, a realization index, or a POSIX root directory capability from which the realization index can be built.
