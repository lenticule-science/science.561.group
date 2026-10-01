---
type: definition
class: cell-system
status: draft
symbol: A
depends-on: [task-cell-system, capability-fiber-bundle, dispatch, jural-relation]
realizes: [assignment]
see-also: [execution-event, predicated-governance/morphisms/assignment, dispatch-monotonicity]
name: Assignment
description: "The substrate-entity produced by the dispatch morphism: a first-class predication-cell-system that records the bounded transfer of work from a dispatcher's office to an executing office."
---


The substrate-entity produced by the [dispatch](../../documents/articles/research/2026/07/31/lenticule-import/library/social-sciences/working/morphisms/dispatch.md) morphism: a first-class predication-cell-system that records the bounded transfer of work from a dispatcher's office to an executing office. An assignment is the [assignment](../../documents/articles/research/2026/07/31/lenticule-import/library/terms/assignment.md) library term realized at the bilattice value-domain.

## What an assignment is — and is not

An assignment is **its own substrate entity, not a predicate on the task** — the [referencing-entity pattern](../../../../../../../philosophy-services-section/services/relationality-services-section/services/agency-services-section/content/text/documents/articles/research/predicated-agentic-orchestration-platform/flatfile-agentic-resource-system/flatfile/referencing-entity-pattern/referencing-entity-pattern.md) in FARS is the substrate-realization side of this commitment. The task's fiber does not grow an `assigned-to` cell; queries that ask "who is doing task $T$?" walk *outward* from $T$ along `assigns-task` reverse-edges and fold the most-recent assignment entity's claims per [derived-state-via-walks](../../../../../../../philosophy-services-section/services/relationality-services-section/services/agency-services-section/content/text/documents/articles/research/predicated-agentic-orchestration-platform/flatfile-agentic-resource-system/derived-state-via-walks/derived-state-via-walks.md). The task remains thin, and its effective fiber is $T \odot \bigoplus_i A_i$ where $A_i$ ranges over assignment entities pointing at $T$.

This formulation supersedes the older treatment in [dispatch](../../documents/articles/research/2026/07/31/lenticule-import/library/social-sciences/working/morphisms/dispatch.md) §"Composition into the assignment morphism", which asserts an `assigned-to` cell directly on the task. See [reconciling-assignment-as-entity-vs-predicate-on-task](../../documents/articles/notes/undated/reconciling-assignment-as-entity-vs-predicate-on-task.md).

## Definition

An assignment cell-system is a triple

$$A = (G_A, \mathcal{S}_A, v^A_0)$$

where:

- $G_A \subseteq \Phi_{\mathrm{op}}$ — the *assignment claim cells*, drawn from the schema:
  - $\langle A, \texttt{is-a}, \texttt{assignment} \rangle$
  - $\langle A, \texttt{assigns-task}, T \rangle$ — the task being assigned
  - $\langle A, \texttt{to-office}, O_{\mathrm{exec}} \rangle$ — the executing office
  - $\langle A, \texttt{from-sender}, O_{\mathrm{disp}} \rangle$ — the dispatching office
  - $\langle A, \texttt{sent-at}, t \rangle$ — timestamp
  - $\langle A, \texttt{authority-bound}, X \rangle$ — the scope of authority transferred
  - $\langle A, \texttt{capability-match}, \delta \rangle$ — the value of $\delta(O_{\mathrm{exec}}, T)$ at issuance, retained as a witness
  - $\langle A, \texttt{retracted}, t' \rangle$ — present (at $\mathbf{t}$) only if revocation has occurred

- $\mathcal{S}_A \subseteq \mathcal{S}_{\mathrm{op}}$ — *invariant rules* enforcing the four Hohfeldian morphism constraints (below). These are content-level closure rules per the [referencing-entity pattern](../../../../../../../philosophy-services-section/services/relationality-services-section/services/agency-services-section/content/text/documents/articles/research/predicated-agentic-orchestration-platform/flatfile-agentic-resource-system/flatfile/referencing-entity-pattern/referencing-entity-pattern.md), not kernel-level checks.

