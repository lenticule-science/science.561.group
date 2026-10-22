---
title: "Rendanheyi Micro-Enterprises as Persistent Programs in a Union of Territories"
summary: "A Lenticule Science synthesis reads a Rendanheyi micro-enterprise as a persistent, customer-coupled program inside a federation with no universal interior."
date-created: 2026-10-01
type: paper
status: active
visibility: public
tags: [rendanheyi, organizational-science, distributed-systems, federation, micro-enterprise, huidu-guanli]
abstract: "Rendanheyi, usually glossed as employee-customer unity, is the management practice in which a small enterprise unit is organized around a direct relation to its user or customer. This paper summarizes a working synthesis from Lenticule Science, the research arm of the 561 Group, that models such a micro-enterprise as a persistent, customer-coupled program rather than as a team or business unit. The synthesis separates four relations that its source says must stay distinct: program composition, territorial inhabitation, federation, and world projection. It places micro-enterprises inside Autonomous National Territories, which federate into a Union of Harmonious Colonies that has no universal interior, and it treats Huidu Guanli as a strategic hull around, not the semantic kernel of, each enterprise. The paper reports the six-part definition of a minimum territory, the failure test for the Union, the proposed two-territory experiment, and the research hypothesis about semantic compression. Throughout, it records the synthesis's own status labels: the framework is a working architecture and a set of testable specifications, not a demonstrated system. The synthesis cites no external management literature, and this paper does not supply any."
keywords: [Rendanheyi, micro-enterprise, Huidu Guanli, federation, Autonomous National Territory, Union of Harmonious Colonies, partition tolerance, choreography, semantic compression]
math: true
---

# Rendanheyi Micro-Enterprises as Persistent Programs in a Union of Territories

A Rendanheyi micro-enterprise, in the model developed by Lenticule Science, is a persistent program whose continued execution is coupled to a direct relation with a user or customer. Such programs live in machine-hosted territories that federate by witnessed treaty, and the federation has no universal interior and no central scheduler. This paper summarizes that working synthesis, states what it claims, and keeps its labels for what remains hypothesis.

## What is Rendanheyi?

Rendanheyi is usually rendered as "employee-customer unity." In the synthesis summarized here the relevant invariant is that a micro-enterprise exists in direct relation to a user or customer. The unit's organization, value claim, work, and continuation are evaluated through that relation, not through distance from a central bureaucracy.

The source states a design consequence. A micro-enterprise should not be modeled as a chain

$$\text{manager} \rightarrow \text{worker} \rightarrow \text{customer},$$

but as a two-way relation,

$$\text{customer} \leftrightarrow \text{enterprise-program},$$

with the internal organization derived around that relation. The arrow runs both ways on purpose. The customer presents demand, constraints, tests, acceptance, and refusal. The enterprise presents offers, products, evidence, prices, conditions, and its own refusals.

The synthesis also reads the phrase "zero distance to the user" carefully. It says the target cannot be the literal elimination of every boundary, because protected borders, privacy, law, resource limits, and refusal are all necessary. The operational goal is to reduce unnecessary coordination distance while preserving required distinctions.

The source does not cite the management literature on Haier's practice or any outside account of it. This paper therefore makes no claims about Haier or about empirical results from Rendanheyi in industry. Its subject is the synthesis, which uses Rendanheyi as a design pattern.

## What is the problem the synthesis tries to settle?

The 561 Group had accumulated several vocabularies for one developing system: one built on enterprises, territories and a union; one ecological; one drawn from Rendanheyi, offices, contracts, markets and courts; and a mathematical language called Obsmetrologia. The synthesis says the difficulty is no longer a shortage of concepts. The same words had been asked to do jobs they were not designed for. A machine had been called a colony, a cell, a settlement, a node, and a territory, and "micro-enterprise" had meant both a bounded transaction and a persistent organization.

Its first claim is that four relations must be kept apart:

