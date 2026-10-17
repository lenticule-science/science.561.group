---
title: "Note on capabilities and federation between MetroPlat nodes"
date-created: 2026-10-09
description: "The Group's held theory of capabilities (authority as a witnessed, attenuable, four-valued standing over a journal) and of federation (the substrate's algebra is the protocol, carried on ActivityPub++ between Semioverse nodes), how it meets and exceeds object capabilities and Spritely Goblins, and a measurement of Bare Cedar Fog and Cold Red Gate against it on 2026-10-09."
keywords:
  - capability
  - object-capability
  - capability-assertion
  - spritely
  - goblins
  - ocapn
  - captp
  - federation
  - activitypub-plus-plus
  - semioverse
  - work-peer
  - metroplat
provenance:
  authors:
    - bare-cedar-fog-claude (senior-scientist)
    - claude-sonnet-5-5
  received-under: lib/emsenn/services/561-group/services/science-services-section/lib/agency/skills/research/SKILL.md
  allocation: Leader, 2026-10-09, relayed by Hai Jian (bare-cedar-fog-claude) under the standing direction to address the debts assigned across the 2026-10-07..09 sessions
  consumer: lib/emsenn/services/561-group/services/engineering-services-section/services/computer-engineering-services-section/services/computer-networking-engineering-services-section/services/object-capability-services-section/content/text/documents/articles/specifications/2026-10-09-requirements-for-capability-bearing-federation.md
---

Path aliases used below. `S` is `lib/emsenn/services/561-group/services`.
`ENG` is `S/engineering-services-section/services/computer-engineering-services-section`.
`NET` is `ENG/services/computer-networking-engineering-services-section`.
`SYS` is `ENG/services/computer-systems-engineering-services-section`.
`HOST` is `SYS/services/agent-computer-system-engineering-services-section/services/multi-agent-computer-system-engineering-services-section/services/multi-agent-computer-platform-engineering-services-section/apps/feltos-enterprise-host`.
`APS` is `NET/services/activitypub-services-section`.
`CSCI` is `S/science-services-section/services/engineering-science-services-section/services/computer-science-services-section`.
`DATA` is `S/561-group-services-section/data`.

## The Leader's statements

The Leader, 2026-10-09: "WE HAVE ... RFC THAT BEATS OCAPS AND ALL THAT WHERE ... IS ALL OUR KNOWLEDGE AND WHY IS OUR KNOWLEDGE NOT SETTLING INTO SPECS AND CODE"; "WE PLANNED OUT AND SPECIFIED TO MEET THEN BEAT SPRITELY ... WHY DO WE HAVE 500000 DIFFERENT WEB SERVERS THAT NONE PLAY TOGETHER ... WHERE IS OUR FEDERATION".

Taken as theory, these say four things. The Group holds a capability model that meets and then beats object capabilities and Spritely. That model is meant to be written as a specification in RFC form. The Group's servers are meant to be nodes of one federation. Knowledge that is held in notes is meant to settle into specifications and then code.

## Where the knowledge is

The house holds the capability and federation theory in these records. Each is read in full for this note.

