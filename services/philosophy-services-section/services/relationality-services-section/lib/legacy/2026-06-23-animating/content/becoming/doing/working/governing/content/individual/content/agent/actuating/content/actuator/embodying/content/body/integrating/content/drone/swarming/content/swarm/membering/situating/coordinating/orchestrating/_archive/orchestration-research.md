---

description: "An Orchestration is a triple (E, {P₁, ..., Pₙ}, Π) — a central coordinator E, a set of subordinate participants {P₁, ..., Pₙ}, and an interaction protocol Π — where E alone holds the global view of the process and coordinates participants by invoking them explicitly. The defining structure: orchestration is centralized coordination — E issues commands; participants respond. Orchestration contrasts with choreography: in a choreography no central controller exists; each participant knows only its local protocol and interacts directly with others. The orchestration/choreography distinction captures the axis between imperative (orchestrator commands) and declarative (global protocol, locally realized) coordination."
defines: Orchestration
related: Workflow, Plan, Process, Service, Choreography, BPEL, SessionType
date-created: 2026-03-20
date-modified: 2026-03-20
introduces: specification
---

# Orchestration

## Formal definition

An **Orchestration** is a triple $(\mathcal{E}, \mathcal{P}, \Pi)$:

$$(\mathcal{E} : \mathrm{Orchestrator},\; \mathcal{P} = \{P_1, \ldots, P_n\} : \mathrm{Participants},\; \Pi : \mathrm{InteractionProtocol})$$

where: - $\mathcal{E}$ is the **orchestrator** — the central coordinator that drives the orchestration; $\mathcal{E}$ has a complete view of the process and is responsible for invoking participants in the right order, passing data between them, handling responses, and managing exceptions; the orchestrator is the locus of control — all coordination passes through it - $\mathcal{P} = \{P_1, \ldots, P_n\}$ is the **participant set** — the services or agents the orchestrator coordinates; each $P_i$ exposes an interface of invocable operations but has no knowledge of the overall workflow; from each $P_i$'s perspective, it receives a request from $\mathcal{E}$ and returns a response; the participant's behavior is local and reactive — it does not initiate coordination - $\Pi$ is the **interaction protocol** — the specification of how $\mathcal{E}$ coordinates $\mathcal{P}$; $\Pi$ specifies: the sequence of invocations (which $P_i$ is invoked when), the data flow (which outputs become inputs), the control flow (sequential, parallel, conditional, iterative routing), and exception handling

**Two invariants.** $(\mathcal{E}, \mathcal{P}, \Pi)$ is an orchestration iff:

1. **Centralized control**: $\mathcal{E}$ is the sole controller of the coordination.
  Every interaction between participants passes through or is mediated by $\mathcal{E}$; no $P_i$ directly invokes another $P_j$ as part of the orchestrated process.
  The control flow lives in $\mathcal{E}$'s protocol, not in the participants.
  This is the defining distinction from choreography: in an orchestration, $\Pi$ is implemented by $\mathcal{E}$; in a choreography, $\Pi$ is distributed across all participants.

2. **Participant opacity**: each $P_i \in \mathcal{P}$ is opaque to the other participants — $P_i$ knows only its own interface and $\mathcal{E}$'s invocations; it does not know about $P_j$ for $j \neq i$ and does not know its position in the overall workflow.
  Participant opacity makes orchestrations substitutable: $P_i$ can be replaced by any service implementing the same interface without modifying any other participant — only $\mathcal{E}$'s protocol needs updating.

## Orchestration vs choreography

The **orchestration/choreography distinction** was formalized in the web services context ca.
2002–2004 (W3C *Web Services Architecture*, 2004; W3C *Web Services Choreography Description Language*, 2004):

**Orchestration** (imperative): a central process $\mathcal{E}$ manages the overall workflow. $\mathcal{E}$ invokes services, handles responses, manages state, and drives the process to completion.
BPEL (WS-BPEL 2.0) is the standard orchestration language: a BPEL process is the orchestrator; the services it calls are participants.

**Choreography** (declarative): a decentralized protocol that each participant implements locally.
There is no orchestrator; each participant knows its **local protocol** (what messages to send and receive, and when) and interacts directly with other participants.
WS-CDL (Web Services Choreography Description Language) specifies choreographies as global interaction patterns from which local protocols can be derived.

The formal difference in terms of process algebra: - **Orchestration**: $\mathcal{E} \mid P_1 \mid \cdots \mid P_n$ where $\mathcal{E}$ is an active process driving the $P_i$ as reactive services - **Choreography**: $P_1 \mid \cdots \mid P_n$ where each $P_i$ is a process with a locally specified protocol; no $\mathcal{E}$ exists as a separate entity

## Milner: CCS and $\pi$-calculus

Robin Milner's process calculi provide the formal foundation for both orchestration and choreography:

