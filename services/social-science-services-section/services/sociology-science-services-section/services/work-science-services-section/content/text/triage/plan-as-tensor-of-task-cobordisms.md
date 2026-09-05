---
type: theorem
class: monoidal-cobordism-instantiation
status: sketch
symbol: "P = (T_1 \\sqcup T_2 \\sqcup \\cdots \\sqcup T_k) \\otimes_{\\preceq} P_{\\mathrm{compose}}"
depends-on: [plan, task-cell-system, workflow, dispatch, decompose-task, handoff-cobordism, completion-as-quiescence]
realizes: [settling-tensor-product, settling-cobordism-category, tqft-structure, workflow-composition]
---

# Plan as tensor product of task cobordisms

A [plan](../objects/plan.md) — a substrate object packaging a coordinated multi-task work-unit with a dependency structure — presents as a **tensor product of task-cobordisms in the [settling cobordism category](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/settling-cobordism-category.md)**, with composition encoded by the partial order on task dependencies. This refines [workflow-composition](./workflow-composition.md) (which states *that* workflows compose) into the substrate-algebraic *how*: workflows compose because they are 1-morphisms in a monoidal cobordism 2-category, with sequential composition as 1-morphism composition and parallel composition as monoidal product.

The substantive content: **the operational distinction between sequential and parallel task composition is the same distinction as 1-morphism composition vs. tensor product in a monoidal category**. Sequential composition encodes dependency; parallel composition encodes independence; both are bona fide structural operations, not pre-vs-post-conditions of a single mechanism. Plans are exactly the closed expressions in the monoidal-cobordism algebra over the task-cell-system.

## Setup: tasks as 0+1-cobordisms

Each [task](../objects/task-cell-system.md) presents as a [handoff cobordism](../objects/handoff-cobordism.md) — a 1-morphism in the [settling cobordism category](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/settling-cobordism-category.md). For a task $T$:

- **Source boundary** $\partial_- T$: the predication settling at task-start — the cells that must hold for $T$ to be dispatchable. By [dispatch-readiness-regime-is-strict](dispatch-readiness-regime-is-strict.md), this is a strict-regime sub-settling per task.
- **Target boundary** $\partial_+ T$: the predication settling at task-completion — the cells produced by $T$. By [completion-as-quiescence](./completion-as-quiescence.md), this is the closure of the bulk.
- **Bulk settling** $T_\bullet$: the predication settling between source and target, including all increments produced during $T$'s execution by [witness-as-increment](../morphisms/witness-as-increment.md).

The 1-morphism is then $T : \partial_- T \to \partial_+ T$ — a settling cobordism whose action on cohomology is, per [tqft-structure](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/theorems/tqft-structure.md), an element of the relevant TQFT-style algebra.

## The two compositions

Two tasks $T_1, T_2$ admit two distinct compositions:

**Sequential composition $T_2 \circ T_1$** when $\partial_+ T_1 = \partial_- T_2$: the gluing of cobordisms along their shared boundary. Operationally, this is "$T_2$ depends on $T_1$'s completion." The composition is a 1-morphism $T_2 \circ T_1 : \partial_- T_1 \to \partial_+ T_2$.

**Parallel composition $T_1 \otimes T_2$** when $\partial_- T_1$ and $\partial_- T_2$ are disjoint sub-settlings: the disjoint union of cobordisms. Operationally, this is "$T_1$ and $T_2$ are independent, can be dispatched concurrently." The composition is a 1-morphism $T_1 \otimes T_2 : \partial_- T_1 \sqcup \partial_- T_2 \to \partial_+ T_1 \sqcup \partial_+ T_2$, taken via [settling-tensor-product](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/theorems/settling-tensor-product.md).

