---
type: narrative
status: current
recaps:
  - ../README.md
  - ../references/hewitt-bishop-steiger1973.md
  - ../references/agha1986.md
  - ../references/gelernter1985.md
  - ../references/engelmore-morgan1988.md
  - ../references/bratman1987.md
  - ../references/rao-georgeff1995.md
  - ../references/wooldridge-jennings1995.md
  - ../references/wooldridge2009.md
  - ../references/kowalski1995.md
  - ../references/finin-et-al1994.md
  - ../references/fipa-acl2002.md
  - ../references/yao-et-al2023.md
  - ../references/park-et-al2023.md
  - ../references/bordini-et-al2007.md
discusses:
  - ../teaching/explanations/agent.md
  - ../teaching/explanations/skill.md
  - ../teaching/explanations/runbook.md
  - ../teaching/explanations/dispatch.md
  - ../teaching/explanations/inbox.md
  - ../teaching/explanations/governance.md
  - ../teaching/explanations/agential-self-generation.md
  - ../theorems/dispatch-as-closure-rule-system.md
  - ../theorems/agent-community-consensus.md
  - ../theorems/governance-as-modal-restriction.md
see-also:
  - structural-lineage-from-blackboard-to-aop.md
  - composability-with-predicated-knowledge-systems.md
title: What the agential-orchestration-platform inherits when it goes substrate-side
description: The parent theory predicated-computing supplies the substrate — closure-rule application, witness chain, snapshot, federation.
---

# What the agential-orchestration-platform inherits when it goes substrate-side

The parent theory [predicated-computing](../../../README.md) supplies the substrate — closure-rule application, witness chain, snapshot, federation.
The platform specialises the parent to the *agential* register — agents, skills, runbooks, dispatch, governance, federation across agent populations.
This narrative records the inheritance ledger in three columns: what the platform inherits *with proof* from the upstream classical-MAS / coordination / LLM-agent literature, what it inherits *as substantive commitment* (`status: sketch`), and what *does not inherit* (the parameters by which the platform adapts to specific realisations).

The ledger is in the spirit of the [predicated-knowledge-systems inheritance ledger](../../../teaching-articles/explanations/what-knowledge-systems-inherits.md), the [semiotics inheritance ledger](../../../teaching-articles/explanations/what-semiotics-inherits.md), and the [functional-runtime-platform inheritance ledger](../../functional-runtime-platform/narratives/what-functional-runtime-platform-inherits.md).
The discipline holds that *being explicit about what does and does not inherit* is itself part of the structural commitment.

## What inherits with proof

These inheritances are *proved* by the upstream literature (or by an in-corpus theorem that imports the upstream proof structure):

- **Actor-style encapsulation composes** ([Hewitt-Bishop-Steiger 1973](../agent/hewitt-bishop-steiger1973/hewitt-bishop-steiger1973.md), [Agha 1986](../agent/agha1986/agha1986.md)).
  Actors interacting only by messages preserve local invariants under arbitrary interleaving; the proof is Agha's operational-semantics treatment.
  The platform's [agent](../teaching/explanations/agent.md) concept inherits encapsulation directly: agents share a substrate but their per-agent state is scope-bounded per [boundary-as-fiber](../scope/boundary-as-fiber/boundary-as-fiber.md), so reasoning about one agent never escapes its scope without going through the substrate's federation.
- **Generative coordination is uncoupled in space, time, and reference** ([Gelernter 1985](../memory/blackboard-as-substrate-projection/gelernter1985/gelernter1985.md)).
  Producers and consumers communicate through a tuple-space without addressing each other; the proof is Linda's operational semantics.
  The platform's [dispatch](../teaching/explanations/dispatch.md) inherits generative coordination as match-by-shape on substrate predications; producers (skill providers) and consumers (work-item raisers) do not address each other.
