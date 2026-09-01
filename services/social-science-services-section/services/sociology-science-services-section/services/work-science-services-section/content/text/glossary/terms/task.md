---
extends: [record, work]
display:
  headline: title
  body: goal
  metadata: [status, work-type, part-of, depends-on, assigned-to]
  list: [input, output]
help-predicates: [id, goal, status, work-type, part-of, depends-on]
restricts: work
description: "A goal-directed unit of work — decomposable into subtasks, terminating when the goal is achieved, failed, or abandoned."
aliases: [tasks]
composes: goal, subtasks, plan
decomposes-to: task, operation
composes-into: workflow
terminates-on: goal-achieved, goal-failed, goal-abandoned
work-types: process, procedure, derivation, inquiry
can-be-part-of: plan
can-be-assigned-to: office
has: [status, priority, goal, requires-concepts]
depends-on-takes: task
assigned-to-takes: office
requires-concepts-takes: term
date-created: 2026-03-29
date-modified: 2026-04-06
id: task
---

A task is a unit of work organized around a goal. It has three parts: a goal (what counts as done), a set of subtasks or operations (what must happen to get there), and a plan (the order and conditions under which subtasks execute).

The goal defines the task. The task succeeds when the goal is achieved. The task fails when the goal becomes impossible. The task is abandoned when the agent releases the goal. Without a goal, there is activity but not a task — the goal is what gives the work its boundary.

Tasks decompose hierarchically. A task breaks into subtasks, which break into smaller subtasks, down to atomic operations that cannot be decomposed further. This hierarchy is the basic structure of all organized work — from military mission planning (mission → phases → tasks → subtasks) to software development (epic → story → task → subtask) to project management (project → work packages → activities).

The plan specifies how subtasks relate. Subtasks may be sequential (do A then B), conditional (if X then do A, else do B), concurrent (do A and B simultaneously), or cyclic (do A until condition Y). The plan is not always fully specified in advance — it may be elaborated as earlier subtasks complete and more information becomes available.

A task can contain any of the four work types. A task whose every subtask is a [process](./process.md) is itself a process. A task with conditional subtasks is a [procedure](./procedure.md). A task that includes open-ended investigation is an [inquiry](./inquiry.md). The task is the container; the work type characterizes what kind of work fills it.

