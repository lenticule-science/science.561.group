---
type: example
status: draft
instantiates: [dispatch, task-cell-system, capability-fiber-bundle]
depends-on: [dispatch, task-cell-system, capability-fiber-bundle, operations-loop]
---

# Dispatch of a "review this PR" task

A worked instance of the [dispatch morphism](../morphisms/dispatch.md) on a strict-regime task: an inbound code-review request that must be matched to an agent.
Walks through the substrate-algebraic computation step by step with concrete cell values.

## Setup

A small operations base $B_{\mathrm{op}} = (\mathbf{2}, \mathcal{C}_{\mathrm{op}}, E_{\mathrm{op}}, \omega)$ with the relevant entities:

- Three agents: $A_1, A_2, A_3$.
- One task: $T = $ "review-pr-#42".
- Three capabilities: $c_1 = \texttt{code-review-rust}$, $c_2 = \texttt{code-review-python}$, $c_3 = \texttt{security-review}$.
- The task's required capabilities: $\{c_1, c_3\}$.

## Capability-fiber state at stage $\tau$

The provided-capability fiber $\sigma_{A_i}$ for each agent (post-closure values, so each cell is in $\{\mathbf{t}, \mathbf{f}, \top\}$):

| Agent | $c_1$ (rust review) | $c_2$ (python review) | $c_3$ (security) |
|---|---|---|---|
| $A_1$ | $\mathbf{t}$ | $\mathbf{f}$ | $\mathbf{f}$ |
| $A_2$ | $\mathbf{t}$ | $\mathbf{t}$ | $\mathbf{t}$ |
| $A_3$ | $\mathbf{f}$ | $\mathbf{t}$ | $\mathbf{t}$ |

The required-capability fiber $\rho_T$:

| Capability | $\rho_T$ |
|---|---|
| $c_1$ (rust review) | $\mathbf{t}$ |
| $c_2$ (python review) | $\mathbf{f}$ (explicitly not required) |
| $c_3$ (security) | $\mathbf{t}$ |

## Computing $\delta(A_i, T)$

Per the [dispatch morphism](../morphisms/dispatch.md), $\delta(A_i, T) = \bigwedge^{(t)}_{c \in C}(\rho_T(c) \Rightarrow \sigma_{A_i}(c))$, with $\Rightarrow$ the twist-product residuation on $\mathbf{FOUR}$.

For each agent, compute the per-capability residual then truth-order-meet:

**Agent $A_1$:** - $\rho_T(c_1) \Rightarrow \sigma_{A_1}(c_1) = \mathbf{t} \Rightarrow \mathbf{t} = \mathbf{t}$ ✓ - $\rho_T(c_2) \Rightarrow \sigma_{A_1}(c_2) = \mathbf{f} \Rightarrow \mathbf{f} = \mathbf{t}$ ✓ (vacuously satisfied; $c_2$ not required) - $\rho_T(c_3) \Rightarrow \sigma_{A_1}(c_3) = \mathbf{t} \Rightarrow \mathbf{f} = \mathbf{f}$ ✗ (required, explicitly lacked) - $\delta(A_1, T) = \mathbf{t} \wedge_t \mathbf{t} \wedge_t \mathbf{f} = \mathbf{f}$

**Agent $A_2$:** - $\rho_T(c_1) \Rightarrow \sigma_{A_2}(c_1) = \mathbf{t} \Rightarrow \mathbf{t} = \mathbf{t}$ ✓ - $\rho_T(c_2) \Rightarrow \sigma_{A_2}(c_2) = \mathbf{f} \Rightarrow \mathbf{t} = \mathbf{t}$ ✓ - $\rho_T(c_3) \Rightarrow \sigma_{A_2}(c_3) = \mathbf{t} \Rightarrow \mathbf{t} = \mathbf{t}$ ✓ - $\delta(A_2, T) = \mathbf{t} \wedge_t \mathbf{t} \wedge_t \mathbf{t} = \mathbf{t}$