- **Practical-reasoning architectures are tractable on bounded resources** ([Bratman 1987](../goal/bratman1987/bratman1987.md), [Rao-Georgeff 1995](../goal/rao-georgeff1995/rao-georgeff1995.md), [Bordini et al. 2007](../bordini-et-al2007/bordini-et-al2007.md)).
  BDI agents with bounded intention stacks and a published practical-reasoning loop achieve goal-pursuit under real-time constraints; the proof is the operational semantics of AgentSpeak/Jason and the convergence results for PRS-family architectures.
  The platform's [runbook](../teaching/explanations/runbook.md) inherits the BDI plan-body discipline directly per [practical-reasoning-as-runbook-execution](../runbook/practical-reasoning-as-runbook-execution/practical-reasoning-as-runbook-execution.md).
- **Speech-act communication has portable semantics** ([Finin et al. 1994](../agent/federation/finin-et-al1994/finin-et-al1994.md), [FIPA-ACL 2002](../agent/federation/fipa-acl2002/fipa-acl2002.md)).
  Performatives carry a publishable agent-communication-language semantics that interoperates across implementations; the proof is the FIPA conformance-test programme.
  The platform inherits the performative discipline; per [speech-act-as-witnessed-predication](../settlement/speech-act-as-witnessed-predication/speech-act-as-witnessed-predication.md), the performative is the predicate slot of a substrate predication.
- **Reactive and rational agents reconcile through a shared logical substrate** ([Kowalski 1995](../kowalski1995/kowalski1995.md)).
  Closure rules can fire either as state-change reactions or within deliberative plans; the proof is Kowalski's meta-logic argument and the AgentSpeak realization.
  The platform's [dispatch-as-closure-rule-system](../dispatch/dispatch-as-closure-rule-system/dispatch-as-closure-rule-system.md) theorem is the substrate-side restatement: dispatch IS the closure-rule system at the agent layer.
- **Network-sheaf consensus computes without coordination on bilattice-valued agent communities** (per [agent-community-consensus](../agent/agent-community/agent-community-consensus/agent-community-consensus.md), itself proved by direct application of [bilattice-network-sheaf-consensus](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/theorems/bilattice-network-sheaf-consensus.md)).
  The platform's federation across agents inherits the math parent's CRDT-style automatic convergence; disagreement is recorded as $\top$, not as an exception.
- **The actor model's no-shared-mutable-state result lifts to substrate sublocales** (per [boundary-as-fiber](../scope/boundary-as-fiber/boundary-as-fiber.md), itself reading off the [predication-categories](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/_index.md) sublocale algebra).
  Two agents sharing a substrate share read-access only to the union of their scopes; their write-access is scope-disjoint by construction.
  The proof is the sublocale-intersection algebra of the math parent.

## What inherits as substantive commitment (status: sketch)

These inheritances are *plausible structural commitments* that the substrate-side framing names but that have not been established in full generality.
They are `status: sketch`:

- **Agent ↔ scope-bounded sublocale is faithful** (per the [composability narrative](composability-with-predicated-knowledge-systems.md), Bridge 1).
  An agent reads as the substrate's sublocale-with-witness-attribution at the agent's scope; the agent's "private state" is the sublocale's interior, the agent's communication is restriction-and-extension across sublocale boundaries.
  The categorical isomorphism is operational on the worked examples but the full faithfulness across federation, scope-elevation (offices), and revocation is sketch-level.
- **Runbook ↔ closure-rule-derivation is faithful** (per the [composability narrative](composability-with-predicated-knowledge-systems.md), Bridge 2).
  A runbook execution reads as a *derivation* in the substrate's closure-rule system: each skill invocation is a closure-rule application, each sub-goal is a sub-derivation, each post-condition is a derived cell.
  The reading is operational but the discipline of mapping BDI plan-body operators (sequence, parallel, choice, while, achieve-goal) onto closure-rule combinators is not yet settled in full generality.
