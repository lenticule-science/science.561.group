---
part-of:
  - reports
title: "Survey of Free Cloud Model Endpoints, May 2026"
date-created: 2026-05-04
text-type: survey
keywords:
  - inference-providers
  - free-tier
  - openai-compatible
  - hosted-llm
  - rate-limits
description: A landscape scan of hosted large-language-model inference providers offering free or free-tier programmatic access as of May 2026.
---

## Survey of Free Cloud Model Endpoints, May 2026

A landscape scan of hosted large-language-model inference providers offering
free or free-tier programmatic access as of May 2026. The scope is *hosted*
inference — endpoints you can call over HTTPS without provisioning your own
GPUs — and *ongoing* free access, not seven-day trial credits. Where a
provider only offers a one-time credit grant, that is noted but the provider
is not recommended for steady use.

The audience is anyone — hobbyist, student, small team, agentic-system
builder — choosing among free providers to offload work that would otherwise
run on a paid API or a human.

The free-tier landscape changes month-to-month; rate limits, eligible models,
and terms of service in particular are revised frequently. Verify current
limits at the provider's docs before depending on the figures here.

## 1. What "free tier" means in 2026

Three patterns are common:

- **Rate-limited free access.** No token budget; the provider caps requests
  per minute (RPM) and tokens per minute (TPM). You can run as much volume
  as the rate limits permit. *Examples: NVIDIA NIM (build.nvidia.com), Groq.*

- **Token-budgeted free access.** Daily or monthly token cap; once exhausted
  the endpoint either fails closed or rolls over to paid pricing.
  *Examples: Cerebras (1M tokens/day), Mistral La Plateforme (1B tokens/month),
  SambaNova (200K tokens/day), Cloudflare Workers AI (10K neurons/day).*

- **Credit-grant free tier.** A monthly recurring credit allotment that
  funds usage at the paid per-token price; once exhausted you pay or wait
  until the next reset. *Examples: Hugging Face Inference Providers
  (100K credits/month), DeepInfra ($5/month), GitHub Models (50 premium
  requests/month on Copilot Free).*

A fourth pattern — the *trial credit* (e.g. Together's $25, Fireworks's $1) —
is not free in any ongoing sense and is excluded from the recommendations.

## 2. Provider notes

The order is alphabetical within "recommended" and "marginal" tiers; the
top-five recommendation list is in §3.

### Recommended for ongoing free use

#### Cerebras Inference

- **API:** OpenAI-compatible. Standard `/v1/chat/completions`.
- **Free budget:** 1,000,000 tokens/day (the largest ongoing free budget on
  the market as of writing). Rate limits 30 RPM, 60K–100K TPM.
- **Models:** Llama 3.3 70B, Qwen3 32B, Qwen3 235B Instruct, GPT-OSS 120B.
- **Context window:** Capped at 8,192 tokens on most free models;
  Qwen3 235B Instruct allows 64K.
- **Latency:** Fastest on the market — wafer-scale silicon delivers
  ~1,800–2,600 tokens/second on 70B-class models.
- **Terms:** Free tier permits programmatic use within rate limits.
- **Docs:** <https://inference-docs.cerebras.ai/support/rate-limits>,
  <https://www.cerebras.ai/pricing>

#### Groq

- **API:** OpenAI-compatible at `https://api.groq.com/openai/v1`.
- **Free budget:** 30 RPM, 6,000 TPM, 14,400 requests/day, ~500K tokens/day
  on `llama-3.1-8b-instant`. Limits vary by model.
- **Models:** Llama 3.3 70B (versatile and specdec variants), Qwen 3 32B,
  GPT-OSS 120B, Whisper for speech.
- **Latency:** ~300+ tokens/second on 70B — fastest commodity-LLM throughput
  outside Cerebras, with broader model selection.
- **Terms:** Programmatic use permitted; the daily request cap is the binding
  constraint at scale.
- **Docs:** <https://console.groq.com/docs/rate-limits>,
  <https://groq.com/pricing>

#### Hugging Face Inference Providers

- **API:** OpenAI-compatible router at `https://router.huggingface.co/v1`.
  A single API key fans out to roughly fifteen partner providers (Together,
  fal, Replicate, Cerebras, SambaNova, Novita, DeepInfra, and others) with
  automatic provider selection or explicit `:cheapest` / `:preferred`
  suffixes.
- **Free budget:** 100,000 monthly credits; PRO plan ($9/month) lifts this
  to 2,000,000.
- **Models:** Effectively any open-weight model on the Hub that a partner
  serves.
