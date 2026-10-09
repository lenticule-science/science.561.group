---
name: dispatching-to-a-logical-inference-model-on-the-web
description: Composes the web-I/O leaf — calls sending-a-message-to-a-logical-inference-model-on-the-web, then receiving-a-message-from-a-logical-inference-model-on-the-web. Use when the dispatch chain has picked a specific web-hosted model and needs the full HTTP round-trip plus response parsing.
title: dispatching-to-a-logical-inference-model-on-the-web
---

## Requirements

- The picked model is a web-hosted model with a record at `doing/working/inferring/models/<slug>.md`.
- The downstream skills are reachable: `sending-a-message-to-a-logical-inference-model-on-the-web`, `receiving-a-message-from-a-logical-inference-model-on-the-web`.

### Inputs

- `model` — string. The model slug.
- `prompt` — string. The prompt to send.
- `maxTokens` — number (optional).

## Steps

1. Call `sending-a-message-to-a-logical-inference-model-on-the-web` with the inputs. Capture the send result.
2. Call `receiving-a-message-from-a-logical-inference-model-on-the-web` with the send result. Capture the response cell.
3. Return the response cell.

## Outcomes

- On success: a structured response cell `{ model, provider, text, sent-at, received-at }` is returned to the caller (`dispatching-to-a-logical-inference-model`).
- On error from either sub-step: the error is propagated up.