- **Dispatch ↔ match-strength-as-bilattice-value is faithful** (per [dispatch-as-closure-rule-system](../dispatch/dispatch-as-closure-rule-system/dispatch-as-closure-rule-system.md) and [dispatch-from-properties](../dispatch/dispatch-from-properties/dispatch-from-properties.md)).
  The match-strength a dispatch operator emits for a (skill, work-item) pair reads as a bilattice value: $\mathbf{t}$ if the skill matches and the agent is authorized, $\mathbf{f}$ if no match, $\bot$ if no information, $\top$ if competing-evidence (multiple skills match equally).
  The reading is enacted on the worked examples; full categorical faithfulness across the predicate category of work-item shapes is sketch-level.
- **Governance ↔ modal-necessity restriction is faithful** (per [governance-as-modal-restriction](../governance/governance-as-modal-restriction/governance-as-modal-restriction.md)).
  The platform's governance discipline reads as a modal-necessity operator on the substrate's accessibility relation between agents and operations; the proof is the parent theorem's modal-necessity properties, restated for the agential layer.
  The reading is operational on the office-graph case; its extension to dynamic governance changes (offices created and dissolved during operation) is sketch-level.
- **Federation across substrates inherits the math parent's CRDT discipline** (per [federation-convergence](../../../../../../../../../../../../../../engineering-services-section/content/text/glossary/concepts/federation-convergence.md), [substrate-specific-federation-conformance](../agent/federation/substrate-specific-federation-conformance/substrate-specific-federation-conformance.md)).
  The platform's federation operators (FARS's `merge-peer`, the `mash-rust-engine`'s envelope merge) inherit the parent theorem's bilattice $\vee_k$-as-merge result.
  The full conformance schema for substrate-specific operators is open per the linked question.
- **The LLM-agent loop is a special case of the platform's tick-dispatch-runbook cycle** (per [upstream-llm-agentic](../upstream-llm-agentic/upstream-llm-agentic.md)).
  ReAct-style thought-action-observation reads as one tick of the platform's cycle for an LLM-mediated agent.
  The reading is operational on the existing examples; its extension to multi-agent LLM systems (multiple LLM agents coordinating via the substrate) is sketch-level.

## What inherits as engineering correspondence

These are inheritances at the operational surface — what a working agential platform gets when it adopts the substrate-side framing:

- **Adding an agent is editing predications.** A new agent joining the platform is the substrate-side insertion of an agent-record entity and the extension of the federation graph; no platform restart, no out-of-band registration.
  Per [agent-community-consensus](../agent/agent-community/agent-community-consensus/agent-community-consensus.md), the consensus is recomputed automatically on the next closure-step.
- **Governance edits the agent population, not a configuration file.** Per [governance-as-modal-restriction](../governance/governance-as-modal-restriction/governance-as-modal-restriction.md), a governance decision to add a new office is a predication insertion on the office-graph; the agent population's authorization changes on the next tick.
- **Skills can be tuned by the platform itself.** When skills are entities and tool-call logs are entries in the [event log](../../../objects/event-log.md), a fine-tuned classifier (per [formality-layer](../scope/formality-layer/formality-layer.md)) trained on the platform's own logs can replace a frontier-model invocation; the platform improves itself per [learning-as-settlement](../memory/learning/learning-as-settlement/learning-as-settlement.md).
  The training pipeline is open per [micromodel-training-pipeline](../micromodel-training-pipeline/micromodel-training-pipeline.md).
- **Federation is by signature, not by protocol.** When [outposts](../teaching/explanations/outpost.md) and [inboxes](../teaching/explanations/inbox.md) are entities and witnesses are signed, federation is the substrate's merge of signed messages.
  Transport, retry, and ordering are engineering details of *how* federation is realized; the *what* is substrate-level structure.
