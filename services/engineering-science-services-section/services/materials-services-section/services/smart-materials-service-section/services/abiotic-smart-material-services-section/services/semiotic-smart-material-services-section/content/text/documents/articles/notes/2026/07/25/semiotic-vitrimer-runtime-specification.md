---
title: Semiotic Vitrimer Runtime Specification
description: "Status: emergency alpha construction contract Authority: Leader's session-spanning reconstruction charge Deployment profile: public cloud; AP at 561.group; experimental EVM network eip155:5615610"
---
# Semiotic Vitrimer Runtime Specification

Status: emergency alpha construction contract  
Authority: Leader's session-spanning reconstruction charge  
Deployment profile: public cloud; AP at `561.group`; experimental EVM
network `eip155:5615610`  

The key words **MUST**, **MUST NOT**, **REQUIRED**, **SHALL**, **SHALL NOT**,
**SHOULD**, **SHOULD NOT**, **RECOMMENDED**, **NOT RECOMMENDED**, **MAY**, and
**OPTIONAL** in this document are to be interpreted as described in BCP 14
(RFC 2119 and RFC 8174) when, and only when, they appear in all capitals.

## 1. Purpose and conformance target

The Semiotic Vitrimer is the Harmonious Union's agentic orchestration platform.
It MUST meet and then exceed the operational capabilities associated with:

- Paperclip: durable goals, planning, budgets, allocation, and coordination;
- Hermes: persistent autonomous execution and reusable learned capabilities;
- Honcho: durable identity, memory, preferences, trajectories, and longitudinal
  state; and
- OpenClaw: human, messaging, and web ingress plus safe machine/tool execution.

Its immediate product is a public question-through-production loop that uses
purchasable Capability Cells to turn a human demand into working, deployed
software. The same loop MUST be able to fabricate or repair a missing Capability
Cell and return that cell to the market.

A conforming deployment MUST reduce reliance on premium interactive Codex
inference by purchasing available cloud inference and cell services for routine
Monitoring, Analysis, Planning, Execution, and Knowledge work. Codex MAY repair
a blocking reaction capability when no compatible provider exists; that repair
MUST become reusable cloud capability rather than recurring session labor.

Passing tests, producing specifications, writing files locally, or advancing an
internal state machine does not establish system conformance. Conformance
requires the public acceptance proof in Section 7.

## 2. Normative glossary

These definitions are operational identities, not metaphors.

### 2.1 Organism and material terms

**Semiotic Vitrimer** — The whole distributed runtime: reversible coordination,
stable capability-bearing cells, settled knowledge, economic pressure, and the
reaction laws connecting them. It is not a package, process, controller, model,
or repository.

**Capability Colony** or **Body** — A cooperating population of sovereign
Capability Cells sharing a market and causal history without being collapsed
into one deployable unit.

**Zeolite** — Seated, content-addressed knowledge and commitment: RMN artifacts,
accepted laws, typed receipts, and EVM-bound state. Zeolite is the rigid phase
that prevents repeated inference. It MUST NOT be silently rewritten.

**Disulfide** — Reversible coordination carried by ActivityPub and A2A:
demands, work orders, bids, hires, dispatches, refusals, and observations. A
disulfide may be broken and re-formed without changing a cell's identity.

**Thioether** — A Capability Cell: a durable but independently movable
capability-bearing participant. It binds the colony without absorbing the
capabilities that flow through it.

**Ossification** — Acceptance of an artifact or law into the rigid knowledge
phase. Ossification MUST follow independent evidence. Premature ossification
freezes errors; failure to ossify forces repeated inference.

**Pressure gradient** — A derived preference among enabled reactions or bids,
formed from demand, fractional cost, expected acceptance yield, capacity,
latency observations, risk, and available authorization. It is not a hardcoded
timer, retry count, token cap, or arbitrary priority integer.

### 2.2 Capability and economic identity

**Capability** — One observable transformation from an admitted input domain to
an output, refusal, and state transition under a stated behavioral law.

