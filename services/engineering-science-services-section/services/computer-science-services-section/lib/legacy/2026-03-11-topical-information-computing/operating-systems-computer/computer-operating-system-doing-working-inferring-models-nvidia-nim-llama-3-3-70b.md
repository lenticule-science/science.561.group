---
name: NVIDIA NIM Llama-3.3-70B
description: "NVIDIA's NIM-hosted Llama 3.3 70B endpoint. No daily token cap; ~40 RPM. The natural home for heterogeneous agent tools given NIM's 100+ models."
handedness: outbound-only
provider: nvidia-nim
adapter: doing/working/inferring/adapters/nvidia.mjs
model-name: meta/llama-3.3-70b-instruct
model-version: ""
base-url: https://integrate.api.nvidia.com/v1
auth-env-var: API_KEY_NVIDIA_NIM
provides-capabilities: [text-generation, instruction-following, tool-calling, structured-output, reasoning]
work-types: [generation, instruction-following, derivation, code-edit, summarization, reasoning]
skills: [writing-a-specification, judging-skill-mention-in-a-paragraph, judging-skill-amendment-from-a-diary-entry, rewriting-a-resource-file]
context-window-tokens: 128000
supports-tool-calling: true
supports-structured-output: true
authorized-for: [claude-code-model-router]
claude-code-authorized: true
claude-code-transport: local-anthropic-gateway
claude-code-prompt-classes: [interactive-coding, interactive-tool-use, delegated-work]
grade: large
cost-per-token-in: 0
cost-per-token-out: 0
monthly-budget-tokens: ""
rate-limit-rpm: 40
rate-limit-rpd: ""
rate-limit-tpm: ""
rate-limit-tpd: ""
enrolled-at: 2026-05-04
enrolled-by: emsenn
survey-cited: library/theories/engineering/theories/tech/theories/computing/theories/artificial-intelligence/theories/agents/texts/survey-of-free-cloud-model-endpoints-may-2026.md
---

NVIDIA's hosted endpoint for Llama 3.3 70B Instruct, served from the NIM (NVIDIA Inference Microservices) platform.
The standout property is *no daily token cap* on the free tier, which makes NIM the right fallback when Cerebras's 1M tok/day envelope is exhausted, and the right primary for steady-state long-context workloads.

NIM also serves 100+ other models — vision, embedding, retrieval, speech, biology — making it the natural home for any heterogeneous agent tool that doesn't fit a 70B-instruct shape.
Each `(model, NIM)` pair would be its own endpoint record (this record covers only Llama 3.3 70B Instruct).

## Use cases

- Long-context tasks (full 128K window).
- Steady-state high-volume work when token budget elsewhere is constrained.
- Fallback when Cerebras / Groq hit rate limits.

## Constraints

- **40 RPM** approximate cap (the binding constraint for free-tier use).
- NVIDIA frames the hosted endpoints as for prototyping and evaluation; the absence of a token cap nonetheless makes them practically usable for steady programmatic traffic.

## Verification

Verify at <https://docs.nvidia.com/nim/> and the build.nvidia.com catalog before depending on the figures.
