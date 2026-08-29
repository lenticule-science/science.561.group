---
id: service
description: "A Service is a triple (I, Φ, ⊥) — an interface I specifying the operations the service exposes, a behavior specification Φ characterizing how the service responds to sequences of invocations, and an independence condition ⊥ asserting that the service's lifecycle is not tied to any particular client. The defining structure: a service is a computational component that provides capabilities to external clients through a stable interface, maintains its own state across multiple invocations, and can be invoked by multiple clients whose individual lifecycles it outlives. A service is not a process in isolation (a process may be private; a service exposes an interface) and not a function (a function is stateless; a service accumulates state across calls)."
defines: Service
related: Process, Automaton, Interface, Composition, IOAutomaton, ComponentModel
date-created: 2026-03-20
date-modified: 2026-03-20
params:
  interface: relational-universe-morphism
  behavior-specification: relational-universe
  state-domain: relational-universe
output: relational-universe-morphism
ast:
  interface-automaton:
    - interface
    - behavior-specification:
        - state-domain
        - interface
    - independence-condition:
        - behavior-specification
---

# Service

## Formal definition

A **Service** is a triple $(\mathcal{I}, \Phi, \perp)$:

$$(\mathcal{I} : \mathrm{Interface},\; \Phi : \mathrm{BehaviorSpec},\; \perp : \mathrm{Independence})$$

where:
- $\mathcal{I}$ is the **interface** — the boundary of the service that is visible to clients; an interface consists of: **provided operations** (what clients can invoke), **required operations** (what the service invokes on its environment), and the **types** of their inputs and outputs; the interface is a contract: clients may assume the service behaves according to $\Phi$ when they use it through $\mathcal{I}$, and the service may assume the environment provides what its required operations need
- $\Phi$ is the **behavior specification** — a characterization of how the service responds to sequences of invocations through $\mathcal{I}$; $\Phi$ may be expressed as an I/O automaton (specifying the transition relation), a process algebra term (specifying the CCS/CSP behavior), a temporal logic formula (specifying invariants and liveness), or a pre/postcondition contract (Hoare-style) on each operation; the behavior specification captures the service's protocol — the acceptable orderings of operations and the state changes they produce
- $\perp$ is the **independence condition** — the assertion that the service's state and lifecycle are independent of any particular client's state and lifecycle; the service persists across client connections and disconnections; its internal state is maintained and accumulated across multiple invocations from multiple clients; this independence is what makes services composable: the service does not terminate when one client terminates

**Three invariants.** $(\mathcal{I}, \Phi, \perp)$ is a service iff:

1. **Interface stability**: the interface $\mathcal{I}$ is stable across invocations — the set of provided and required operations does not change at runtime. Clients can rely on the interface remaining consistent. This is the condition that makes services interchangeable: two services with the same interface can be substituted for each other in a composition, provided their behaviors satisfy the same specification.

2. **Stateful persistence**: the service maintains internal state $s \in D$ that persists across multiple invocations. Each invocation may read and modify this state. The state is the service's memory — it encodes the accumulated history of prior interactions that affects current responses. A stateless component (one whose response depends only on the current request and not on prior requests) is a function, not a service in the full sense.

3. **Client-lifecycle independence**: the service's lifecycle ($\perp$) is independent of any individual client's lifecycle. The service starts before any particular client connects and may continue after all current clients disconnect. Clients are ephemeral relative to the service. This is the condition that distinguishes a service from a subroutine: a subroutine lives and dies with its caller; a service exists on its own terms.

## Lynch and Tuttle: input/output automata

Nancy Lynch and Mark Tuttle (*Hierarchical Correctness Proofs for Distributed Algorithms*, 1987; "An Introduction to Input/Output Automata," *CWI Quarterly*, 1989) introduced **I/O automata** as a formal model for reactive systems:

An **I/O automaton** is a tuple $(Q, \Sigma, \Delta, q_0)$ where:
- $Q$ is the state set
- $\Sigma = \Sigma_{\mathrm{in}} \cup \Sigma_{\mathrm{out}} \cup \Sigma_{\mathrm{int}}$ partitions the alphabet into **input actions** (controlled by the environment, cannot be disabled), **output actions** (controlled by the automaton), and **internal actions** (invisible to the environment)
- $\Delta \subseteq Q \times \Sigma \times Q$ is the transition relation
- $q_0 \in Q$ is the initial state

The key distinction: **input actions are always enabled** — the automaton cannot refuse an input. This models the fundamental asymmetry between services and their clients: a service may be invoked at any time; it cannot block invocations, only respond to them (perhaps with an error). Output actions, by contrast, are enabled or disabled by the automaton's current state.

