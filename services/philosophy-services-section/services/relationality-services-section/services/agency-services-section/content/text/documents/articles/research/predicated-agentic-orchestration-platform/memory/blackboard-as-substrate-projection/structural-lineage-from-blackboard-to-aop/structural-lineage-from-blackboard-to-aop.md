---
type: narrative
status: current
recaps:
  - ../references/engelmore-morgan1988.md
  - ../references/hewitt-bishop-steiger1973.md
  - ../references/agha1986.md
  - ../references/gelernter1985.md
  - ../references/bratman1987.md
  - ../references/rao-georgeff1995.md
  - ../references/wooldridge-jennings1995.md
  - ../references/kowalski1995.md
  - ../references/finin-et-al1994.md
  - ../references/fipa-acl2002.md
  - ../references/yao-et-al2023.md
  - ../references/park-et-al2023.md
introduces:
  - ../objects/agentic-orchestration-platform.md
discusses:
  - ../teaching/explanations/agent.md
  - ../teaching/explanations/dispatch.md
  - ../teaching/explanations/runbook.md
  - ../teaching/explanations/inbox.md
  - ../teaching/explanations/governance.md
  - ../teaching/explanations/agential-self-generation.md
see-also:
  - what-aop-inherits.md
  - composability-with-predicated-knowledge-systems.md
  - upstream-classical-mas.md
  - upstream-llm-agentic.md
  - upstream-synthesis-bridges.md
title: From the blackboard to the agential orchestration platform — and what each step bought
description: The line from Hewitt's actor model (1973) through Gelernter's tuple-spaces (1985), the HEARSAY-II / blackboard architectures consolidated by Engelmore-Morgan (1988), Bratman's intention analysis (1987), the BDI realization of Rao-Georgeff…
---

# From the blackboard to the agential orchestration platform — and what each step bought

The line from Hewitt's actor model (1973) through Gelernter's tuple-spaces (1985), the HEARSAY-II / blackboard architectures consolidated by Engelmore-Morgan (1988), Bratman's intention analysis (1987), the BDI realization of Rao-Georgeff (1995), the FIPA agent-communication standardization (1994–2002), Kowalski's logic-meets-agents reconciliation (1995), the LLM-era agent-loop pattern of ReAct (Yao et al. 2023), and the long-horizon generative-agent demonstrations (Park et al. 2023) is not a roll-call of competing frameworks.
Each step on the line was taken in service of a real *structural problem* in the discipline of orchestrating multiple computational agents on a shared state; every step that survived did so because the next problem in the line could not be solved without it; the agential-orchestration-platform discipline as it stands is what the accumulated commitments look like when read substrate-side.

This narrative traces the line in the spirit of [from-frege-to-fars](../../../../../../../../../science/theories/information/theories/knowledge-systems/theories/predicated-knowledge-systems/narratives/from-frege-to-fars.md), [structural-lineage-from-church-to-roc](../../functional-runtime-platform/narratives/structural-lineage-from-church-to-roc.md), and [structural-lineage-peirce-to-lotman](../../../../../teaching-articles/explanations/structural-lineage-peirce-to-lotman.md): each step named, the engineering problem it solved spelled out, what its successor would have lacked without it.
The corpus's three [upstream-stream](../../../upstream-classical-mas/upstream-classical-mas.md) narratives ([classical-mas](../../../upstream-classical-mas/upstream-classical-mas.md), [llm-agentic](../../../upstream-llm-agentic/upstream-llm-agentic.md), [synthesis-bridges](../../../upstream-synthesis-bridges/upstream-synthesis-bridges.md)) survey the field topically; this narrative reads the same body of work *as a chain of required steps*.

## Hewitt-Bishop-Steiger solve the *shared-state-coupling* problem

Pre-1973 concurrent computation was structured around shared memory and locks.
The structural problem: shared mutable state forced every concurrent process into the same global synchronization regime, and the regime did not compose — two correct subsystems could deadlock when joined, and the proof obligation for any property of a composite system had to re-quantify over every pair of processes.
Concurrent computation had no compositional semantics.

Hewitt's move (1973; per [Hewitt-Bishop-Steiger 1973](../../../agent/hewitt-bishop-steiger1973/hewitt-bishop-steiger1973.md)) was the *actor model*: each concurrent unit is an actor that holds private state, communicates only by sending messages to other actors, and processes messages one at a time from its mailbox.
The structural argument was the *encapsulation discipline*: an actor's state is unobservable except through messages, so reasoning about an actor never escapes its local interface.
Agha's 1986 mathematical treatment (per [Agha 1986](../../../agent/agha1986/agha1986.md)) supplied the formal semantics — actors as triples $\langle \text{behavior}, \text{mailbox}, \text{address}\rangle$ — and proved the foundational compositional results.