**CCS** (*A Calculus of Communicating Systems*, 1980): processes communicate by synchronizing on shared channel names. $P \mid Q$ is parallel composition; $P$ and $Q$ synchronize on complementary actions $a$ and $\bar{a}$.
An orchestration is a CCS process $\mathcal{E} \mid P_1 \mid \cdots \mid P_n$ where $\mathcal{E}$ sends on channel $a_i$ to which $P_i$ listens on $\bar{a}_i$.

**The $\pi$-calculus** (*A Calculus of Mobile Processes*, Milner, Parrow, Walker 1992): extends CCS with **name-passing** — channel references can be sent as message payloads, enabling dynamic binding.
An orchestrator $\mathcal{E}$ can receive a channel reference to a participant at runtime, invoke it, and forward the result — modeling dynamic service orchestration where participants are discovered and bound at runtime.
The $\pi$-calculus's scope extrusion rule ($\nu x (P \mid Q) \mid R \equiv \nu x (P \mid Q \mid R)$ when $x$ free in $R$ after extrusion) formalizes how new communication channels are shared between the orchestrator and new participants.

**Bisimulation for orchestrations**: two orchestration processes are equivalent iff they are bisimilar — no external observer (participant) can distinguish them.
The **labeled bisimulation** in CCS/π-calculus gives the right equivalence: two orchestrations that produce the same observable behaviors (same invocations on participants, same responses handled) are bisimilar.

## Honda, Carbone, and Yoshida: multiparty session types

Kohei Honda (*Language Primitives and Type Discipline for Structured Communication-Based Programming*, 1998, with Vasconcelos and Kubo), and Carbone, Honda, Yoshida (*Structured Communication-Centred Programming for Web Services*, 2008) developed **multiparty session types** as the formal type theory for choreographic protocols:

A **global type** $G$ specifies the communication protocol for participants $\{p_1, \ldots, p_n\}$: - $p \to q : \langle T \rangle .
G'$: $p$ sends a value of type $T$ to $q$, then $G'$ continues - $p \to q : \{l_i : G_i\}_{i \in I}$: $p$ selects label $l_i$ for $q$, and $G_i$ continues - $\mu X.
G$: recursive protocol

**Projection** $G \upharpoonright r$: the **local type** for participant $r$ extracted from global type $G$ — $r$'s view of the protocol:

$$(p \to q : \{l_i : G_i\}_{i \in I}) \upharpoonright r = \begin{cases} \oplus\{l_i : G_i \upharpoonright r\}_{i \in I} & \text{if } r = p \text{ (internal choice: } r \text{ sends)} \\ \&\{l_i : G_i \upharpoonright r\}_{i \in I} & \text{if } r = q \text{ (external choice: } r \text{ receives)} \\ \mathrm{merge}_{i \in I}(G_i \upharpoonright r) & \text{otherwise (}r\text{ uninvolved; merge must be defined)} \end{cases}$$

The global type $G$ is **projectable** iff the merge operation is defined for all uninvolved participants.
A well-typed process system $\prod_r P_r$ satisfies global type $G$ iff each $P_r$ implements $G \upharpoonright r$.

**Key theorems** (Honda, Yoshida & Carbone, *JACM* 63(1), 2016): well-typed multiparty session processes satisfy (i) **subject reduction** — type is preserved under reduction; (ii) **progress** — no deadlock; (iii) **projection soundness** — if $G$ is projectable and each participant implements its local type, the system is communication-safe.

**The orchestration-choreography duality**: every orchestrated process can be expressed as a choreographic global type, and every choreography can be compiled to an orchestrated implementation.
The duality is formal: the orchestrator $\mathcal{E}$'s protocol corresponds to one participant's local type in the choreographic description; "rotating" which participant acts as the controller yields the orchestration from the choreography.
Honda et al.'s key result: a choreographic global type $G$ can always be compiled to an executable orchestration (with a designated "orchestrating" participant implementing $G \upharpoonright$ orchestrator).

## Open questions

- Whether the orchestration/choreography duality is a formal categorical duality — whether orchestrations and choreographies are dual objects in some category of distributed process specifications, related by a duality functor, and whether the projection from choreography to orchestration (extracting the orchestrator's local type) is this functor's action.
- Whether the soundness conditions for orchestration (the orchestrator correctly handles all possible participant responses, including faults) and choreography (the global type projects correctly to all local types without communication mismatches) unify to a single correctness criterion in the π-calculus or session type setting.
- Whether multiparty session types have a sheaf-theoretic formulation — whether a global type is a global section of a presheaf over the history site (the protocol as consistent local data), and whether projection is the restriction map in the presheaf.
- Whether the BPEL compensation mechanism — reversing committed work when a fault occurs — has a categorical formulation as a monad (the compensation monad), where binding corresponds to recording compensation actions and the monad's unit/multiplication handle normal and compensated execution.
