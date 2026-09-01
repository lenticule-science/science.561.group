---
name: dispatching-a-script
description: Resolves a skill slug to its script and runs the script with the supplied parameters by composing sending-parameters-to-a-script and receiving-a-message-from-a-script. Use when dispatching-a-process or dispatching-a-procedure needs to actually execute a skill's body.
---

## Requirements

- The caller supplies one of `scriptPath`, `skillRealizations`, or `repoRoot`.
- A skill realization is a directory carrying `SKILL.md` plus exactly one non-helper `.mjs` under `scripts/`.
- The resolved script default-exports a function.

### Inputs

- `workItem` — object with at minimum `{ skill, parameters }`.
  The resolved script's default-exported function is called with `parameters` as its argument.
- `scriptPath` — optional already-resolved script path.
- `skillRealizations` — optional precomputed array of `{ skill, scriptPath }`.
- `repoRoot` — optional POSIX directory capability used to build a realization index.

## Steps

1. Resolve the script path for `workItem.skill` from `scriptPath`, `skillRealizations`, or a `repoRoot` scan for `SKILL.md` surfaces.
2. Call `sending-parameters-to-a-script` with `{ scriptPath, parameters }`.
3. Call `receiving-a-message-from-a-script` with the send result.
4. Return the response.

## Outcomes

- On success: the script's structured output is returned to the caller (the kind-dispatcher).
- On unknown skill or missing script: error propagated up.
- On script error: error propagated up with diagnostic context.