| Relation | Question it answers | Notation in the source |
|---|---|---|
| Program composition | Which executions belong to which persistent program? | $\mu \triangleleft E$ |
| Territorial inhabitation | Where does a persistent program operate? | $E \in T$ |
| Federation | How do territories relate without merging? | treaty, exchange, shared protocol |
| World projection | How is the system made navigable to people and agents? | temples, reefs, courts |

The source writes the claim as an invariant: these four relations are not the same relation, and the architecture is produced by their interaction. A transaction is a bounded program. A persistent micro-enterprise is also a program, and bounded encounters are executions or continuations of it. This is "recursive execution or composition, not container ownership," so programs do not live "inside an otherwise non-programmatic corporation."

## How does the synthesis model a micro-enterprise?

The synthesis defines a Rendanheyi micro-enterprise as a persistent program that keeps a local distinction between itself and its environment while staying open to exchange. It accepts some requests and refuses others. It consumes resources, produces artifacts and evidence, changes its own state, retains history, exposes services, enters contracts, seats offices, and can alter its policy or capabilities under appropriate authority.

As a first schematic carrier it offers a nine-part tuple $E = (\mathcal I, \Theta, X, H, R, O, C, B, F)$:

| Symbol | Reading in the source |
|---|---|
| $\mathcal I$ | the enterprise's operative relational or semantic regime |
| $\Theta$ | its seated local law or theory |
| $X$ | revisable current state |
| $H$ | append-only witnessed history and provenance |
| $R$ | resource state and resource processes |
| $O$ | offices and currently lawful authority relations |
| $C$ | contracts and customer relations |
| $B$ | border and admission relations |
| $F$ | refusal and continuation conditions |

The source adds two cautions. The symbols are "placeholders for generated structures rather than a final product type," and the enterprise is not identical to the tuple. The tuple is a current attempt to name independently necessary projections of the program's continuing life.

### Why is the executor not the enterprise?

A human, a model, a process, a swarm, or a changing mixture can execute parts of the enterprise program. The enterprise persists only if the relevant continuity, authority, history, and customer relations persist. The source summarizes this as three non-identities: executor $\neq$ enterprise, office $\neq$ enterprise, and swarm $\neq$ enterprise. An office is a normative interface through which certain classes of transition may be performed. A swarm is an execution configuration that may temporarily do work for one or several enterprises. For this reason, internal offices and swarms are meant to stay reconfigurable. They are the means by which the customer relation is sustained, not the reason the enterprise exists.

## Where do micro-enterprises live?

A persistent program can have memory, law, resources, borders and refusal without being the environment in which other enterprises sit. The synthesis therefore separates enterprise sovereignty from territorial sovereignty. Enterprise sovereignty concerns the continuation and protected interior of one program. Territorial sovereignty concerns the conditions under which many such programs can share one computational ground while keeping their own interiors.

An Autonomous National Territory (ANT) is the current name for the second structure. The source treats the word "territory" operationally. It claims no physical land, legal nation-state status, diplomatic immunity, citizenship, or exemption from external jurisdiction. "National" records a requirement of continuity of purpose, memory and constitutional commitment. "Autonomous" adds the strongest test: the territory must have lawful continuations when its root or its neighbors are absent.

### What is the minimum territory?

The synthesis says a candidate ANT must provide at least six classes of local structure.

1. **Ground.** A locally persistent, addressable ground that survives the absence of a remote coordinator.
2. **Admission.** The territory distinguishes what is merely reachable from what is admitted. A remote message or declaration does not automatically become local law, evidence, or instruction.
3. **Local execution.** Enterprise programs act on local state and resources. If every meaningful transition needs a remote controller, the machine is a terminal and not a territory.
4. **Local persistence.** Enough state, including provenance, lineage, office state, contracts and resource state, to reconstitute the local ecology after restart or network loss.
5. **Border and refusal.** The ability to reject, defer, quarantine or translate an external act without damaging its own continuation. A territory that can communicate only by granting peers direct write access has communication but no meaningful border.
6. **Federation interface.** Typed relations with another ANT without either becoming the other's interior.

These give the schematic $T = (G, A, X, P, B, \Phi)$, which the source calls "a research carrier, not a final implementation schema."

