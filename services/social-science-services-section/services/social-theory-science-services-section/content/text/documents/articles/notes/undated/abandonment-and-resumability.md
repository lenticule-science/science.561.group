---
type: question
status: partial
explores: [task-cell-system, completion-as-quiescence, operations-settling]
title: What is the substrate state of an abandoned task, and is it resumable?
description: "The task-cell-system object and completion-as-quiescence theorem treat abandonment as a separate predicate: $\\langle T, \\texttt{abandoned-by}, A^\\rangle = \\mathbf{t}$ for some agent $A^$, leaving the task's goal cells $GT$ in whatever…"
---

# What is the substrate state of an abandoned task, and is it resumable?

The [task-cell-system object](../../../../glossary/terms/task-cell-system.md) and [completion-as-quiescence theorem](../../../../../../../sociology-science-services-section/services/work-science-services-section/services/predicated-work-services-section/content/glossary/concepts/completion-as-quiescence.md) treat *abandonment* as a separate predicate: $\langle T, \texttt{abandoned-by}, A^*\rangle = \mathbf{t}$ for some agent $A^*$, leaving the task's goal cells $G_T$ in whatever bilattice state they had when work stopped.

## Goal-cell state after abandonment

When the abandonment cell $\langle T, \texttt{abandoned-by}, A^*\rangle$ reaches $\mathbf{t}$, the task's goal cells $G_T$ carry their current bilattice values. By [settling-monotonicity](../../humanities/theories/math/theories/categories/theories/predication-categories/concepts/settling-monotonicity.md), the task-local closure rules in $\mathcal{S}_T$ continue to be present in $\mathcal{S}_{\mathrm{op}}$ — settling-monotonicity does not retract rules when cells settle. Without additional machinery, the rules continue to fire if their antecedents are met by future increments.

This produces an operationally undesirable behavior: an abandoned task's goal cells may continue to move toward their target values via later increments and rule firings, even though no agent is responsible for the task. The task's `assigned-to` cell may still be at $\mathbf{t}$ for the abandoning agent $A^*$ (the assignment was not undone — it was abandoned, which is distinct from reassignment).

### Suspension via activation guard

The preferred resolution is an *activation guard*: a distinguished cell $\langle T, \texttt{potential-rules-suspended}\rangle$ that, when settled to $\mathbf{t}$, gates all of $T$'s task-local rules. Each rule $r \in \mathcal{S}_T$ is extended with an additional conjunct:

$$v\bigl(\langle T, \texttt{potential-rules-suspended}\rangle\bigr) = \mathbf{f} \;\text{ or }\; v\bigl(\langle T, \texttt{potential-rules-suspended}\rangle\bigr) = \bot$$

as a required antecedent condition. When the task's rules are suspended, this condition fails, and no task-local rule fires. (Equivalently, the entire $\mathcal{S}_T$ is moved to a suspended state, which can be encoded as an activation-guard antecedent without modifying the rules structurally.)

A closure rule fires on abandonment to assert suspension:

$$r_{\mathrm{suspend}}: v\bigl(\langle T, \texttt{abandoned-by}, A^*\rangle\bigr) = \mathbf{t} \;\Longrightarrow\; v\bigl(\langle T, \texttt{potential-rules-suspended}\rangle\bigr) = \mathbf{t}$$

By settling-monotonicity, once the suspension cell reaches $\mathbf{t}$, it remains there. The task's goal cells are frozen at their abandonment-time values, indefinitely — they will not move under further closure-rule firings as long as the task remains abandoned.

This is the substrate-algebraic content of *goal-cell pinning on abandonment*: not a direct freeze of the goal cells themselves (which cannot be achieved by monotone settling), but a suspension of the rules that would drive them.

## Four abandonment substates

At the moment of abandonment, the goal cells $G_T$ are in one of four bilattice configurations, each carrying distinct operational meaning:

| Goal-cell configuration at abandonment | Operational meaning |
|---|---|
| All $G_T$ cells at $\bot$ | **No progress**: work never started or no witnesses recorded. |
| Some $G_T$ cells at $\mathbf{t}$, none at $\mathbf{f}$, none at $\bot$ | **Partial completion**: some goals achieved; others were never attempted. |
| Some $G_T$ cells at $\mathbf{t}$, some at $\bot$ | **Partial progress**: mixed — some goals evidenced, others still open. |
| Any $G_T$ cell at $\mathbf{f}$ | **Failure-then-abandonment**: at least one goal was actively negated; the task was abandoned in a failed state. |
| Any $G_T$ cell at $\top$ | **Contradiction-then-abandonment**: conflicting witnesses on a goal cell; the task was abandoned under repair conditions. |