| Record | What it holds |
|---|---|
| `NET/src/object-capability/index.mjs` (614 lines) | the authority algebra: object capabilities, capability views, assertions (grant, attenuate, delegate, revoke, present), standing, principal standing, authority decisions, UCAN-shaped delegation |
| `NET/src/object-capability/captp/index.mjs` (1,587 lines) | CapTP as pure values: sturdyrefs, deliveries, pipelines, authority graphs, causal cuts, vat tables, handoff gifts, sessions, transcripts, libp2p transport projection |
| `NET/src/object-capability/macaroons.mjs`, `wasi.mjs` | macaroon caveats and WASI preopens read as capability views |
| `NET/services/object-capability-services-section/services/ocapn-sturdyref-admission-service` | a standalone service that mints and admits `urn:ocapn:sturdyref:` references |
| `SYS/apps/computer-system-engine/src/rpc/capability-assertions.mjs`, `dispatch.mjs` | the journal feed that stores assertions and the dispatch seam that conjoins an operation's availability with the subject's standing |
| `CSCI/content/text/documents/articles/notes/2026/08/29/2026-08-29-note-on-the-capability-operating-system-lineage.md` | the capability-OS lineage from Dennis and Van Horn to CHERI, what the Group adds to it, and six things to take from it |
| `CSCI/content/text/documents/articles/notes/2026/06/25/2026-06-25-ucan-as-capability.md` | UCAN as the portable envelope of the one capability carrier |
| `S/science-services-section/content/text/documents/articles/notes/2026/07/25/2026-07-25-capcell-the-ap-evm-standard-for-agentic-orchestration.md` | capability as a product unit: the Capability Cell, its identity and its bound faces |
| `S/engineering-services-section/content/text/documents/articles/notes/2026/03/21/2026-03-21-note-on-federation-as-substrate-join.md`, `.../2026/06/20/2026-06-20-federation-trust-as-bilattice-graded.md`, `.../2026/06/05/2026-06-05-seam-federation-distribution.md`, and the concepts `federation-convergence`, `federation-envelope`, and the term `federation-bridge` | the federation theory |
| `S/engineering-services-section/content/text/glossary/terms/semioverse.md`, `moose.md` | the network, its nodes and its intended server |
| `APS/content/text/documents/articles/specifications/2026-09-27-specification-of-activitypub-plus-plus.md`, `.specification.json`, `draft-emsenn-activitypub-plus-plus-00.xml` | the RFC: the ActivityPub++ profile, as an Internet-Draft in RFC XML |
| `HOST/src/work-replication.mjs`, `HOST/src/federated-work.mjs` | work-peer replication between nodes |
| `SYS/apps/computer-system-engine/src/rpc/node.mjs`, `scripts/system-federate.mjs` | node discovery, receipt-only arrivals and the settlement exchange |
| GitHub `emsenn/2026-08-01-animating`, `src/writing/activitypub/capability.mts:1-20` and `src/writing/captp/index.mts:1-40` | the origin of the capability carrier, written against OCapPub and Spritely |

The RFC the Leader names is `draft-emsenn-activitypub-plus-plus-00` (category `info`, independent submission). It states the wire and states what a node must not claim about authority and payment (`APS/.../2026-09-27-specification-of-activitypub-plus-plus.md:29-33, 114-124`). It states no capability model. The capability model is in the records above and is not in the RFC. That absence is the reason the Leader finds the knowledge unsettled: the model that beats object capabilities is held in code and notes, and the specification that other implementations would read carries only the carrier.

No note, term or specification in the house compares the Group's model with Spritely Goblins by name. The only records that name the lineage are `animating/src/writing/activitypub/capability.mts:1-20` ("Christine Lemmer-Webber's OCapPub/Spritely arc reached for ActivityPub-as-a-distributed-game with object-capabilities instead of identity"), `animating/src/writing/captp/index.mts:1-40` (CapTP "of the Spritely/Goblins/OCapN lineage"), the lineage note of 2026-08-29, and the glossary term `object-capabilities`, which until today was an empty stub of three frontmatter lines. The plan "to meet then beat Spritely" is held as the Leader's statement and as the two code headers; its specification is this note and the requirements that follow it.

## The Group's capability model

### Authority is a designated move

A capability is an affordance made into an unforgeable, attenuable, delegable reference. It is exercisable exactly when it names a move the holder has. Authority is what move the holder can play, and not who the holder is (`animating/src/writing/activitypub/capability.mts:1-20`). In the node the designation is a string `resource#action`, built by `capabilityGrant` (`NET/src/object-capability/index.mjs:145-147`), and a grant on a resource covers its sub-resources and nothing else (`grantWithin`, `index.mjs:119-130`).

### The capability operations

There are five assertion kinds, each an immutable `capability.assertion` record: `grant`, `attenuate`, `delegate`, `revoke`, `present` (`index.mjs:344-382`).

1. Attenuation never widens. `attenuateAssertion` refuses a child grant that is not within its parent's (`index.mjs:352-364`). The same law holds for views (`attenuateCapabilityView`) and for UCAN-shaped delegations (`verifyCapabilityDelegation`, `index.mjs:580`).
2. Delegation is accountable. A `delegate` assertion names its parent and may carry the allocation and the accountable party that licensed it (`index.mjs:366-378`). Delegation without accountability is the confused deputy's ground, and the Group's delegation records who answers for it.
3. Revocation is an assertion. `revokeAssertion` records the withdrawal as a record of its own (`index.mjs:348`).
4. A held reference may be presented without being widened (`presentCapability`, `index.mjs:380`).
5. A public liberty is a grant to the holder `*`, revocable per holder (`index.mjs:384-385`).