These compositions satisfy the **interchange law** of a monoidal 1-category: $(T_2 \circ T_1) \otimes (T_4 \circ T_3) = (T_2 \otimes T_4) \circ (T_1 \otimes T_3)$ when both sides are defined. Substrate-algebraically, this is the statement that "dispatching independent tasks in different orders gives the same result" — the bedrock of parallel work.

## Statement

**Theorem (plan as monoidal-cobordism expression).** *Let $P$ be a plan presented as a finite collection of tasks $\{T_i\}_{i=1}^k$ together with a dependency partial order $\preceq$ on $\{1, \ldots, k\}$. Suppose:*

1. *(Boundary compatibility.) For each cover relation $i \preceq j$ in $\preceq$, there is a designated boundary identification $\partial_+ T_i \supseteq B_{ij} \subseteq \partial_- T_j$ such that the cobordisms can be glued along $B_{ij}$.*

2. *(Plan-cells closure.) The plan's full cell-system is closed under the polity's [closure rules](../../../../../../math/theories/categories/theories/predication-categories/concepts/closure-rule-system.md) — equivalently, the plan does not need cells from outside $\bigcup_i (T_i)_\bullet$ to fire its closure rules.*

*Then:*

(a) **(Plan as 1-morphism in cobordism category — series-parallel case.)** *Suppose additionally $\preceq$ is a **series-parallel poset** (built from singletons by series and parallel composition only — equivalently, an N-free poset). Then $P$ presents as a 1-morphism in the [settling cobordism category](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/settling-cobordism-category.md), of the form*
$$P : \bigsqcup_{i \in \min(\preceq)} \partial_- T_i \to \bigsqcup_{i \in \max(\preceq)} \partial_+ T_i$$
*built from the $T_i$ by alternating $\circ$ and $\otimes$ as prescribed by $\preceq$. $P$ is the unique 1-morphism (up to the interchange law) that respects the partial order: tasks at incomparable positions in $\preceq$ are tensored in parallel; tasks at consecutively-ordered positions are composed sequentially. For non-series-parallel $\preceq$ — plans with genuine fan-in/fan-out dependency structure (e.g., the N-shaped poset $\{a < c, b < c, b < d\}$) — the 1-morphism representation requires additional Frobenius-multiplication and Frobenius-comultiplication primitives from the [settling-frobenius-structure](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/concepts/settling-frobenius-structure.md), beyond binary $\circ, \otimes$. See [open downstream](#open-downstream).*

(b) **(Cohomological action factors over $\preceq$.)** *The action of $P$ on cohomology, $Z(P) : H^*(\partial_- P) \to H^*(\partial_+ P)$, is the composite of the constituent task-actions $Z(T_i)$ in the order prescribed by $\preceq$, with parallel-composed tasks contributing via the [settling-tensor-product](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/theorems/settling-tensor-product.md) on cohomology. By [tqft-structure](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/theorems/tqft-structure.md), this is a well-defined functor from the monoidal-cobordism category of plans to the monoidal category of bilattice-valued cohomologies.*

(c) **(Sequential and parallel are categorically distinct.)** *For tasks $T_1, T_2$ that admit both compositions (i.e., both $T_2 \circ T_1$ exists when $\partial_+ T_1 = \partial_- T_2$, and $T_1 \otimes T_2$ exists when the source-boundaries are disjoint), the two compositions are different 1-morphisms with different cohomological actions in general. Sequential composition encodes dependency-induced cell sharing; parallel composition encodes independent cell-system union. The interchange law is the only identity relating them.*

(d) **(Workflow-composition factors through plan composition.)** *The [workflow-composition](./workflow-composition.md) theorem — that compatible workflows compose into a workflow — factors through the present theorem: each workflow is a plan-shaped expression, and workflow composition is plan composition as 1-morphisms in the cobordism category, satisfying the interchange law for parallel sub-workflows.*

## Sketch

**(a)** Each task $T_i$ is, by hypothesis (1) and the [handoff-cobordism](../objects/handoff-cobordism.md) construction, a 1-morphism in the [settling cobordism category](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/settling-cobordism-category.md). For a series-parallel $\preceq$, the plan $P$ is built recursively: the singleton case is a single task; the series case $\preceq_1; \preceq_2$ gives $P_2 \circ P_1$ (when boundaries identify per (1)); the parallel case $\preceq_1 \parallel \preceq_2$ gives $P_1 \otimes P_2$ via [settling-tensor-product](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/theorems/settling-tensor-product.md). The interchange law guarantees that the two distinct ways of unfolding a parallel-of-series (or series-of-parallel) into binary operations produce the same 1-morphism, so the result depends only on $\preceq$, not on the unfolding sequence. For non-series-parallel $\preceq$, the recursion above is incomplete — N-shaped posets and more complex shapes require Frobenius primitives to express the fan-in/fan-out, which the cited [settling-frobenius-structure](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/concepts/settling-frobenius-structure.md) supplies but is not invoked in the present sketch's binary-operation framing. Plan-cells closure (2) is needed to ensure the closure-rule firings during plan execution are determined by the plan itself, not by external cells. $\square$ (Sketch (a))

**(b)** By [tqft-structure](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/theorems/tqft-structure.md), the action $Z$ on cohomology is a monoidal functor from the cobordism category to the category of bilattice-valued cohomologies. Functoriality gives $Z(T_2 \circ T_1) = Z(T_2) \circ Z(T_1)$ for sequential composition, and monoidality gives $Z(T_1 \otimes T_2) = Z(T_1) \otimes Z(T_2)$ for parallel composition. Both extended via the interchange law to the full plan-poset diagram. $\square$ (Sketch (b))

**(c)** Consider the toy case of two tasks $T_1, T_2$ that both produce a cell pattern with a shared cell $c$. In sequential composition $T_2 \circ T_1$ with $T_2$ taking $c \in \partial_+ T_1 = \partial_- T_2$ as input, the cell $c$ is *consumed* by $T_2$ — the bulk of $T_2 \circ T_1$ contains $c$ as an internal cell, and the closure rules may fire on $c$ in $T_2$'s context. In parallel composition $T_1 \otimes T_2$ with disjoint source-boundaries (so $T_2$ does not take $c$ as input), both copies of $c$ — one from $T_1$, one from $T_2$ — appear in $\partial_+(T_1 \otimes T_2)$ as distinct cells in disjoint sub-settlings. The cohomological action differs: $Z(T_2 \circ T_1)$ may have non-trivial $H^1$ at $c$ from the sequential firing; $Z(T_1 \otimes T_2)$ has the two copies of $c$ as independent generators with no $H^1$ relation. The two compositions are distinct 1-morphisms with distinct cohomologies. $\square$ (Sketch (c))

**(d)** [workflow-composition](./workflow-composition.md) establishes that compatible workflows compose into a workflow. A workflow is a recurrent-practice instantiation of a plan-pattern; by hypothesis-shape it satisfies (1) and (2) per recurrence. The workflow-composition operation applied to two compatible workflows is then exactly the plan-composition of (a) applied to the underlying plan-patterns, with recurrence-respect inherited from the recurrent-practice structure. The interchange law for parallel sub-workflows follows from the same interchange law on plan composition. $\square$ (Sketch (d))

## Operational consequences

### Series-parallel plans factor uniquely up to the interchange law

The unique-presentation content of (a) — restricted to series-parallel (N-free) dependency posets — is the substrate-algebraic version of the practitioner-recognized fact that *"a series-parallel plan's structure is determined by the dependency graph; the order in which we list mutually-incomparable tasks at each parallel block is irrelevant."* For series-parallel $\preceq$, plan-presentations that differ only in the listing of incomparable tasks present the same 1-morphism; presentations that differ in the dependency structure present different 1-morphisms. For non-series-parallel $\preceq$ — fan-in/fan-out plans — the analogous uniqueness statement requires the extended generator set $\{\circ, \otimes, \nabla, \Delta\}$ from [settling-frobenius-structure](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/concepts/settling-frobenius-structure.md), with uniqueness up to interchange *plus* the Frobenius axioms; this case is open per the [open downstream](#open-downstream).

### Cell-sharing is the test of sequential vs parallel

The (c) result gives a substrate-algebraic test for whether two tasks should be sequentially or parallelly composed: examine whether $\partial_+ T_1$ and $\partial_- T_2$ share cells. If they do — a cell of $T_1$'s output is consumed by $T_2$ — sequential composition is forced. If they don't — the source boundaries are disjoint — parallel composition is the (preferred, more compositional) choice. The cohomological consequences differ; choosing the "wrong" composition produces a plan with the wrong action on cohomology.

### Plan completion is bulk closure of the cobordism

By [completion-as-quiescence](./completion-as-quiescence.md), task completion is closure of the task-cell-system. For a plan $P$ as a 1-morphism, **plan completion is the bulk closure of $P$'s cobordism** — the simultaneous quiescence of every constituent task's bulk under the polity's closure rules, computed coherently across the gluings and tensorings. This generalizes [plan-completion-as-meet](./plan-completion-as-meet.md) — which establishes plan-completion as a meet on a flat task-list — by replacing the meet with the cobordism-bulk-closure when the plan has dependency structure.

### Decomposition and refinement are duality structures

The [decompose-task](../morphisms/decompose-task.md) operation is the formal inverse of plan composition: it takes a 1-morphism (a task or a plan) and presents it as a composition of finer 1-morphisms. By the universal property of the cobordism category, decomposition is unique up to the interchange law and the choice of decomposition refinement. *Refining* a task into a plan is exactly the operation of presenting a 1-morphism as a non-trivial composite; *consolidating* a plan into a task is the operation of treating the composite as opaque.

## TQFT-style invariants of plans

Per [tqft-structure](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/theorems/tqft-structure.md), each 1-morphism in the cobordism category has TQFT-style invariants — partition functions, state spaces, amplitudes. Specialized to plans:

- The **state space** $Z(\partial_- P)$ is the cohomology of the source boundary — the cohomological signature of "the cells the plan consumes."
- The **state space** $Z(\partial_+ P)$ is the cohomology of the target boundary — the cohomological signature of "the cells the plan produces."
- The **partition function** $Z(P) : Z(\partial_- P) \to Z(\partial_+ P)$ is the cohomological action.
- The **amplitudes** $\langle s_+ | Z(P) | s_- \rangle$ for $s_\pm \in Z(\partial_\pm P)$ record "the cohomological-class probability" that the plan, started at source-state $s_-$, lands at target-state $s_+$.

For most operationally-interesting plans, the relevant TQFT is the bilattice-valued analog of the standard 2-dimensional TQFT — the [settling-frobenius-structure](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/concepts/settling-frobenius-structure.md) of the predication settling category. Plan-amplitudes in this TQFT are the substrate-algebraic content of *"how likely is it that this plan, executed from these initial conditions, produces these outputs"* — a quantitative refinement of the plan's qualitative structure.

This payoff is the deep reason for the cobordism formalism: it lets the plan inherit the entire TQFT-toolkit at once, including monoidality, duality, and the standard amplitude-computation machinery.

## Status

`sketch` because:

- The (1+0)-dimensional cobordism setting is the most natural for the plan structure (tasks as 1-morphisms with 0-dimensional boundaries), but the [settling cobordism category](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/settling-cobordism-category.md) is presented as a more general 2-category. The dimensional reduction needed to specialize to plans is straightforward but not exhibited per task class.
- The [tqft-structure](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/theorems/tqft-structure.md) theorem establishes the TQFT-style functoriality at the abstract level; the specialization to plan-cobordisms requires checking the Frobenius axioms for plan-composition concretely, which is gestured at via [settling-frobenius-structure](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/concepts/settling-frobenius-structure.md) but not verified.
- The interchange-law content of (a) is correct in general monoidal categories but its explicit form for plans with non-trivial cell-sharing across the two compositions deserves spelled-out treatment.
- The plan-completion claim — that plan completion is bulk closure of the cobordism — is consistent with [completion-as-quiescence](./completion-as-quiescence.md) and [plan-completion-as-meet](./plan-completion-as-meet.md), but the explicit cobordism-level reformulation of plan completion is sketched, not verified.

The directional content — that plans are 1-morphisms in a monoidal cobordism 2-category, with sequential composition as $\circ$ and parallel composition as $\otimes$, and the interchange law as the only constraint relating them in the series-parallel case (with Frobenius mult/comult $\nabla, \Delta$ required for general dependency posets) — is the substantive proposal of this sketch.

## Where used

- [workflow-composition](./workflow-composition.md) — the cited theorem establishing workflow composition; the present theorem refines it by identifying workflow-composition as 1-morphism composition in the cobordism category and supplying the monoidal-product structure for parallel sub-workflows.
- [plan-completion-as-meet](./plan-completion-as-meet.md) — for flat task-lists, plan-completion is a meet; the present theorem generalizes this to dependency-structured plans, where the meet is replaced by the bulk closure of the plan-cobordism.
- [decompose-task](../morphisms/decompose-task.md) — the dual operation: decomposition presents a 1-morphism as a non-trivial composite. The present theorem and decompose-task together exhibit the cobordism category's compositional structure as a *factorization-system* on operational work.
- [handoff-cobordism](../objects/handoff-cobordism.md) — supplies the per-task cobordism objects this theorem composes into plans.
- [completion-as-quiescence](./completion-as-quiescence.md) — supplies the closure-quiescence content used to identify plan completion with bulk closure.
- [restructure-as-visible-automorphism](./restructure-as-visible-automorphism.md) — re-arranging tasks within a plan that respect the dependency partial order corresponds to permutations in the cobordism category that preserve the 1-morphism class; these are cosmetic restructurings on the plan-cobordism. Cobordism-class-changing restructurings (e.g., merging two parallel tasks into a sequential dependency) are substantive.

## Open downstream

- *Beyond series-parallel: Frobenius mult/comult for general posets.* The (a) statement is restricted to series-parallel $\preceq$. General dependency posets — including the canonical N-shaped poset $\{a < c, b < c, b < d\}$, common in real plans where one task seeds two distinct downstreams — require Frobenius-multiplication ($\nabla$) and Frobenius-comultiplication ($\Delta$) primitives from [settling-frobenius-structure](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/concepts/settling-frobenius-structure.md) to express fan-in (multiple tasks feeding one) and fan-out (one task feeding multiple). With $\nabla, \Delta$ added to $\circ, \otimes$, the substrate has the standard 2D-TQFT generator set. Conjecture: every finite plan-poset has a $\{\circ, \otimes, \nabla, \Delta\}$-expression yielding a unique 1-morphism (up to interchange + Frobenius axioms). Verification requires checking the Frobenius axioms (associativity, commutativity, Frobenius identity) on plan-composition explicitly — currently invoked but not exhibited.
- *Plan equivalences as cobordism homotopy.* Two plans presenting the "same work in different shape" — e.g., a re-pipelined version that splits one task into two and merges the results — should be equivalent as 1-morphisms up to a cobordism homotopy (a 2-morphism). Whether this equivalence is the correct substrate-algebraic content of "plan refactoring" deserves exploration.
- *Critical-path as longest-chain in $\preceq$.* The critical-path of a plan, in project-management terminology, corresponds to the longest chain in $\preceq$. Whether this aligns with a cohomological invariant — perhaps the maximum length of a sequential-composition factor in the 1-morphism's canonical decomposition — is open.
