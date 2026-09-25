---
name: routable-llm-endpoint-as-swarm-participant
description: "What kind of substrate-thing is a routable external LLM endpoint?"
type: question
class: harness-discipline
status: open
depends-on: [swarm, sovereign-node, ../../../../teaching/explanations/cost-discipline, ../../teaching/explanations/dispatch]
see-also: [mcp-client-as-swarm-participant, endpoint-as-outbound-swarm-participant, monetary-cost-as-quantale-extension, rate-limit-as-time-windowed-availability-predication, ../../../../teaching/explanations/interfacers-and-cost-settlement]
title: routable-llm-endpoint-as-swarm-participant
---

# What kind of substrate-thing is a routable external LLM endpoint?

The motivating concrete case: the captain wants the swarm to call out to free-tier LLM endpoints (Nvidia cloud free tier, OpenRouter free tier, etc.) for inference, choosing among them based on cost, capability, and rate-limit availability so that work-per-second-at-lowest-cost-to-swarm is maximized.
These endpoints are *not* swarm members in the same sense as a Claude-Android-MCP-client (the directionality is opposite — the swarm calls them, they don't call the swarm).

What is a routable LLM endpoint in FARS terms?

It is *not* a [sovereign node](../architecture/sovereign-node/sovereign-node.md), *not* a [confederation](../architecture/confederation/confederation.md) peer, *not* an actor crossing a boundary inbound.
It is an *outbound dispatch target*: when a swarm member's settling needs LLM inference, the dispatch chooses among available endpoints and fires an inference request; the endpoint replies with a completion; the completion enters the substrate as the agent's output.

Per [cost-discipline](../../../../../../../../../../../../../../../engineering-services-section/content/text/glossary/concepts/cost-discipline.md), reads are free and only settling pays.
Calling out to an external LLM endpoint is part of an agent's settling work — the cost is real, denominated in the [Lawvere quantale](../../../../../../../../../../../../../../../engineering-services-section/content/text/glossary/concepts/cost-composition-via-lawvere-quantale.md) at `[0, ∞]`, and the cost-composition-by-addition discipline says the cheapest path is the minimum.

If the substrate is to choose among heterogeneous endpoints by cost, capability, and availability — which the captain wants — then the substrate must *know about* the endpoints in some form.

## Candidate answers

1. **`LLMEndpointRecord` as substrate object.** Each routable endpoint is a substrate entity with predications declaring its identity (provider, model name), its cost (per-token-input, per-token-output, in the cost-discipline's quantale), its capability (context-length, modalities, instruction-following grade), its availability (rate-limits, current-window-budget).
  [Dispatch](../../teaching/explanations/dispatch.md) chooses among them via twist-product fusion of work-requirements against endpoint-predications.
  Cost is settled per call into the substrate's cost ledger.

2. **Endpoints are configuration, not substrate.** The endpoints are runtime-level concerns invisible to the substrate.
  An agent's runtime chooses among them by some external policy; the substrate sees only the agent's settled output, not which endpoint produced it.
  This makes endpoints simpler to manage but loses substrate-level cost visibility.

3. **Hybrid.** Endpoints are configuration *for the runtime* but the *cost of calling each* is recorded in the substrate as cost-witnesses on each settle-event.
  The substrate doesn't choose, but it accumulates cost-history that can inform future choice.

The first reading is the only one that lets the substrate's discipline (cost-composition, dispatch, federation) reach the endpoint-routing concern.
The second loses the lever the captain wants.
The third is a halfway-house that may not be stable — once cost is in the substrate, the urge to make dispatch use it will be strong.

## Open sub-questions

Each sub-question has been split out to its own note with candidate readings; pointers below.

- *Are the endpoints federation-graph members of the swarm in any meaningful sense?* They are not sovereign nodes, but they *receive* something (the inference call) and *return* something (the completion).
  If they were treated as a degenerate kind of confederation peer with restricted protocol (no admit, only answer), would that simplify or complicate the discipline? — see [endpoint-as-outbound-swarm-participant](../endpoint-as-outbound-swarm-participant/endpoint-as-outbound-swarm-participant.md).
- *Does the cost-discipline's quantale extend cleanly to dollar-denominated cost (which is what API-tier costs are denominated in)?* The current cost-discipline is closure-iteration-cost.
  The captain's "lowest-cost-to-swarm" concern is closer to monetary cost.
  The quantale arithmetic is the same shape (addition for composition, min for choice), but the units differ.
  Is this one cost dimension or two? — see [monetary-cost-as-quantale-extension](../monetary-cost-as-quantale-extension/monetary-cost-as-quantale-extension.md).
- *How does rate-limit availability fit in the substrate's algebra?* Rate limits are time-windowed, which the heartbeat discipline already handles for internal scheduling, but dispatch-to-external-endpoint involves an external state the substrate cannot directly observe. — see [rate-limit-as-time-windowed-availability-predication](../rate-limit-as-time-windowed-availability-predication/rate-limit-as-time-windowed-availability-predication.md).

## What this question waits on

Same as [mcp-client-as-swarm-participant](../mcp-client-as-swarm-participant/mcp-client-as-swarm-participant.md): the FARS *Harness surfaces & interfacers* spec section, plus a possible extension of [cost-discipline](../../../../../../../../../../../../../../../engineering-services-section/content/text/glossary/concepts/cost-discipline.md) to multi-dimensional cost (settle-cost vs. monetary-cost vs. rate-limit-budget).