- **Strength:** As a *router* over the rest of the market, it is the cheapest
  single integration that yields broad model coverage. Best used as a
  fallback layer rather than a primary path; the credit budget is small in
  absolute terms.
- **Docs:** <https://huggingface.co/docs/inference-providers/pricing>

#### Mistral La Plateforme

- **API:** Proprietary REST close to the OpenAI shape, plus an
  OpenAI-compatible endpoint. No credit card required for the free tier.
- **Free budget:** Experiment tier — ~1 RPS, 500K TPM, 1,000,000,000 tokens
  per month across Mistral models (Small 3, Large, open-mistral-7b,
  open-mixtral-8x7b, Codestral).
- **Latency:** Suited to batch / background work given the 1 RPS cap.
- **Terms:** TOS treats the free tier as evaluation/prototyping. Production
  is expected to be on the paid Scale plan, but the experiment tier carries
  no enforcement against programmatic agentic use within its limits.
- **Strength:** Largest absolute monthly budget of any provider on this list.
  Strong European-data-residency story if relevant.
- **Docs:** <https://docs.mistral.ai/deployment/ai-studio/tier>,
  <https://mistral.ai/pricing>

#### NVIDIA NIM (build.nvidia.com)

- **API:** OpenAI-compatible. Base URL
  `https://integrate.api.nvidia.com/v1`. Auth: API key prefixed `nvapi-`
  obtained from the NVIDIA Developer Program.
- **Free budget:** Pure rate-limited free access — typically ~40 RPM per
  model, no daily token cap, no credit card required. The earlier
  credit-based system was retired in early 2025.
- **Models:** 100+ — Llama 3.3 70B Instruct, DeepSeek-R1, Qwen 3, GPT-OSS
  120B, Kimi K2.5, MiniMax M2.7, GLM-5, plus reasoning, vision, embedding,
  retrieval, speech, and biology-specific models. Best breadth on the list.
- **Terms:** NVIDIA frames the hosted endpoints as for prototyping and
  evaluation; the absence of a token cap nonetheless makes them usable for
  heavier programmatic work. Production-scale deployments are expected to
  self-host NIM containers.
- **Docs:** <https://build.nvidia.com/>,
  <https://docs.api.nvidia.com/nim/reference/llm-apis>

### Marginal — usable for narrower roles

#### Cloudflare Workers AI

- **API:** REST plus an OpenAI-compatible chat path. Cloudflare API token
  auth.
- **Free budget:** 10,000 neurons/day (≈5K–10K small-model requests),
  resets at 00:00 UTC. Hard fail-closed past the cap on the free plan.
- **Models:** Llama 3.x, Mistral, Qwen, Gemma, embeddings, plus image
  models. Mostly small-to-medium open-weight.
- **Use case:** Excellent if you are already running Cloudflare Workers and
  want inference colocated; capability ceiling is below the recommended
  tier.
- **Docs:** <https://developers.cloudflare.com/workers-ai/platform/pricing/>

#### OpenRouter (free models)

- **API:** OpenAI-compatible aggregator; one key, many upstream providers.
- **Free budget:** 20 RPM, 50 requests/day on free models; lifted to 1,000
  requests/day after a one-time purchase of ≥$10 in OpenRouter credits.
- **Models:** 25+ free, including Qwen3 Coder 480B, DeepSeek R1, Llama 3.3
  70B, Mistral Small 3.1, GPT-OSS 120B. The `openrouter/free` auto-router
  selects among them.
- **Caveat:** Free models may log prompts/completions to upstream providers;
  OpenRouter's docs explicitly do not recommend free models for production.
- **Docs:** <https://openrouter.ai/pricing>,
  <https://openrouter.ai/docs/api/reference/limits>

#### SambaNova Cloud

- **API:** OpenAI-compatible. API key auth.
- **Free budget:** 200,000 tokens/day total. RPM caps by model size: 30 (8B),
  20 (70B), 10 (405B). A separate $5 trial credit expires in 90 days but
  the rate-limited free tier persists.
- **Models:** Llama 3.1 8B/70B/405B, DeepSeek R1, Qwen 32B.
- **Use case:** Useful as a fallback or for occasional access to 405B-class
  models; daily cap is too small for serious agentic loops.
- **Docs:** <https://docs.sambanova.ai/docs/en/models/rate-limits>,
  <https://cloud.sambanova.ai/plans/pricing>

### Use with care or avoid for free-only programmatic use

#### Google AI Studio / Gemini API

- **Free budget:** After the April 1, 2026 changes, **Pro models are
  paid-only**. Free tier today: Gemini 2.5 Flash and 2.5 Flash-Lite, ~5–15
  RPM and 100–1,000 RPD per model, 250K TPM.