### Standing is four-valued

`can` reads the assertions that concern a holder and a grant and returns a standing whose value is the extremal reading of two independent facts, granted and revoked (`index.mjs:387-409`). The four readings are held (granted, not revoked), refused (revoked, not granted), contested (both), and unevidenced (neither). `may` joins that standing with the office-bound authority assertions `recognizes` and `withholds` (`index.mjs:490-518`). The three dispositions follow the readings: unevidenced asks for more evidence, refused refuses, contested requires repair (`meaningful-human-control`, cited in `CSCI/.../2026-08-29-note-on-the-capability-operating-system-lineage.md` section 3). Every system in the capability-OS lineage answers authority with two values; the Group's gate answers with four, and says which of "no evidence you may" and "evidence you may not" it faces.

### Authority is a witnessed journal

Assertions are not stored in a table beside the journal. They are rows of the journal feed `capability-assertions`, each admitted as a content-addressed witness (`SYS/apps/computer-system-engine/src/rpc/capability-assertions.mjs:24-47`). The authorization read is uncached, because another process can revoke between two decisions, and it fails closed: a malformed, unavailable or incomplete feed yields no held assertions (`capability-assertions.mjs:49-63`). The dispatch seam conjoins an operation's availability with the subject's standing, so a local invocation and any other invocation take the same gate (`SYS/apps/computer-system-engine/src/rpc/dispatch.mjs:43-61`).

Holding authority does not create the record that the holder acted. A closure rule cannot manufacture a witness (`witness-as-increment`, cited at the lineage note section 1). The authority history and the action history are two witnessed logs and neither substitutes for the other.

### Transport is CapTP over witnessed sessions

`captp/index.mjs` carries the OCapN vocabulary: sturdyrefs from capability views (`captp/index.mjs:80`), deliveries and pipelines (`:107-199`), authority graphs with an odd-causal-cycle law (`:270-334`), vector clocks and causal cuts with quiescence (`:440-798`), vat tables (`:898-956`), three-party handoff gifts (`:967-1003`), sessions with crossed-hello resolution and a committed transcript (`:1147-1383`), and a libp2p transport projection (`:1385-1463`). Every one of them has a statement log that writes it as EAVT rows, so a session is a witnessed object, not a socket's memory.

The claim that promise pipelining is a *-autonomous composition belongs to `animating`. MetroPlat softened it to a causal-set law: a pipeline that contains an odd causal cycle cannot converge however delivery proceeds (lineage note section 1). The Group holds the softened law.

### Capability as product

A Capability Cell is an independently purchasable capability whose identity is a hash of its SKU, its law and its sovereign controller, and whose declared faces (ActivityPub actor, A2A Agent Card, MCP endpoint, x402 resource, EVM account) are each verified by their own checker. ActivityPub is the knowledge face: its outbox accumulates and never retracts. EVM state is the truth face: the current, revisable disposition. The proved asymmetry `cross_order_not_knowledge_nucleus` means a settlement on the truth face is never by itself knowledge on the knowledge face, so a cell must bind both (`S/science-services-section/.../2026-07-25-capcell-the-ap-evm-standard-for-agentic-orchestration.md:40-110, 160-175`). Authority capabilities and product capabilities are two readings of one carrier: a cell's face is a designated move that its controller grants.

## How the model meets object capabilities and Spritely Goblins

It meets them on every primitive they hold.

| Object-capability and Goblins primitive | The Group's realization |
|---|---|
| designation is authority; no ambient authority | `resource#action` grants; `capability-not-acl` decision: there are no ACLs, authorization is the capability check |
| unforgeable reference | sturdyref as a capability view (`captp/index.mjs:80`); minted random reference in `ocapn-sturdyref-admission-service/src/admission.mjs` |
| attenuation, non-amplification | `attenuateAssertion`; the non-amplification theorem in the functional-runtime-platform theory |
| introduction and delegation | `delegateAssertion`; handoff gifts (`captp/index.mjs:967-1003`) |
| vats and sessions | `vatFromAuthorityGraph`, `openSession` (`captp/index.mjs:898, 1172`) |
| promise pipelining | `captpPipeline`, `composePipeline` (`captp/index.mjs:119, 189`) |
| garbage collection of references | `dropPresence`, `gcExportsOp`, `applyGcExports` |
| macaroon caveats, WASI preopens, UCAN | read as capability views in the same module |

