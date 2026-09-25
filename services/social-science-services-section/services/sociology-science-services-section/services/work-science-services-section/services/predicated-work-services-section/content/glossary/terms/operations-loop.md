---
type: definition
class: phased-recurrent-practice
status: draft
symbol: "\\Lambda"
depends-on: [recurrent-practice, operations-settling, dispatch]
realizes: [operations-loop]
aliases:
  - Operations loop
---

# Operations loop

The mathematical realization of the *operations loop* — the six-phase recurrent practice through which a working community advances tasks: *planning → dispatch → execution → tracking → review → feedback*. Per the work vocabulary's stage-terms ([planning](../../../terms/planning.md), [dispatch](../../../terms/dispatch.md), [execution](../../../../../content/text/glossary/terms/execution.md), [tracking](../../../../../content/text/glossary/terms/tracking.md), [review](../../../../../../../../../content/text/glossary/terms/review.md), [feedback](../../../../../../../../../content/text/glossary/terms/feedback.md)), each stage carries `part-of-cycle: operations-loop` and a `position-in-cycle` index.

The operations loop is a [recurrent practice](./recurrent-practice.md) with phase structure: each cycle of the loop is itself a sequence of six sub-stages whose closure rules fire in order.

## Data

The operations loop $\Lambda$ is a recurrent-practice triple $(\mathcal{S}_\Lambda, T_\Lambda, \alpha_\Lambda)$ instantiated as:

- $\mathcal{S}_\Lambda \subseteq \mathcal{S}_{\mathrm{op}}$ — partitioned into six sub-rule-sets, one per phase:

$$\mathcal{S}_\Lambda \;=\; \mathcal{S}_{\mathrm{plan}} \,\sqcup\, \mathcal{S}_{\mathrm{disp}} \,\sqcup\, \mathcal{S}_{\mathrm{exec}} \,\sqcup\, \mathcal{S}_{\mathrm{trk}} \,\sqcup\, \mathcal{S}_{\mathrm{rev}} \,\sqcup\, \mathcal{S}_{\mathrm{fdb}}$$