The discipline's [agent](../teaching/explanations/agent.md) concept and the [inbox](../teaching/explanations/inbox.md) concept inherit the actor's encapsulation directly.
The substrate-side reformulation is stronger: the actor's mailbox becomes a substrate-resident inbox-record, the actor's behavior becomes substrate-resident skill and runbook records, and the actor's "private state" becomes a *scope-bounded view* on a single shared substrate per [boundary-as-fiber](../../../scope/boundary-as-fiber/boundary-as-fiber.md).
Without Hewitt-Bishop-Steiger and Agha, the discipline could not name agents as compositional units that share a substrate without sharing global state.

## Gelernter solves the *coordination-coupling* problem

Once concurrent units are encapsulated, the question becomes: how do they *coordinate* without re-introducing shared mutable state?
Pre-Linda coordination went through direct message-passing (every coordinating pair must know each other's addresses) or through shared queues (which re-introduce the synchronization regime the actor model removed).
The structural problem: coordination via direct addressing does not scale to dynamic populations of cooperating agents; coordination via shared queues re-introduces the locking regime.

Gelernter's move (1985; per [Gelernter 1985](../gelernter1985/gelernter1985.md)) was the *Linda* coordination model: a *tuple-space* is an associative shared store that any process can write tuples into, read tuples from (matching by template), or take tuples from (atomically).
The structural argument was the *generative coordination* discipline: producers do not address consumers, consumers do not address producers, both interact only with the tuple-space via associative match.
The model is *uncoupled* in space (producer and consumer need not know each other), in time (writes and reads can be separated arbitrarily), and in reference (no addresses).

The discipline inherits Gelernter's tuple-space discipline as the *generative-coordination* register the substrate occupies.
The substrate's [predication-graph store](../../../../../../../../../../../../../../../../engineering-services-section/content/text/glossary/terms/predication-graph-store.md) plays the tuple-space role: agents publish predications, agents read predications by [dispatch](../teaching/explanations/dispatch.md)-shape match, the medium is associative.
Without Linda, the discipline could not specify [dispatch](../teaching/explanations/dispatch.md) as a *substrate operation* — match-by-shape — rather than a directory lookup.

## Engelmore-Morgan consolidate the *opportunistic-control* problem

Linda gave a coordination *medium*; the question becomes: what *control* discipline runs on top of the medium?
The HEARSAY-II speech-understanding system (1970s) and the blackboard-architecture lineage that followed it had grappled with the same problem in domain-knowledge integration: many specialist *knowledge sources* could each contribute to a shared *blackboard*, but which knowledge source should fire next, on which blackboard region, was not specified by any single source.
The structural problem: opportunistic control — letting whichever knowledge source has the strongest match-strength on the current blackboard state fire next — required a *meta-reasoning* layer that selected among knowledge sources without itself being a knowledge source.

Engelmore-Morgan's move (1988; per [Engelmore-Morgan 1988](../engelmore-morgan1988/engelmore-morgan1988.md)) was the consolidation of the blackboard-architecture lineage into a discipline: blackboard + knowledge-sources + control component (the *scheduler*) that observes the blackboard state and selects the next knowledge-source firing per a published policy.
The structural argument was the *separation of reasoning from control*: knowledge sources state what to do given a blackboard state; the scheduler states which knowledge source fires; both are specifiable independently.

The discipline inherits the blackboard-control split as the [dispatch](../teaching/explanations/dispatch.md) discipline.
The platform's dispatch is structurally the blackboard's control component: it observes the substrate's predication state, computes a match-strength for each candidate skill against each candidate work-item, and selects per a published policy.
The substrate-side reformulation makes the control discipline first-class: the scheduler is itself a substrate entity (per [agential self-generation](../../../agent/agential-self-generation/agential-self-generation.md)), and dispatch decisions are recorded predications (per [dispatch-as-closure-rule-system](../../../dispatch/dispatch-as-closure-rule-system/dispatch-as-closure-rule-system.md)).
Without the blackboard lineage, the discipline could not separate *what work to do* from *who does it next* as substrate-level operations.

## Bratman and Rao-Georgeff solve the *practical-reasoning* problem

The opportunistic-control discipline let knowledge sources fire in response to blackboard state; the question becomes: how does an agent pursue *multi-step goals* under that discipline, without losing the goal as the blackboard state evolves?
Pre-Bratman analyses had agents as either reactive (each tick fires the most-applicable rule on the current state, no memory of intent) or fully deliberative (each tick re-plans the entire goal-pursuit).
The structural problem: reactive agents thrash on environments where goal-pursuit requires committing to a course of action across many ticks; fully-deliberative agents cannot meet real-time requirements.
A discipline of *bounded* commitment to action was missing.

Bratman's move (1987; per [Bratman 1987](../../../goal/bratman1987/bratman1987.md)) was the philosophical analysis of *intention* as a distinct mental attitude with three structural roles: intentions *constrain practical reasoning* (they rule out plans inconsistent with prior commitments), they *survive belief revision* (they remain in force when the world changes, until reconsidered), and they *control conduct* (they directly govern action).
Rao-Georgeff's move (1991; per [Rao-Georgeff 1995](../../../goal/rao-georgeff1995/rao-georgeff1995.md)) was the *Belief-Desire-Intention* (BDI) realization of Bratman's analysis as a practical agent architecture: agents have a belief base (the substrate state as the agent reads it), a desire set (open goals), an intention stack (committed-to plans), and a *practical-reasoning loop* that selects and revises intentions.
PRS, dMARS, and JACK are the operational realizations.

The discipline inherits BDI's practical-reasoning loop as the [practical-reasoning-as-runbook-execution](../../../runbook/practical-reasoning-as-runbook-execution/practical-reasoning-as-runbook-execution.md) concept.
The platform's [runbook](../teaching/explanations/runbook.md) is structurally the BDI plan: a triggering condition (BDI's *triggering event*), a context predicate (BDI's *context*), and a body of skill invocations and sub-goals (BDI's *plan body*).
The substrate-side reformulation makes intentions first-class predications per [intention-as-scope-bounded-commitment](../../../goal/intention-as-scope-bounded-commitment/intention-as-scope-bounded-commitment.md): an intention is a substrate cell with a scope, the scope is the boundary across which the intention constrains other agents' practical reasoning.
Without BDI, the discipline could not name [runbook](../teaching/explanations/runbook.md) as the unit of *committed course of action* distinct from [skill](../teaching/explanations/skill.md) (the unit of single-step capability).