The current direction is that each persistent machine be treated as the first practical realization of an ANT. The synthesis frames this as a deployment strategy and not an identity theorem. A machine supplies a failure domain, storage, compute, interfaces and a clear connected-versus-disconnected distinction. But a disk can be replaced and a virtual machine can migrate, so territorial identity may plausibly survive those changes. Migration criteria are listed among the open items.

## How do territories form a union?

ANTs federate into what the synthesis calls a Union of Harmonious Colonies (UHC). Its central negative law is that the UHC is not a super-settlement. The Union has no universal interior, meaning no single state, scheduler, law, ontology, work queue, or globally writable database.

The synthesis insists this is a pattern the 561 Group instantiates, not a parent organization it belongs to. Instead of a containment tree such as UHC $\supset$ 561 Group $\supset$ machines $\supset$ enterprises, the intended picture is that autonomous territories $\{T_i\}$ plus witnessed relations $\{\tau_{ij}\}$ constitute the Union structure. The Union is not the union of the territories' interiors. It exists "in the lawful composability of locally governed views and acts, not in possession of their combined interior state."

Union-wide objects are allowed: a treaty registry, a route index, a content-addressed catalogue, a public identity page, a common protocol profile. The criterion is whether the object can be reconstructed, challenged, or revised from constituent evidence without gaining unilateral write authority over that evidence. If so, it is plausibly a federation object. If not, it may have become an undeclared super-settlement.

### What does "harmonious" mean?

The source rejects the reading that every local theory is consistent with every other, because that would destroy the sovereignty the Union is built to protect. Harmony is the capacity of autonomous local programs to compose where composition is warranted, preserve witnessed differences where it is not, and continue acting without a universal interior. The source gives four obligations: composability, difference preservation, non-domination by addressability, and continuation. This is why it treats paraconsistency, the ability to hold contradiction without collapse, as non-decorative: "a Union that can only represent harmony by deleting contradiction has confused peace with amnesia."

### Choreography or orchestration?

Orchestration means one coordinator directs each step. Choreography means parties know a shared protocol, decide locally how to meet their own obligations, and let work move through witnessed events that counterparties independently receive, assay, accept, reject, or refine. The synthesis makes choreography the default federation mode, with orchestration kept local and explicit for cases such as incident response or bounded internal campaigns. A Union that needs one coordinator to decide every cross-territory move "has recreated a capital scheduler."

## What is Huidu Guanli's role?

The source treats Huidu Guanli, the older management line in the same body of work, as a strategic hull around the enterprise program, not as its semantic kernel. The kernel answers what the program is, which relations constitute it, which transitions are lawful, and what state, evidence, and resources exist. The hull answers which direction is pursued, what should be delegated, what stays constitutionally constrained, where organizational energy is accumulating or dying, and whether the present arrangement can still move toward its purpose.

The separation has a practical reason. Strategy should be able to reconfigure offices, swarms and internal organization without redefining the enterprise's semantic identity. So the hull may change more often than the identity-bearing program beneath it.

## How could the architecture fail, and how would it be tested?

### The failure test

The synthesis gives a simple test. Sever the connection to a nominated root service. If territories lose the ability to reconstruct local state, enterprises cannot determine admitted work, offices lose authority, work cannot be refused, customers cannot be served, and the only valid move is reconnecting, then the system has built remote terminals, not a Union. If territories continue locally, keep their evidence and jurisdiction, and later exchange witnessed updates, the structure the report calls a Union has begun to appear. The source says this test "should eventually be performed rather than merely asserted."

### The two-territory experiment

The next milestone is deliberately small: two persistent machines or virtual-machine equivalents, each hosting an ANT substrate and at least two persistent enterprise programs. The test has six stages.

