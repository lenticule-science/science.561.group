---
name: mcp-client-as-swarm-participant
description: "What kind of substrate-thing is an MCP/A2A-client cloud agent?"
type: question
class: harness-discipline
status: open
depends-on: [swarm, sovereign-node, confederation, ../../teaching/explanations/boundary, ../../../../../web-server-platform/objects/endpoint-record, ../../../../../web-server-platform/concepts/bearer-token]
see-also: [routable-llm-endpoint-as-swarm-participant, ../../teaching/explanations/boundary-as-fiber]
title: mcp-client-as-swarm-participant
---

# What kind of substrate-thing is an MCP/A2A-client cloud agent?

The motivating concrete case: a captain voice-chats with Claude in the Android app. Claude (running on Anthropic's infrastructure, reachable only via the captain's session in the cloud chat surface) makes MCP tool-calls to `quiescent.
561.group/mcp/<endpoint>`, with bearer-token authentication.
The MCP calls operate on the FARS sovereign node at Quiescent — admitting events, querying the substrate, dispatching agents.

What is the cloud-agent in FARS terms?

It is *not* a [sovereign node](../architecture/sovereign-node/sovereign-node.md): it does not run FARS, has no event log, has no rule-system version, has no flatfile substrate.
It is therefore not a peer in any [confederation](../architecture/confederation/confederation.md): no federation envelopes flow between the cloud-agent and the Quiescent node.

It is *not* a member of Quiescent's [swarm](../architecture/swarm/swarm.md) in the strict definitional sense: the Quiescent swarm is the population of `AgentRecord`s in Quiescent's own flatfile.
The cloud-agent has no `AgentRecord` at Quiescent — its behavior is determined by Anthropic's runtime, not by Quiescent's substrate.

But it *is* an actor crossing Quiescent's boundary.
Per [boundary-as-fiber](../../scope/boundary-as-fiber/boundary-as-fiber.md), the boundary is composed from identity + office + location + mode + scope-policy; whatever the cloud-agent sees at Quiescent is determined by the boundary fiber, not by the MCP transport.
The cloud-agent is authenticated (bearer-token), its requests are dispatched to Quiescent agents, its writes are admitted as events under whatever actor-identity its bearer-token resolves to.

## Candidate answers

1. **The cloud-agent has an `AgentRecord` at Quiescent** representing the *external authenticated client*, distinguished from native-agents by its `kind: external-mcp-client`.
  Then the swarm's definition stays clean: the swarm is the `AgentRecord` population, and external clients show up as a sub-population whose runtime is "out there" rather than "in here."
  The bearer-token's principal resolution determines which `AgentRecord` is invoked.

2. **The cloud-agent is *not* a swarm member; it is a [boundary](../../teaching/explanations/boundary.md) traversal.** The bearer-token resolves to an actor-identity, which the boundary fiber composes; the actions the cloud-agent invokes are performed by Quiescent's native dispatch on behalf of the authenticated principal.
  The cloud-agent is a *client*, not a *member*.

3. **Both, depending on register.** The cloud-agent is a swarm member when the substrate needs a stable identity to attribute its activity to (witness chain, audit, attribution).
  It is a boundary traversal when the substrate needs to enforce admissibility (authorization, scope, mode).
  The two registers are not redundant — they answer different substrate-level questions.

The third reading is the most likely correct one given AgOP's existing discipline (witness for attribution, boundary for admissibility), but it imposes the requirement that an `AgentRecord` exist for *every* externally-authenticated principal that ever crosses the boundary.
The administrative cost of that may be acceptable (creating an agent record is cheap) or may be a smell (it would mean any browser session creates substrate detritus).

## Cross-reference to A2A

The same question applies to A2A (Agent-to-Agent) protocol clients.
The structural answer should be the same regardless of whether the inbound transport is MCP or A2A, because per [boundary-as-fiber](../../scope/boundary-as-fiber/boundary-as-fiber.md) the transport renders the boundary, it does not constitute it.

## What this question waits on

The FARS *Harness surfaces & interfacers* spec section (still to write per [`_index.md`](../_index.md)).
That section's promised content — "boundary-as-fiber-composition, transport-independence, the three interfacer operations (extract/apply/compose), the counit law, the cost settlement path" — is exactly the material this question's answer will be a corollary of.
