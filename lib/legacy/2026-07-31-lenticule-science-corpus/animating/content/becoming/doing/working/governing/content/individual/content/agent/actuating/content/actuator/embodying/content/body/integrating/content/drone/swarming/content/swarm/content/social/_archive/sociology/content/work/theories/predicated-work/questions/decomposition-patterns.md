---
type: question
status: partial
explores: [decompose-task, task-cell-system, workflow-composition]
---

# What closure-rule shapes correspond to non-AND decomposition patterns?

The [decompose-task morphism](../morphisms/decompose-task.md) defines task decomposition with a single composition rule $r_{\mathrm{compose}}$ whose antecedent is the *conjunction* of all subtasks' goal-cell settlements.
This is AND-decomposition: the parent settles iff every subtask settles.

Real decomposition includes patterns the AND-rule does not cover:

- **OR-decomposition**: parent settles iff *any* subtask settles.
- **k-of-n decomposition**: parent settles when at least $k$ of $n$ subtasks settle.
- **Sequential decomposition**: subtasks must settle in a specific order; later subtasks' closure rules become active only after earlier subtasks settle.
- **Conditional decomposition**: which subtasks are required depends on values settled at earlier stages.
- **Inquiry decomposition**: subtasks emerge during execution; the subtask-set is unknown at task creation.

## Closure-rule shapes

### AND-decomposition

Already formalized in [decompose-task](../morphisms/decompose-task.md).
The composition rule is $\Pi_1$ (universal conjunction over a finite set):

$$r_{\mathrm{AND}}: \bigwedge_{i=1}^{n} \bigl(\bigwedge_{\phi \in G_{T_i}} v(\phi) = v^*_{T_i}(\phi)\bigr) \;\Longrightarrow\; \bigwedge_{\phi \in G_T} v(\phi) \geq_k v^*_T(\phi)$$

This is in the $\Pi_1$ closure-rule fragment.
Regime: strict if all $\mathcal{S}_{T_i}$ are strict; maximum regime otherwise.

### OR-decomposition

The parent settles when *any* subtask settles.
The composition rule requires existential content — an antecedent that is a disjunction over the subtasks' goal cells.
Closure rules in the standard predication-categories framework have conjunctive antecedents; a disjunctive antecedent is realized as a *set of rules*, one per subtask:

$$r_{\mathrm{OR},i}: \bigwedge_{\phi \in G_{T_i}} v(\phi) = v^*_{T_i}(\phi) \;\Longrightarrow\; \bigwedge_{\phi \in G_T} v(\phi) \geq_k v^*_T(\phi) \quad \text{for each } i = 1, \ldots, n$$

This is still $\Pi_1$: each rule has a conjunctive antecedent, and the *disjunctive effect* arises from having multiple rules any one of which suffices.
No new fragment is needed.
Regime: strict if subtasks are strict and $n$ is finite; Scott-continuous if $n$ is allowed to grow with the task's requirements.

The OR pattern introduces a structural asymmetry: once any $T_i$ settles the parent, the other $T_j$ may continue their closure-rule firings on their own goal cells — they are not cancelled.
The OR-parent's goal cells settle, but the sibling subtasks' closure-rule subsystems remain active.
This means OR-decomposition can produce orphaned-but-settling subtasks: tasks whose goal cells continue toward settlement even after the parent has completed.
The operations settling must either include explicit `cancel-on-sibling-completion` rules, or tolerate orphaned settling as a substrate fact.

### Sequential decomposition

Subtask $T_j$ becomes potential only after $T_i$ settles ($i < j$ in the sequence).
This is realized by *activation guards* on $T_j$'s closure rules:

$$r_{\mathrm{seq}, i \to j}: \bigl[\bigwedge_{\phi \in G_{T_i}} v(\phi) = v^*_{T_i}(\phi)\bigr] \;\Longrightarrow\; v\bigl(\langle T_j, \texttt{activation-permitted}\rangle\bigr) = \mathbf{t}$$

Each rule in $\mathcal{S}_{T_j}$ has $v(\langle T_j, \texttt{activation-permitted}\rangle) = \mathbf{t}$ added to its antecedent.
Until $T_i$ settles, $T_j$'s rules are syntactically present in $\mathcal{S}_{\mathrm{op}}$ but never fire.
After $T_i$ settles, the activation-permitted cell reaches $\mathbf{t}$, and $T_j$'s rules become eligible to fire.

This remains $\Pi_1$: activation guards are additional conjuncts.
The settling regime is the same as AND-decomposition plus one additional closure-step per sequencing edge.
For a chain of $n$ tasks, the closure ordinal of the composed system is the sum of component ordinals plus $n$ (one activation step per edge), still within the strict regime for finite $n$ with strict components.

