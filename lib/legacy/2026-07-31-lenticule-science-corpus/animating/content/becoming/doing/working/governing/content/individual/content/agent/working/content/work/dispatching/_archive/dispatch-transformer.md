---
type: morphism
class: residuation
status: draft
symbol: "\\delta"
depends-on: [capability-fiber-bundle, predication-fiber-algebra, post-closure-adjunction-restriction]
realizes: [dispatch]
---

# Dispatch

The morphism that, given a task's requirement section $\rho_T$ and an agent's capability section $\sigma_A$, returns a *match valuation* $\delta(A, T) \in \mathbf{FOUR}$: the bilattice value classifying whether $A$ can take $T$.

## Definition

For a task $T$ with required-capability section $\rho_T : C \to \mathbf{FOUR}$ over the capability index $C$, and an agent $A$ with provided-capability section $\sigma_A : C \to \mathbf{FOUR}$, dispatch is

$$\delta(A, T) \;=\; \bigwedge_{c \in C}^{(t)} \bigl(\rho_T(c) \Rightarrow \sigma_A(c)\bigr)$$

where $\Rightarrow$ is the [twist-product residuation](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/theorems/twist-product-residuation.md) on $\mathbf{FOUR}$ from the [adjoint structure paper](../../../../../../../../../science/theories/information/texts/the-adjoint-structure-of-predication-on-bilattice-valued-fibers.md):

$$(x_+, x_-) \Rightarrow (z_+, z_-) \;=\; \bigl((x_+ \to z_+) \wedge (x_- \to z_-),\; x_+ \cdot z_-\bigr),$$

and $\bigwedge^{(t)}$ is the truth-order meet.
The pointwise residual asks "for capability $c$, does the agent's provision satisfy the task's requirement?"
The truth-order conjunction asks "is this true for *every* required capability?"

## Behavior on canonical inputs

| $\rho_T(c)$ | $\sigma_A(c)$ | $\rho_T(c) \Rightarrow \sigma_A(c)$ | Reading |
|---|---|---|---|
| $\mathbf{t}$ | $\mathbf{t}$ | $\mathbf{t}$ | Required, provided — match |
| $\mathbf{t}$ | $\mathbf{f}$ | $\mathbf{f}$ | Required, explicitly lacked — non-match |
| $\mathbf{t}$ | $\bot$ | $\bot$ | Required, agent silent — uncertain |
| $\bot$ | anything | $\mathbf{t}$ | Not required — vacuously satisfied |
| $\mathbf{t}$ | $\top$ | $\top$ | Required, contradictory provision — repair |
| $\mathbf{f}$ | anything | $\mathbf{t}$ | Explicitly not required — vacuously satisfied |

The $\bot$-on-required case (agent silent on a required capability) returns $\bot$ — uncertain, not failure.
Operational dispatch must therefore *force settlement of capability cells before dispatching*: an agent whose capability fiber has $\bot$-cells on required capabilities cannot be dispatched until those cells settle to $\mathbf{t}$ or $\mathbf{f}$.
The closure-rule system $\mathcal{S}_{\mathrm{op}}$ must include capability-completeness rules that drive $\bot$-valued required-capability cells to settled values via enrollment witnesses.

## Composition with post-closure restriction

By [post-closure adjunction-restriction](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/theorems/post-closure-adjunction-restriction.md), the residuated structure on $\mathbf{2}^\bowtie$ does not always pass through quiescence cleanly: a closure operator's fixed points need not be closed under arbitrary $\Rightarrow$-applications.
For dispatch, this means the match valuation $\delta(A, T)$ must be computed *before* applying any further closure, or the dispatch result must be re-validated after closure.
In practice, dispatch is computed on settled (post-closure) capability sections, where the values are restricted to $\{\mathbf{t}, \mathbf{f}, \top\}$ per [post-closure bilattice closure](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/theorems/post-closure-bilattice-closure.md).

## Capacity and authority

Dispatch as defined here handles only capability matching — the first of the work-vocabulary's three checks. *Authority* is the existence of a [jural-relation](theories/predicated-governance/objects/jural-relation.md) $R^P$ with $\langle R^P, \texttt{kind}, \texttt{power}\rangle = \mathbf{t}$, $\langle R^P, \texttt{potential-holder}, \texttt{dispatcher}\rangle = \mathbf{t}$, $\langle R^P, \texttt{scope-action}, \texttt{assign-}T\rangle = \mathbf{t}$ — the dispatcher holds the power to make the assignment. *Capacity* is a cardinality predicate over the agent's open assignments; it is enforced by a closure rule blocking assignment when the cardinality exceeds the agent's declared capacity.

The full dispatch act is the conjunction of the three: $\delta(A, T) = \mathbf{t}$ AND the dispatcher's power-relation $R^P$ exists AND the agent has capacity.
The bilattice algebra handles the first; the substrate's closure machinery handles the latter two.

By [correlate-of](theories/predicated-governance/morphisms/correlate-of.md), the dispatcher's exercise of $R^P$ creates a correlative liability in $A$: a jural relation $R^L$ with $\langle R^L, \texttt{kind}, \texttt{liability}\rangle = \mathbf{t}$, $\langle R^L, \texttt{potential-holder}, A\rangle = \mathbf{t}$, $\langle R^L, \texttt{passive-party}, \texttt{dispatcher}\rangle = \mathbf{t}$.
This is the substrate-algebraic content of the work vocabulary's "delegation creates a duty of execution in the assignee" — the correlative liability is the bilattice-side rendering of the duty's emergence.

## Composition into the assignment morphism

When $\delta(A, T) = \mathbf{t}$ and authority and capacity both hold, the dispatcher's *assignment act* emits an [Assignment](../objects/assignment.md) entity $A_{T \to A}$ at stage $\tau$ whose cells carry the dispatch witnesses: `assigns-task: T`, `to-office: A`, `from-sender: <dispatcher>`, `sent-at: \tau`, `authority-bound: <scope>`, `capability-match: \delta(A, T)`.
The task's own fiber does *not* grow an `assigned-to` cell; the dispatch relationship lives on the assignment fiber, walked from $T$ via reverse-edges on `assigns-task`.

By the [referencing-entity pattern](../../../../../engineering/theories/tech/theories/computing/theories/predicated-computing/theories/agential-orchestration-platform/theories/flatfile-agentic-resource-system/concepts/referencing-entity-pattern.md), this thin-task discipline keeps three things on the assignment fiber where they belong: (a) the *audit trail* of who dispatched what under what authority, which needs `from-sender`, `sent-at`, `authority-bound` cells the task itself shouldn't carry; (b) the [Hohfeldian invariants](../objects/assignment.md) — derivativity, accountability non-transfer, boundedness, revocability — which attach as morphism rules to the assignment fiber rather than as hard-coded constraints in the task increment-generation layer; and (c) the *revocation/reassignment distinction*, which becomes two different kinds of increment on the assignment fiber (retraction vs. fresh-emission) rather than a non-monotone retraction of an `assigned-to` cell on the task.

Downstream lifecycle rules trigger potential-state transitions on $T$ by *walking referencing assignment entities and execution events*, not by reading a cell on $T$.
See the [task-cell-system](../objects/task-cell-system.md) lifecycle table for the derived state-machine semantics.
