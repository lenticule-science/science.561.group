---
name: sending-a-message-to-a-logical-inference-model-on-the-web
description: Sends a prompt to a named inference model's web endpoint and returns the raw response text. Use when the dispatch chain has resolved to a specific web-hosted model and needs to make the HTTP round-trip.
---

## Requirements

- The model is registered at `doing/working/inferring/models/<model-slug>.md` with `provider:`, `base-url:`, `auth-env-var:`, `model-name:`.
- The provider's auth env var is set (e.g., `API_KEY_NVIDIA_NIM` for `nvidia-nim`).
- One adapter exists for the provider at `doing/working/inferring/adapters/<provider>.mjs`.

### Inputs

- `model` — string. Slug of the model record (e.g. `nvidia-nim-llama-3-3-70b`).
- `prompt` — string. The prompt to send.
- `maxTokens` — number (optional). Caps the response length.

## Steps

1. Read the model record at `doing/working/inferring/models/<model>.md` and extract `provider:`, `model-name:`.
2. Resolve the adapter for the provider. NVIDIA-NIM is wired today; other providers raise a no-adapter error.
3. Call `adapter.send({ prompt, model: <model-name>, maxTokens })`.
4. Return `{ model, provider, response-text, sent-at }`.

## Outcomes

- On success: the structured send result is returned. The caller (`dispatching-to-a-logical-inference-model-on-the-web`) hands it to `receiving-a-message-from-a-logical-inference-model-on-the-web` for parsing.
- On adapter error: the error is propagated. Higher layers decide whether to retry, fail the work item, or pick a different model.
