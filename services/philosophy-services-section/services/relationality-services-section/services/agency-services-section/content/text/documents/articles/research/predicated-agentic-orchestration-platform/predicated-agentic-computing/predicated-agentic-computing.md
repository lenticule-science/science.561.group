---
type: narrative
status: current
recaps: [predication-substrate, agential-self-generation, federation, witness, runbook, dispatch]
introduces: [predicated-agentic-computing]
discusses: [predication-substrate, agential-self-generation, federation, runbook, dispatch]
title: Predicated agentic computing
description: "This narrative names and positions the composite theory the engineering corpus is building toward — predicated agentic computing: the design discipline that combines a predication substrate (the predication / logic upstream stream…"
---

# Predicated agentic computing

This narrative names and positions the *composite theory* the engineering corpus is building toward — *predicated agentic computing*: the design discipline that combines a [predication substrate](../../../teaching/explanations/predication-substrate.md) (the predication / logic upstream stream realized as a runtime substrate) with the [agential self-generation](../agent/agential-self-generation/agential-self-generation.md) commitment (agents and their machinery as substrate content).
The composite is what the predicated-computing and agential-orchestration-platform corpora together specify; this narrative names the composite explicitly so subsequent corpus work has a referent.

## What predicated agentic computing is

A *predicated agentic computing system* satisfies all of the following commitments simultaneously:

- **Predication substrate.** The system's storage primitive is the [predication cell](../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/concepts/predication-cell.md) carrying a value in the four-valued bilattice; the system's reasoning primitive is the [closure-rule system](../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/concepts/closure-rule-system.md) operating on the substrate's [predication-graph store](../../../../../../../../../../../../../../engineering-services-section/content/text/glossary/terms/predication-graph-store.md) under the hyperdoctrinal apparatus of [Jacobs (1999)](../../../../../../../../../../logic-services-section/content/text/documents/articles/notes/undated/jacobs1999.md).
  The substrate's value-domain is paraconsistent ([Belnap (1977)](../../../references/belnap1977.md), [Fitting (2006)](../../../references/fitting2006.md), [Ginsberg (1988)](../../../references/ginsberg1988.md)); contradictions are recorded, not exploded.