- **Caveat:** Free-tier prompts and outputs are used to improve Google
  products. This disqualifies the free tier for sensitive workloads or
  any agentic use where the data path matters.
- **Docs:** <https://ai.google.dev/gemini-api/docs/rate-limits>

#### GitHub Models

- **Free budget:** Tied to your GitHub Copilot plan. Copilot Free: 50
  premium requests/month plus 2,000 inline suggestions. From June 1, 2026
  the model shifts to monthly AI-credit allotments.
- **Caveat:** Docs explicitly mark the endpoints for prototyping and
  evaluation, not production. Token caps are small per model.
- **Docs:** <https://docs.github.com/billing/managing-billing-for-your-products/about-billing-for-github-models>

#### DeepInfra

- **Free budget:** $5/month recurring credit at standard per-token pricing
  — small but ongoing. Startup program offers up to 1B tokens for
  qualifying companies.
- **Docs:** <https://deepinfra.com/pricing>

#### Together AI

- **Free budget:** $25 trial credits plus an ongoing free tier covering ~68
  free-priced models with reduced concurrency. Capability ceiling on free
  models is lower than the paid catalog.
- **Docs:** <https://docs.together.ai/docs/billing-credits>

### Excluded — no usable ongoing free tier

- **Fireworks AI** — $1 starter credit, no permanent free token allowance.
- **Replicate** — pay-per-second-of-GPU-time only; no token-based free tier.

## 3. Recommendation: top five for first integration

Ranked on (a) ongoing free tier, (b) OpenAI-compatible API, (c) capability
sufficient for agentic dispatch, (d) terms permitting programmatic use:

1. **Cerebras Inference** — 1M tokens/day is the largest ongoing free
   budget on the market, with 70B-class models and the fastest latency.
   Primary path for agentic dispatch where context fits in 8K.
2. **NVIDIA NIM** — No daily token cap and 100+ models including reasoning,
   vision, embedding, and retrieval. Best breadth; the natural home for
   heterogeneous agent tools.
3. **Groq** — 14,400 requests/day at the fastest commodity tokens-per-second
   makes it ideal for latency-sensitive steps and tool-calling routers.
4. **Mistral La Plateforme** — 1 billion tokens per month is enormous; the
   1 RPS cap means it suits batch and background work rather than
   interactive loops.
5. **Hugging Face Inference Providers** — Smaller absolute budget, but as a
   *router* over the rest of the market, it yields the broadest model
   coverage from one integration. Best used as a fallback layer.

Honorable mentions in second-wave order: Cloudflare Workers AI (if your
infra already runs on Cloudflare), OpenRouter free (cheap fallback router
with broad menu), SambaNova (small daily cap but solid models). Avoid
GitHub Models, Gemini free tier, Together free, and DeepInfra free as
primary substrates — caps are too tight or terms too restrictive for
steady programmatic traffic.

## 4. Common integration shape

Every provider in the recommended tier — and the marginal Cloudflare,
OpenRouter, and SambaNova entries — speaks OpenAI's `/v1/chat/completions`
shape. A single client over `(base_url, api_key, model)` triples covers all
of them; per-provider rate-limit budgets and per-model capability claims
become the routing inputs.

A fallback chain across Cerebras → Groq → NVIDIA NIM → Hugging Face router
gives you a no-cost capability ladder for most agentic work, with provider
selection driven by which one has budget left in the current window. Keep
prompts portable: avoid provider-specific tool-call dialects in the hot
path so the same prompt can be retried against the next provider when the
first hits its limit.

## 5. Caveats and limitations

- **Free tiers expire or tighten.** Every provider on this list has revised
  limits at least once in the past twelve months. Verify before depending.
- **Programmatic agentic use is sometimes ambiguous in TOS.** Several
  providers describe their free tier as "for prototyping and evaluation."
  Steady programmatic traffic within rate limits has not been the subject
  of public enforcement actions to date, but the language leaves room for
  one.
- **Free-tier data may be retained or used for training.** Notably true of
  Google's free Gemini tier and (per their terms) some upstream partners
  routed through OpenRouter free. Sensitive workloads should pay for the
  paid tier or use a self-hosted alternative.
- **Free tiers are not a service-level commitment.** Latency, availability,
  and even model selection can change without notice. Production systems
  that depend on continuity should treat free-tier access as a fallback,
  not a primary.
- **Capability tiers and quotas are uneven.** A provider's "free 70B" is
  not necessarily comparable to another's "free 70B" — context windows,
  function-calling support, structured-output reliability, and instruction-
  following grade vary substantially across the list.

