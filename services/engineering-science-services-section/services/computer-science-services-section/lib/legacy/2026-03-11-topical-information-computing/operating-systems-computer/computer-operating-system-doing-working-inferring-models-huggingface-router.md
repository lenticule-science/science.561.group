---
name: HuggingFace router
description: "HF's OpenAI-compatible router over partner inference providers. Smaller absolute budget but broadest model coverage from one integration. Best as a fallback layer."
handedness: outbound-only
provider: huggingface-router
adapter: doing/working/inferring/adapters/huggingface.mjs
model-name: ""
model-version: ""
base-url: https://router.huggingface.co/v1
auth-env-var: API_KEY_HUGGINGFACE_INFERENCE
provides-capabilities: [text-generation, instruction-following, tool-calling, structured-output, multi-model-routing]
work-types: [generation, instruction-following, derivation, fallback-routing]
skills: []
context-window-tokens: ""
supports-tool-calling: true
supports-structured-output: true
grade: variable
cost-per-token-in: 0
cost-per-token-out: 0
monthly-budget-tokens: ""
rate-limit-rpm: ""
rate-limit-rpd: ""
rate-limit-tpm: ""
rate-limit-tpd: ""
enrolled-at: 2026-05-04
enrolled-by: emsenn
survey-cited: theories/engineering/theories/tech/theories/computing/theories/continuous-computation/theories/artificial-intelligence/theories/agents/prose/learning/surveys/survey-of-free-cloud-model-endpoints-may-2026.md
---

A *router* endpoint: one OpenAI-compatible URL that dispatches across HF's partner inference providers (Together, Fireworks, Replicate, SambaNova, Hyperbolic, and others).
The free budget is a credit allotment that funds usage at paid per-token prices on the underlying providers.
Per-token cost is *not* zero in the strict sense — it consumes the credit allotment — but this record treats it as a free-tier endpoint within the budget.

This is the only record where `model-name` is empty: the router takes the model identifier as a per-call parameter (e.g., `meta-llama/Llama-3.3-70B-Instruct`, `Qwen/Qwen3-Coder-480B`, `deepseek/deepseek-r1`).
Each per-call (provider, model) tuple may carry its own capability and cost predications; the router record above is the *aggregate* enrollment.

## Use cases

- Fallback when primary endpoints (Cerebras, Groq, NVIDIA NIM) hit rate limits.
- Access to models not served by the primaries (e.g., specialized open-weight models on a single partner).
- Single-integration coverage of the broader open-weight model market.

## Constraints

- **Credit-grant model.** The free monthly credit is small in absolute terms; this endpoint should be a fallback, not a primary path.
- Model-specific capability and rate-limit predications should be tracked per `(provider, model)` tuple — the router record is the single integration point but the dispatch's eligibility filter needs per-model claims.
- Per HF's docs, free-router traffic may carry data-handling caveats; check upstream providers' privacy practices for sensitive workloads.

## Verification

Verify at <https://huggingface.co/docs/inference-providers/index>.

## Note on multi-model endpoints

This record is provisional.
A more precise treatment would split it into one model record per `(provider, model)` tuple the router exposes — each carrying its own capability and cost claims — and route through the HF integration as the access path.
The single-record form above is the minimum viable for first-integration; the per-tuple expansion is captured as future work in the [survey](../../../../theories/engineering/theories/tech/theories/computing/theories/continuous-computation/theories/artificial-intelligence/theories/agents/prose/learning/surveys/survey-of-free-cloud-model-endpoints-may-2026.md).