**Capability Cell (CapCell)** — One independently purchasable capability with an
executable, consumed contracts, sovereign package and repository, controller and
wallet, AP/A2A/web faces, OCap boundary, priced offer, operational memory, chain
binding, and independent invocation evidence. A local-only, AP-only, EVM-only,
or multi-capability bundle is not a complete CapCell.

**SKU** — Stable, price-free identity of the product sold. Mint time, hostname,
offer price, and deployment revision MUST NOT affect SKU identity.

**Capability law** — Content identity of the exact executable behavioral
contract: accepted inputs, outputs, refusals, state effects, and observable
semantics.

**Controller** — The sovereign principal authorized to revise a cell's mutable
bindings and spend from its wallet.

**Cell identity** — Stable identity derived from exactly SKU, capability law,
and controller:

```text
CellId := H(canonical(SKU, CapabilityLaw, Controller))
```

Changing a hostname, price, repository URL, or manifest MUST NOT reincarnate the
cell.

**Manifest revision** — A revisable binding from active cell identity to its
current repository, package, AP actor, A2A Agent Card, web endpoint, x402
resource, and chain faces.

**Offer** — Expiring signed commercial terms binding cell identity, SKU,
capability law, callable address, authorization, denomination, fractional price,
network, and expiry. An offer is not product identity.

**Bid** — A provider's offered terms for one work order. A retry is a new
economic act and MUST consume newly authorized resources or a provider's own
risk-bearing concession.

**Commodity lot** — A finite delivered quantity or result produced by an
accepted invocation.

**Denomination** — The unit in which value is quoted. It is neither a product
identity nor proof of asset ownership.

**Fractional amount** — A canonical rational quantity represented as numerator
and denominator, with nonzero positive denominator. Binary floating-point and
integer-only truncation MUST NOT be the authoritative representation of prices,
yields, or allocation ratios.

### 2.3 Reaction and proof terms

**Demand** — Durable admitted expression of a wanted observable outcome,
authority, constraints, and available resources. Conversation text is ingress;
the durable demand is the operating object.

**Reaction law** — A content-addressed declaration of typed prerequisites,
allowed providers, required outputs, refusals, proof pores, and settlement
effects for producing one outcome. It constrains the circuit; it does not
perform a provider's capability.

**Work order** — A market-visible request to satisfy one currently enabled,
unfilled proof pore under a reaction law.

**Proof pore** — A typed admission boundary that names the evidence required for
one state transition. A pore is enabled only when its prerequisite receipts are
accepted and its output remains unsatisfied:

```text
enabled(p, S) := prerequisites(p) subset-of acceptedReceipts(S)
                 and output(p) not-in acceptedOutputs(S)
```

The scheduler MUST derive candidate work from enabled proof pores. It MUST NOT
invent a convenient next stage or use execution failure as its planning oracle.

**Kinetic proofing** — Repeated, economically accountable challenge of a
candidate result through structurally independent evidence before settlement.
Additional checking MUST be purchased when its expected reduction in acceptance
risk exceeds its expected cost; it MUST NOT be a ceremonial fixed checklist.

**evidence-bound verification** — The actor that produced a candidate result
cannot supply the independent receipt that settles that result:

```text
producer(candidate) != issuer(acceptanceReceipt(candidate))
```

Self-tests are useful observations but MUST NOT constitute independent
acceptance.

**Proof game** — The interaction between a candidate strategy and adversarial
counter-strategies at a proof pore. Acceptance concerns observable boundary
behavior, not persuasive explanation by the author.

**Game foam** — The network of proof games whose shared dry interfaces retain
only behavior reached by valid counter-strategies. It is not a collection of
model opinions.

**Dry interface** — The minimal externally observable and attested surface of a
cell. Unvisited internal reasoning is not promoted as evidence.

**Hydrophobic collapse** — Attack-surface minimization achieved by placing
unattested complexity behind an OCap membrane while exposing only typed,
attested interfaces. It MUST NOT be interpreted as permission to hide behavior
required by the capability law.

