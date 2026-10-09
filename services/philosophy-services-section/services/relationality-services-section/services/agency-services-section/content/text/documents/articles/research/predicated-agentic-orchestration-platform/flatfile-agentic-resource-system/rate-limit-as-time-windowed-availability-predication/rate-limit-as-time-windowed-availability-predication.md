---
name: rate-limit-as-time-windowed-availability-predication
description: "How does rate-limit availability fit in the substrate's algebra?"
type: question
class: dispatch-discipline
status: candidate-answers-drafted
depends-on: [../../teaching/explanations/heartbeat, ../../teaching/explanations/dispatch, ../../../../teaching/explanations/cost-discipline]
splits-from: routable-llm-endpoint-as-swarm-participant
see-also: [routable-llm-endpoint-as-swarm-participant, endpoint-as-outbound-swarm-participant, monetary-cost-as-quantale-extension]
title: rate-limit-as-time-windowed-availability-predication
---

# How does rate-limit availability fit in the substrate's algebra?

Sub-question 3 of [routable-llm-endpoint-as-swarm-participant](../routable-llm-endpoint-as-swarm-participant/routable-llm-endpoint-as-swarm-participant.md).
Rate limits at free-tier endpoints are *time-windowed external state*: the provider tracks a request-counter and a token-counter on its side of the boundary; the counters reset at provider-defined intervals; the substrate cannot directly observe the counter values.
Yet the dispatch needs to know whether an endpoint has budget remaining before sending the request, or it will burn cost-fuel only to receive a 429.

The [heartbeat](../../teaching/explanations/heartbeat.md) discipline already handles time-windowed scheduling for *internal* settling.
The question is how the substrate represents an *external* time-windowed counter that it must track without observing.

## What the substrate has access to

Three signal classes:

- **Self-tracked usage.** Every dispatch call against an endpoint is a substrate-observable event.
  The substrate can maintain its own counter of requests-sent and tokens-spent within each rate-limit window, replenished on the heartbeat tick at window-boundary cadence.
- **Provider-returned headers.** Several providers (Groq, NVIDIA NIM, OpenAI-compatible upstreams) return `x-ratelimit-remaining-requests` / `x-ratelimit-remaining-tokens` on every response.
  When present, these are authoritative — the provider's side of the counter, communicated to the substrate at no additional cost.
- **Failure responses.** A 429 with a `retry-after` header is the strongest signal; the endpoint is unavailable until at least the indicated time.
  A 429 without `retry-after` is a "back off some unspecified amount."

## Candidate readings

1. **External observation only (reactive).** The substrate maintains no rate-limit predication.
  It dispatches blindly; on 429, the [diagnoser](../../dispatch/dispatch-as-closure-rule-system/dispatch-as-closure-rule-system.md) emits a `rate-limited` finding; subsequent dispatches avoid the endpoint until a cooldown expires.
  Reactive, simple, but burns cost-fuel on every limit-hit.

2. **Substrate-side conservative ledger (proactive).** The substrate maintains its own rate-limit accounting per endpoint as a time-windowed predication.
  Each dispatch decrements the ledger; the heartbeat replenishes at window-boundary; dispatch refuses when the ledger is exhausted, before sending.
  Proactive, but conservative — the substrate's counter can drift below the provider's actual remaining count if the substrate cannot observe its own past calls accurately (e.g., across substrate restart, missed witnesses).

3. **Hybrid: substrate ledger as floor, provider-headers as eager updates.** Maintain (2) as the substrate's self-sovereign account.
  When the provider returns rate-limit headers, eagerly update the ledger to the header's value.
  When a 429 arrives, force the ledger to zero with cooldown derived from `retry-after`.
  When the provider returns no rate-limit headers, fall back to the substrate's own counter.
  The ledger is the *belief*; provider signals are *evidence* updating that belief.

## Recommended reading: (3)

The hybrid is substrate-native because the predication-categories machinery treats the rate-limit-budget as exactly the kind of time-windowed observation the tracking stage produces:

> Tracking is the stage that produces observation entities — claims about the current state and metrics of work — without altering the work entities themselves.
> (...)
> The fiber is cyclically rebuilt — observations have `observed-at` timestamps, and a tracking-status query re-runs at each cadence.

Rate-limit budgets are [tracking](../../../../../../../../../../../../../social-science-services-section/services/sociology-science-services-section/services/work-science-services-section/content/text/glossary/terms/tracking.md)-stage predications on endpoint records:

```yaml
<endpoint-id>:
  rate-limit-budget:
    - window-start: 2026-05-04T14:00:00Z
      window-duration: PT1M
      max-requests: 30
      requests-used: 12
      max-tokens: 6000
      tokens-used: 4200
      observed-at: 2026-05-04T14:00:42Z
      observed-via: provider-header  # or self-counted, or 429-forced-zero
```

The dispatch consults the most recent observation that's still in-window via the same walk-most-recent-first pattern that execution uses to read task state from execution-events.
Old observations decay naturally — a window passes, the predication is no longer in-window, the dispatch reads the next observation or treats the budget as fresh-replenished.

The substrate's *belief* about availability is bilattice-graded: observations from provider-header carry high evidence; self-counted observations carry medium evidence (substrate's count may diverge from provider's); cooldown-forced observations from a 429 carry maximum evidence (the provider has *told* us we're at zero) and maximum truth on `at-zero`.
Dispatch's eligibility filter uses the belief: an endpoint with high-evidence-zero-budget is excluded; an endpoint with medium-evidence-some-budget is eligible; an endpoint whose budget observation is older than the window is treated as fresh.

This sits cleanly inside the substrate algebra without requiring the substrate to observe external state.
The substrate observes its own dispatch events and the responses it admits across the boundary; rate-limit availability is *derived* from those observations via a closure rule, not magicked into existence.

## Why "external state" is the wrong frame

The original sub-question framed rate-limit as "external state the substrate cannot directly observe."
That framing makes the problem look intractable.
But the substrate has never required direct observation of external state — it has always derived its world-model from boundary admissions.
The provider's rate-limit counter is no different from the weather: the substrate doesn't observe the temperature, it admits weather-forecast predications signed by trusted sources, and reasons under bilattice-graded uncertainty about the actual temperature.

Rate-limit availability is the same shape: the substrate admits observations from the boundary (response headers, 429s, its own dispatch counts) and reasons over them in the predication algebra.
There is no special category "external state I cannot observe" — there are only predications with varying evidence and varying age, walked at dispatch time per the existing tracking-stage discipline.

## What this resolves and what it leaves open

Resolves the sub-question: rate-limit budget is a tracking-stage predication on the endpoint, derived from observations the substrate makes at the boundary, consulted by dispatch via the same walk-most-recent-first pattern execution uses to read task state.

Leaves open: the engineering decision of *which channel* the rate-limit observations land on.
Per the working answer to the channels question (six sublocales of the event log, one per work-spoke), rate-limit observations are tracking-stage and land on the `track` channel.
But rate-limit observations are also relevant to dispatch (they feed the eligibility filter); the channel decomposition's coherence requires that dispatch-stage reads can walk to track-channel observations cleanly.
That's a substrate-engineering detail to verify when the channel split is implemented; it does not change the answer above.