**Agent $A_3$:** - $\rho_T(c_1) \Rightarrow \sigma_{A_3}(c_1) = \mathbf{t} \Rightarrow \mathbf{f} = \mathbf{f}$ ✗ (required, lacked) - $\rho_T(c_2) \Rightarrow \sigma_{A_3}(c_2) = \mathbf{f} \Rightarrow \mathbf{t} = \mathbf{t}$ ✓ - $\rho_T(c_3) \Rightarrow \sigma_{A_3}(c_3) = \mathbf{t} \Rightarrow \mathbf{t} = \mathbf{t}$ ✓ - $\delta(A_3, T) = \mathbf{f} \wedge_t \mathbf{t} \wedge_t \mathbf{t} = \mathbf{f}$

## Result

$A_2$ is the unique match: $\delta(A_2, T) = \mathbf{t}$. $A_1$ fails on security; $A_3$ fails on rust-review.
Capacity and authority checks (per the [dispatch morphism](../morphisms/dispatch.md)) follow as separate filters; assuming both succeed for $A_2$, the dispatch's increment emits an [Assignment](../objects/assignment.md) entity carrying the dispatch witnesses:

$$u_\tau = \bigl\{\, A^* \mathrel{\colon}\; \langle A^*, \texttt{assigns-task}, T\rangle = \mathbf{t},\; \langle A^*, \texttt{to-office}, A_2\rangle = \mathbf{t},\; \langle A^*, \texttt{authority-bound}, \texttt{review-PR}\rangle = \mathbf{t},\; \langle A^*, \texttt{capability-match}, \delta(A_2, T)\rangle = \mathbf{t} \,\bigr\}$$

The task fiber on $T$ is *unchanged* by dispatch — no `assigned-to` cell on $T$ — and the dispatch relationship is walked from $T$ via reverse-edges on `assigns-task`.
Together with [correlate-of](theories/predicated-governance/morphisms/correlate-of.md)'s firing creating the correlative liability/duty in $A_2$.

## What's substrate-algebraically substantive

- **The match is computed, not chosen.** Given the cell state, $\delta(A_i, T)$ has a definite bilattice value for each $A_i$.
  Selection of "the matching agent" is the post-closure operation: take the agent with $\delta = \mathbf{t}$, breaking ties (multiple agents matching) by capacity (per the [capacity-as-substrate-property question](questions/capacity-as-substrate-property.md)) or by other dispatcher-policy.