**Trajectory** — Append-only causal sequence of demand, context, work orders,
bids, hires, invocations, observations, receipts, refusals, settlements, and
supersessions.

**Residue** — Reusable knowledge extracted from a trajectory: provider
reliability, cost/yield observations, failed strategies, artifacts, constraints,
and newly discovered capability demand.

**Induction coil** — The reaction circuit that takes an existing or specified
capability through extraction, sovereign packaging, controller/wallet
provisioning, chain registration, public AP/A2A/web deployment, offer
publication, customer invocation, and independent observation. It is not one
megapackage implementing all those capabilities.

### 2.4 Agentic and organizational terms

**MAPE-K** — Monitoring, Analysis, Planning, Execution over shared Knowledge.
Each stage is a market role realized by independently purchasable cells. MAPE-K
MUST NOT remain implicit work performed exclusively by the human or Codex.

**Office** — A bounded set of duties and decision authority projected into a
worker's context. An office is not a cell, executable, permanent agent identity,
or justification for bundling its duties into a megapackage.

**Character** — A durable perspective, preferences, and communicative identity
that may inform context projection. It does not confer execution authority.

**Agent** — A stateful participant that may pursue goals and hire capabilities.
An LLM invocation is one possible provider operation, not the agentic platform.

**Package** — Any sovereign deployable carrier of one capability. It is not
restricted to npm and MUST NOT be interpreted as permission to aggregate
unrelated capabilities.

**Question through production** — The complete public reaction from human/web
question through durable demand, market allocation, implementation, deployment,
customer invocation, observation, settlement, and learned residue.

## 3. Required runtime topology

A conforming system MUST contain these separable roles:

1. **Ingress and OCap membrane** for human, web, messaging, AP, and A2A events.
2. **Append-only causal trajectory** providing one observable arrow of time.
3. **Reaction-law interpreter** that computes enabled proof pores without
   implementing their domain capabilities.
4. **Capability market** for discovery, bids, authorization, hire, x402 payment,
   settlement, and retries as new purchases.
5. **Context projection cells** for identity, office, preferences, relevant
   memory, prior art, and provenance-bearing evidence.
6. **MAPE-K cell mesh** containing independently deployable monitoring,
   analysis, planning, execution, verification, and knowledge capabilities.
7. **Kinetic proof pores** enforcing typed artifacts and evidence-bound
   acceptance.
8. **Zeolite substrate** using content addressing and chain settlement.
9. **Pressure field** deriving allocation from economic and operational
   observations.
10. **Induction capability** that returns missing or repaired cells to the same
    market.

The reaction interpreter MAY select among enabled work orders and accepted bids.
It MUST NOT research, specify, code, test, provision, deploy, price, verify, or
certify on behalf of the cells it coordinates.

## 4. Required production circuit

For a software-production demand, the seated reaction law MUST expose proof
pores for the following observable products when the demand requires them:

- admitted intent and completion conditions;
- relevant corpus and external evidence retrieval;
- research synthesis and system diagnosis;
- requirements and operating concept;
- architecture and detailed design;
- verification and acceptance design;
- executable implementation;
- deterministic projection of machine formats;
- sandboxed build and test observations;
- sovereign repository and package induction;
- controller, wallet, and configured-chain binding;
- public web, ActivityPub, A2A, and x402 offer publication;
- independent customer invocation;
- trajectory analysis and reusable residue.

These are capability classes, not mandatory methods or one aggregate pipeline.
A reaction law MAY omit an already satisfied pore, run independent pores
concurrently, or purchase a stronger provider that lawfully supplies one
declared capability. It MUST NOT treat one provider's untyped prose as proof
that multiple independent pores were satisfied.

When no compatible provider is discoverable, the unmet pore becomes durable
capability demand for the induction coil. The system MUST prefer extracting and
generalizing existing repository implementation over creating an additional
parallel framework.

## 5. Protocol and deployment requirements

Operational providers MUST be deployed on network-accessible cloud
infrastructure. A laptop process MAY be used for development probes but MUST NOT
be advertised as the operational provider or cited as acceptance evidence.