## 6. Sources

- [NVIDIA NIM API Explained: Free AI Inference in 2026](https://decodethefuture.org/en/nvidia-nim-api-explained/)
- [build.nvidia.com](https://build.nvidia.com/)
- [API Reference for NVIDIA NIM for LLMs](https://docs.nvidia.com/nim/large-language-models/latest/api-reference.html)
- [Groq Rate Limits docs](https://console.groq.com/docs/rate-limits)
- [Groq pricing](https://groq.com/pricing)
- [Cerebras Inference Rate Limits](https://inference-docs.cerebras.ai/support/rate-limits)
- [Cerebras pricing](https://www.cerebras.ai/pricing)
- [Gemini API rate limits](https://ai.google.dev/gemini-api/docs/rate-limits)
- [Gemini API pricing](https://ai.google.dev/gemini-api/docs/pricing)
- [Google Gemini free-tier April 2026 changes](https://help.apiyi.com/en/google-gemini-api-free-tier-changes-april-2026-guide-en.html)
- [OpenRouter pricing](https://openrouter.ai/pricing)
- [OpenRouter API rate limits](https://openrouter.ai/docs/api/reference/limits)
- [OpenRouter free models collection](https://openrouter.ai/collections/free-models)
- [Cloudflare Workers AI pricing](https://developers.cloudflare.com/workers-ai/platform/pricing/)
- [GitHub Models billing docs](https://docs.github.com/billing/managing-billing-for-your-products/about-billing-for-github-models)
- [GitHub Models — moving beyond free limits changelog](https://github.blog/changelog/2025-06-24-github-models-now-supports-moving-beyond-free-limits/)
- [Hugging Face Inference Providers pricing](https://huggingface.co/docs/inference-providers/pricing)
- [Hugging Face Inference Providers OpenAI-compatible changelog](https://huggingface.co/changelog/inference-providers-openai-compatible)
- [Mistral La Plateforme tier docs](https://docs.mistral.ai/deployment/ai-studio/tier)
- [Mistral pricing](https://mistral.ai/pricing)
- [Together AI billing/credits docs](https://docs.together.ai/docs/billing-credits)
- [SambaNova rate limits](https://docs.sambanova.ai/docs/en/models/rate-limits)
- [SambaNova Cloud pricing](https://cloud.sambanova.ai/plans/pricing)
- [DeepInfra pricing](https://deepinfra.com/pricing)
- [DeepInfra OpenAI-compatible docs](https://deepinfra.com/docs/openai_api)
- [Fireworks pricing](https://fireworks.ai/pricing)
- [Replicate pricing](https://replicate.com/pricing)

## Provisioning verification — 2026-05-04

When the captain enrolled in four of the five recommended providers (Cerebras, Groq, NVIDIA NIM, HuggingFace; Mistral skipped due to phone/billing requirement), the substrate hit each provider's `GET /v1/models` to confirm the surveyed model lineup against the live account view. The findings:

- **Cerebras** — drift. Survey lists "Llama 3.3 70B, Qwen3 32B, Qwen3 235B Instruct, GPT-OSS 120B." Live account exposes `gpt-oss-120b`, `llama3.1-8b`, `qwen-3-235b-a22b-instruct-2507`, `zai-glm-4.7`. Llama 3.3 70B and Qwen3 32B are gone; `llama3.1-8b` and `zai-glm-4.7` are new. The substrate's Cerebras endpoint record was retargeted to `llama3.1-8b` for the smoke-test smoke test pending a fuller rebuild.
- **Groq** — `llama-3.3-70b-versatile` confirmed in lineup; record correct as written. Lineup is broader than the survey claimed (now also serves `openai/gpt-oss-120b`, `meta-llama/llama-4-scout-17b-16e-instruct`, several Whisper variants, prompt-guard models).
- **NVIDIA NIM** — `meta/llama-3.3-70b-instruct` confirmed; record correct. Lineup is 138 models including Llama 4 Maverick, DeepSeek V4, Gemma 4, vision and code models. Most of these could profitably become their own endpoint records.
- **HuggingFace Router** — 129 models routed, including DeepSeek V4, Qwen 3.6, Kimi K2.6, Gemma 4, GLM 5.1, MiniMax M2.7. Record uses empty `model-name` (passed per call), so no drift.
- **Mistral** — not provisioned this round.

Net: the survey's *recommendation order* (Cerebras → Groq → NIM → HF → Mistral) holds; the *specific Cerebras model* it cites does not. Re-run this verification before any subsequent provisioning.