These five cases (none, partial-completion, partial-progress, failure, contradiction) are substrate-distinguishable by reading $G_T$'s values at the abandonment timestamp. An auditor reconstructing the abandoned task from the event log sees exactly which case obtained. This resolves the audit-log reconstruction question.

## Distinction from failure

A *failed* task has at least one goal cell at $\mathbf{f}$ at quiescence and its lifecycle has transitioned to the failed state via a specific closure rule (see [completion-as-quiescence](../../../../../../../sociology-science-services-section/services/work-science-services-section/services/predicated-work-services-section/content/glossary/concepts/completion-as-quiescence.md)). A *failed-then-abandoned* task also has a goal cell at $\mathbf{f}$, but additionally has the `abandoned-by` cell at $\mathbf{t}$.

The substrate distinction:
- **Failed**: $\exists \phi \in G_T: v(\phi) = \mathbf{f}$ at quiescence; no `abandoned-by` cell at $\mathbf{t}$.
- **Abandoned-without-failure**: `abandoned-by` at $\mathbf{t}$; $\forall \phi \in G_T: v(\phi) \in \{\bot, \mathbf{t}\}$ at abandonment.
- **Abandoned-after-failure**: both `abandoned-by` at $\mathbf{t}$ and $\exists \phi \in G_T: v(\phi) = \mathbf{f}$ at abandonment.

This three-way distinction has operational consequences for auditors and downstream systems that depend on the task's results: failed tasks should trigger error-handling; abandoned-without-failure tasks may represent work worth resuming; abandoned-after-failure tasks may represent irrecoverable positions.

Additionally, the distinction between abandonment and failure applies to the responsible agent:
- Failure: the task's closure-rule system drove the goal cells to $\mathbf{f}$ — the failure is a *substrate outcome*.
- Abandonment: the agent $A^*$ introduced the `abandoned-by` increment — abandonment is a *voluntary act* and the substrate records *who* abandoned.

## Resumability and the resumption morphism

By settling-monotonicity, the `abandoned-by` cell on $T$ remains at $\mathbf{t}$ permanently. Task $T$ itself is not resumable — there is no monotone operation that retracts the abandonment witness.

However, a *new task* $T'$ can be created that *resumes the work of $T$*. The resumption morphism creates $T'$ with:

- $\langle T', \texttt{resumes}, T\rangle = \mathbf{t}$ in the initial valuation — the substrate records the continuity relationship.
- Initial goal-cell valuation $v^{T'}_0 = v^T_{\tau_{\mathrm{abn}}}|_{G_{T'}}$ — the new task inherits $T$'s goal-cell values at the moment of abandonment as its starting state, rather than beginning from $\bot$. This gives the resuming agent the prior partial progress.
- The goal set $G_{T'}$ may be identical to $G_T$, or may be a refined subset (if some goals were already achieved and do not need to be re-pursued).
- $\mathcal{S}_{T'}$ is a fresh copy of $T$'s task-local rules (or a refined version appropriate to the resumption context).

The resumption morphism is thus:

$$\mathrm{Resume}(T, \tau_{\mathrm{abn}}): T \;\mapsto\; T' = \bigl(G_T \setminus G_T^{\mathrm{settled}},\; \mathcal{S}_{T'},\; v^T_{\tau_{\mathrm{abn}}}|_{G_T \setminus G_T^{\mathrm{settled}}}\bigr)$$

where $G_T^{\mathrm{settled}} = \{\phi \in G_T : v^T_{\tau_{\mathrm{abn}}}(\phi) = v^*_T(\phi)\}$ are the already-achieved goals, which need not be re-pursued.

The prior task $T$ retains its `abandoned-by` cell; the new task $T'$ records `resumes: T`. The substrate carries both as simultaneous facts: $T$ was abandoned; $T'$ continues the work. The audit log preserves both the abandonment and the resumption as distinct witnessed events.

