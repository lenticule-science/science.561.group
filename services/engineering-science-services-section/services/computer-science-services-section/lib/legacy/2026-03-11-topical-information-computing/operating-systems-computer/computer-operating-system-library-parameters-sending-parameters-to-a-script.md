---
name: sending-parameters-to-a-script
description: Invokes a script at a resolved path with the supplied parameters and captures its return value. Use as the local-execution counterpart of sending-a-message-to-a-logical-inference-model-on-the-web.
---

## Requirements

- The script at `scriptPath` exists and default-exports an async function taking one object argument.

### Inputs

- `scriptPath` — string, absolute path to the script `.mjs` file.
- `parameters` — object, passed as the single argument to the script's default-exported function.

## Steps

1. Dynamic-import the script at `scriptPath`.
2. Call its default export with `parameters`.
3. Capture the returned value.
4. Return `{ scriptPath, parameters, return-value, sent-at }`.

## Outcomes

- On success: the structured send result is returned.
  The caller hands it to `receiving-a-message-from-a-script` for parsing into the final response shape.
- On script-raised error: the error is propagated.
  Higher layers decide whether to retry, fail the work item, or surface the diagnostic.
