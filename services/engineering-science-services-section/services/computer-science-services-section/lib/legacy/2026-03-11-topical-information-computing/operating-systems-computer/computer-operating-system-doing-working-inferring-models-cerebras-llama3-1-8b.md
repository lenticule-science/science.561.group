---
name: Cerebras Llama-3.1-8B
description: "Cerebras's wafer-scale-silicon endpoint serving Llama 3.1 8B. Smaller than the surveyed Llama 3.3 70B but the same provider; what the user's enrolled account currently exposes (May 2026 lineup: gpt-oss-120b, llama3.1-8b, qwen-3-235b-a22b-instruct-2507, zai-glm-4.7)."
handedness: outbound-only
provider: cerebras
adapter: doing/working/inferring/adapters/cerebras.mjs
model-name: llama3.1-8b
model-version: ""
base-url: https://api.cerebras.ai/v1
auth-env-var: API_KEY_CEREBRAS_INFERENCE
provides-capabilities: [text-generation, instruction-following, tool-calling, structured-output]
work-types: [generation, instruction-following, derivation, summarization]
skills: [writing-plain-technical-general-american-english]
context-window-tokens: 8192
supports-tool-calling: true
supports-structured-output: true
authorized-for: [claude-code-model-router]
claude-code-authorized: true
claude-code-transport: local-anthropic-gateway
claude-code-prompt-classes: [interactive-coding, interactive-tool-use, delegated-work]
grade: small
cost-per-token-in: 0
cost-per-token-out: 0
monthly-budget-tokens: ""
rate-limit-rpm: ""
rate-limit-rpd: ""
rate-limit-tpm: ""
rate-limit-tpd: ""
enrolled-at: 2026-05-04
enrolled-by: emsenn
survey-cited: library/theories/engineering/theories/tech/theories/computing/theories/artificial-intelligence/theories/agents/texts/survey-of-free-cloud-model-endpoints-may-2026.md
survey-drift: "Cited survey lists Llama 3.3 70B as Cerebras's free-tier model. As of 2026-05-04 GET /v1/models returns gpt-oss-120b, llama3.1-8b, qwen-3-235b-a22b-instruct-2507, zai-glm-4.7 — Llama 3.3 70B is not in the lineup. Audit the survey and decide whether to enroll the other Cerebras models as separate endpoint records."
---

The user's enrolled-account view of Cerebras at provisioning time.
The original survey-cited target was Llama 3.3 70B; that model is no longer in the account's `/v1/models` lineup, and Llama 3.1 8B is the closest available stand-in for general-purpose agentic work.

## Use cases

- Smoke-test target for the dispatch chain's outbound wiring.
- Lightweight summarization, instruction-following, and short-form generation tasks that fit in 8K context.

## Constraints

- **Context window: 8,192 tokens.** Tasks whose composed fiber exceeds this must dispatch elsewhere.
- **Rate limits unverified.** The survey-cited 1M tok/day budget pertained to a different model on the same provider; verify against current Cerebras pricing/limits docs before relying on it for sustained traffic.

## Verification

Confirm current limits at <https://inference-docs.cerebras.ai/support/rate-limits>.