- **Disagreement is observable, not exceptional.** Per [agent-community-consensus](../agent/agent-community/agent-community-consensus/agent-community-consensus.md) claim 2, disagreement between agents at the same cell becomes a $\top$-cell in the community's join.
  The substrate exposes which agents disagreed; the resolution discipline is policy.

## What is *not* inherited

Some commitments of the upstream literature are *not* preserved by the substrate-side framing.
Naming them is part of the discipline:

- **The choice of agent-architecture style.** BDI (PRS, Jason, JACK), pure-reactive (subsumption, behaviour-based), purely-deliberative (planner-centric), and hybrid (3T, TouringMachines) are agent architectures admissible under the platform; the discipline is open over which style a working agent commits to.
  A platform hosting a BDI runbook discipline is one realisation; a platform hosting purely-reactive closure-rule firing is another.
- **The choice of communication regime.** FIPA-ACL with full performative semantics, KQML, JSON-RPC, gRPC, MCP, raw HTTP: each is a communication regime admissible under the platform's [speech-act-as-witnessed-predication](../settlement/speech-act-as-witnessed-predication/speech-act-as-witnessed-predication.md) reformulation.
  The platform commits to *some* speech-act discipline existing without committing to which.
- **The choice of coordination topology.** Hierarchical (orchestrator-and-workers), peer-to-peer (federated), market-based (contract-net), stigmergic (shared-environment-mediated): each is a coordination topology the platform's [federation graph](../agent/federation/federation-graph/federation-graph.md) can express.
  The substrate is open over which topology a deployment commits to.
- **The choice of memory regime.** Per-agent isolated memory (actor-style), shared-blackboard memory (HEARSAY-style), substrate-resident streams with reflection (Generative-Agents-style): each is a memory regime the platform's [session-and-memory-as-substrate](../session/session-and-memory-as-substrate/session-and-memory-as-substrate.md) reformulation can host.
  The platform commits to memory-as-substrate-content without committing to its temporal granularity.
- **The choice of LLM-binding regime.** Direct API binding, function-calling surfaces, MCP-mediated tool use, on-device inference, fine-tuned micromodels: each is an LLM-binding regime admissible under the platform's [tool-use-as-skill-invocation](../skill/tool-use-as-skill-invocation/tool-use-as-skill-invocation.md) reformulation.
  The platform's [formality-layer](../scope/formality-layer/formality-layer.md) discipline names the *progression* across regimes; it does not commit to any single one.
- **The choice of governance regime.** Centralised (single executive), distributed (vote, quorum), constitutional (rule-bound), republic (delegated), captain-and-crew (this corpus's own choice): each is a governance regime admissible under [governance-as-modal-restriction](../governance/governance-as-modal-restriction/governance-as-modal-restriction.md).
  The platform commits to *some* modal-restriction discipline without commiting to which.

These un-inheritances are *features*, not bugs: they are the parameters by which the substrate-side framing adapts to different agent populations.
A framing that imposed any of them would be less general than the discipline it claims to formalise.

## What the parent gains by adopting the substrate

The parent theory predicated-computing is enriched, not replaced, by the agential framing committed to here.
What the parent gains:

- **A substrate-level reading of every agential primitive.** Agents, skills, runbooks, dispatch, governance, federation become substrate-level operations rather than orchestration-side glue.
- **A composability discipline with the predicated-knowledge-systems substrate.** Agential content and knowledge content live on the same substrate, federated via the same operations.
- **A first-class operational binding to working systems.** The corpus's own operational tooling — the personnel-and-offices machinery in `operations/command/`, the FARS sub-theory's flatfile realisation, the `mash-rust-engine` example — inherits the agential reading, which becomes the substrate's structural account of what *being-an-agent-on-a-platform* means at a working scale.
- **An internal stratification.** The platform's child sub-theory [flatfile-agentic-resource-system](../theories/flatfile-agentic-resource-system/) is itself a theory in the strict sense, parented by the agential layer.
  The parent gains a *vertical* discipline of theory-promotion alongside its horizontal one.
