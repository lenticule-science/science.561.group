---
name: receiving-a-message-from-a-script
description: Parses the structured send result returned by sending-parameters-to-a-script into a response cell. Use as the second half of the script-execution leaf after a send returns.
---

## Requirements

- A send result from `sending-parameters-to-a-script` is available as input.

### Inputs

- `sendResult` — object returned by sending.
  Must contain `scriptPath`, `parameters`, `return-value`, `sent-at`.

## Steps

1. Validate the send result has the expected fields.
2. Build the response cell: `{ scriptPath, parameters, return-value, sent-at, received-at }`.
3. Return the response cell.

## Outcomes

- On success: a structured response cell is returned.
  The caller (`dispatching-a-script`) returns it up the chain.
- On malformed input: an error is raised.
