---
id: workflow
description: "A Workflow is a tuple (P, T, F, M₀, M_f) — a Petri net with a distinguished source place P_s (no incoming arcs) and sink place P_e (no outgoing arcs), where every node lies on a directed path from P_s to P_e — that models a business process as a coordinated sequence of activities with explicit data and control flow. The defining structure: a workflow specifies how a set of activities is to be performed by specifying the conditions under which each activity becomes enabled, the dependencies between activities, and the routing logic (sequential, parallel, conditional, iterative) that governs execution. A workflow is not a plan (a plan is a static structure of intended actions; a workflow is a dynamic process that can be enacted by multiple cases) and not a procedure (a procedure has a single specification; a workflow orchestrates many procedures across many participants)."
defines: Workflow
related: Plan, Procedure, Process, Orchestration, PetriNet, BPELProcess
date-created: 2026-03-20
date-modified: 2026-03-20
params:
  activity-set: relational-universe
  routing-logic: relational-universe-morphism
  data-flow: relational-universe-morphism
output: relational-universe
ast:
  workflow-net:
    - activity-set
    - routing-logic:
        - activity-set
        - activity-set
    - soundness-condition:
        - routing-logic
        - data-flow
---

# Workflow

## Formal definition

A **Workflow** is a tuple $(P, T, F, M_0, M_f)$ — a **workflow net** — where:
- $(P, T, F)$ is a **Petri net**: $P$ is a finite set of **places** (conditions/states), $T$ is a finite set of **transitions** (activities), $F \subseteq (P \times T) \cup (T \times P)$ is the **flow relation** (arcs)
- $M_0 : P \to \mathbb{N}$ is the **initial marking** — a single token on the **source place** $p_s$ (the unique place with $\bullet p_s = \emptyset$, no incoming arcs): $M_0 = \{p_s \mapsto 1, p \mapsto 0 \text{ for } p \neq p_s\}$
- $M_f : P \to \mathbb{N}$ is the **final marking** — a single token on the **sink place** $p_e$ (the unique place with $p_e\bullet = \emptyset$, no outgoing arcs): $M_f = \{p_e \mapsto 1, p \mapsto 0 \text{ for } p \neq p_e\}$

**Structural condition**: every node $n \in P \cup T$ lies on a directed path from $p_s$ to $p_e$ in the graph $(P \cup T, F)$. No node is isolated from the workflow's flow.

**Firing rule**: a transition $t \in T$ is **enabled** in marking $M$ iff every input place has at least one token: $\forall p \in \bullet t : M(p) \geq 1$. Firing $t$ consumes one token from each input place and produces one token in each output place: $M' = M - \mathbf{1}_{\bullet t} + \mathbf{1}_{t\bullet}$.

**Three invariants.** $(P, T, F, M_0, M_f)$ is a workflow iff:

1. **Single source and sink**: there is exactly one source place $p_s$ and one sink place $p_e$. The source is the workflow's start: every execution begins with a token at $p_s$. The sink is the workflow's end: every successful execution terminates with a token at $p_e$. Multiple sources or sinks represent multiple independent processes, not a single workflow.

2. **Structural connectivity**: every node is on a path from $p_s$ to $p_e$. Unreachable transitions (not on any path from source) would never execute; unreachable places would never receive tokens. Structural connectivity ensures the workflow's structure is minimal — no dead components.

3. **Soundness** (the key behavioral property — not a static structural invariant but a semantic condition):
   - **Termination**: for every marking $M$ reachable from $M_0$, there exists a firing sequence from $M$ reaching $M_f$. Every execution can eventually complete.
   - **Proper completion**: $M_f$ is the only marking reachable from $M_0$ with a token in $p_e$ — $M_f(p) = 0$ for $p \neq p_e$. Completion places exactly one token in the sink and nothing elsewhere.
   - **No dead transitions**: every transition $t \in T$ can fire in at least one reachable marking. No activity is permanently blocked.

## Petri: places, transitions, and the concurrency model

Carl Adam Petri (*Kommunikation mit Automaten*, 1962, dissertation) introduced **Petri nets** as a formal model of concurrent computation:

A **Petri net** $(P, T, F)$ models concurrency through **place-token semantics**: places represent conditions (resources, states, data locations); transitions represent events (activities, firings); tokens represent instances of conditions being active. Multiple transitions can fire simultaneously if their input places are disjoint (true concurrency, not interleaving).

**Key Petri net properties** relevant to workflow analysis:
- **Reachability**: is marking $M'$ reachable from $M_0$? Decidable but requires non-primitive-recursive time (Mayr 1984; Kosaraju 1982); EXPSPACE-hard lower bound; effectively reduces to coverability for most practical analysis
- **Liveness**: is every transition enabled in at least one reachable marking from every reachable marking? (Each activity can always eventually be done)
- **Boundedness**: is there a bound $k$ such that no place ever holds more than $k$ tokens? ($k$-bounded nets have finite state spaces; decidable and reduces to reachability; Hack 1976)
- **Coverability**: is every marking dominated by some reachable marking? Decidable in EXPSPACE (Rackoff 1978)