- $T_\Lambda$ — the cycle-boundary ordinals at the *cadence* of the loop (typically aligned with the [weekly calendar](../../../../../../../../../../../../public-services-section/services/personal-services-section/services/emsenn-services-section/content/text/documents/articles/essays/weekly-calendar-as-recurrent-practice.md): one operations-loop cycle per week, or per session, depending on the community's cadence choice).

- $\alpha_\Lambda$ — typically *Markov*: each cycle's planning depends on the prior cycle's feedback, but no aggregations across older cycles. (Communities with stronger institutional memory may have *finite-history* practices — quarterly planning depends on the prior $k$ quarters — which still place the operations loop in the Scott-continuous regime.)

## The six phases

Each phase is a sub-stage with its own closure rules firing on its sub-stage interval $[\tau_{i,j}, \tau_{i,j+1})$ within the $i$-th loop-cycle:

**1. Planning** ($\mathcal{S}_{\mathrm{plan}}$). Closure rules that examine the prior cycle's feedback cells, propose new tasks ([task-cell-system](../../../../../../../../social-theory-science-services-section/content/text/glossary/terms/task-cell-system.md) creation), and assemble them into a [plan](./plan.md) with dependency partial order. Outputs: cells $\langle T_i, \texttt{part-of-plan}, P\rangle = \mathbf{t}$ for each new task.

**2. Dispatch** ($\mathcal{S}_{\mathrm{disp}}$). Closure rules that match potential-frontier tasks against agents per the [dispatch morphism](../morphisms/dispatch.md). Outputs: cells $\langle T_i, \texttt{assigned-to}, A\rangle = \mathbf{t}$ when capability matches and authority + capacity hold. Concurrent with [installation](../../../../../../../../../../../../public-services-section/services/personal-services-section/services/emsenn-services-section/content/text/glossary/terms/installation.md) and [delegation](../../../services/predicated-governance-services-section/content/glossary/terms/delegation.md) when new offices / sub-grants are needed.

**3. Execution** ($\mathcal{S}_{\mathrm{exec}}$). Closure rules that fire on execution-witness increments — agents performing work, producing artifacts, settling cells. Outputs: cells $\langle T_i, \texttt{progressed-via}, \mathrm{event}\rangle = \mathbf{t}$ recording each substantive step. State transitions on the task's lifecycle cells (open → active → ...).

**4. Tracking** ($\mathcal{S}_{\mathrm{trk}}$). Closure rules that aggregate execution-witnesses into status reports. Outputs: cells $\langle T_i, \texttt{status-at-stage}, \tau\rangle = v$ for the appropriate bilattice value $v$ at periodic intervals within the cycle. Continuous monitoring; cells refresh as new evidence arrives.

**5. Review** ($\mathcal{S}_{\mathrm{rev}}$). Closure rules that fire at cycle-end, examining the cycle's cumulative state for completion, failure, abandonment, and discovered-new-information. Outputs: review-witness cells, lessons-learned cells, plan-revision-needed cells.

**6. Feedback** ($\mathcal{S}_{\mathrm{fdb}}$). Closure rules that propagate the review's outputs into seed-conditions for the next cycle's planning. Outputs: cells $\langle \mathrm{cycle}_i, \texttt{produces-seed-for}, \mathrm{cycle}_{i+1}\rangle$ — the Markov-aggregation cells that link cycles.

## Phase ordering as closure-rule gating

The six phases fire *in order* within each cycle. Substrate-algebraic encoding: each phase's closure rules carry a *gate cell* on their antecedent that requires the prior phase's terminal-witness:

- Dispatch rules require $\langle \mathrm{cycle}_i, \texttt{planning-completed-at}, \tau\rangle = \mathbf{t}$ for some $\tau$ within the cycle.
- Execution rules require $\langle \mathrm{cycle}_i, \texttt{dispatch-completed-at}, \tau\rangle = \mathbf{t}$.
- Etc.

This produces a *strict phase sequence*: no closure rule of phase $j+1$ fires until phase $j$'s terminal witness is settled. By [settling-monotonicity](../../../../../../../../../../library/theories/humanities/theories/math/theories/categories/theories/predication-categories/concepts/settling-monotonicity.md), once a phase's terminal cell is at $\mathbf{t}$, the next phase is permanently unblocked for that cycle.

## Cross-cycle cadence

The cadence of the loop is the inter-cycle interval. Typical choices:

- *Per-session* cadence: one loop cycle per work session (high-frequency, fine-grained).
- *Daily* cadence: one cycle per day (matches the [weekly calendar](../../../../../../../../../../../../public-services-section/services/personal-services-section/services/emsenn-services-section/content/text/documents/articles/essays/weekly-calendar-as-recurrent-practice.md)'s daily structure).
- *Sprint* cadence (Reinertsen 2009): one cycle per sprint (commonly two weeks).
- *Quarterly* cadence: one cycle per quarter (long-term).

Multi-scale operations loops *nest* per the work vocabulary's [cadence](../../../terms/cadence.md) table: daily cycles within weekly cycles within monthly within quarterly. Each scale is its own operations loop $\Lambda_{\mathrm{daily}}, \Lambda_{\mathrm{weekly}}, \ldots$ with its own $\mathcal{S}$ and $T$. They *share* substrate cells: a task settled at a daily-cycle review may be re-examined at a weekly-cycle review, with the weekly review consulting the cumulative daily-review cells.

## Regime

By the [regime-of-recurrent-practice theorem](../concepts/regime-of-recurrent-practice.md) applied to operations loops with *Markov* aggregation: Scott-continuous regime. $\kappa = \omega$. Cohomology trivial.

A loop with *limit-aggregating* feedback (e.g., a quarterly review that aggregates *all* prior quarters' learnings cumulatively) lifts to transfinite-bounded. A loop whose feedback structure depends on aggregations across *uncountably-many* prior cycles would be aperiodic — but no actual operational cadence reaches that regime; the function of the endeavor (the aim toward which the operations loop runs) is the aperiodic-regime structure, not the loop itself.

## Composition with the function

The operations loop's reason for running is the [function-as-aperiodic-settling](../theorems/function-as-aperiodic-settling.md) of the endeavor: each loop cycle advances the aperiodic-regime function-settling by one Scott-continuous step. The function does not stabilize; the loop runs forever (per *recurrence not repetition* — Prigogine). Each cycle's feedback contributes to the function's cumulative cohomological invariant.

This is the substrate-algebraic content of "the means change but the function does not": the loop's per-cycle content (the specific tasks, plans, dispatches) is the means and varies; the loop's cadence and the function it serves are the aim and persist.

## Relation to predicated-computing

The operations loop's substrate-algebraic specification is the *application-layer* spec for an operations-management implementation. The corresponding engineering side — [predicated-computing](../../../../../../../../engineering/theories/tech/theories/computing/theories/predicated-computing/) — provides the substrate runtime: the predication-graph store, the event log, the closure-rule firing machinery, the witness format. The operations loop here is *what should run*; predicated-computing is *what runs it*.

A working implementation: closure rules for each phase encoded in the engineering substrate; agent invocations producing increments; the substrate's settling propagating the loop forward cycle by cycle.

## Earlier material

By the [regime-of-recurrent-practice theorem](../concepts/regime-of-recurrent-practice.md) applied to operations loops with *Markov* aggregation: Scott-continuous regime. $\kappa = \omega$. Cohomology trivial.