- **First-class provenance and witnessing.** Every state change carries a [witness](../../../teaching/explanations/witness.md) recording the operator, the inputs, the outputs, and the substrate state at the time of the event.
  Provenance is substrate content, not an annotation layer ([Green–Karvounarakis–Tannen (2007)](../../../references/green-et-al2007.md) gives the algebraic shape; the substrate's witness chain is the substrate-content realization).
- **Agential self-generation.** Every operative element — every [agent](../teaching/explanations/agent.md), every [skill](../teaching/explanations/skill.md), every [runbook](../teaching/explanations/runbook.md), every [shape](../scope/shape/shape.md), every [office](../teaching/explanations/office.md), every [governance](../teaching/explanations/governance.md) rule — is a substrate entity.
  The agential layer's machinery, including the layer's own definition of what counts as an agent, is in the same substrate the agents act on.
- **Federation by value-domain join.** Two systems federating compose through the substrate's value-domain join.
  There is no separate federation protocol; the substrate's algebra is the federation protocol per [federation-as-substrate-join](../../../narratives/federation-as-substrate-join.md).
  Convergence under arbitrary message-delivery orderings is structural (the bilattice-valued generalization of [Shapiro et al. (2011)](../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/references/shapiro-et-al2011.md)'s CRDT discipline).
- **Practical reasoning as substrate operator schedule.** The classical-MAS practical-reasoning loop ([Bratman (1987)](../goal/bratman1987/bratman1987.md), [Rao–Georgeff (1995)](../goal/rao-georgeff1995/rao-georgeff1995.md)) is realized as the substrate's tick / dispatch / runbook-execution cycle ([practical-reasoning-as-runbook-execution](../runbook/practical-reasoning-as-runbook-execution/practical-reasoning-as-runbook-execution.md)); the LLM-era agent loop ([ReAct](../skill/tool-use-as-skill-invocation/yao-et-al2023/yao-et-al2023.md)) is the same cycle restated for LLM-mediated agents.

A system satisfying any subset of these commitments is *partially* predicated-agentic; a system satisfying all of them is *fully* predicated-agentic.
The predicated-computing engineering theory specifies the substrate side; the agential-orchestration-platform theory specifies the agential side; the two together specify the composite.

## How the upstream streams compose

The five upstream streams identified in the recent enrichment narratives — [predication-and-logic](../../../narratives/upstream-predication-logic.md), [classical-MAS](../upstream-classical-mas/upstream-classical-mas.md), [LLM-era-agentic](../upstream-llm-agentic/upstream-llm-agentic.md), [synthesis-bridges](../upstream-synthesis-bridges/upstream-synthesis-bridges.md), [substrate-and-coordination](../../../narratives/upstream-substrate-coordination.md) — compose into the predicated-agentic-computing system through a specific division of labor:

- **Predication-and-logic** supplies the substrate (fibred categorical apparatus; bilattice value-domain; recursive-query closure; provenance algebra; situation-calculus action representation).
- **Classical-MAS** supplies the agential vocabulary and engineering catalog (agents, messages, blackboards, tuple spaces, BDI architectures, FIPA performatives).
- **LLM-era-agentic** supplies the modern agent surface (agent loops, typed tool use, scratchpads, long-horizon memory, the industry-standardized API shape).
- **Synthesis-bridges** supplies the prior attempts at the same composite (logic-programming-meets-agents; semantic-web-agents) — establishing the targets that the platform's substrate-content reformulation achieves through one operator family rather than through layered interfaces.
- **Substrate-and-coordination** supplies the federation foundation (process algebras, CRDTs, distributed knowledge, consensus protocols).

Each stream contributes specific structural elements to the composite, with the platform's specific commitment that *all of them are substrate content*.
Where the streams' published works treat each component as a separate engineering layer, the composite makes everything substrate content with the bilattice value-domain throughout, the witness chain as the audit and causal-history layer, and runbooks as the substrate-content realization of higher-level patterns.

### Borrowed vs novel — per-stream matrix

| Stream | What the composite borrows | Where the composite diverges | Substrate-content novelty |
|---|---|---|---|
| Predication / logic | Fibred categorical apparatus (Jacobs); bilattice four-valued domain (Belnap, Ginsberg, Fitting); recursive-query / Datalog closure (Abiteboul–Hull–Vianu); provenance semirings (Green–Karvounarakis–Tannen); situation-calculus action representation (McCarthy–Hayes, Reiter); RDF/SPARQL knowledge-graph register (W3C, Hogan et al.) | Lifts Datalog from $\mathbf{2}$-valued to bilattice-valued; treats provenance as substrate content rather than as an annotation layer; treats action histories as substrate event-log content rather than as an external execution trace | Witness chain as substrate primitive; bilattice value-domain throughout; closure-rule system as the unified reasoning operator |
| Classical multi-agent systems | Agent / message / blackboard / tuple-space vocabulary (Wooldridge–Jennings, Hewitt–Agha, Gelernter, Engelmore–Morgan); BDI architecture (Rao–Georgeff, Bratman); FIPA / KQML communication (FIPA, Finin et al.) | Replaces mentalistic belief / desire / intention semantics with substrate-content reformulations; replaces FIPA performative semantics with witnessed-predication speech-acts; replaces blackboard / tuple-space middleware with substrate fibers / scopes | Belief-as-fiber-restriction, intention-as-scope-bounded-commitment, speech-act-as-witnessed-predication, blackboard-as-substrate-projection |
| LLM-era agentic | Agent loop (ReAct, Yao et al.); typed tool use (Toolformer, OpenAI / Anthropic agent docs); long-horizon memory (Park et al. generative agents); orchestration frameworks (MetaGPT, Wang et al. survey, Xi et al. survey) | Refuses framework-code SOPs in favor of substrate-content runbooks; refuses framework-defined tools in favor of substrate-content skills; refuses scratchpad-as-prompt-buffer in favor of session-memory-projection over substrate predications | Tool-use-as-skill-invocation, scratchpad-as-session-memory-projection, runbook as substrate-content SOP |
| Synthesis bridges | Logic-programming-meets-agents (Kowalski meta-logic; Bordini et al. AgentSpeak/Jason; De Giacomo et al. ConGolog); semantic-web-agents (Berners-Lee–Hendler–Lassila, Hendler) | Earlier syntheses kept agent machinery in framework code or in a layered architecture above the data; the composite collapses both into substrate content with one operator family | Plan-body-as-runbook; substrate as the uniform reactive/rational substrate Kowalski proposed |
| Substrate / coordination | Process algebras (Milner π-calculus; Sangiorgi–Walker); CRDTs (Almeida–Baquero–Shapiro, Preguiça et al.); distributed knowledge (Fagin–Halpern–Moses–Vardi); consensus protocols (Lamport Paxos, Ongaro–Ousterhout Raft) | Lifts CRDTs from $\mathbf{2}$-valued / numeric value-domains to bilattice-valued; treats consensus as a closure-rule firing pattern rather than as a separately-engineered protocol; treats causal history as substrate witness chain rather than as separately-tracked metadata | Consensus-as-closure-rule, causal-history-as-witness-chain, federation-by-value-domain-join |

## What predicated agentic computing rejects

The composite explicitly rejects positions held in pieces by the upstream streams:

- **The agent / data layered architecture.** The Semantic-Web-agents program treated agents as a layer above RDF/OWL; LLM-agent frameworks treat agents as a layer above vector DBs and tool routers; classical MAS treated agents as a layer above message buses.
  The composite makes data, agents, ontologies, communication, and coordination *one substrate*.
- **Mentalistic agent semantics that the substrate cannot inspect.** The BDI tradition's beliefs / desires / intentions and FIPA's mentalistic speech-act semantics ground agency in mental states the substrate has no access to.
  The composite reformulates each as substrate content: beliefs as fiber-restricted predications ([belief-base-as-fiber-restriction](../memory/belief-base-as-fiber-restriction/belief-base-as-fiber-restriction.md)); intentions as scope-bounded commitments ([intention-as-scope-bounded-commitment](../goal/intention-as-scope-bounded-commitment/intention-as-scope-bounded-commitment.md)); speech-acts as witnessed predications ([speech-act-as-witnessed-predication](../settlement/speech-act-as-witnessed-predication/speech-act-as-witnessed-predication.md)).
- **Two-valued semantics at the storage layer.** Datalog, RDF, classical CRDT data types, and most agent-platform stores are $\mathbf{2}$-valued.
  The composite uses the four-valued bilattice throughout; contradictions are first-class.
- **Out-of-substrate agent machinery.** AgentSpeak/Jason loads its plans from external code; LLM-agent frameworks define their tools and SOPs in framework code; classical MAS instantiates its organizational structure in framework configuration.
  The composite makes all the agent machinery substrate content per [agential self-generation](../agent/agential-self-generation/agential-self-generation.md).
- **Provenance as separately-engineered audit layer.** Most agent and data-storage systems achieve auditability by adding logging on top of the operational stack.
  The composite makes provenance substrate content from the start: every event is born with its witness; auditing is substrate traversal.

## What predicated agentic computing enables

The composite enables a class of system properties that none of the upstream streams' published works individually achieve:

- **End-to-end auditability without external logging.** Every agent decision, every tool call, every belief update, every governance check, every federation merge, every consensus step is in the substrate's witness chain.
  Replay reconstructs the system's full operational history from the chain.
- **Federation across vendors and instances without protocol re-specification.** Two predicated-agentic systems federating exchange their substrate content through value-domain join.
  There is no agent-platform protocol to negotiate, no schema mapping to bolt on; vocabulary differences are substrate-content bridge predications subject to the same operators.
- **Paraconsistency at the agent layer.** Two agents that observe contradictory facts about the same predication produce a $\top$-valued substrate cell that subsequent dispatch can act on.
  The contradiction is preserved as substrate content rather than collapsed by ex-falso reasoning or arbitrarily resolved by last-write-wins.
- **Agent self-improvement through substrate edit.** An agent that wants to refine its skills, change its runbooks, or update its governance rules edits substrate content through the same operators it uses for everything else.
  The "self-improvement" engineering question reduces to substrate-edit authorization.
- **Uniform integration of LLM-mediated and non-LLM-mediated agents.** Per [tool-use-as-skill-invocation](../skill/tool-use-as-skill-invocation/tool-use-as-skill-invocation.md), LLM tool use is substrate skill invocation; per [scratchpad-as-session-memory-projection](../memory/scratchpad-as-session-memory-projection/scratchpad-as-session-memory-projection.md), the LLM scratchpad is a session-memory projection.
  Both shapes coexist in the same substrate; mixing LLM agents with deterministic skills, micromodels, and human users is a substrate composition rather than a cross-framework integration.

## The corpus's commitment going forward

The engineering corpus (predicated-computing and agential-orchestration-platform together) is the *specification* of predicated agentic computing as a design discipline.
The math foundation rooted at the [predication cell](../../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/concepts/predication-cell.md) supplies the formal apparatus; the engineering corpus operationalizes the apparatus into a substrate with the agential layer.
The five upstream streams are the corpus's intellectual debts; the substrate-content reformulation is the corpus's specific contribution.
The composite-theory name *predicated agentic computing* is the engineering register's handle for the discipline; subsequent corpus work — additional theorems, more developed runbook catalogs, the formality-layer micromodel discipline, the federation-trust grading — extends the composite without re-stating the foundational commitment that this narrative records.