## Wooldridge-Jennings consolidate the *agent-as-discipline-unit* problem

By 1995 the field had actors, tuple-spaces, blackboards, BDI, KQML — many partial accounts of what an *agent* was, with no shared definition.
The structural problem: without a definition of agent that names which properties an entity must have to count as one, the field could not characterize *agent-systems* compositionally; every paper had to re-define the term, and the re-definitions diverged.

Wooldridge-Jennings's move (1995; per [Wooldridge-Jennings 1995](../../../wooldridge-jennings1995/wooldridge-jennings1995.md)) was the *weak* and *strong* notions of agency: weak agency requires *autonomy*, *social ability*, *reactivity*, and *pro-activeness*; strong agency adds *mental attitudes* (beliefs, desires, intentions, etc.).
The structural argument was that the weak notion is the *minimum a system must support to be analyzed as multi-agent*, and the strong notion is the engineering *target* for systems that need to model agent reasoning explicitly.
[Wooldridge 2009](../../../wooldridge2009/wooldridge2009.md) is the consolidated textbook.

The discipline inherits the weak notion as the *minimum gate* for [agent](../teaching/explanations/agent.md): a substrate entity is an agent iff it satisfies autonomy (its actions are its own — substrate-recorded under its agent-record), social ability (it can communicate via the substrate's federation and inbox machinery), reactivity (it processes predications its scope admits), and pro-activeness (it can initiate runbook execution).
The strong notion is what BDI realizations of the platform commit to.
Without Wooldridge-Jennings, the discipline could not check whether a candidate substrate entity is *eligible to be called an agent* against a published gate.

## Finin et al. and FIPA solve the *speech-act-discipline* problem

Once agents are units, the question becomes: what are their *messages*?
Pre-KQML inter-agent messaging was either uninterpreted byte-streams (each pair of agents agreed on a private protocol, no portability) or function-call signatures (no semantics for inform / request / commit / refuse — speech acts collapsed to procedure calls).
The structural problem: agents communicating across organizational and trust boundaries needed messages with *speech-act semantics* — the message's *force* (assertion, query, request, commitment) had to be portable across implementations.

The KQML move (1994; per [Finin et al. 1994](../../../agent/federation/finin-et-al1994/finin-et-al1994.md)) and the FIPA-ACL move (2002; per [FIPA-ACL 2002](../../../agent/federation/fipa-acl2002/fipa-acl2002.md)) was the *agent communication language* discipline: messages carry a *performative* (the speech act — `inform`, `request`, `query-if`, `propose`, `accept-proposal`, etc.) and a *content* (the proposition being asserted, queried, or proposed).
The structural argument was Searle's speech-act theory operationalized for agents: the performative names *what kind of act the message performs*, the content names *what the act is about*.

The discipline inherits the speech-act discipline as the [speech-act-as-witnessed-predication](../../../settlement/speech-act-as-witnessed-predication/speech-act-as-witnessed-predication.md) concept.
The substrate-side reformulation collapses message and content into one substrate cell: an `inform` is a predication with the asserting agent as witness; a `request` is a predication with `request` as the predicate and the requested action as the object.
The performative is the *predicate slot* of the predication.
Without KQML/FIPA, the discipline could not commit to messaging as substrate-content rather than substrate-side glue, and federation across agent populations would have no portable semantics.

## Kowalski solves the *reactive-versus-rational unification* problem

By the mid-1990s the field had two disciplines for what an agent's program *is*: reactive (rules fire on state-changes, no deliberation) and rational (plans are formal specifications, deliberation drives execution).
The structural problem: real working agents needed both — fast reactive response to environmental changes *and* deliberative pursuit of multi-step goals — and the two were treated as separate architectural families.

Kowalski's move (1995; per [Kowalski 1995](../../../kowalski1995/kowalski1995.md)) was the *meta-logic* unification: reactive and rational agency are reconcilable through a shared logical substrate where rules can be either *triggered by state* (reactive) or *applied within a deliberation* (rational), and the same logical formula can occupy both roles depending on context.
AgentSpeak / Jason ([Bordini-Hübner-Wooldridge 2007](../../../bordini-et-al2007/bordini-et-al2007.md)) and ConGolog ([De Giacomo-Lespérance-Levesque 2000](../../../runbook/degiacomo-et-al2000/degiacomo-et-al2000.md)) are the operational realizations.

The discipline inherits the unification as the [closure-rule system](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/concepts/closure-rule-system.md) discipline applied to agential operations: closure rules fire on substrate state-changes (reactive), runbooks orchestrate sequences of skill invocations toward goals (rational), both run on the same substrate.
[dispatch-as-closure-rule-system](../../../dispatch/dispatch-as-closure-rule-system/dispatch-as-closure-rule-system.md) is the substrate-side restatement of Kowalski's argument: dispatch IS the closure-rule system at the agent layer.
Without Kowalski, the discipline would commit to reactive-versus-rational as separate substrate registers; with Kowalski, the discipline commits to a single substrate that supports both via the same closure machinery.

## Yao et al. solve the *LLM-agent-loop* problem

By the early 2020s the rise of large language models posed a new structural problem: an LLM produces text, but an agent needs to *act* — read state, invoke external tools, observe results, decide next action.
The structural problem: untyped text-completion does not carry the *reasoning-vs-action* discipline an agent loop requires; without that discipline, every LLM-driven agent re-invents an ad-hoc interleaving of thought and tool use.

Yao et al.'s move (2023; per [Yao et al. 2023](../../../skill/tool-use-as-skill-invocation/yao-et-al2023/yao-et-al2023.md)) was the *ReAct* pattern: explicit alternation of *thought* (LLM reasoning step) and *action* (tool invocation) with *observation* (tool result) inserted into the LLM's context window after each action.
The structural argument was that *interleaving makes the trace inspectable*: the agent's reasoning becomes an auditable sequence, the agent's actions become typed tool invocations, and post-hoc analysis can attribute outcomes to specific reasoning steps.
Schick et al. (2023, *Toolformer*; per [Schick et al. 2023](../../../skill/tool-use-as-skill-invocation/schick-et-al2023/schick-et-al2023.md)) demonstrated that the same pattern could be *learned* by the model directly.
The OpenAI / Anthropic function-calling and assistant surfaces (per [openai-agents-docs](../../../openai-agents-docs/openai-agents-docs.md), [anthropic-agent-loops](../../../anthropic-agent-loops/anthropic-agent-loops.md)) consolidated the engineering surface the field coalesced around.

The discipline inherits ReAct as the *interleaved tick-discipline* the platform supports for LLM-mediated agents.
The platform's [tick](../teaching/explanations/tick.md) is one closure-step on one entity; for an LLM agent, a tick may emit a reasoning predication ("thought") and a skill invocation ("act"), with the post-act substrate state read by the next tick ("observation").
The substrate-side reformulation makes the ReAct trace first-class: thoughts and actions are recorded predications, the [event log](../../../objects/event-log.md) IS the trace.
Without ReAct, the discipline could not bind LLM-mediated agents to the same substrate as classical-MAS agents with a shared reasoning-trace discipline.

## Park et al. solve the *long-horizon-memory* problem

ReAct gave a per-tick reasoning-action discipline; the question becomes: how do agents *remember* across ticks, sessions, and days?
Pre-Generative-Agents LLM applications had only a context window — once a fact rolled out of the window, it was gone.
The structural problem: long-horizon agent behavior (persistent goals, evolving relationships, learned preferences) required *substrate-resident memory* the agent could query across arbitrarily-long temporal gaps.

Park et al.'s move (2023; per [Park et al. 2023](../../../park-et-al2023/park-et-al2023.md)) was the *generative-agents* architecture with a memory stream: every observation, every action, every reflection is written to a substrate-resident memory stream; the agent retrieves relevant entries by recency-importance-relevance scoring; periodic *reflection* synthesizes patterns into higher-level memories.
The structural argument was the *Smallville demonstration*: 25 agents with this architecture produced coherent multi-day social behavior in simulation, refuting the claim that LLM agents could only be short-horizon.

The discipline inherits the memory-as-substrate discipline as the [scratchpad-as-session-memory-projection](../../scratchpad-as-session-memory-projection/scratchpad-as-session-memory-projection.md) concept and the [session-and-memory-as-substrate](../../../session/session-and-memory-as-substrate/session-and-memory-as-substrate.md) narrative.
The platform's substrate IS the memory stream; the LLM-era scratchpad is recovered as a session-scoped projection of the substrate's memory predications, with cross-session memory as agent-scoped predications above the session per [session-as-time-bounded-sublocale](../../../session/session-as-time-bounded-sublocale/session-as-time-bounded-sublocale.md).
Without Park et al.'s demonstration, the discipline would have to argue *that* long-horizon LLM-agent behavior is possible; with it, the discipline can argue *how* it is implemented as a substrate operation.

## What the line accumulates

Reading from Hewitt to Park, the discipline accumulates nine structural commitments:

| Step | Problem | Commitment | What the successor would lack |
|---|---|---|---|
| Hewitt-Agha | shared mutable state does not compose | actors-as-encapsulated-units with mailboxes | no compositional semantics for concurrent agents |
| Gelernter | direct addressing does not scale; shared queues re-couple | tuple-space as associative coordination medium | no medium for [dispatch](../teaching/explanations/dispatch.md) as substrate operation |
| Engelmore-Morgan | opportunistic firing requires meta-reasoning | blackboard + knowledge-sources + scheduler split | no substrate-level separation of *what work* from *who does it* |
| Bratman / Rao-Georgeff | reactive thrashes, fully-deliberative misses real-time | BDI: belief base, desires, intentions, practical reasoning | no [runbook](../teaching/explanations/runbook.md) discipline as committed course of action |
| Wooldridge-Jennings | no shared definition of agent | weak / strong agency gates | no published gate for "is this entity an [agent](../teaching/explanations/agent.md)?" |
| Finin / FIPA | inter-agent messaging without portable semantics | speech-act discipline: performative + content | no portable substrate-content reformulation of messages |
| Kowalski | reactive vs rational treated as separate architectures | meta-logic unification: same logic, different role | no single substrate supporting both modes |
| Yao et al. (ReAct) | LLM-driven agents re-invent thought/action interleaving | thought-action-observation as inspectable trace | no reasoning-trace discipline binding LLM agents to substrate |
| Park et al. | LLM agents have only context-window memory | substrate-resident memory stream with reflection | no long-horizon LLM-agent behavior on the substrate |

Each step is required for what comes after.
The accumulated commitment is what the discipline *is*; each commitment becomes a substrate-level operation under the predicated-knowledge-systems substrate (per the [composability narrative](composability-with-predicated-knowledge-systems.md)).
The substrate-side reformulation of *every* step in the line is the platform's [agential self-generation](../../../agent/agential-self-generation/agential-self-generation.md) commitment: the operations agents use are themselves substrate entities.

The discipline as it stands is not a parade of competing agent frameworks; it is the line of accumulated commitments that, taken together, constitutes the agential layer of a working predicated-computing substrate.