Note: sequential ordering at the *subtask* level is distinct from the dependency-edge mechanism of [workflow-composition](../theorems/workflow-composition.md).
Workflow edges encode data flow (output cells of $T_i$ are inputs to $T_j$); sequential activation guards encode temporal ordering without necessarily transferring cell content.
Both mechanisms can coexist.

### Conditional decomposition

Which subtasks are required depends on the bilattice value of a *guard cell* $\gamma$ settled at an earlier stage.
The conditional decomposition is a pair of rule-sets, each gated on $\gamma$:

$$r_{\mathrm{cond}, \mathbf{t}}: v(\gamma) = \mathbf{t} \;\wedge\; [\text{subtask-set } A \text{ settled}] \;\Longrightarrow\; G_T \text{ settled}$$ $$r_{\mathrm{cond}, \mathbf{f}}: v(\gamma) = \mathbf{f} \;\wedge\; [\text{subtask-set } B \text{ settled}] \;\Longrightarrow\; G_T \text{ settled}$$

Per [workflow-composition](../theorems/workflow-composition.md), this is a coproduct $W_A + W_B$ in $\mathbf{Wf}_\tau$, with the gating condition $\gamma$ selecting the injection.
Both branches are present in $\mathcal{S}_{\mathrm{op}}$; only one fires depending on $\gamma$'s settled value.

If $\gamma = \top$ (contradicted), both rules' antecedents are formally satisfied, and both consequents fire — a repair condition.
If $\gamma = \bot$, neither fires; the task is blocked pending $\gamma$'s settlement.
This is structurally well-defined: conditional decomposition is $\Pi_1$ per branch, with the branching effected by the guard cell's bilattice value.

Nested conditionals: if the guard cell for branch $A$ is itself conditionally settled, the nesting is a chain of $\Pi_1$ rules — still $\Pi_1$ at each level, with the settling depth equal to the nesting depth.
No new fragment is required for finite nesting.

### Inquiry decomposition

The subtask-set is not fixed at task creation.
New subtasks $T'_j$ emerge during execution, asserted by increment witnesses (discoveries, findings, new requirements).
Each emergence event $u_\tau$ adds new cells $\langle T, \texttt{decomposes-into}, T'_j \rangle = \mathbf{t}$ to the settling at stage $\tau$.

The composition rule must now be *responsive* to the dynamically growing subtask-set.
A fixed AND-rule over a pre-enumerated set does not apply.
The appropriate closure rule reads a summary cell:

$$r_{\mathrm{inquiry}}: v\bigl(\langle T, \texttt{all-known-subtasks-settled}\rangle\bigr) = \mathbf{t} \;\wedge\; v\bigl(\langle T, \texttt{inquiry-closed}\rangle\bigr) = \mathbf{t} \;\Longrightarrow\; G_T \text{ settled}$$

Two new cells govern the inquiry:

- $\langle T, \texttt{all-known-subtasks-settled}\rangle$: maintained by a rule that iterates over all currently-asserted `decomposes-into` cells and checks each subtask's goal.
  This rule's antecedent references *the current set* of subtask-cells — a universal quantification over a domain that grows with increments.
  Such a rule is *not* $\Pi_1$ in the finite sense; it is a $\Pi_1$ rule over a variable domain, equivalent to a Scott-continuous rule (since each new subtask cell that arrives at $\mathbf{t}$ in the increment extends the antecedent domain by one finitely-checkable cell).
  The rule remains Scott-continuous as long as the subtask set grows by countably many increments; if uncountably many subtasks could emerge, it lifts to the transfinite-bounded regime.

- $\langle T, \texttt{inquiry-closed}\rangle$: asserted by an increment when the agent responsible for the inquiry declares it complete.
  Without this cell, the task cannot complete even if all known subtasks settle — new subtasks could always arrive.

The inquiry decomposition thus lives in the Scott-continuous regime (for countable subtask growth) rather than the strict regime of fixed-subtask patterns.
This is the substrate-algebraic content of the work vocabulary's observation that inquiry cannot be fully pre-planned.

## Work-type correspondence

The four [work-types](../../../../../../../../../../../humanities/theories/sociology/theories/work/terms/work.md) correspond naturally to decomposition patterns:

| Work type | Decomposition pattern | Subtask-set | Closure-rule fragment | Regime |
|---|---|---|---|---|
| Process | AND or sequential | Fixed, ordered | $\Pi_1$ (finite) | Strict |
| Procedure | Sequential + conditional | Fixed, dynamically branched | $\Pi_1$ per branch | Strict |
| Derivation | AND with dependency DAG | Fixed, partially ordered | $\Pi_1$ (finite) | Strict |
| Inquiry | Dynamic (inquiry decomposition) | Growing during execution | Scott-continuous | Scott-continuous |

Process and derivation are AND-decompositions with different ordering structures: process has a total sequential order; derivation has a partial order (the dependency DAG).
Procedure adds the conditional-branch structure, which is still $\Pi_1$ per branch.
Only inquiry lifts beyond $\Pi_1$ to the Scott-continuous fragment.

This means: processes, procedures, and derivations are all in the *strict regime* from a decomposition standpoint — their parent-task closure ordinals are finite.
Inquiry tasks' parent-task closure ordinals are $\omega$ (Scott-continuous).
A workflow composed entirely of non-inquiry tasks remains strict; introducing a single inquiry task lifts the workflow to Scott-continuous.

## CALM for OR-decomposition and coordination structure

The OR-parent's completion cell — $\langle T, \texttt{settled-by-completion}\rangle = \mathbf{t}$ — is $\leq_k$-monotone once asserted (via any one of the $n$ subtask-completion rules).
By the [predication-settling CALM corollary](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/theorems/settling-calm-corollary.md):

- Confirming "is the OR-parent complete?" is coordination-free: any replica with the parent-completion cell can confirm it locally.
- Confirming "has no subtask settled yet (parent still pending)?" requires coordination — it confirms the absence of a parent-completion cell, which in turn requires confirming no subtask has settled.

**Coordination asymmetry vs. AND-decomposition.** For AND-decomposition, confirming "all subtasks are complete" also requires coordination (universal positive over all subtasks).
The AND-parent's completion is confirmed coordination-free *once* the parent-completion cell settles; confirming *in-progress AND* status requires coordination.
For OR-decomposition, the same asymmetry holds but with a sharper first-completion signal: the first subtask to settle produces an immediately coordination-free positive confirmation of the parent's completion.
In a distributed context, OR-decomposition has strictly faster coordination-free completion detection than AND-decomposition (first-to-arrive vs. last-to-arrive).

**The orphaned-settling problem under CALM.** The orphaned subtasks ($T_j$ for $j \neq$ the first-settling $T_i$) continue their closure-rule firings after the parent completes.
Each orphaned subtask's goal cells are $\leq_k$-monotone; their settling witnesses accumulate.
The operational problem is not a CALM violation (the substrate behaves correctly) but a resource question: work is being done whose fruits are not required.
The explicit cancellation rule $r_{\mathrm{cancel}}$ is a $\leq_k$-monotone increment (the `cancelled` cell settles at $\mathbf{t}$, coordination-free to confirm once fired); cancellation propagates correctly without coordination.
The cancellation decision itself (which node decides to fire $r_{\mathrm{cancel}}$?) does require coordination if multiple nodes are simultaneously executing different subtasks — one must be declared winner and the others cancelled.

## Remaining open aspects

**k-of-n decomposition.** The k-of-n pattern requires counting settled subtasks, which requires cardinality reasoning not native to the bilattice's $\wedge_t$ operation.
See [capacity-as-substrate-property](capacity-as-substrate-property.md) for the slot-cell resolution.
Once cardinality is handled by a slot-cell scheme, k-of-n reduces to a special case of OR-decomposition over slot-occupancy cells — staying in $\Pi_1$ at the cost of a slot-cell allocation scheme.

**OR + monotonicity.** The OR-decomposition's orphaned-settling subtasks interact with settling-monotonicity: once a subtask's goal cells start accumulating evidence, they continue to accumulate even if the parent has completed via a sibling.
This is not a mathematical problem (monotonicity is preserved) but an operational one: work is being done by an agent on a subtask that is no longer needed.
An explicit cancellation rule (asserting $\langle T_j, \texttt{cancelled}\rangle = \mathbf{t}$ when the parent settles via sibling) is substrate-expressible as a $\Pi_1$ rule, but requires the task-cell-system to include a `cancelled` predicate in its lifecycle states.
The [task-cell-system object](../objects/task-cell-system.md) does not currently include `cancelled` as a named lifecycle state — this is a gap.

**Mixed decomposition.** Real tasks often combine patterns: an inquiry phase followed by a procedural execution phase.
These are sequential compositions (per workflow-composition) of tasks with different decomposition types.
The composed workflow's regime is the maximum regime of its components — Scott-continuous whenever an inquiry component is present.