It beats them in seven things, each stated as a property of the model.

1. Standing has four values. A node distinguishes unevidenced from refused from contested and responds to each differently. A reference graph answers only reachable or not.
2. Authority is witnessed. Every grant, attenuation, delegation and revocation is a content-addressed journal witness, so "who held what, from whom, when" is a query and not an inference from a reference graph.
3. Delegation names who answers for it. The accountable party and allocation ride on the assertion.
4. Revocation is an ordinary assertion, read uncached, and fails closed. Revocation in the lineage is the hardest problem; here it is a first-class record whose effect is immediate at the next authorization read.
5. Federation is by convergence of state, and not only by live sessions. Two nodes that exchange witnessed assertions converge on the same standing in any order, by the substrate's join (section on federation below). A live CapTP session between vats is one carrier of that exchange, not the only one.
6. The wire is the open network. Capabilities, payment and agent messages ride inside one ActivityPub activity, so a capability can cross to any ActivityPub node that implements the profile. Spritely's own arc reached for ActivityPub (`capability.mts:1-20`); the Group's wire is ActivityPub.
7. Authority and payment are separate. A settled payment proves a payment event and is never authority to perform an operation that the node's own admission has not accepted (`APS/.../2026-09-27-specification-of-activitypub-plus-plus.md:124`).

Beating a system presupposes interoperating with it. The Group's CapTP is a value layer and has not exchanged a message with an independent OCapN implementation; the beat is a claim about the model, and the meet is shown only when a Goblins vat and a MetroPlat node exchange a sturdyref, a delivery and a handoff.

## How federation between MetroPlat nodes works

### Nodes and actors

The Semioverse is the network of nodes. Each organization runs an always-on MetroPlat node (OPS); a machine that is not always on runs its own node named for the machine. Bare Cedar Fog is the founder's laptop. Cold Red Gate is the always-on host. Everyone who acts, person or agent, is an actor with a handle on a node, and work between actors travels as A2A messages, so Claude handing Codex an assignment is one actor messaging another and not a private call inside a process (`S/engineering-services-section/content/text/glossary/terms/semioverse.md:59-70`; founder, 2026-09-27). The intended server is MOOSE, which no package yet carries (`moose.md`).

### The wire

One actor has exactly one public ActivityPub face. A node federates through ActivityPub and nothing beside it, and exposes no public A2A listener (`APS/.../specification-of-activitypub-plus-plus.md:29-31`). Every inbound activity is verified before the inbox callback runs (`:33`). An activity carries one CloudEvents envelope; the envelope carries one A2A message; the message carries one SEN part named by its `ni:` digest (`:35-110`). The activity names one A2A Agent Card (`:53`). Authority, invocation, settlement and anchor ride only inside that message (`:114-118`).

### The algebra is the protocol

When two substrates federate, the substrate's value-domain is the protocol's semantic content, and the transport layer has only transport and authentication left to do (`S/engineering-services-section/.../2026-03-21-note-on-federation-as-substrate-join.md:8-23`). Exchange converges in any order, with duplicates, under partition, to the closure of the join of all writes (`federation-convergence`). Content-addressed messages make a duplicate a no-op. A disagreement is a held contested value with both witnesses and is never resolved by last writer (`2026-06-05-seam-federation-distribution.md:15, 35`). A signed witness crosses the boundary and the receiver verifies attribution against its own data before admitting it (`federation-envelope`).

### Peer trust is graded

A node's standing toward a peer has four values: admitted (handshake-verified, identity present, not revoked), rejected (revoked or deny-listed by an authoritative decision), unknown (never seen), contested (two operators recorded conflicting decisions). A Boolean federation cannot represent unknown or contested as distinct from rejected or admitted (`S/engineering-services-section/.../2026-06-20-federation-trust-as-bilattice-graded.md:13-18`). The peer's authority over a node is the same object as any holder's authority: a standing over capability assertions. A peer node and a peer actor are holders; what they may do on a node is what the node's feed grants them.

### Work peers

