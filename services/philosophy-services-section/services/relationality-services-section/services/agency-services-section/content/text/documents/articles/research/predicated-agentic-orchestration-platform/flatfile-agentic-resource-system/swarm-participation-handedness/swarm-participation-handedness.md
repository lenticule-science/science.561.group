---
name: swarm-participation-handedness
description: "Does the boundary fiber need a handedness coordinate to express directional asymmetry of swarm participation?"
type: question
class: harness-discipline
status: open
depends-on: [swarm, confederation, ../../teaching/explanations/boundary, ../../teaching/explanations/boundary-as-fiber]
see-also: [mcp-client-as-swarm-participant, routable-llm-endpoint-as-swarm-participant]
title: swarm-participation-handedness
---

# Does the boundary fiber need a handedness coordinate to express directional asymmetry of swarm participation?

The captain's described swarm includes at least three participation classes with structurally different handedness across the substrate's boundary:

- **Self-hosted FARS sovereign node** (e.g., the captain's laptop running its own FARS): bidirectional.
  Acts on its own substrate; participates in confederation as a federation peer; acts on other nodes' substrates via federation envelopes.
- **MCP/A2A-client cloud agent** (e.g., Claude on Android calling `quiescent.
  561.group/mcp/...
  `): inbound-only.
  The swarm exposes endpoints; the client dials in, authenticates, and operates on the swarm's substrate via dispatch.
  The client has no substrate of its own that the swarm reaches into.
- **Routable LLM endpoint** (e.g., Nvidia cloud free tier): outbound-only.
  The swarm dispatches inference requests to the endpoint; the endpoint replies; the endpoint never initiates.

The [boundary-as-fiber](../../scope/boundary-as-fiber/boundary-as-fiber.md) narrative says the boundary is composed from identity + office + location + mode + scope-policy.
None of these coordinates is *directional* in the sense above — they characterize *what an actor sees* at the boundary, but they do not characterize *which way activity flows across* the boundary.

The question: is the directional handedness of cross-boundary activity a separate coordinate of the boundary fiber, or is it derivable from the existing coordinates?

## Candidate readings

1. **Handedness is derivable.** *Office* and *scope-policy* together encode what activity an actor can initiate vs. only respond to.
  A cloud-agent's office grants only `respond-to-dispatched-call`; an LLM endpoint's office grants only `answer-inference-call`; a sovereign node's office grants both initiation and response.
  Derivability would mean handedness is already in the fiber, just not made explicit.

2. **Handedness is a new coordinate.** The fiber composition factors as `identity + office + location + mode + scope-policy + handedness`, where handedness is one of `{inbound-only, outbound-only, bidirectional}`.
  This is a category-theoretic move: the fiber's base extends.

3. **Handedness is a property of the *boundary*, not the actor.** Each boundary has a fixed handedness; the actor's role at that boundary is determined by which boundary they cross.
  A sovereign node has a boundary-pair (one inbound, one outbound) for each peer; an MCP-server endpoint has only an inbound boundary; an LLM-endpoint has only an outbound boundary.

The third reading is the cleanest in some respects: it puts handedness on the boundary substrate-record itself, not on the fiber composition.
But it raises a coherence question: what does it mean for an actor's view to be the *fiber composition* at a boundary if the boundary is itself the source of one of the composition's coordinates?

## Why this matters for the *Harness surfaces & interfacers* section

The promised section's "extract/apply/compose" interfacer operations are typed differently depending on the boundary's handedness:

- *Inbound-only boundary*: `extract` is the substantive operation (parse incoming request → predications); `apply` is response-shaped; `compose` is response-fan-out.
- *Outbound-only boundary*: `apply` is the substantive operation (project request from predications → outbound call); `extract` is response-parsing.
- *Bidirectional*: all three are substantive; the counit law is the constraint that round-trips compose to identity.

If the section's typing is uniform — three operations, regardless of boundary — then handedness must enter as a parameter or as a kind-restriction on the operations.
If the section's typing is handedness-aware, then the boundary fiber must expose handedness somehow.
Either way, the question must be answered before the section is drafted coherently.