Tasks compose into [workflows](./workflow.md). A workflow is a directed graph of tasks, where edges represent dependencies (task B cannot start until task A completes) or information flow (task B uses task A's output). A workflow is itself a task at a higher level of description — it has a goal, subtasks (the individual tasks), and a plan (the graph structure).

The stopping criterion for decomposition is practical, not formal. Annett and Duncan's $p \times c$ rule: stop decomposing when the probability of failure times the cost of failure falls below a threshold. High-risk operations get decomposed further. Low-risk operations are treated as atomic. The grain of decomposition matches the stakes, not any abstract standard of atomicity.


---

<!-- source: _archive/discipline-intake/business/terms/task.md -->

## Imported source: _archive/discipline-intake/business/terms/task.md

---
id: task
description: "A Task is a triple (G, S, P) — a goal G specifying the desired outcome, a set S of subtasks or atomic operations required to achieve G, and a plan P ordering the elements of S under the conditions in which each must execute — constituting a recognizable, purposive unit of activity that decomposes until atomic operations are reached. The defining structure: a task is organized around a goal that defines what counts as its completion; the task's structure is the hierarchical decomposition of the goal into sub-goals, each with its own sub-tasks, terminating in atomic operations. A task is not a procedure (a procedure has an a priori specification; a task's plan is conditional on context) and not a plan (a plan is a set of partially ordered operations; a task is the goal-structured unit of activity that the plan serves)."
defines: Task
related: Plan, Procedure, Work, Inquiry, Goal, Operation, HierarchicalTaskAnalysis, GOMS
date-created: 2026-03-20
date-modified: 2026-03-20
params:
  goal: relational-universe
  operation-set: relational-universe
  plan: relational-universe-morphism
output: relational-universe
ast:
  goal-directed-activity:
    - goal
    - subtask-decomposition:
        - goal
        - operation-set
    - plan:
        - subtask-decomposition
        - goal
---

# Task

## Formal definition

A **Task** is a triple $(G, S, P)$:

$$(G : \mathrm{Goal},\; S : \mathrm{Subtasks} \cup \mathrm{Operations},\; P : \mathrm{Plan}(S, G))$$

where:
- $G$ is the **goal** — the desired outcome or end-state the task aims to achieve; $G$ is what makes the task purposive: the task succeeds iff $G$ is achieved; the goal is not merely a postcondition but a **purposive state** — a state the agent is attempting to bring about; the goal gives the task its unit-character: a task is bounded by its goal's achievement
- $S$ is the **subtask set** or **operation set** — the constituent elements required to achieve $G$; at a non-atomic level, $S = \{T_1, \ldots, T_n\}$ is a set of sub-tasks, each with their own $(G_i, S_i, P_i)$ structure; at the atomic level, $S$ consists of **primitive operations** — elementary actions that cannot be further decomposed; the hierarchy terminates when every leaf is an operation
- $P$ is the **plan** — the partial ordering and conditional structure specifying how elements of $S$ must be sequenced to achieve $G$; $P$ specifies ordering constraints, conditions under which each subtask applies, and the stopping condition (when $G$ is deemed achieved); $P$ may be underspecified — leaving open the choice between multiple valid orderings

**Three invariants.** $(G, S, P)$ is a task iff:

1. **Goal-directed**: $G$ is defined before $S$ and $P$ — the task's purpose determines what counts as a subtask and what counts as a valid plan. An operation not connected to $G$ is not part of the task. This distinguishes a task from a mere sequence: a sequence has no goal; a task has a goal that defines when the sequence is complete and which operations are relevant.

2. **Hierarchical decomposability**: each non-atomic subtask $T_i \in S$ is itself a task $(G_i, S_i, P_i)$ where achieving $G_i$ makes progress toward $G$. The hierarchy terminates: there are no infinite chains of decomposition. The atomic operations at the leaves are the irreducible executions from which higher-level behavior is built.

3. **Plan-goal coherence**: executing the operations in $S$ in the order specified by $P$ produces a state satisfying $G$. A task whose plan does not achieve its goal is a broken task. Coherence is not a syntactic property of $P$; it is the semantic requirement that $P$'s execution actually achieves $G$ given the task's context.

## Annett and Duncan: hierarchical task analysis

John Annett and Keith Duncan (*Task Analysis and Training Design*, 1967, *Occupational Psychology*) introduced **hierarchical task analysis** (HTA) as a method for analyzing task structure for training and system design:

An **HTA decomposition** of a task has:
- A **goal** for the whole task
- A **plan** specifying the operations and the order/conditions under which they occur
- An iterative **subgoal decomposition**: each non-atomic operation is re-analyzed as a sub-goal with its own operations and plan

The stopping criterion — **the $p \times c$ rule**: stop decomposing when the product of $p$ (probability that inadequate performance causes failure) and $c$ (cost of inadequate performance) falls below an acceptable threshold. High $p \times c$ operations require further analysis; low $p \times c$ can be treated as atomic.

**Plans in HTA** specify conditions under which subtasks execute:
- **Fixed sequence**: "Do 1, then 2, then 3"
- **Contingent**: "If condition $X$, do 1; else do 2"
- **Concurrent**: "Do 1 and 2 simultaneously, then do 3 when both complete"
- **Cyclic**: "Do 1 repeatedly until condition $Y$"

HTA is foundational in human factors and cognitive systems engineering for understanding how complex skilled behaviors are organized and how they can fail.

## Erol, Hendler, and Nau: hierarchical task networks

Kutluhan Erol, James Hendler, and Dana Nau (*HTN Planning: Complexity and Expressivity*, 1994; *UMCP: A Sound and Complete Procedure for Hierarchical Task-Network Planning*, 1994) formalized **hierarchical task network (HTN) planning** — making precise the distinction between primitive and compound tasks:

A **primitive task** $t_p$ is a task directly executable by an **operator** (a STRIPS-style action schema): it has no further decomposition. An operator $\mathrm{op}$ is applicable to $t_p$ iff $\mathrm{pre}(\mathrm{op})$ holds in the current state; applying $\mathrm{op}$ produces effects $\mathrm{eff}(\mathrm{op})$.

A **compound task** $t_c$ is a task that must be reduced to primitive tasks via **methods**. A method $m = (t_c, \mathrm{pre}_m, T_m)$ for compound task $t_c$ consists of:
- $\mathrm{pre}_m$: the precondition under which $m$ is applicable
- $T_m = (\{t_1, \ldots, t_k\}, \prec_m)$: a **task network** — a partially ordered set of subtasks that accomplishes $t_c$

HTN **planning** is the process of reducing all compound tasks to primitive tasks via applicable methods:
1. Select an unresolved compound task $t_c$ in the current task network
2. Select an applicable method $m$ for $t_c$ (one whose precondition holds)
3. Replace $t_c$ with the subtask network $T_m$, inheriting ordering constraints
4. Repeat until all tasks are primitive

The resulting totally ordered sequence of primitive tasks is the executable plan.

**Expressivity**: Erol, Hendler, and Nau prove that HTN planning is strictly more expressive than classical (STRIPS-style) planning: any classical planning problem can be encoded as an HTN problem, but not vice versa. HTN planning can directly represent task hierarchies, procedural knowledge, and decomposition constraints that classical planning cannot express without encoding. The complexity: HTN planning with general methods is undecidable; with ground methods (fully instantiated, no variables), it is decidable and EXPTIME-complete.

**The primitive/compound distinction** is the formal realization of HTA's leaf/internal-node decomposition: primitive tasks are the leaves of the task hierarchy (corresponding to HTA's atomic operations at the stopping criterion); compound tasks are the internal nodes (corresponding to HTA's subgoals requiring further analysis).

## Card, Moran, and Newell: GOMS

Stuart Card, Thomas Moran, and Allen Newell (*The Psychology of Human-Computer Interaction*, 1983) developed **GOMS** (Goals, Operators, Methods, Selection rules) as a computational cognitive model of routine skilled behavior:

- **Goals**: desired states; goals have a hierarchical structure — top-level goals decompose into sub-goals, down to method-executable atomic goals
- **Operators**: elementary actions, each with a fixed execution time; the **Keystroke Level Model** (KLM, Card et al. 1980) assigns durations: $K$ = keystroke (0.28s), $P$ = pointing (1.1s), $H$ = homing (0.4s), $M$ = mental operation (1.35s), $R$ = system response (variable)
- **Methods**: sequences of operators and sub-goals that accomplish a goal; each method is a procedural specification for achieving a goal
- **Selection rules**: when multiple methods exist for the same goal, rules specify which to use based on contextual conditions

**GOMS prediction**: total task time = sum of all operator durations executed by the selected methods. This gives quantitative performance predictions without experiments.

GOMS is the first formal cognitive model of task performance: it provides an algorithmic account of how a skilled user performs a task, decomposing it into a structured hierarchy of goals and operators.

## Norman: the action cycle

Donald Norman (*The Design of Everyday Things*, 1988) introduced the **action cycle** as a model of how intentional action is structured:

1. **Goal formation**: forming a desired state
2. **Intention to act**: forming an intention toward the goal
3. **Action sequence specification**: determining what actions to take
4. **Action execution**: executing the actions
5. **Perception of system state**: perceiving the resulting state
6. **Interpretation**: interpreting the perceived state
7. **Evaluation**: evaluating whether the goal has been achieved

Norman's two **gulfs**:
- **Gulf of execution**: difficulty translating intentions into available actions (gap between intent and affordance)
- **Gulf of evaluation**: difficulty interpreting system state (gap between system display and user comprehension)

The action cycle makes explicit that a task is not just an execution sequence but a loop involving perception and evaluation — the task includes the agent's assessment of whether the goal has been achieved.

## Open questions

- Whether GOMS selection rules $(g_i \Rightarrow m_i)$ for a goal $G$ are formally equivalent to the guard structure of a procedure — making a GOMS model a procedure specification for cognitive task execution, with each goal-with-selection-rules being a guarded-command procedure.
- Whether there is a natural notion of **task refinement** — where $T_2$ refines $T_1$ iff every acceptable execution of $T_2$ is an acceptable execution of $T_1$ (achieving the more specific goal subsumes achieving the more general) — and whether this corresponds to goal subsumption in the HTA hierarchy.
- Whether the HTA hierarchy corresponds to the tower structure in the relational universe — whether each level of decomposition maps to a tower level, with atomic operations at the base and the overall goal at the top, and whether task correctness (plan-goal coherence) is a property of how these levels connect.
- Whether the stopping criterion $p \times c$ (probability of failure times cost) has a formal representation as a decision-theoretic threshold on the fiber — whether it corresponds to a condition on the Heyting algebra value of the subtask's completion proposition, making the $p \times c$ threshold a formal boundedness condition on the fiber.
