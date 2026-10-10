---
name: Groq Llama-3.3-70B-Versatile
description: "Groq's LPU-hosted Llama 3.3 70B Versatile endpoint. 14,400 requests/day at fastest commodity tps. Ideal for latency-sensitive steps and tool-calling routers."
handedness: outbound-only
provider: groq
adapter: doing/working/inferring/adapters/groq.mjs
model-name: llama-3.3-70b-versatile
model-version: ""
base-url: https://api.groq.com/openai/v1
auth-env-var: API_KEY_GROQ_GROQCLOUD
provides-capabilities: [text-generation, instruction-following, tool-calling, structured-output]
work-types: [generation, instruction-following, derivation, code-edit, tool-routing]
skills: [drafting-a-claim, rewriting-plain-technical-general-american-english]
context-window-tokens: 32768
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
rate-limit-rpm: 30
rate-limit-rpd: 14400
rate-limit-tpm: ""
rate-limit-tpd: ""
enrolled-at: 2026-05-04
enrolled-by: emsenn
survey-cited: library/theories/engineering/theories/tech/theories/computing/theories/artificial-intelligence/theories/agents/texts/survey-of-free-cloud-model-endpoints-may-2026.md
---

Groq's LPU (Language Processing Unit) endpoint serving Llama 3.3 70B Versatile.
Fastest commodity tokens-per-second outside Cerebras, with a 14,400 requests/day free budget.
The natural primary for latency-sensitive interactive steps and tool-calling routers, where time-to-first-token dominates total task time.

## Use cases

- Tool-calling routers that need to make many fast decisions.
- Interactive UI steps with strict latency budgets.
- Workloads where the daily request cap (not the token cap) is the binding constraint.

## Constraints

- **14,400 requests/day** is the binding free-tier constraint at scale.
- Limits vary by model — `llama-3.1-8b-instant` (e.g.) carries different RPM/TPM caps than the 70B versatile model.
  The runtime should track per-model rate-limit budgets when the swarm dispatches to multiple Groq models.
- Other available Groq models (each potentially its own endpoint record): Llama 3.3 70B SpecDec, Qwen 3 32B, GPT-OSS 120B, Whisper for speech.

## Verification

Verify current limits at <https://console.groq.com/docs/rate-limits>.