- **Silent capabilities require completeness.** This example assumed all relevant capability cells are *settled* (either $\mathbf{t}$ or $\mathbf{f}$).
  In the un-settled $\bot$ case, the residuation can produce $\bot$ outputs (per the [dispatch morphism](../morphisms/dispatch.md)'s table), which would block dispatch until cells settle.
  A working operations base must include capability-completeness rules that drive $\bot$-cells on relevant capabilities to settled values via enrollment or office-membership witnesses.
- **The bilattice $\Rightarrow$ does the work.** No ad-hoc match logic.
  The math program's [post-closure adjunction-restriction](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/theorems/post-closure-adjunction-restriction.md) guarantees the operation closes on $\{\mathbf{t}, \mathbf{f}, \top\}$, so the dispatch result is always in this post-closure subset — no $\bot$-output if inputs are settled.
- **Strict regime.** This example is in the [strict regime](../theorems/regime-of-task.md) of [regime-of-task](../theorems/regime-of-task.md): finite agent set, finite capability set, finite task, single dispatch step.
  Closure ordinal $\kappa = 1$; the computation is finite and decidable.

## What this example does *not* show

- *Authority and capacity*.
  Both treated as separate filters in the dispatch morphism; this example assumes they pass.
  A complete dispatch-trace would compute the [jural-relation](theories/predicated-governance/objects/jural-relation.md) cell for the dispatcher's power-to-assign, the agent's capacity (per the [capacity-as-substrate-property question](questions/capacity-as-substrate-property.md)), and combine all three.
- *The downstream effects.* Once dispatched, $A_2$'s execution produces witnesses; tracking aggregates them; review evaluates completion.
  The full operations-loop trace is downstream content; this example stops at the assignment increment.
- *Plan and workflow context.* The task $T$ may be one node in a larger [plan](../objects/plan.md) or [workflow](../objects/workflow.md); dependency-ordering rules may have gated $T$'s availability for dispatch.
  This example assumes $T$ is in the potential-frontier (dependencies settled, ready to be dispatched).

## What happens when $A_2$'s security capability becomes $\top$ after dispatch

Suppose: after the dispatch of $T$ to $A_2$ (at stage $\tau$), a contradicting witness arrives at $\tau' > \tau$ — another agent records $\langle A_2, \texttt{provides-capability}, c_3\rangle = \mathbf{f}$ (e.g., a certification lapse).
The cell $\sigma_{A_2}(c_3)$ moves from $\mathbf{t}$ to $\top$.

**CALM consequences:** The positive dispatch confirmation — "was $A_2$ dispatch-ready at $\tau$?" — remains coordination-free to confirm: the witness increment at $\tau$ is settled, and any replica can confirm that the dispatch-readiness cell was $\mathbf{t}$ at $\tau$.
The new question — "is $A_2$ *still* dispatch-ready at $\tau'$?" — now produces $\delta(A_2, T)|_{\tau'} = \top$ (by [dispatch-monotonicity](../theorems/dispatch-monotonicity.md): the knowledge-order grows, so $\mathbf{t} \leq_k \top$).
The current dispatch readiness is contradicted.

**LES consequences:** The [truth-knowledge long exact sequence](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/theorems/truth-knowledge-cohomology-long-exact-sequence.md) applied to the dispatch sheaf $\mathcal{F}_\delta$ at stage $\tau'$: $\mathcal{F}^{(\top)}_\delta \neq 0$ at $c_3$.
The connecting morphism $\partial: H^0(\mathcal{F}^{(\top)}_\delta) \to H^1_t(\mathcal{F}^{(t)}_\delta)$ is non-zero.
The dispatch-in-progress is cohomologically flagged with a degree-1 obstruction.

**Operational consequences:** The working community's closure-rule system detects the $\top$-valued readiness cell and fires a dispatch-under-contradiction witness.
Possible responses (all expressible as substrate increments): 1. **Adjudicate the capability contradiction:** determine if the $\mathbf{f}$-witness was in error; if so, retract it via an adjudication increment (driving $c_3$ from $\top$ back to $\mathbf{t}$).
The LES obstruction is resolved; $A_2$ is confirmed dispatch-ready.
2. **Halt the task pending resolution:** assert a suspension increment on $T$, holding the dispatch frozen until $A_2$'s capability cell is resolved.
The LES obstruction persists until adjudication.
3. **Re-dispatch to a substitute:** if adjudication determines $\mathbf{f}$ is correct, $A_2$ is not currently security-capable.
The task's assignment is retracted via a re-assignment increment (which by [dispatch-monotonicity](../theorems/dispatch-monotonicity.md) requires an explicit revocation increment, since the positive assignment cannot simply be lowered).
A new dispatch to another qualified agent (if one exists) is initiated.

This illustrates the substrate's repair-condition handling: $\top$ is not a silent failure but a surfaced repair condition.
The LES provides the cohomological location of the problem; the closure-rule system provides the response options.

## Position in the program

This is the second worked example in [`predicated-work/examples/`](.).
Together with [weekly-calendar-as-recurrent-practice](weekly-calendar-as-recurrent-practice.md), it anchors the abstract objects/morphisms of predicated-work in concrete computations:

- weekly-calendar — recurrent-practice instance, regime classification.
- dispatch-of-a-pr-review — dispatch morphism instance, residuation computation.

Future examples should cover plan-decomposition, workflow-composition, an installation+delegation chain through predicated-governance, and a higher-regime case (e.g., a transfinite-bounded recurrent practice with limit-aggregation).
