---
name: inference-model-record
description: A cell representing an external LLM inference endpoint the dispatch chain can route work to. Bears connection cells (provider, base-url, auth-env-var, model-name), advertised-capability cells (skills), and a receiver-discovery cell (adapter) pointing at the node module that performs the wire I/O.
category: kernel
fields: []
---

An inference-model-record is the cell-shape of a registered external LLM. Each record under `doing/working/inferring/models/<slug>.md` is one routable model. Model records together form the receiver pool the LLM-side of the dispatch chain searches — the picker walks the directory and picks the first model whose `skills:` list contains the workitem's capability.

The structure is named separately from a hypothetical generic `receiver` form because there is no single polymorphic receiver shape in the OS; receiver-kinds are disambiguated into one structure per kind. Script-bearing skills are receivers under [`skill.md`](../../work/governance/rules/specifications/skill.md). Future receiver-kinds (message queue, protocol handler) get their own structure files when authored.

## Required cells

- `provider` — short slug naming the hosting provider (e.g. `nvidia-nim`, `groq`, `cerebras`, `mistral-la-plateforme`, `huggingface-router`). Used by the adapter-discovery cell and the witness log.
- `base-url` — the HTTP endpoint the adapter posts to.
- `auth-env-var` — the environment variable name the adapter reads the API key from. Lives in env, never in the repo.
- `model-name` — the provider's identifier for the specific model (e.g. `meta/llama-3.3-70b-instruct`). Sent as the `model` field of the HTTP payload.
- `skills` — list of kebab-case slugs the model advertises as capabilities it can handle. The dispatch picker matches against this list. Empty list means the model is registered but not advertised for any work.
- `adapter` — repo-relative path to the node module implementing the wire I/O for this model's provider (e.g. `doing/working/inferring/adapters/nvidia.mjs`). The adapter module default-exports an async `send({prompt, model, maxTokens})`. Phase 5 of the dispatch-architecture work adds this cell to every existing model record.

## Optional cells

- `provides-capabilities`, `work-types` — coarser capability axes than `skills`. Used for surveys and selection-rule extensions; not read by the picker today.
- `context-window-tokens`, `supports-tool-calling`, `supports-structured-output` — model-side affordances. Used for receiver-suitability filtering when the workitem's payload demands them.
- `grade`, `cost-per-token-in`, `cost-per-token-out`, `monthly-budget-tokens`, `rate-limit-rpm`, `rate-limit-rpd`, `rate-limit-tpm`, `rate-limit-tpd` — cost and rate-limit affordances. The first-match-wins picker ignores these; a future ranking rule will read them.
- `handedness` — fixed to `outbound-only` for inference models; they are dispatched to and cannot initiate work.
- `enrolled-at`, `enrolled-by` — provenance cells the human registrar fills.

## Relation to other structures

- The `skills:` list ranges over slugs registered in the skill catalog at `doing/working/hacking/doing/working/skills/<slug>/`.
- A model record is one node in the receiver pool of the [`dispatching`](../transformers/dispatching.md) transformer.
- When the picker selects a model, the LLM-branch dispatch scripts read the model record to resolve provider, adapter, and auth env var, then call the adapter — see `library/object/library/thing/library/system/library/inference-model/doing/working/dispatching-to-a-logical-inference-model/scripts/dispatch-to-a-logical-inference-model.mjs` and `library/object/library/thing/library/system/library/inference-model/library/logical-inference-model-on-the-web/doing/working/sending-a-message-to-a-logical-inference-model-on-the-web/scripts/send-a-message-to-a-logical-inference-model-on-the-web.mjs`.
- The machine-readable shape is at [`inference-model-record.schema.json`](inference-model-record.schema.json).