Bare Cedar Fog and Cold Red Gate are each other's work peer. The work board replicates as a union of content-addressed facts: moves that only tell into a grow-only record are monotone and join by set union on the move's address; coordinated moves (withdrawal, release, supersession, a hold, an acceptance that chooses) are played on the thread's own home node and travel to the peer only as a decision stamped with `decidedBy` (`HOST/src/work-replication.mjs:1-27`). A node ships what the peer has not received, from a ledger of received addresses, on a schedule of 900 seconds, with retry (`work-replication.mjs:134-195`; `HOST/test/work-peer-schedule.test.mjs`; `S/561-group-services-section/services/561-group-operations-services-section/sites/bare-cedar-fog.561.group/config/metroplat-instance.json`, schedule `work-peer-catch-up`).

### Settlement exchange

A node pushes to each peer the admitted witnesses the peer lacks, date by date, in bounded signed transfers (RFC 9421), from the feeds granted to that peer; a peer without a grant receives no journal material (`SYS/apps/computer-system-engine/scripts/system-federate.mjs:1-12, 37-82`; `SYS/.../src/rpc/node.mjs:171-187`). Each node advertises itself at `/.well-known/system-node` with its origin, endpoints, peers and Ed25519 key, and refuses an advertisement that carries authority fields or names another origin (`SYS/.../test/node-peering.test.mjs`).

### What federation is meant to be

Federation between MetroPlat nodes is one thing: nodes holding witnessed capability assertions about each other and about actors, exchanging activities that carry A2A messages named by digest, converging by join, and refusing by standing. A peer is admitted by a granted assertion, and its moves are admitted when its standing for the move kind is held. Work replication and settlement exchange are two uses of that one carrier and one gate.

## Measurement of the running system, 2026-10-09

Read from the node's journal (`DATA/journals/2026/*/*/*admit-capability-assertions.jsonl.witnesses`), the node configuration by name, the code above, the public endpoints, and Cold Red Gate over `ssh cold-red-gate` read-only.

### What conforms

1. The local authority gate is real. Bare Cedar Fog holds 1,447 admitted capability assertions in 20 daily feeds from 2026-09-01 to 2026-10-09; dispatch reads them uncached at every authorization (`dispatch.mjs:43-61`).
2. Work-peer replication runs both ways. Bare Cedar Fog's ledger `S/561-group-services-section/work-peer-shipped.jsonl` holds 6,918 shipped addresses, last written 2026-10-09 10:15; Cold Red Gate's `settlement/work-peer-shipped.jsonl` holds 1,217, last written 2026-10-08 08:30. The schedule `work-peer-catch-up` is in Bare Cedar Fog's instance (900 s).
3. Both nodes advertise `/.well-known/system-node` with the same contract and each names the other as peer (HTTP 200 on both, 2026-10-09). Both actor documents answer.
4. The convergence discipline is implemented: moves are content-addressed, duplicates are no-ops, coordinated moves have a single home.

### The gap

**G1. Peer authority is identity.** Every inbound work move is admitted by comparing the sender's actor identifier with one configured peer actor: `if (senderActorId !== peerActor) throw` at `HOST/src/federated-work.mjs:193, 214, 263, 277, 297`. The configuration is the single value `GROUP_PEER_ACTOR=https://cold-red-gate.561.group/actors/metroplat`. No capability assertion is read on the federated path. This is ambient authority by identity, the shape the capability model refuses, and it admits exactly one peer.

**G2. No capability crosses a node boundary.** None of the 1,447 assertions on Bare Cedar Fog is held by or presented from a remote actor. All are `grant`. There is no `attenuate`, `delegate` or `revoke` and no `parent` field on any row. Of the 1,447, 1,262 are node-to-own-worker grants (issuer `bare-cedar-fog.561.group` or `ops.561.group`, holder `infograph-worker`); the rest are session activations naming local principals and node names. Cold Red Gate holds 27, all to its own node name, all issued by `infograph:mcp-session-activation`. The `capability-assertions` feed is not among the feeds exchanged between the nodes.

**G3. The issuer is an event, not an authority.** The 1,447 assertions name as issuer either the node itself or an activation event (`infograph:mcp-session-activation` 145, `infograph:http-service-activation` 29, `infograph:capability-assertion-admit` 8). `grantAssertion` does not check that the issuer holds the standing it grants (`NET/src/object-capability/index.mjs:344-346`), so non-amplification is enforced at attenuation and not at first issue.