ActivityPub coordination for the 561 Group deployment MUST use the
`actions.561.group` namespace. Chain identifiers MUST be parameters of reusable
capabilities. The experimental deployment profile MUST use `eip155:5615610`;
`eip155:561561` remains reserved for the eventual first Union chain.

A complete cell MUST expose both:

- an ActivityPub knowledge face carrying accumulating discoverable claims; and
- an EVM settlement face carrying current committed disposition.

It MUST also expose a signed callable A2A Agent Card/endpoint, an OCap-protected
execution boundary, and an x402-priced offer when work crosses that boundary.

JSON schemas MUST be consumed by deterministic executable boundaries. An LLM
MUST NOT be rejected merely because useful reasoning surrounds a machine
projection. Deterministic parsing/projection cells SHOULD separate reasoning
artifacts from required protocol serialization.

Workflow progress MUST be event- and receipt-driven. Wall-clock time MAY appear
as a provider observation, transport lease, market expiry, or explicit Leader
constraint. A timer MUST NOT manufacture progress, declare success, choose an
arbitrary retry limit, or substitute for economic pressure.

## 6. Repository reconstruction law

Before implementing a missing capability, a worker MUST search executable code,
services, offices, skills, procedures, duties, tests, and current research notes
for compatible prior art. Names and directory ownership MUST be treated as
unreliable historical labels.

If compatible logic exists inside an aggregate package, the worker SHOULD
extract or expose that logic as one sovereign cell and route consumers through
its public contract. It SHOULD remove or bypass the embedded duplicate after
the public provider is proven.

A worker MUST NOT respond to an end-to-end obstruction by indefinitely repairing
the nearest seam. It MUST first decide whether that seam is inside the required
reaction circuit. If not, it records residue and continues toward the missing
public capability.

Specifications, schemas, governance records, reports, receipts, and tests are
products or evidence. They MUST NOT displace delivery of the executable cloud
capability they constrain.

## 7. Public acceptance proof

The system conforms to this emergency alpha contract only when an external user
can:

1. submit a fabrication or software-production demand through the public web;
2. inspect its durable current state, causal events, hired cells, bids, costs,
   and present obstruction;
3. resume after process or provider interruption without restarting accepted
   work;
4. receive a sovereign public cell bound to a parameterized chain deployment;
5. discover matching AP, A2A, web, repository, offer, and chain faces;
6. invoke the advertised capability as a real customer;
7. obtain independent evidence that the result satisfies its capability law;
8. observe settlement and append-only trajectory residue; and
9. demonstrate that a later fabrication uses that residue to reduce expected
   cost per accepted outcome or improve accepted capability.

The expected economic quantity is represented fractionally:

```text
expectedCostPerAcceptedOutcome
  := expectedCostPerAttempt / probabilityOfAcceptance
```

Budget exhaustion, test success, document completion, local invocation, or an
author's declaration MUST NOT substitute for this proof.

## 8. Sources of settled rationale

This specification operationalizes, without replacing, the following current
research:

- `lib/emsenn/services/561-group/services/lenticule-science/content/text/documents/articles/notes/2026/07/25/2026-07-25-capcell-the-ap-evm-standard-for-agentic-orchestration.md`
- `lib/emsenn/services/561-group/services/lenticule-science/content/text/documents/articles/notes/2026/07/25/2026-07-25-note-on-physarum-zeosemiocenum-system-specification.md`
- `lib/emsenn/services/561-group/services/lenticule-science/content/text/documents/articles/notes/2026/07/25/2026-07-25-note-on-physarum-zeosemiocenum-fabrication.md`
- `lib/emsenn/services/561-group/services/lenticule-science/content/text/documents/articles/notes/2026/07/24/2026-07-24-basics-of-agentic-orchestration-platforms.md`

Where a research analogy and an observable requirement appear to conflict, the
observable requirement controls implementation until the relevant mathematical
claim is formally established and its software interpretation is specified.