### Suspension and resumption without abandonment

A lighter variant is *suspension without abandonment*: the agent pauses the task temporarily, intending to return. This does not set `abandoned-by`; instead, it sets a `suspended-by` cell at $\mathbf{t}$. The activation-guard mechanism fires identically, blocking task-local rule firings. When work resumes, an increment asserts `suspension-lifted` at $\mathbf{t}$, and a closure rule fires to clear the activation guard:

$$r_{\mathrm{resume}}: v\bigl(\langle T, \texttt{suspension-lifted}\rangle\bigr) = \mathbf{t} \;\Longrightarrow\; v\bigl(\langle T, \texttt{potential-rules-suspended}\rangle\bigr) \text{ reactivated}$$

But settling-monotonicity prevents clearing the suspension cell directly — once at $\mathbf{t}$, it stays. The cleanest substrate-monotone treatment: use an epoch counter. `active-rules-suspended-epoch-$e$` at $\mathbf{t}$ suspends rules when epoch $e$ is current; `suspension-lifted-epoch-$e$` at $\mathbf{t}$ marks the suspension as lifted for epoch $e$; the activation guard reads both: rules fire iff there is no suspension in the current epoch without a corresponding lift. This is the same epoch pattern used in [capacity-as-substrate-property](capacity-as-substrate-property.md)'s slot-cell scheme.

True abandonment (`abandoned-by`) is the terminal variant of suspension: no lift will ever be asserted; the task is permanently deactivated and a fresh $T'$ is the only path forward.

## CALM for abandonment queries

The abandonment cell $\langle T, \texttt{abandoned-by}, A^*\rangle$ is $\leq_k$-monotone: once settled to $\mathbf{t}$, it remains at $\mathbf{t}$ by settling-monotonicity. By the [predication-settling CALM corollary](../../../../../../../../../information-science-services-section/services/math-services-section/services/obsmetrological-services-section/lib/formalization/infomaterial/lib/infomaterial/docs/verso/mark/content/utterance/articulating/content/articulation-cell/content/potential-articulation-cell/predicating/content/predication-cell/content/potential-predication-cell/positing/content/valuation/content/knowledge-least-valuation/settling/content/sheaf/content/settling-cohomology/references/settling-calm-corollary.md):

- Confirming "has $T$ been abandoned?" is coordination-free: any replica that has received the abandonment increment can confirm it locally.
- Confirming "has $T$ NOT been abandoned?" requires coordination — it confirms the absence of an abandonment cell across all log replicas.

The practical asymmetry: a distributed operations substrate can detect task abandonment coordination-free (any node receiving the abandonment witness reports it immediately). A query such as "is $T$ still actively assigned and not yet abandoned?" requires coordination — it confirms the simultaneous absence of abandonment and the presence of an potential assignment. The combined positive/negative query is not $\leq_k$-monotone.

For the resumption morphism: the new task $T'$'s `resumes` cell $\langle T', \texttt{resumes}, T\rangle = \mathbf{t}$ is also $\leq_k$-monotone. Confirming "is $T'$ a resumption of $T$?" is coordination-free. Confirming "is there any resumption of $T$ somewhere in the system?" requires coordination (positive existential over the whole task-set, which is confirmed by finding one but requires scanning all tasks to confirm none exist).

## What remains open

**Cascading abandonment.** If $T$ is a parent task with subtasks $T_1, \ldots, T_n$, and $T$ is abandoned, what happens to the subtasks? Under the activation-guard scheme, only $T$'s task-local rules are suspended — the subtask rules $\mathcal{S}_{T_i}$ are unaffected unless each $T_i$ also receives an abandonment cell. A cascade rule could fire:

$$r_{\mathrm{cascade}}: v\bigl(\langle T, \texttt{abandoned-by}, A\rangle\bigr) = \mathbf{t} \;\wedge\; v\bigl(\langle T, \texttt{decomposes-into}, T_i\rangle\bigr) = \mathbf{t} \;\Longrightarrow\; v\bigl(\langle T_i, \texttt{abandoned-by}, T\rangle\bigr) = \mathbf{t}$$

— subtasks are abandoned by the parent, with the parent as the abandoning agent. Whether cascade-abandonment is appropriate (or whether subtasks should be reassigned or completed independently) is an operational policy question. The substrate can express either; the policy is a charter-rule commitment.

