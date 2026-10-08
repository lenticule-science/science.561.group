---
name: receiving-a-message-from-a-logical-inference-model-on-the-web
description: Parses the raw response text returned by sending-a-message-to-a-logical-inference-model-on-the-web into a structured response cell. Use as the second half of the web-I/O leaf after a send returns.
title: receiving-a-message-from-a-logical-inference-model-on-the-web
---

## Requirements

- A send result from `sending-a-message-to-a-logical-inference-model-on-the-web` is available as input.

### Inputs

- `sendResult` — the object returned by sending. Must contain `model`, `provider`, `response-text`, `sent-at`.

## Steps

1. Validate the send result has the expected fields.
2. Build the response cell shape: `{ model, provider, text, sent-at, received-at }`.
3. Return the response cell.

## Outcomes

- On success: a structured response cell is returned. The caller (`dispatching-to-a-logical-inference-model-on-the-web`) returns it up the chain to the caller that originally requested logical inference.
- On malformed input: an error is raised.
