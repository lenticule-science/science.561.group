---
type: definition
class: closure-rule-subsystem
status: draft
symbol: R
depends-on: [operations-settling, closure-rule-system, settling-bound]
realizes: [recurrence, cadence, cycle]
---

# Recurrent practice

The mathematical realization of a [recurrent practice](../../../../../../../../../humanities/theories/sociology/theories/work/terms/recurrence.md) at a [cadence](../../../../../../../../../humanities/theories/sociology/theories/work/terms/cadence.md): a closure-rule subsystem $\mathcal{S}_R \subseteq \mathcal{S}_{\mathrm{op}}$ whose rules fire at a regular ordinal pattern, producing one *cycle* per firing.

## Data

A recurrent practice $R$ is a triple $(\mathcal{S}_R, T_R, \alpha_R)$:

- $\mathcal{S}_R \subseteq \mathcal{S}_{\mathrm{op}}$ — the closure-rule subsystem comprising the rules that *constitute* the practice (e.g., the rules for "weekly review": detect the start of a new week, gather review inputs, run the review procedure, produce review-witnesses).
- $T_R = \{\tau_0, \tau_1, \tau_2, \ldots\} \subseteq \lambda$ — the cycle-boundary ordinals: the stages at which a new cycle begins.
  The intervals $[\tau_i, \tau_{i+1})$ are the *cycles* of $R$.
- $\alpha_R$ — the *aggregation structure*: the dependency pattern of the cycle-$i$ closure rule's antecedent on the prior settling history.
  One of:
  - *Cycle-independent* — the rule's antecedent depends only on the increment $u_\tau$ for $\tau \in [\tau_i, \tau_{i+1})$.
    Each cycle stands alone.
  - *Markov* — the rule's antecedent depends on the increments and settled cells from the immediately prior cycle $[\tau_{i-1}, \tau_i)$ plus the current cycle's increments.
  - *Finite-history* — the rule's antecedent depends on the prior $k$ cycles for some fixed finite $k$.
  - *Limit-aggregating* — the rule's antecedent depends on aggregations across all prior cycles.
    At limit ordinals, the rule reads the join of all prior cycles' settled content.

## Multi-scale nesting

