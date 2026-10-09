---

name: "Plan"
extends: [record, partial-order, intention]
restricts: [act, work]
description: "A structured commitment to a set of intended actions, ordered by dependencies, that transforms a current situation toward a goal. Plans are partial, hierarchical, and defeasible — they constrain future deliberation without dictating every detail."
contains: task
can-be-part-of: [project, campaign]
has: [status, goal, definition-of-done, milestones, ordering, requires-concepts]
serves-takes: [goal, objective]
owner-is: office
requires-concepts-takes: term
coordinated-by-takes: campaign
date-created: 2026-03-20
date-modified: 2026-04-06
aliases:
  - plans
params:
  operation-set: relational-universe
  dependency-order: relational-universe-morphism
  goal-condition: relational-universe
output: relational-universe
ast:
  partial-order-of-operations:
    - operation-set
    - dependency-order:
        - operation-set
        - operation-set
    - causal-structure:
        - operation-set
        - dependency-order
made-of:
  - operation
  - partial-order
  - precondition
  - goal
distinguished-from:
  - procedure
  - process
  - inquiry
  - policy
instances:
  - strips-plan
  - partial-order-plan
  - pddl-plan
introduced-by: fikes-nilsson-1971
id: plan
where:
- $\mathcal{O}$ is the **operation set** — the finite collection of **steps** (intended actions, operations, or tasks) that the plan consists of; each step $o \in \mathcal{O}$ has its own preconditions (what must hold before $o$ executes) and effects (what $o$ changes in the state when it executes)
- $\prec$ is the **ordering constraint** — a strict partial order on $\mathcal{O}$ specifying which steps must precede which; $o_1 \prec o_2$ means "step $o_1$ must be completed before step $o_2$ begins"; $\prec$ is the plan's causal and temporal skeleton; steps not related by $\prec$ may execute in any order (or concurrently)
see-also: procedure-process-task-inquiry-intention-strips-pddl
---

A plan is a structured commitment to a finite set of intended actions, connected by dependencies, aimed at transforming a current situation toward a goal. A plan says what must happen and what must happen before what — but it does not dictate every detail of execution.

## What makes something a plan

Four properties distinguish a plan from a wish, a list, or a policy:

1. **Finite commitment.** A plan commits to a bounded set of steps. An infinite or open-ended intention is a strategy or policy, not a plan. Finiteness makes a plan communicable: you can state it, hand it off, and verify its completion.

2. **Dependency structure.** Steps are connected by ordering constraints: step A must complete before step B can begin, because A produces something B needs. Steps without ordering constraints can proceed in any order or concurrently. The dependency structure is a directed acyclic graph — cycles would make the plan unexecutable.

3. **Goal orientation.** Every step contributes to the plan's goal through a chain of means-end relations. A step that could be removed without affecting the goal is not part of the plan — it is padding. Plans are lean: they include what is necessary and nothing else.

4. **Defeasible stability.** Plans resist casual revision. Once adopted, a plan constrains future deliberation — you do not re-deliberate from scratch at each moment. But plans can be abandoned or revised when circumstances change. The key distinction: reconsideration requires reasons, not just preference (Bratman 1987).

## Partiality

Plans are typically partial. They specify some aspects of future action and leave others open for later specification. A plan to "hold a conference" may specify the venue and date but not the seating arrangement. Partial plans are the norm; fully specified total-order plans are the exception.

This partiality connects to the work type classification. A plan where both the meaning and execution are settled is a [process](./process.md). Where execution is open but meaning is settled, it is a [procedure](./procedure.md). Plans typically operate in the procedure or [derivation](./derivation.md) space — the structure is committed but some steps require judgment in execution.

## Hierarchy

Plans nest. A high-level plan decomposes into sub-plans, which decompose into [tasks](./task.md). The high-level intention ("attend the conference") constrains the sub-intentions ("book the flight," "prepare the talk"), which constrain specific actions ("call the airline"). This hierarchy connects immediate actions to long-term commitments.

