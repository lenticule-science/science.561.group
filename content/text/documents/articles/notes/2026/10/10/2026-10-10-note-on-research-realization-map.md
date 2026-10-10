---
title: "Research realization map, 2026-10-10"
description: "Which Lenticule Science research is realized in Red Cup Engineering code that machines run, which is not, and the ranked requirements written for what is not."
date-created: 2026-10-10
type: note
keywords:
  - research-realization
  - swarm-theory
  - known-intermittent
  - requirements
status: map
---

# Research realization map, 2026-10-10

The founder asked that the Group's code fabrication systems realize "every best idea and research we have." The founder's words in earlier sessions name the gap: "This repo has *WORLD CLASS* research on hofheldian rights. and drone swarms. and CRDT merging. … you are not making them work like how the theory says they must" (2026-09-03), and "we need to realize, use-and-improve the existing theory/research we have on this" (2026-10-09).

This map pairs each concrete research claim with the code that realizes it. A claim is *realized* when a package pinned by Cold Red Gate (`emsenn/cold-red-gate` `sources.json`) carries code and a test for it. Status is read from identifiers and tests at `red-cup-engineering/computer-services-section` `6f3183f` and `red-cup-engineering/computer-data-services-section` `56aa419`.

## Swarm theory (predicated agentic orchestration platform)

Research: `services/philosophy-services-section/services/relationality-services-section/services/agency-services-section/content/text/documents/articles/research/predicated-agentic-orchestration-platform/`.

| Claim | Realized by | Status |
|---|---|---|
| merge-peer: idempotent, commutative, associative, monotone union | feltos-enterprise-host `work-replication.mjs` `mergeMoves`; computer-system-engine `journal/exchange.mjs` `mergeSettlementTransfer`; signcell `merge` | Realized |
| A sovereign node's outbound envelopes accumulate and are delivered on rejoin | `shipWorkSince` ledger; `catchUpOutcome` holds an away known-intermittent peer | Realized for push |
| Absence reads ⊥, refusal reads f | `deliveryAway` separates away from refused | Realized for one delivery; no persisted reading |
| PeerRecord holds the peer's signing key; a colony that cannot be dialed is still verified | computer-system-engine `systemNodeDeclaredPeerKeys`, `SYSTEM_NODE_PEER_KEYS` | Realized by the `pinned-peer-keys` change (requirement `swarm-peer-verified-by-declared-key`) |
| replay-from-peer: a node requests, admits and merges what it lacks | computer-system-engine `/settlement/pull`, `system-federate --pull` | Realized at the settlement layer by the `replay-from-peer` change (requirement `swarm-replay-from-peer`); the work-board pull is not built |
| One PeerRecord per federation-graph entry: work peers are a set | — | Unrealized (requirement `swarm-work-peers-as-a-set`; see also computer-services-section#144) |
| Failure detection as bilattice modal suspicion: ⊥ until θ, suspicion only forward | — | Unrealized (requirement `swarm-peer-liveness-forward-only-suspicion`) |
| Federation trust as bilattice-graded: silence never writes f | — (no trust store exists) | Unrealized (requirement `swarm-silence-never-writes-false-trust`) |
| Handedness is a property of the boundary | organizing `agency/organs.mjs` for bearers only | Partial (requirement `swarm-transport-handedness`) |
| merge-peer re-settles under the receiver's rules | `work-replication.mjs` re-admits under the move's recorded edition | Deliberate divergence; needs a ruling |

## Other sections, highest-value unrealized claims

Each has a requirement record in its owning engineering section in `emsenn/bare-cedar-fog`.

| Research | Claim | Requirement |
|---|---|---|
| agential-semioverse `error-envelopes.md` | "Every envelope carries a correlation identifier" | `refusal-envelope-carries-code-category-correlation` |
| 2026-10-02 note on more than a clock (E26) | Late valid-time correction | `eavt-rows-carry-valid-time` |
| logic `predication-canonical-firing-trajectory-via-lex-order.md` | "selects a *unique* sequence" | `closure-rules-fire-in-lex-canonical-order` |
| computer science, 2026-04-01 human-change reconciliation | "Diff the repo against the last known state" | `session-start-human-change-reconciliation` |
| 2026-06-25 sheaf evidence fusion | "which source is lying?" | `evidence-fusion-blames-the-inconsistent-source` |
| obsmetrologia-computing context transport | descent to the actor quotient | `actor-identity-descent-is-checked` |
| relationality `check-noninterference.md` | noninterference across channels and ports | `information-flow-noninterference-checked` |
| semiotics `accountable-agentic-newsrooms.md` | correction as dependency invalidation | `newswire-correction-invalidates-dependents` |
| hearing access `RESEARCH-PROGRAM.md` | antiphasic DIN carries more routing information | `din-assay-supports-antiphasic-presentation` |

## Already realized elsewhere (sample)

Term-to-filepath codec, RMN/SEN admission, RWIL entropy, proof-carrying synchronization, arena reachability, Obsmetrologia band/CALM/work arena (with Lean golden vectors), charter tiers, meaningful human control, attention allocation, pool cycle, Myrheim–Meyer dimension, Lawvere Laplacian and CRDT/CALM cohomology.

## Coverage limits

Nine science submodules are not initialized in this repository's checkout (math, knowledge, materials, media, games, communicating, ecological, social-services, nested computer science). Math and knowledge were read from their bare-cedar-fog copies; the rest remain to be mapped.
