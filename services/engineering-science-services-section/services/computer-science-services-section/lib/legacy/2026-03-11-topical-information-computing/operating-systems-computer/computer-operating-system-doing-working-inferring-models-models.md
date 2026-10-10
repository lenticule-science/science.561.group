---
name: inference models
description: "Records for the external LLM inference models the swarm dispatches to. Each record lists the model's endpoint, protocol, auth env var, and the skills the model is known to handle well — used by the dispatch chain to route work."
contains:
  - cerebras-llama3-1-8b.md
  - groq-llama-3-3-70b-versatile.md
  - huggingface-router.md
  - mistral-mistral-large.md
  - nvidia-nim-llama-3-3-70b.md
---

Each `.md` file under this directory is one inference model: a routable external LLM the swarm dispatches work to.
Models are outbound-only — the swarm dispatches to them; they cannot initiate work, admit envelopes, or sign witnesses.

The free-tier model records are based on `theories/engineering/theories/tech/theories/computing/theories/artificial-intelligence/theories/agents/texts/survey-of-free-cloud-model-endpoints-may-2026.md`.
Rate limits and model availability change month-to-month; verify against the provider's docs before depending on the figures.

## Registered models

- `cerebras-llama3-1-8b.md` — Cerebras Inference / Llama 3.1 8B.
  Small, fast.
- `groq-llama-3-3-70b-versatile.md` — Groq / Llama 3.3 70B Versatile.
  14,400 requests/day at fastest commodity tokens-per-second.
- `huggingface-router.md` — Hugging Face Inference Providers router.
  Broadest model coverage; best as fallback.
- `mistral-mistral-large.md` — Mistral La Plateforme / Mistral Large.
  1B tokens/month at 1 RPS; batch and background.
- `nvidia-nim-llama-3-3-70b.md` — NVIDIA NIM / Llama 3.3 70B Instruct.
  No daily token cap.

## How dispatch picks a model

The dispatch chain's `dispatching-to-a-logical-inference-model` skill walks this directory and selects the first model whose `skills:` list contains the skill the work item needs.
First match wins for now; ranking by cost, latency, and rate-limit headroom is deferred.

For a work item to reach an LLM, the work's needed skill must appear in some model's `skills:` list.
If no model advertises the skill, the dispatcher returns a no-match error and the work waits.