The hierarchy runs: goal → [project](./project.md) → plan → task. A project may contain multiple plans. A plan contains tasks connected by dependencies. The dependency graph among tasks determines the critical path and minimum duration.

## Coordination

Plans serve two coordination functions (Bratman 1987):

- **Coordination over time.** A plan settled upon now guides future sessions. Without a plan, each session would deliberate from scratch about what to do — a waste of the system's most constrained resource (context).
- **Coordination with others.** Shared plans allow agents (human and artificial) to work in parallel without continuous negotiation. Two agents with access to the same plan can each take different tasks, confident their work will compose.

## Reconsideration

When should a plan be revised rather than continued? The [review](../../../../../../../../content/text/glossary/terms/review.md) stage of the operations loop evaluates plan-vs-actual variance. If the variance is within tolerance, continue. If circumstances have materially changed — a dependency is permanently blocked, the goal is no longer relevant, a better approach has been discovered — revise the plan. The threshold for revision is deliberate: plans that change on every session provide no stability; plans that never change despite evidence provide no adaptation.

## Formal connections

The dependency structure of a plan is a partial order on operations — the same structure formalized in AI planning as partial-order plans (McAllester and Rosenblitt 1991, building on Sacerdoti's NOAH 1975). STRIPS (Fikes and Nilsson 1971) and PDDL (Ghallab et al. 1998) provide formal languages for specifying plans as sequences of state-transforming operators with preconditions and effects. These formalisms ground the concept computationally: a dependency graph among tasks in a plan file is a lightweight partial-order plan.

Bratman's philosophical account (*Intention, Plans, and Practical Reason*, 1987) provides the normative grounding: plans are not just data structures but commitments that constrain practical reasoning.

## See also

- [task](./task.md) — the unit of work within a plan
- [project](./project.md) — the container that groups related plans
- [schedule](./schedule.md) — the temporal allocation that maps plan steps to calendar time
- [milestone](./milestone.md) — named checkpoints within a plan
- [Planning and Scheduling Survey](../../documents/notes/2026-04-03-note-on-planning-and-scheduling-survey.md) — how planning has been understood across disciplines
- [Formal Planning Theory](../../documents/notes/2026-04-03-note-on-formal-planning-theory.md) — STRIPS, partial-order plans, PDDL, and the plan refinement preorder

## Formal definition

A **Plan** is a pair $(\mathcal{O}, \prec)$:

$$(\mathcal{O} : \mathrm{FinSet}(\mathrm{Operation}),\; \prec \subseteq \mathcal{O} \times \mathcal{O} : \mathrm{StrictPartialOrder})$$

together with:
- A **precondition** $\mathrm{pre} : \mathrm{State} \to \mathrm{Bool}$ specifying the states from which the plan applies
- A **goal condition** $\mathrm{goal} : \mathrm{State} \to \mathrm{Bool}$ specifying the states the plan aims to achieve

The plan $(\mathcal{O}, \prec)$ is **valid** iff: there exists a total ordering $o_1, o_2, \ldots, o_n$ of $\mathcal{O}$ extending $\prec$ such that, starting from any state satisfying $\mathrm{pre}$, sequentially executing $o_1, \ldots, o_n$ produces a state satisfying $\mathrm{goal}$.

**Four invariants.** $(\mathcal{O}, \prec)$ is a plan iff:

1. **Finite commitment**: $|\mathcal{O}| < \infty$. A plan is a finite structure — it commits to a bounded set of intended steps. An infinite plan is not a plan but a policy or strategy. Finiteness is what makes plans executably communicable: one can state a plan, hand it off, and verify its completion.

2. **Partial order consistency**: $\prec$ is a strict partial order (irreflexive, asymmetric, transitive) with no cycles. A plan with a cyclic dependency ($o_1 \prec o_2 \prec \cdots \prec o_1$) cannot be executed. The acyclicity of $\prec$ is the condition that makes the plan a directed acyclic structure rather than a loop.

3. **Causal groundedness**: every ordering constraint $o_1 \prec o_2$ in $\prec$ is **causally grounded** — $o_1$ must precede $o_2$ either because $o_1$ produces an effect that $o_2$ requires (producer-consumer dependency), or because $o_1$'s execution would threaten $o_2$'s precondition if done after (threat ordering). Ordering constraints without causal grounding are arbitrary serializations, not plan structure.

4. **Means-end coherence**: every step $o \in \mathcal{O}$ is connected to the goal by a chain of **means-end relations** — $o$ is included in the plan because it contributes (as a necessary or sufficient means) to some subgoal $G'$ that itself contributes to the plan's goal $G$. Formally: there is no step $o \in \mathcal{O}$ such that removing $o$ from $\mathcal{O}$ (and dropping all constraints involving $o$) leaves $\mathrm{goal}$ achievable from $\mathrm{pre}$. A step that can be removed without affecting plan validity is not part of the plan's means-end structure — it is redundant. Means-end coherence ensures plans are not padded with irrelevant steps.

**Plan refinement.** Plans over the same goal admit a **refinement preorder**: $\Pi_1 \sqsubseteq \Pi_2$ iff $\mathrm{Lin}(\Pi_2) \subseteq \mathrm{Lin}(\Pi_1)$, where $\mathrm{Lin}(\Pi)$ is the set of total orderings (linearizations) of $\mathcal{O}$ consistent with $\prec$. A refinement $\Pi_2$ commits to more — it permits fewer execution orderings but every ordering it permits is also permitted by $\Pi_1$. In terms of the ordering relation: $\Pi_1 \sqsubseteq \Pi_2$ iff $\prec_1 \subseteq \prec_2$ (the concrete plan adds ordering constraints). A total ordering of $\mathcal{O}$ consistent with $\prec_1$ is the most refined plan: it selects a single linearization. The partial-order plan $(\mathcal{O}, \emptyset)$ with no ordering constraints is the least refined plan — all linearizations are permitted.

## Fikes and Nilsson: STRIPS

Richard Fikes and Nils Nilsson (*STRIPS: A New Approach to the Application of Theorem Proving to Problem Solving*, 1971) introduced the first formal planning language and the foundational planning algorithm:

A **STRIPS operator** (action schema) is a triple $(pre, add, del)$:
- $pre$: the **precondition** — a set of positive literals that must hold in the current state for the operator to be applicable
- $add$: the **add list** — literals made true by the operator's execution
- $del$: the **delete list** — literals made false by the operator's execution

A **STRIPS plan** is a total sequence $\sigma = (o_1, o_2, \ldots, o_n)$ of operator instances such that:
- $o_1$ is applicable in the initial state $s_0$ ($pre(o_1) \subseteq s_0$)
- Each successive $o_i$ is applicable in the state resulting from applying $o_1, \ldots, o_{i-1}$ to $s_0$
- The goal condition $G$ is satisfied in the final state

STRIPS operates with the **closed world assumption**: every literal not asserted to be true is assumed false. The STRIPS representation is **propositional**: state variables are ground literals (no quantification over individuals).

The STRIPS algorithm: **goal regression** — work backward from the goal condition, finding operators whose add-lists include goal literals, then recurse on the operators' preconditions. The algorithm is correct (produces valid plans) but incomplete for some domains (the Sussman anomaly shows that STRIPS-style regression can fail on interacting subgoals).

## McAllester and Rosenblitt: partial-order planning

David McAllester and David Rosenblitt (*Systematic Nonlinear Planning*, 1991; building on Sacerdoti's NOAH 1975 and Tate's NONLIN 1977) formalized **partial-order planning** — a more expressive plan representation than STRIPS's total sequences:

A **partial-order plan** is a tuple $(S, O, \prec, L)$:
- $S$: a set of **steps** (operator instances)
- $O$: open **precondition goals** — preconditions of steps not yet causally supported
- $\prec$: **temporal ordering constraints** on steps
- $L$: **causal links** $o_1 \xrightarrow{p} o_2$ — asserting that step $o_1$ achieves precondition $p$ of step $o_2$

**Threat resolution**: a step $o_3$ threatens a causal link $o_1 \xrightarrow{p} o_2$ if $o_3$ might delete $p$ and could execute between $o_1$ and $o_2$. Threats are resolved by **demotion** ($o_3 \prec o_1$) or **promotion** ($o_2 \prec o_3$).

The partial-order planner systematically refines a partial plan by: (1) selecting an open goal and finding an achiever, (2) detecting threats and resolving them. The plan is complete when all goals have causal support and all threats are resolved. Partial-order planning produces plans with the minimum necessary ordering constraints — the most flexible execution orderings.

## Bratman: plans as practical reasoning structures

Michael Bratman (*Intention, Plans, and Practical Reason*, 1987) provides the philosophical account of what plans ARE — their role in practical reasoning, not just their formal structure:

**Plans as commitments**: for Bratman, a plan is an **intention** — a mental state that (i) disposes the agent toward certain actions, (ii) shapes future practical reasoning, and (iii) plays an important coordinating role in the agent's activity over time. Plans are not merely representations of intended action sequences; they are normatively binding commitments that the agent must have reasons to abandon.

**Three functional roles of plans**:
1. **Coordination over time**: plans allow an agent to coordinate its activities — a plan settled upon now guides future deliberation; one need not re-deliberate from scratch at each moment
2. **Coordination with others**: shared plans provide a common structure for cooperative action — two agents with a shared plan can coordinate without continuous negotiation
3. **Nesting**: plans nest — sub-plans are adopted in service of higher-level plans; the plan hierarchy connects immediate actions to long-term intentions

**Partial plans**: Bratman argues that plans are typically **partial** — they specify some but not all aspects of future action. Partial plans leave room for further specification as execution proceeds. A fully specified total-order plan is the exception; partial plans with underspecified steps and unresolved choices are the norm.

**Reconsideration**: plans can be reconsidered — abandoned, revised, or replaced — but rational reconsideration requires reasons. The agent's commitment to a plan is defeasible but not arbitrary: abandoning a plan requires that something has changed that makes the plan no longer appropriate, not just that the agent has new preferences. This normative structure distinguishes plans from mere sequences of intended actions.

## PDDL: the standard formal planning language

Ghallab, Howe, Knoblock et al. (*PDDL — The Planning Domain Definition Language*, 1998) standardized the planning language used in the International Planning Competition:

A **PDDL problem** consists of:
- A **domain** definition: object types, predicates, and action schemas (STRIPS-style operators with typed parameters)
- A **problem** definition: initial state (ground literal assignments), goal condition (formula over ground atoms), and object instances

A **PDDL plan** is a sequence of ground action instances that transforms the initial state into a state satisfying the goal. PDDL extensions support: numerical fluents, temporal constraints (durations, concurrency), probabilistic effects, and preferences.

PDDL's **action schemas** are parameterized STRIPS operators: $\mathrm{action}(\bar{x}) : pre(\bar{x}), eff(\bar{x})$ where $\bar{x}$ is a tuple of typed variables; grounding $\bar{x}$ with object instances produces a STRIPS operator.

## Open questions

- Whether Bratman's plan nesting (sub-plans in service of higher plans) corresponds to the tree structure of causal links in partial-order planning — whether the normative hierarchy of intentions has the same formal structure as the causal link hierarchy in the plan's DAG.
- Whether there is a coalgebraic account of planning — whether a planner is a coalgebra that maps problem states to plan extensions, and whether the planning problem's solution corresponds to a final coalgebra (the complete plan).
- Whether partial-order plans have a sheaf-theoretic characterization — whether a partial plan is a local section of the "possible plan" presheaf, and whether plan extension (adding steps and causal links) is the gluing of local sections into a global section that covers all open goals.
- Whether Bratman's reconsideration norm (defeasible but not arbitrary plan abandonment) can be formalized as a refinement relation on plans — whether a revised plan is a refinement of the original in some appropriate sense, and whether the conditions for legitimate reconsideration correspond to the conditions for refinement.