Cadences nest: per the work vocabulary's table — turn ⊂ session ⊂ daily ⊂ weekly ⊂ monthly ⊂ quarterly.
A recurrent practice at scale $s$ has a $T_R$ whose ordinal-spacing reflects $s$; nested practices have $T_{R'} \subset T_R$ when $R'$ runs at a finer scale.
The composition of nested practices is again a recurrent practice with the union of cycle-boundaries.

## Cadence vs. synchronization

Reinertsen's (2009) distinction renders structurally: a *cadence* is a single $T_R$ — one practice's firing pattern. *Synchronization* of multiple practices $R_1, \ldots, R_k$ is the existence of a shared cycle-boundary $\tau \in T_{R_1} \cap \cdots \cap T_{R_k}$ — a stage at which all of them fire together.
Synchronized practices coordinate at the shared boundary; non-synchronized practices may have any phase relationship.

## Settlement-path on the practice

Per the [cadence term](../../../../../../../../../humanities/theories/sociology/theories/work/terms/cadence.md)'s "settlement path applied to cadence" reading, the practice's $\mathcal{S}_R$ matures along the [AOP formality progression](../../../../../../../engineering/theories/tech/theories/computing/theories/predicated-computing/theories/agential-orchestration-platform/concepts/formality-layer.md): from inquiry-flavored prose-only rules (F1) through structured procedures (F2) to algebraic deterministic rules (F3).
At F3, the practice's firing is automatic — the substrate triggers the cycle without external invocation.
At F1, the practice depends on a frontier model interpreting prose at each cycle boundary.

## Identification of the cycle and its phases

A single cycle $C_i = [\tau_i, \tau_{i+1})$ is itself a sub-settling: an ordinal segment of the operations settling restricted to the cells that the practice's closure rules act on.
Cycles with internal phase structure (e.g., PDCA: plan, do, check, act) have $\mathcal{S}_R$ further partitioned into per-phase sub-rule-sets, with phase-boundary witnesses driving the transition from one phase's active rules to the next.
The phase structure is local to the cycle; the *next* cycle re-runs the phase sequence.

The Prigogine novelty principle — recurrence ≠ repetition — is captured by the aggregation structure: cycle-independent practices are repetitions; Markov, finite-history, and limit-aggregating practices carry novelty across cycles via the prior-cycle dependence in the closure rule's antecedent.

## Finite-history practices as step-$n$ rules

Finite-history aggregation of depth $n$ is exactly the structure of the math program's [step-$n$ substitution rule](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/step-n-substitution-rule.md): the closure rule at cycle $i$ reads the prior $n$ cycles' settled content (via a substitution matrix $M$) and produces cycle $i$'s cell values via the matrix application.
The standard cases:

| Depth $n$ | Substitution rule | Perron-Frobenius eigenvalue | Convergent pattern |
|---|---|---|---|
| $n = 1$ | Markov | 1 (flat matrix) | Geometric decay/growth |
| $n = 2$ | Fibonacci-type | Golden ratio $\phi \approx 1.618$ | Fibonacci frequency ratios |
| $n = 3$ | Padovan-type | Plastic constant $\rho \approx 1.325$ | Padovan frequency ratios |
| $n = 4$ | Tetranacci-type; bilattice $\mathbf{FOUR}$ correspondence | $\approx 1.927$ | Tetranacci frequency ratios |

The key distinction from the limit-aggregating case: step-$n$ practices are *Scott-continuous* as closure operators (each cycle's antecedent reads only $n$ prior cycles, which is finite at every stage).
Their $H^1$ classifying invariant is the step-$n$ integer-lattice invariant $\mathrm{cl}\text{-}\mathrm{inv}^{(n)} \in \mathbb{Z}^n$ with rank exactly $n$ — structurally different from the limit-aggregating practice's transfinite-bounded $H^1$.

This means: a quarterly-planning practice that draws on the prior four quarters (depth-4, Tetranacci-type) has a classifying invariant $\mathrm{cl}\text{-}\mathrm{inv}^{(4)} \in \mathbb{Z}^4$; a generational-review that aggregates across *all* prior generations has a transfinite-bounded $H^1$ class.
The two are genuinely different structural types of recurrent practice, distinguishable by regime and by the cohomological invariant's algebraic type.

## Temporal 2-category embedding

The recurrent practice $R$ embeds in the [temporal 2-category](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/temporal-2-category.md) $\mathbf{T}(\mathcal{C}_{\mathrm{op}}, \lambda)$: each cycle-boundary $\tau_n \in T_R$ is a 0-cell $(\tau_n, \mathcal{C}_{\mathrm{op}})$ and each cycle $[\tau_n, \tau_{n+1})$ is a 1-cell

$$\Sigma_R^{(n)} \;:\; (\tau_n, \mathcal{C}_{\mathrm{op}}) \;\to\; (\tau_{n+1}, \mathcal{C}_{\mathrm{op}})$$

the [settle-cycle morphism](../morphisms/settle-cycle.md).
The recurrent practice's full run is the composite 1-cell $\Sigma_R^{(N)} \circ \cdots \circ \Sigma_R^{(0)}$, and the transfinite iterate $\Sigma_R^\omega$ is the limit in $\mathbf{T}(\mathcal{C}_{\mathrm{op}}, \lambda)$ of the countable composite chain.

The aggregation structure $\alpha_R$ determines how the 2-cells in $\mathbf{T}$ — the KZ-lax-idempotent diamond — behave across the practice's 1-cell composites: - Cycle-independent and Markov practices: the 2-cells collapse (strict-idempotent limit), so $\mathbf{T}$ restricts to a 1-category on the practice's 0-cells. - Limit-aggregating practices: the 2-cells are genuinely non-trivial at the limit 0-cell $(\omega, \mathcal{C}_{\mathrm{op}})$, reflecting the non-Scott-continuous content added at the limit stage.
The KZ-lax-idempotent structure is the substrate-algebraic content of "the limit cycle is more than the join of its predecessors."