**Petri net classes**:
- **Free-choice nets**: $\forall t_1, t_2 \in T : \bullet t_1 \cap \bullet t_2 \neq \emptyset \Rightarrow \bullet t_1 = \bullet t_2$ — if two transitions share an input place, they share all input places. Free-choice nets are the most common in workflow modeling; soundness is decidable in polynomial time for free-choice workflow nets (Desel & Esparza 1995).
- **Workflow nets**: the workflow-specific subclass (van der Aalst's restriction) ensures source/sink structure and connectivity.

## Van der Aalst: workflow nets and soundness

Wil van der Aalst (*The Application of Petri Nets to Workflow Management*, 1998, *Journal of Circuits, Systems and Computers*; *Workflow Management: Models, Methods, and Systems*, 2002, with Kees van Hee) formalized workflow management using Petri nets:

A **WF-net** (workflow net) is a Petri net satisfying the structural conditions above. Van der Aalst's central contribution: defining **soundness** as the right behavioral correctness criterion for workflow processes (Invariant 3 above) and proving algorithmic results for checking soundness.

**The soundness verification algorithm**: for a workflow net $N$, construct the **short-circuited net** $N^*$ by adding a transition $t^*$ from the sink $p_e$ to the source $p_s$. Then:
- $N$ is sound iff $N^*$ is **live and bounded**.

Liveness and boundedness of $N^*$ can be checked using existing Petri net tools. For free-choice workflow nets, soundness checking is polynomial (Desel & Esparza 1995); for safe WF-nets, PSPACE-complete; for general WF-nets, EXPSPACE-complete (Blondin, Majumdar & Offtermatt, LICS 2022).

**Workflow patterns** (van der Aalst, ter Hofstede, Kiepuszewski, Barros 2003): a catalog of 20 workflow control-flow patterns that characterize common routing logic:
- **Sequence**: activity $B$ starts after $A$ finishes
- **Parallel split**: after $A$, both $B$ and $C$ start concurrently (AND-split)
- **Synchronization**: $C$ starts only after both $A$ and $B$ finish (AND-join)
- **Exclusive choice**: after $A$, exactly one of $B$ or $C$ starts based on a condition (XOR-split)
- **Simple merge**: $C$ starts after whichever of $A$ or $B$ finishes first (XOR-join)
- **Multi-choice**: after $A$, one or more of $B, C, D$ start (OR-split)

Each pattern has a formal Petri net representation and a characterization of which workflow languages support it.

## The WfMC reference model and BPEL

The **Workflow Management Coalition** (WfMC) reference model (1994-1999) defines the architecture for workflow management systems and provides a formal model of workflow independent of any particular Petri net encoding:

A **process definition** in the WfMC model is a computer-executable representation of a business process, consisting of: **activities** (units of work), **transitions** (conditions for moving between activities), **participants** (organizational entities performing activities), and **data** (information flowing between activities).

**BPEL** (Business Process Execution Language, originally BPEL4WS 2002, OASIS WS-BPEL 2.0 2007) is the standard XML language for executable workflow processes in service-oriented architectures. A BPEL process:
- Defines a **service** that coordinates other Web services
- Uses **activities** (invoke, receive, reply, assign, sequence, flow, switch, while, pick) for control flow
- Provides explicit **compensation** — compensating for executed activities when a fault occurs
- Models both **synchronous** (request-response) and **asynchronous** interaction patterns

BPEL's formal semantics have been given in terms of both process algebras (Lanese et al.) and Petri nets (Ouyang et al.), establishing the connection between the industrial standard and the theoretical framework.

## Open questions

- Whether van der Aalst's soundness condition (termination, proper completion, no dead transitions) is the right correctness criterion for all workflows, or whether it is too strong for certain real-world processes (e.g., workflows with planned exceptions or cyclic behavior) and too weak for others (e.g., workflows with timing constraints).
- Whether the workflow net structure has a natural expression as a coalgebra — whether a workflow can be modeled as a coalgebra $(X, \alpha: X \to F(X))$ where $X$ is the marking space and $F$ encodes the firing rule, and whether soundness corresponds to a property of the final coalgebra.
- Whether the Petri net composition operations (sequential, parallel, choice composition) form a monoidal category and whether workflow soundness is preserved under all monoidal operations — making soundness a property that can be verified compositionally from the soundness of components.
- Whether BPEL's compensation mechanism — reversing previously committed work when a fault occurs — has a formal semantics in terms of history fibers: whether compensation corresponds to retracting elements from the execution-settled fiber $\mathrm{Fix}(\Delta_t)$ back to the history $H_t$.