| Stage | What is exercised |
|---|---|
| 1. Local life | Each territory boots, reconstructs its state, runs one local transaction, refuses another, and preserves provenance. |
| 2. Treaty | A witnessed relation names identities, protocol, allowed interactions, evidence conditions and refusal behavior. |
| 3. Choreographed work | A request crosses from one territory to an enterprise in the other, which admits it under its own law and returns a witnessed result. No root process decides each hop. |
| 4. Derived continuation | The returned result feeds further local work without giving the other territory write authority. |
| 5. Partition | The territories are disconnected and each must keep useful work going. Stale information or queued obligations are acceptable; loss of identity is not. |
| 6. Reconnection | Witnessed updates are exchanged and settled without rewriting independent histories or silently erasing contradiction. |

The source says that if this cannot be made to work without a global coordinator carrying all meaningful state, "the architecture needs revision." It also lists what the first experiment should not attempt: a complete graphical world, cryptocurrency, a global market, every court office, a universal ontology, or a theorem connecting every term to the mathematical foundation. What it must keep is local identity, admission and refusal, an explicit treaty, provenance, no direct foreign writes, and useful disconnected operation.

## What is the semantic-compression hypothesis?

The synthesis also treats its vocabulary as an experiment in semantic compression for agentic systems. A token such as ANT or SSE (Sovereign State or Settlement Enterprise, with a later source note that the requested wording is Sovereign Service Enterprise) is valuable only if it points reproducibly to a generated, versioned semantic object whose definitions, negative constraints, proofs, and provenance can be recovered. A prompt that repeats thousands of tokens to re-establish what a sovereign enterprise is could be replaced by a short alias that imports that object.

The research hypothesis is stated as: a shared generated semantic vocabulary lowers context cost and semantic drift more than prose retrieval alone, while preserving recoverability and correction. The source says the compression ratio is empirical and should eventually be measured. It attaches an obligation to compression: every short term must be decompressible back to its definition.

## How does this relate to the software?

The synthesis separates architecture from deployment. It names three software candidates for three roles: FeltOS for the territorial substrate, MetroPlat for the enterprise and governance runtime, and Semioverse for the addressed semantic fabric. Its own non-identity statements are explicit: FeltOS is not the ANT, MetroPlat is not the enterprise, and Semioverse is not the shared ground. Each is software intended to realize part of a role, and "exact implementation evidence must be assayed separately."

## Limits and open problems

- **Status of the work.** The source is labelled a working synthesis report. It defines a target architecture; it does not prove the current software realizes it.
- **Partial realization.** The synthesis describes the 561 Group as an active partial realization. It lists real features (persistent enterprise records, offices, shared settlement surfaces, content-addressed identifiers, work spread over several agents) and real failures: heavy reliance on conversation context, shared roots, provider-specific state and centrally visible work surfaces.
- **Not yet demonstrated.** The machine-as-territory relation has not passed a partition test. The semantic fabric does not yet act as a universal decompressor. Migration criteria for territories are unsettled, and office seating and software capabilities do not yet share one runtime contract.
- **Placeholders.** The tuples $E$ and $T$ are research carriers, not final types. The architectural arrows are dependencies, not yet one claimed formal functor.
- **Observed boundary.** An October 2026 check of an installed world found some proposed civic concepts not yet received as operative world resources, and the source accordingly labels them candidates, not established institutions.
- **Untested hypothesis.** The semantic-compression claim is testable but has not been measured.
- **No outside evidence.** The synthesis cites no external empirical study of Rendanheyi, and this paper offers none. Whether the pattern outperforms conventional organizational designs is not addressed.

## Related

- Companion publications on [paraconsistent four-valued logic](/belnap-four-valued-logic/) supply the formal reading of holding contradiction without collapse.
- [The autonomic MAPE-K loop](/mape-k-autonomic-computing-loop/) describes the monitor-analyze-plan-execute control cycle that nodes in this design run.
- [Dispatching concurrent AI agents at scale](/dispatching-concurrent-ai-agents-at-scale/) treats the executors that fill enterprise offices.
- [Obsmetrologia and formal mathematics in Lean 4](/obsmetrologia-formal-mathematics-in-lean-4/) describes the mathematical language the synthesis builds on.
- Sibling sites: [561 Group](https://561.group/), [Engineering](https://engineering.561.group/), [Operations](https://operations.561.group/), [Services](https://services.561.group/), [Market](https://market.561.group/).