**I/O automaton composition**: two automata $A_1$ and $A_2$ are **composable** iff their output alphabets are disjoint ($\Sigma_{\mathrm{out}}^{(1)} \cap \Sigma_{\mathrm{out}}^{(2)} = \emptyset$). The composed automaton $A_1 \| A_2$ shares internal transitions and synchronizes on shared actions. This models service composition: two services can be composed when their output channels do not conflict; shared channels are the communication interface between them.

Lynch's **simulation relations** give the right notion of service refinement: automaton $A_1$ **simulates** $A_2$ iff there exists a relation $f : Q_1 \to Q_2$ mapping $A_1$'s states to $A_2$'s states such that every step of $A_1$ is matched by a step of $A_2$. A refined service (simulating a more abstract one) is a more detailed implementation of the same behavioral specification.

## De Alfaro and Henzinger: interface automata

Luca de Alfaro and Thomas A. Henzinger (*Interface Automata*, 2001) extended I/O automata with a game-theoretic account of **interface compatibility**:

An **interface automaton** is an I/O automaton where composition is defined only between **compatible** interfaces. Two interfaces $A$ and $B$ are compatible iff there is an environment $E$ in which they can interact without reaching an error state — a state where $A$ sends an output that $B$ cannot handle or vice versa.

The compatibility check is a game: the system (trying to show compatibility) tries to find a safe execution; the environment (trying to find incompatibility) tries to trigger an error. The interface is compatible iff the system wins this game. This gives an **assume-guarantee** semantics for service interfaces: a service makes assumptions about its environment (which inputs it will receive) and guarantees about its outputs (what it will produce).

**Interface refinement**: interface $A'$ **refines** $A$ iff $A'$ is at least as useful as $A$ in every context. De Alfaro and Henzinger show that interface refinement corresponds to alternating simulation (a two-player game simulation) — a refinement of the game-theoretic analysis. A service specification can be progressively refined from abstract interface (what the service does) to concrete implementation (how it does it), with each refinement preserving compatibility.

## Hoare: communicating sequential processes

Tony Hoare (*Communicating Sequential Processes*, 1978, *CACM*; *Communicating Sequential Processes*, 1985, Prentice Hall) gave the seminal process algebra for concurrent services:

A **CSP process** is defined by a set of events (communication actions) and a behavior described inductively:
- $\mathrm{STOP}$: the process that does nothing (deadlocked)
- $a \to P$: the process that first performs event $a$ then behaves like $P$
- $P \sqcap Q$: internal (nondeterministic) choice between $P$ and $Q$
- $P \square Q$: external (deterministic) choice — the environment picks which first event to offer
- $P \| Q$: parallel composition — $P$ and $Q$ run concurrently, synchronizing on shared events
- $P \setminus A$: hiding — events in $A$ become internal to $P$

A service in CSP is a process $S$ that synchronizes with clients on shared events. The service's specification is its CSP term; two services are equivalent iff they are **failures-divergences equivalent** (have the same traces, failures, and divergences). CSP's trace model, failures model, and failures-divergences model give increasingly fine notions of process equivalence, capturing different aspects of observable behavior.

**CSP's refinement order**: $P$ refines $Q$ (written $P \sqsubseteq Q$) iff every trace, failure, and divergence of $P$ is also a trace/failure/divergence of $Q$. A more refined service has no new bad behaviors relative to its specification.

## Open questions

- Whether the I/O automaton model of services (Lynch-Tuttle) and the interface automaton model (de Alfaro-Henzinger) agree on the right notion of service refinement — whether I/O automaton simulation and interface automaton alternating simulation coincide when the environment is constrained to be compatible.
- Whether there is a coalgebraic account of services — whether the interface functor $F(\text{State}) = \text{Output}^{\text{Input} \times \text{State}}$ (outputs depend on input and current state) gives a coalgebra whose final coalgebra is the universal service type, and whether service equivalence is bisimulation in this coalgebraic setting.
- Whether composition of services (I/O automaton parallel composition) corresponds to a tensor product in a suitable category of services — whether $A \| B$ is the coproduct, product, or tensor in a symmetric monoidal category of service specifications.
- Whether the interface independence condition ($\perp$) can be formally characterized as a property of the behavior specification $\Phi$ — whether independence means $\Phi$ does not contain any proposition of the form "the service terminates when client $c$ disconnects," and whether this negative existential condition has a positive algebraic characterization (e.g., $\Phi$ is a fixed point of some stability operator).