**Cohomological trace of abandoned work.** Abandoned tasks leave partial settling in the operations settling's history. The $H^1$-class of the operations settling includes this partial content as a genuine cohomological contribution — "work started but not finished" is substrate-algebraically distinct from "work never started."

The [truth-knowledge long exact sequence](../../../../../../../../../information-science-services-section/services/math-services-section/services/obsmetrological-services-section/lib/obsmetrologia/docs/verso/mark/content/utterance/articulating/content/articulation-cell/content/potential-articulation-cell/predicating/content/predication-cell/content/potential-predication-cell/positing/content/valuation/content/knowledge-least-valuation/settling/content/sheaf/content/settling-cohomology/references/truth-knowledge-cohomology-long-exact-sequence.md) gives a precise account of the cohomological structure of abandoned work:

$$\cdots \to H^{n-1}(\mathcal{F}^{(\top)}_T) \xrightarrow{\partial} H^n_t(\mathcal{F}^{(t)}_T) \to H^n_k(\mathcal{F}^{(k)}_T) \to H^n(\mathcal{F}^{(\top)}_T) \xrightarrow{\partial} \cdots$$

restricted to the abandoned task's goal-cell sheaf $\mathcal{F}_T$.

For an *abandoned-without-failure, non-contradicted* task (all $G_T$ cells at $\mathbf{t}$ or $\bot$ at abandonment, none at $\top$): $\mathcal{F}^{(\top)}_T = 0$, and the LES collapses to $H^n_t \cong H^n_k$. The task's partial progress contributes to $H^0_t(\mathcal{F}^{(t)}_T)$ (counting the goals achieved, as free abelian on eventually-designated cells) and to $H^1_k$ via the settling-fiber groupoid's component structure.

For an *abandoned-after-contradiction* task (some $G_T$ cell at $\top$ at abandonment): $\mathcal{F}^{(\top)}_T \neq 0$. The inconsistency sheaf $\mathcal{F}^{(\top)}_T$ is non-zero precisely on the contradicted goal cells. $H^0(\mathcal{F}^{(\top)}_T)$ is a free abelian group on the persistently-contradicted goal cells — a count of the *unresolved conflicts* that the abandonment left behind. The connecting morphism $\partial: H^0(\mathcal{F}^{(\top)}_T) \to H^1_t(\mathcal{F}^{(t)}_T)$ maps each unresolved contradiction to a class in truth-order cohomology at the next degree, encoding the fact that unresolved contradictions create higher-order obstruction to treating the abandoned task's partial content as classically consistent.

This gives the cohomological trace of abandoned work precise structure:
- Achieved goals → free abelian contribution to $H^0_t$.
- Unresolved contradictions at abandonment → non-zero $\mathcal{F}^{(\top)}_T$, non-trivial LES, $H^1_t$ correction term.
- MLD-class of the abandoned partial settling → structural invariant in $H^1_k$ of the encompassing operations settling.

Whether abandoned tasks' partial settling inflates or deflates $H^1_k$ depends on whether the abandonment-state partial settling is MLD-equivalent to a complete settling (of a smaller task) or is a genuinely new cohomological class. The inconsistency sheaf route above is the most tractable direction: abandoned-with-contradiction tasks contribute strictly positive-rank $\mathcal{F}^{(\top)}_T$ and therefore genuinely inflate the LES's non-trivial terms.

## Earlier material

$$v\bigl(\langle T, \texttt{active-rules-suspended}\rangle\bigr) = \mathbf{f} \;\text{ or }\; v\bigl(\langle T, \texttt{active-rules-suspended}\rangle\bigr) = \bot$$

$$r_{\mathrm{suspend}}: v\bigl(\langle T, \texttt{abandoned-by}, A^*\rangle\bigr) = \mathbf{t} \;\Longrightarrow\; v\bigl(\langle T, \texttt{active-rules-suspended}\rangle\bigr) = \mathbf{t}$$

$$r_{\mathrm{resume}}: v\bigl(\langle T, \texttt{suspension-lifted}\rangle\bigr) = \mathbf{t} \;\Longrightarrow\; v\bigl(\langle T, \texttt{active-rules-suspended}\rangle\bigr) \text{ reactivated}$$
