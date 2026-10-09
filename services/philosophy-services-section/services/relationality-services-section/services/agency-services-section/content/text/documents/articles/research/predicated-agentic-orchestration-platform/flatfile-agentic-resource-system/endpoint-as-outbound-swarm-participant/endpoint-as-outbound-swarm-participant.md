---
name: endpoint-as-outbound-swarm-participant
description: "Are routable LLM endpoints federation-graph members, or some degenerate kind of confederation peer?"
type: question
class: harness-discipline
status: candidate-answers-drafted
depends-on: [swarm, confederation, ../../teaching/explanations/boundary, swarm-participation-handedness, mcp-client-as-swarm-participant]
splits-from: routable-llm-endpoint-as-swarm-participant
see-also: [routable-llm-endpoint-as-swarm-participant, ../../teaching/explanations/boundary-as-fiber]
title: endpoint-as-outbound-swarm-participant
---

# Are routable LLM endpoints federation-graph members, or some degenerate kind of confederation peer?

Sub-question 1 of [routable-llm-endpoint-as-swarm-participant](../routable-llm-endpoint-as-swarm-participant/routable-llm-endpoint-as-swarm-participant.md).
The parent question asks what kind of substrate-thing a routable external LLM endpoint is.
This sub-question asks specifically: an endpoint *receives* something (an inference call) and *returns* something (a completion); does that minimal protocol qualify it as a degenerate kind of [confederation](../architecture/confederation/confederation.md) peer with restricted protocol (no admit, only answer)?

## What rules out "confederation peer"

Per [confederation](../architecture/confederation/confederation.md), confederation peers are *sovereign nodes*: each peer owns its own substrate, event log, rule-system version, and admits envelopes per its own governance.
A free-tier LLM endpoint has none of these:

- No substrate.
  The endpoint does not maintain a flatfile, has no event log we can replay, and exposes no rule-system version.
- No federation envelopes.
  The protocol is request/response, with the endpoint always in the responder role; envelopes presuppose bidirectional admission with signed-witness authentication.
- No governance over admission.
  The endpoint admits inference requests under whatever rate-limit and TOS the provider has unilaterally set, not under a discipline FARS substrates can examine or interoperate with.

The phrase "degenerate confederation peer" is a category error.
The peer-record relation in FARS encodes another *sovereign node's* identity and trust; an endpoint has no analogous identity within FARS's federation algebra.
Trying to make endpoint-records inhabit the peer slot would force violations of the per-node-sovereignty invariant for no algebraic gain.

## What "outbound-handed swarm participant" gets right

Per [swarm](../architecture/swarm/swarm.md), the swarm is the agential population at one sovereign node, and it explicitly admits "humans, code, LLM, hybrid" — the swarm is not bounded to one runtime class.
Per [mcp-client-as-swarm-participant](../mcp-client-as-swarm-participant/mcp-client-as-swarm-participant.md) candidate 3, the cleanest substrate-shape for a non-native participant is *agent-record + boundary*: an `AgentRecord` (or specialization) names the participant for attribution and dispatch; the boundary fiber handles admissibility.

Per [swarm-participation-handedness](../swarm-participation-handedness/swarm-participation-handedness.md), the third participation class is *outbound-only*: the swarm dispatches to the participant; the participant never initiates.
An LLM endpoint sits exactly there.

The combined reading: an endpoint is an outbound-handed swarm participant, recorded as an `LLMEndpointRecord` (a specialization of `AgentRecord`) in the sovereign node's flatfile, dispatched to via the existing dispatch algebra, returning completions that the substrate admits as the dispatcher's settled output.

## Candidate readings

1. **Endpoint as outbound-handed swarm participant via `LLMEndpointRecord`** — recommended below.
  Endpoints inherit the agent-record discipline (predications declaring identity, capability, cost, rate-limit budget) but are restricted to outbound handedness at the boundary.
  Confederation is not invoked.

2. **Endpoint as boundary-only traversal, no agent-record.** The endpoint is *only* a boundary; the dispatcher's settling action contains the call, and the endpoint has no substrate-recorded identity.
  Drawback: the dispatch algebra needs targets it can compose with; without an agent-record-like entity carrying capability and cost predications, the substrate cannot answer "which endpoint is best for this work?" without consulting runtime configuration external to the substrate.
  Loses cost-discipline visibility.

3. **Endpoint as degenerate confederation peer with restricted protocol.** Ruled out above; included for completeness.
  Forces the peer-record relation to carry sovereign-node-shaped slots that endpoints cannot fill, breaking the per-node-sovereignty invariant of confederation.

## Recommended reading: (1)

Record each routable endpoint as an `LLMEndpointRecord` — a specialization of `AgentRecord` whose frontmatter declares:

- *Identity*: provider, model name, model version, base URL, auth-env-var name.
- *Capability predications*: `provides-capabilities`, `work-types`, `context-window-tokens`, `supports-tool-calling`, `supports-structured-output`.
- *Cost predications*: `cost-per-token-in`, `cost-per-token-out`, `monthly-budget-tokens` (in the cost quantale per the recommended reading of [monetary-cost-as-quantale-extension](../monetary-cost-as-quantale-extension/monetary-cost-as-quantale-extension.md)).
- *Availability predications*: `rate-limit-rpm`, `rate-limit-tpd`, `rate-limit-tpm` (in the time-windowed predication form per the recommended reading of [rate-limit-as-time-windowed-availability-predication](../rate-limit-as-time-windowed-availability-predication/rate-limit-as-time-windowed-availability-predication.md)).
- *Handedness*: `handedness: outbound-only` — fixed, not a per-call choice.

The handedness coordinate is what the candidate readings of [swarm-participation-handedness](../swarm-participation-handedness/swarm-participation-handedness.md) need to exist somewhere; reading 3 of that question (handedness-as-boundary-property) and reading 1 (handedness-derivable-from-office) both project onto the `LLMEndpointRecord` cleanly — the record's office grants only `answer-inference-call`, which is outbound-only by the office's own scope.

Dispatch routes work to endpoints by `office ⊙ task-requirement` exactly as it does for human or code agents; the only specialization is that the dispatch settle-action for an endpoint *is* the HTTPS call, with the response parsed into substrate predications via the boundary's `extract` operation.

## What this resolves and what it leaves open

Resolves the original sub-question: endpoints are not confederation peers, neither in the standard nor in any degenerate sense.
They are outbound-handed swarm participants.

Leaves open (depends on resolution of [swarm-participation-handedness](../swarm-participation-handedness/swarm-participation-handedness.md)): whether `handedness: outbound-only` is a first-class fiber coordinate, a derived projection of office + scope-policy, or a property of the boundary the endpoint is reached through.
The recommended reading above is consistent with all three answers to the handedness question, so endpoint-record frontmatter does not need to wait on that resolution; whichever reading the captain picks for handedness will project compatibly onto endpoint records.
