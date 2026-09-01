---

title: "Plan"
description: "A finite set of intended operations with a partial order encoding causal and temporal dependencies — the structure that connects intention to action."
aliases: [plans]
made-of: [operation, partial-order, precondition, goal]
distinguished-from: [procedure, process, inquiry, policy]
extends: [partial-order, intention]
instances: [strips-plan, partial-order-plan, pddl-plan]
introduced-by: fikes-nilsson-1971
date-created: 2026-03-20
date-modified: 2026-04-01
---

## Formal definition

A **Plan** is a pair $(\mathcal{O}, \prec)$:

$$(\mathcal{O} : \mathrm{FinSet}(\mathrm{Operation}),\; \prec \subseteq \mathcal{O} \times \mathcal{O} : \mathrm{StrictPartialOrder})$$

together with: - A **precondition** $\mathrm{pre} : \mathrm{State} \to \mathrm{Bool}$ specifying the states from which the plan applies - A **goal condition** $\mathrm{goal} : \mathrm{State} \to \mathrm{Bool}$ specifying the states the plan aims to achieve

where: - $\mathcal{O}$ is the **operation set** — the finite collection of **steps** (intended actions, operations, or tasks) that the plan consists of; each step $o \in \mathcal{O}$ has its own preconditions (what must hold before $o$ executes) and effects (what $o$ changes in the state when it executes) - $\prec$ is the **ordering constraint** — a strict partial order on $\mathcal{O}$ specifying which steps must precede which; $o_1 \prec o_2$ means "step $o_1$ must be completed before step $o_2$ begins"; $\prec$ is the plan's causal and temporal skeleton; steps not related by $\prec$ may execute in any order (or concurrently)

The plan $(\mathcal{O}, \prec)$ is **valid** iff: there exists a total ordering $o_1, o_2, \ldots, o_n$ of $\mathcal{O}$ extending $\prec$ such that, starting from any state satisfying $\mathrm{pre}$, sequentially executing $o_1, \ldots, o_n$ produces a state satisfying $\mathrm{goal}$.

**Four invariants.** $(\mathcal{O}, \prec)$ is a plan iff:

1. **Finite commitment**: $|\mathcal{O}| < \infty$.
  A plan is a finite structure — it commits to a bounded set of intended steps.
  An infinite plan is not a plan but a policy or strategy.
  Finiteness is what makes plans executably communicable: one can state a plan, hand it off, and verify its completion.

2. **Partial order consistency**: $\prec$ is a strict partial order (irreflexive, asymmetric, transitive) with no cycles.
  A plan with a cyclic dependency ($o_1 \prec o_2 \prec \cdots \prec o_1$) cannot be executed.
  The acyclicity of $\prec$ is the condition that makes the plan a directed acyclic structure rather than a loop.

3. **Causal groundedness**: every ordering constraint $o_1 \prec o_2$ in $\prec$ is **causally grounded** — $o_1$ must precede $o_2$ either because $o_1$ produces an effect that $o_2$ requires (producer-consumer dependency), or because $o_1$'s execution would threaten $o_2$'s precondition if done after (threat ordering).
  Ordering constraints without causal grounding are arbitrary serializations, not plan structure.

4. **Means-end coherence**: every step $o \in \mathcal{O}$ is connected to the goal by a chain of **means-end relations** — $o$ is included in the plan because it contributes (as a necessary or sufficient means) to some subgoal $G'$ that itself contributes to the plan's goal $G$.
  Formally: there is no step $o \in \mathcal{O}$ such that removing $o$ from $\mathcal{O}$ (and dropping all constraints involving $o$) leaves $\mathrm{goal}$ achievable from $\mathrm{pre}$.
  A step that can be removed without affecting plan validity is not part of the plan's means-end structure — it is redundant.
  Means-end coherence ensures plans are not padded with irrelevant steps.

**Plan refinement.** Plans over the same goal admit a **refinement preorder**: $\Pi_1 \sqsubseteq \Pi_2$ iff $\mathrm{Lin}(\Pi_2) \subseteq \mathrm{Lin}(\Pi_1)$, where $\mathrm{Lin}(\Pi)$ is the set of total orderings (linearizations) of $\mathcal{O}$ consistent with $\prec$.
A refinement $\Pi_2$ commits to more — it permits fewer execution orderings but every ordering it permits is also permitted by $\Pi_1$.
In terms of the ordering relation: $\Pi_1 \sqsubseteq \Pi_2$ iff $\prec_1 \subseteq \prec_2$ (the concrete plan adds ordering constraints).
A total ordering of $\mathcal{O}$ consistent with $\prec_1$ is the most refined plan: it selects a single linearization.
The partial-order plan $(\mathcal{O}, \emptyset)$ with no ordering constraints is the least refined plan — all linearizations are permitted.

## Fikes and Nilsson: STRIPS

Richard Fikes and Nils Nilsson (*STRIPS: A New Approach to the Application of Theorem Proving to Problem Solving*, 1971) introduced the first formal planning language and the foundational planning algorithm:

A **STRIPS operator** (action schema) is a triple $(pre, add, del)$: - $pre$: the **precondition** — a set of positive literals that must hold in the current state for the operator to be applicable - $add$: the **add list** — literals made true by the operator's execution - $del$: the **delete list** — literals made false by the operator's execution

A **STRIPS plan** is a total sequence $\sigma = (o_1, o_2, \ldots, o_n)$ of operator instances such that: - $o_1$ is applicable in the initial state $s_0$ ($pre(o_1) \subseteq s_0$) - Each successive $o_i$ is applicable in the state resulting from applying $o_1, \ldots, o_{i-1}$ to $s_0$ - The goal condition $G$ is satisfied in the final state

STRIPS operates with the **closed world assumption**: every literal not asserted to be true is assumed false.
The STRIPS representation is **propositional**: state variables are ground literals (no quantification over individuals).

The STRIPS algorithm: **goal regression** — work backward from the goal condition, finding operators whose add-lists include goal literals, then recurse on the operators' preconditions.
The algorithm is correct (produces valid plans) but incomplete for some domains (the Sussman anomaly shows that STRIPS-style regression can fail on interacting subgoals).

## McAllester and Rosenblitt: partial-order planning

David McAllester and David Rosenblitt (*Systematic Nonlinear Planning*, 1991; building on Sacerdoti's NOAH 1975 and Tate's NONLIN 1977) formalized **partial-order planning** — a more expressive plan representation than STRIPS's total sequences:

A **partial-order plan** is a tuple $(S, O, \prec, L)$: - $S$: a set of **steps** (operator instances) - $O$: open **precondition goals** — preconditions of steps not yet causally supported - $\prec$: **temporal ordering constraints** on steps - $L$: **causal links** $o_1 \xrightarrow{p} o_2$ — asserting that step $o_1$ achieves precondition $p$ of step $o_2$

**Threat resolution**: a step $o_3$ threatens a causal link $o_1 \xrightarrow{p} o_2$ if $o_3$ might delete $p$ and could execute between $o_1$ and $o_2$.
Threats are resolved by **demotion** ($o_3 \prec o_1$) or **promotion** ($o_2 \prec o_3$).

The partial-order planner systematically refines a partial plan by: (1) selecting an open goal and finding an achiever, (2) detecting threats and resolving them.
The plan is complete when all goals have causal support and all threats are resolved.
Partial-order planning produces plans with the minimum necessary ordering constraints — the most flexible execution orderings.

## Bratman: plans as practical reasoning structures

Michael Bratman (*Intention, Plans, and Practical Reason*, 1987) provides the philosophical account of what plans ARE — their role in practical reasoning, not just their formal structure:

**Plans as commitments**: for Bratman, a plan is an **intention** — a mental state that (i) disposes the agent toward certain actions, (ii) shapes future practical reasoning, and (iii) plays an important coordinating role in the agent's activity over time.
Plans are not merely representations of intended action sequences; they are normatively binding commitments that the agent must have reasons to abandon.

**Three functional roles of plans**: 1. **Coordination over time**: plans allow an agent to coordinate its activities — a plan settled upon now guides future deliberation; one need not re-deliberate from scratch at each moment 2. **Coordination with others**: shared plans provide a common structure for cooperative action — two agents with a shared plan can coordinate without continuous negotiation 3. **Nesting**: plans nest — sub-plans are adopted in service of higher-level plans; the plan hierarchy connects immediate actions to long-term intentions

**Partial plans**: Bratman argues that plans are typically **partial** — they specify some but not all aspects of future action.
Partial plans leave room for further specification as execution proceeds.
A fully specified total-order plan is the exception; partial plans with underspecified steps and unresolved choices are the norm.

**Reconsideration**: plans can be reconsidered — abandoned, revised, or replaced — but rational reconsideration requires reasons.
The agent's commitment to a plan is defeasible but not arbitrary: abandoning a plan requires that something has changed that makes the plan no longer appropriate, not just that the agent has new preferences.
This normative structure distinguishes plans from mere sequences of intended actions.

## PDDL: the standard formal planning language

Ghallab, Howe, Knoblock et al. (*PDDL — The Planning Domain Definition Language*, 1998) standardized the planning language used in the International Planning Competition:

A **PDDL problem** consists of: - A **domain** definition: object types, predicates, and action schemas (STRIPS-style operators with typed parameters) - A **problem** definition: initial state (ground literal assignments), goal condition (formula over ground atoms), and object instances

A **PDDL plan** is a sequence of ground action instances that transforms the initial state into a state satisfying the goal.
PDDL extensions support: numerical fluents, temporal constraints (durations, concurrency), probabilistic effects, and preferences.

PDDL's **action schemas** are parameterized STRIPS operators: $\mathrm{action}(\bar{x}) : pre(\bar{x}), eff(\bar{x})$ where $\bar{x}$ is a tuple of typed variables; grounding $\bar{x}$ with object instances produces a STRIPS operator.