- $v^A_0$ — the initial valuation set by the dispatch act: each schema cell at $\mathbf{t}$ on the value the dispatcher supplied, the `retracted` cell at $\bot$.

## The four Hohfeldian invariants as morphism rules

Following the [dispatch-and-delegation survey](../../../../../../../philosophy-services-section/services/relationality-services-section/services/agency-services-section/content/text/documents/articles/notes/2026/04/03/2026-04-03-dispatch-and-delegation-survey.md), assignment carries four invariants. Each is a closure rule in $\mathcal{S}_A$ whose firing produces a structural witness or drives a contradicting cell to $\top$:

- **Derivativity.** $\langle A, \texttt{authority-bound}, X \rangle \le_t \langle O_{\mathrm{disp}}, \texttt{has-authority}, X \rangle$. An assignment cannot transfer authority the dispatcher does not hold; if it tries, the rule drives the cell pair to $\top$, blocking issuance until the contradiction settles.
- **Accountability non-transfer.** No morphism into the dispatcher's accountability fiber from $A$'s cells exists. Operationally: there is no closure rule whose antecedent contains $A$-cells and whose consequent removes a cell from $\langle O_{\mathrm{disp}}, \texttt{accountable-for}, T \rangle$. Accountability is structurally insulated from the assignment fiber.
- **Boundedness.** $\langle A, \texttt{authority-bound}, X \rangle \neq \bot$ at issuance. A bootstrap-time rule rejects an assignment whose `authority-bound` cell is at $\bot$ — issuance is blocked until the bound is specified.
- **Revocability.** A `retract` increment on $A$ drives $\langle A, \texttt{retracted}, t' \rangle$ from $\bot$ to $\mathbf{t}$. By the elision discipline, downstream walks that fold most-recent-first will treat the assignment as withdrawn at $t' \ge t_{\text{walk}}$. Revocation does not edit the assignment cells; it adds a cell whose presence supersedes them.

## Algebraic role: dispatch as $\odot$, assignment as the witnessed product

The dispatch morphism's match valuation is

$$\delta(O, T) = \bigwedge_{c \in C}^{(t)} (\rho_T(c) \Rightarrow \sigma_O(c))$$

per [dispatch](../../documents/articles/research/2026/07/31/lenticule-import/library/social-sciences/working/morphisms/dispatch.md). When $\delta(O, T) = \mathbf{t}$, the dispatcher's act *witnesses the product* $O \odot T$ by issuing an assignment entity $A$ whose $G_A$ cells encode the dispatch-time witnesses (which capabilities matched, what authority was transferred, what scope was bounded). The assignment is what survives the dispatch event into the substrate; $\delta$ is the value, $A$ is the entity carrying the value's witnesses.

By the adjunction $\odot \dashv \Rightarrow$, "office $O$ can do task $T$ to threshold $\theta$" — i.e., $O \odot T \le_t \theta$ — is equivalent to "the task's requirement restricts to what the office provides at threshold" — $T \le_t (O \Rightarrow \theta)$. The assignment entity exists in either reading; the readings differ only in *which side of the equivalence* the dispatcher computed from.

## Lifecycle

An assignment enters one of three terminal states:

- **Discharged** — the executing office's [execution-events](execution-event.md) settle the task's goal cells to $v^*_T$. The assignment's `discharged-at` cell is asserted at $\mathbf{t}$ via a closure rule conditioned on task completion.
- **Retracted** — a `retract` increment is admitted; `retracted` reaches $\mathbf{t}$. Subsequent walks elide the assignment.
- **Lapsed** — a deadline cell on the assignment passes without discharge or retraction; a closure rule fires `lapsed-at`. The assignment is no longer effective for routing future executions but persists in the log for audit.

These are not new state cells on the task. They are new cells on the *assignment*; the task's effective fiber, walked at any time, sees the most-recent terminal-state cell across its in-edge assignments and infers the work-routing situation accordingly.
