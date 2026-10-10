---
name: Mistral Mistral-Large
description: "Mistral's hosted endpoint for Mistral Large. 1 billion tokens per month free at 1 RPS. Suits batch and background work."
handedness: outbound-only
provider: mistral-la-plateforme
adapter: doing/working/inferring/adapters/mistral.mjs
model-name: mistral-large-latest
model-version: ""
base-url: https://api.mistral.ai/v1
auth-env-var: MISTRAL_API_KEY
provides-capabilities: [text-generation, instruction-following, tool-calling, structured-output]
work-types: [generation, instruction-following, derivation, batch-summarization, batch-extraction]
skills: []
context-window-tokens: 131072
supports-tool-calling: true
supports-structured-output: true
grade: large
cost-per-token-in: 0
cost-per-token-out: 0
monthly-budget-tokens: 1000000000
rate-limit-rpm: 60
rate-limit-rpd: ""
rate-limit-tpm: 500000
rate-limit-tpd: ""
enrolled-at: 2026-05-04
enrolled-by: emsenn
survey-cited: library/theories/engineering/theories/tech/theories/computing/theories/artificial-intelligence/theories/agents/texts/survey-of-free-cloud-model-endpoints-may-2026.md
---

Mistral's experiment-tier endpoint for Mistral Large.
The free monthly budget — 1 billion tokens — is enormous; the binding constraint is the 1 RPS cap, which makes the endpoint suited to batch and background work rather than interactive loops.
The 131K context window is the largest among the recommended endpoints and is the right primary when long-context dispatch is the dominant cost.

## Use cases

- Batch summarization of large document sets.
- Background extraction over long histories.
- Periodic high-volume reasoning that can be queued and trickled at 1 RPS.

## Constraints

- **1 RPS** ceiling (60 RPM) — strictly batch/background, not interactive.
- TOS treats the free tier as evaluation/prototyping.
  The experiment tier carries no enforcement against programmatic agentic use within its limits, but production-tier traffic is expected to migrate to the paid Scale plan.
- Other Mistral models served on the same endpoint (each potentially its own record): Small 3, open-mistral-7b, open-mixtral-8x7b, Codestral.

## Verification

Verify at <https://docs.mistral.ai/getting-started/models/models_overview/> and the experiment-tier limits page.
