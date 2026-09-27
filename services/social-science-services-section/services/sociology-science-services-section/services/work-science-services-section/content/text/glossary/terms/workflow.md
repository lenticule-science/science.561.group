---
description: "A directed graph of tasks — edges represent dependencies or information flow, the graph structure is the plan."
aliases: [workflows]
composed-of: task
structure: directed-graph
edges: dependency, information-flow
properties: reachability, boundedness, liveness
models: petri-net, directed-graph, partial-order
executable-by: process, procedure, agent
date-created: 2026-03-29
date-modified: 2026-09-27
id: workflow
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
defines: Workflow
related: Plan, Procedure, Process, Orchestration, PetriNet, BPELProcess
date-modified: 2026-03-20
---

A workflow is a composition of [work](./work.md) units with one algebraic constraint: the initial input type equals the final output type. The workflow takes something of type X and produces something of type X, regardless of what happens internally. The internal structure is unconstrained — flat sequence, branching web, parallel paths, nested sub-workflows. What matters is the boundary: same type in, same type out.

This constraint is what makes workflows composable. Two workflows on the same type can be chained. A workflow can be nested inside another workflow as a single step. A workflow can replace any work unit that has the same input and output type. The algebraic boundary makes substitution safe.

The simplest workflow is a sequence: A then B then C. The simplest branching workflow adds a condition: after A, do B if X, else do C. The simplest parallel workflow runs B and C simultaneously after A, then joins at D. All workflows are combinations of these three patterns — sequence, branch, and parallel — composed into a directed graph.

A workflow is not the same thing as a [task](./task.md), though they overlap. A workflow is an algebraic concept — it specifies a composition of work with a type boundary. A task is a planning concept — it specifies a named container with a completion condition. A task may contain a workflow. A workflow may serve as a task when given a name and completion condition. But a workflow without a name or completion condition is still a valid composition of work; it just has no place in a plan. And a task containing a single work unit is a valid planning container but not a workflow in the algebraic sense.

A workflow is a directed graph, and directed graphs have computable properties. Reachability: can every task be reached from the start? Boundedness: can any intermediate queue grow without limit? Liveness: can every task eventually execute, or are there deadlocks? These properties are checkable before execution — you can analyze a workflow's structure to find problems without running it.

Petri nets formalize workflow analysis. A Petri net is a bipartite graph of places (which hold tokens representing state) and transitions (which consume and produce tokens). A transition fires when its input places have the required tokens. Workflow soundness — every case that starts eventually completes without leftover tokens — is a Petri net reachability property.

A workflow is a partial order on its tasks. The dependency edges define a precedence relation: A must complete before B starts. This relation is reflexive (every task depends on itself trivially), antisymmetric (if A depends on B and B depends on A, they are the same task or there is a cycle, which is a design error), and transitive (if A before B before C, then A before C). A workflow without cycles is a directed acyclic graph — a DAG — and the dependency relation is a [partial order](../../../../../../../../../information-science-services-section/services/math-services-section/content/text/glossary/terms/partial-order.md).

Tasks in a workflow may be any of the four work types. A workflow of pure [processes](./process.md) is deterministic — run it and the outcome is fixed. A workflow containing [procedures](./procedure.md) branches on conditions. A workflow containing [inquiry](./inquiry.md) is adaptive — the graph may be modified during execution as inquiry reveals new information. The most rigid workflows are pure process chains. The most flexible are inquiry-containing workflows that rewrite their own structure.

## In practice

A workflow that is planned and tracked, rather than only composed, carries
what makes it finishable:

- a named output, what exists when it is complete: "every spec file has its
  required frontmatter", not "do things in spec/";
- a completion condition; "ongoing improvement" is a standing state, not a
  condition, and a workflow without one is an open-ended session;
- a state: active, complete, blocked or abandoned. Blocked, with every
  current step waiting on an unmet dependency, is a valid state rather than a
  failure, and a workflow is abandoned with a stated reason rather than left
  to stall;
- only steps that advance its named output. Steps may be skillful or ad hoc,
  and gaps found while running add steps.

Work that crosses owners is split into one workflow per owner, joined by a
named artifact handed from one to the next. A step that belongs to no named
workflow cannot be prioritized, coordinated or known to be done.

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

## Related

- [Workflow in predicated work](../../../../../../../../../philosophy-services-section/services/relationality-services-section/services/agency-services-section/content/text/glossary/terms/workflow.md): the house formalization, a workflow as a composition of task cell systems with a cell-pattern boundary type, normative-handoff edges and a regime
- [Work](./work.md), [Process](./process.md), [Procedure](./procedure.md), [Inquiry](./inquiry.md)
