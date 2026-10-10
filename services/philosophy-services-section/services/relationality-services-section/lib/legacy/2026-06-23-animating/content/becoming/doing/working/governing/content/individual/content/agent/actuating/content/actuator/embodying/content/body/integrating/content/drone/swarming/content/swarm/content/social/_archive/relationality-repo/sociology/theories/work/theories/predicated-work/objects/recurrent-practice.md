---
type: definition
class: closure-rule-subsystem
status: draft
symbol: R
depends-on: [operations-settling, closure-rule-system, settling-bound]
realizes: [recurrence, cadence, cycle]
---

# Recurrent practice

The mathematical realization of a [recurrent practice](../../../../../../../../../../library/theories/humanities/theories/sociology/theories/work/terms/recurrence.md) at a [cadence](../../../../../../../../../../library/theories/humanities/theories/sociology/theories/work/terms/cadence.md): a closure-rule subsystem $\mathcal{S}_R \subseteq \mathcal{S}_{\mathrm{op}}$ whose rules fire at a regular ordinal pattern, producing one *cycle* per firing.

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

Per the [cadence term](../../../../../../../../../../library/theories/humanities/theories/sociology/theories/work/terms/cadence.md)'s "settlement path applied to cadence" reading, the practice's $\mathcal{S}_R$ matures along the [AOP formality progression](../../../../../../../../engineering/theories/tech/theories/computing/theories/predicated-computing/theories/agential-orchestration-platform/concepts/formality-layer.md): from inquiry-flavored prose-only rules (F1) through structured procedures (F2) to algebraic deterministic rules (F3).
At F3, the practice's firing is automatic — the substrate triggers the cycle without external invocation.
At F1, the practice depends on a frontier model interpreting prose at each cycle boundary.

## Identification of the cycle and its phases

A single cycle $C_i = [\tau_i, \tau_{i+1})$ is itself a sub-settling: an ordinal segment of the operations settling restricted to the cells that the practice's closure rules act on.
Cycles with internal phase structure (e.g., PDCA: plan, do, check, act) have $\mathcal{S}_R$ further partitioned into per-phase sub-rule-sets, with phase-boundary witnesses driving the transition from one phase's active rules to the next.
The phase structure is local to the cycle; the *next* cycle re-runs the phase sequence.

The Prigogine novelty principle — recurrence ≠ repetition — is captured by the aggregation structure: cycle-independent practices are repetitions; Markov, finite-history, and limit-aggregating practices carry novelty across cycles via the prior-cycle dependence in the closure rule's antecedent.