**G4. The feed grows by restatement.** There are 186 distinct holder-and-grant pairs among the 1,447 rows. One pair (`infograph-worker`, the local inference-provider grant) is restated 821 times. The authorization read scans the whole feed on every decision (`capability-assertions.mjs:53-63`), so restatement raises the cost of every authorization.

**G5. A second authority table governs the settlement exchange.** Which journal feeds a peer receives is the environment map `SYSTEM_NODE_SETTLEMENT_FEEDS` (`node.mjs:171-187`), not capability assertions. Bare Cedar Fog's environment sets no such map, and `system-federate` is not among the eleven schedules of its instance. No journal material flows between the nodes through that channel.

**G6. There are two channels, and the work channel is outside the profile.** The draft requires that a node federate through ActivityPub and nothing beside it (`:31`) and records, as its own open question, that settlement replication posts CloudEvents to `/arrivals` beside the one public face (`:161`). The work channel is ActivityPub but carries SignStuff evidence (`application/vnd.semioverse.signstuff+cbor`) without an Agent Card (`APS/src/sen-activity.mjs:21, 207-208`), where the profile requires every activity to name exactly one A2A Agent Card (`:53`).

**G7. The profile's discovery surfaces are not served.** `GET /.well-known/agent-card.json` returns 404 on both nodes. On Bare Cedar Fog, WebFinger and NodeInfo return 502 (Cold Red Gate returns 200). The draft states that no node runs the profile as one server (`:156`).

**G8. CapTP is not on any node.** No operation in the instance's capability list opens a CapTP session or mints a sturdyref. The object-capability module is imported by the `rpc` layer only for assertions and dispatch. The OCapN sturdyref admission service is a standalone package with a private JSONL ledger and no reference from the instance configuration. CapTP has not exchanged a message with an independent OCapN implementation.

**G9. Revocation of references is garbage collection.** `dropPresence` and `gcExportsOp` reclaim what nobody wants; the lineage's revocation (caretaker, visible revocation) is not realized for CapTP references (lineage note section 4(f)). `revokeAssertion` exists and has never been issued.

**G10. The properties the lineage obliges are unstated.** Authority monotonicity under composed pipelines, the confinement closure of an agent's grant set, and the assumption list for the JavaScript and Lean CapTP correspondence are named in the lineage note (section 6, items 1, 2, 5) and have no statement or test in the module.

**G11. Many servers, few nodes.** Cold Red Gate runs seventeen user services, of which `cold-red-gate-561-group` (the MetroPlat node), `binding-generations-ops`, `market-561-group-node`, `games-561-group`, `inference-work-lot`, `inference-work-lot-sen` and `npm-registry` are separate HTTP processes on ports 8080-8089 and 18xxx. The one `/.well-known/system-node` that answers at `cold-red-gate.561.group` is the MetroPlat node's. `ops.561.group` and `ops.bindinggenerations.net` did not answer from the laptop on 2026-10-09. The intended deployment is one node per machine with every other server a client of it (`semioverse.md`, "Its server"); that deployment does not exist.

## Why the knowledge has not settled

Three causes are visible in the records.

1. The model was built in `animating`, then re-built in MetroPlat, then moved to `NET/src/object-capability`; the lineage note records two independent CapTP implementations that disagree on a headline claim (section 1). The theory was never written once, in the specification layer, after the code settled.
2. The RFC was written for the wire, and its authority section is a prohibition (`:118`) without the positive model. A second implementation could not derive standing, attenuation, presentation or revocation from it.
3. Each federating capability grew its own channel and its own authority table: the work peer by configured actor, the settlement exchange by environment map, the sturdyref service by private ledger. The model's single gate (`authorizationFromCapabilityAssertions`) was never placed on the federated path.

## Open

- Which signature scheme an inbound activity must carry, and the registration of `application/sen+cbor` and `application/a2a+json`, remain open in the draft (`:158-166`).
- Whether Cold Red Gate's credentials-file environment sets a settlement-feed map was not read; its credentials file is private. The measurement of G5 is Bare Cedar Fog's.
- The comparison with Goblins rests on the published OCapN vocabulary as the house holds it; it is made by the property list above and is not yet made by an exchange between the two.

The requirements for engineering are in `NET/services/object-capability-services-section/content/text/documents/articles/specifications/2026-10-09-requirements-for-capability-bearing-federation.md`.
