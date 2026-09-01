---
type: definition
class: cell-system
status: draft
symbol: F
depends-on: [observation, plan, predication-cell]
realizes: [finding]
see-also: [adjustment, observation, retrospect-via-cosettling]
---

# Finding

The substrate-entity produced by the [review](../../../terms/review.md) stage: a structured judgment comparing observed work-state to expected work-state. Per the [referencing-entity pattern](../../../../../engineering/theories/tech/theories/computing/theories/predicated-computing/theories/agential-orchestration-platform/theories/flatfile-agentic-resource-system/concepts/referencing-entity-pattern.md), findings are *first-class entities a review entity contains*, not bullet points in a review's body. The review is thin; the findings are where the substantive content lives.

## Definition

A finding cell-system is a triple

$$F = (G_F, \mathcal{S}_F, v^F_0)$$

where:

- $G_F \subseteq \Phi_{\mathrm{op}}$ — the *finding claim cells*:
  - $\langle F, \texttt{is-a}, \texttt{finding} \rangle$
  - $\langle F, \texttt{observed}, O \rangle^*$ — references to the [observation](observation.md) entities that supplied the actual state
  - $\langle F, \texttt{expected}, P \rangle$ — reference to the plan, goal, or baseline cell that supplied the criterion
  - $\langle F, \texttt{variance}, \Delta \rangle$ — the structured gap; may be a scalar or a sub-fiber
  - $\langle F, \texttt{cause}, \Phi_C \rangle$ — a *witnessing configuration* (sub-fiber), not a label (see below)
  - $\langle F, \texttt{scope}, \ell \rangle$ where $\ell \in \{\texttt{single-loop}, \texttt{double-loop}\}$
  - $\langle F, \texttt{severity}, \sigma \rangle$
  - $\langle F, \texttt{contained-by}, R \rangle$ — the review entity that groups this finding

- $\mathcal{S}_F$ — closure rules; in particular, the rules implementing the single-loop / double-loop reading of the Lambek adjunction (below).

- $v^F_0$ — initial valuation at finding emission: schema cells at $\mathbf{t}$ on supplied content, derived cells at $\bot$ until subsequent composition.

## Single-loop and double-loop as the two sides of $\odot \dashv \Rightarrow$

The working hypothesis is that Argyris and Schön's loop distinction is the two sides of the Lambek adjunction:

- **Single-loop** finding: produced when $\langle \texttt{plan} \odot \texttt{execution} \le_t \texttt{outcome} \rangle$ settles non-$\mathbf{t}$ on some outcome cell. The execution did not realize the plan. The variance is *between plan and execution*; the cause is in the execution; the scope cell takes value `single-loop`.

- **Double-loop** finding: produced when the restricting direction $\langle \texttt{plan} \le_t (\texttt{execution} \Rightarrow \texttt{outcome}) \rangle$ settles non-$\mathbf{t}$. By the adjunction these are the same mathematical fact viewed from different sides, so a single-loop $\mathbf{t}$ with a double-loop $\mathbf{f}$ identifies a plan that *executed cleanly but was wrong* — the variance is *within the plan itself*. The scope cell takes value `double-loop`; the cause sub-fiber points at plan-level structure (a wrong assumption, a missing requirement, a misframed goal).

A review that walks only one side of the adjunction emits only single-loop findings or only double-loop findings, computing half the information the algebra carries. Whether the conjecture survives encoding against worked examples is empirical.

## Cause as witnessing configuration, not label

Following Dekker (2006) and the blameless-post-mortem discipline, the `cause` cell of a finding is **not** a scalar label like `"Alice's mistake"`. Such a label is a *projection* that discards the witnessing geometry — it preserves a name but loses the conditions that made the outcome likely.

The substrate-conformant form is a sub-fiber $\Phi_C$ whose own cells point at contributing factors:

- $\langle \Phi_C, \texttt{contributing-factor}, \texttt{missing-information} \rangle$
- $\langle \Phi_C, \texttt{contributing-factor}, \texttt{tool-failure-X} \rangle$
- $\langle \Phi_C, \texttt{contributing-factor}, \texttt{time-pressure} \rangle$
- $\langle \Phi_C, \texttt{system-condition}, \kappa \rangle^*$ — references to the system-level claims (an office's capacity cell, a procedure's incompleteness cell) that admit the outcome.

This is the same $\top$-concentration discipline FARS uses for message-rejection explanations — review findings inherit it.

## Stage-gate as residuation threshold

Cooper's stage-gate review asks "should we continue?" — algebraically, a threshold check on the single-loop composition. A stage-gate finding carries the additional cell $\langle F, \texttt{stage-gate-threshold}, \theta \rangle$, and the gating rule fires `proceed` or `halt` based on whether $\texttt{plan} \odot \texttt{execution-so-far} \ge_t \theta$. Approval-gates require an additional `approved-by` cell whose value is an office whose authority fiber validates the approval; without this cell at $\mathbf{t}$, the gate does not fire.

## Algebraic role: container and the contained

Findings are contained by reviews via $\langle F, \texttt{contained-by}, R \rangle$. The review entity is thin (context, scope, cadence cells); aggregating findings into a review-summary is a walk: locate $F_i$ with $\langle F_i, \texttt{contained-by}, R \rangle$, fold variance and severity cells. The review itself does not carry the judgments; the findings do.

## Position

Findings are the inputs to [adjustments](adjustment.md): an adjustment's `responds-to` cell points at the finding(s) whose variance the change is designed to close. A finding without a responding adjustment is a lesson observed-but-not-acted-on; the adjustment is what closes the operations loop.
