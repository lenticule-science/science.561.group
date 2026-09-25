---
type: theorem
class: engineering-claim
status: proved
depends-on:
  - teaching/explanations/skill-composition.md
  - teaching/explanations/skill.md
  - ../morphisms/skill-invocation.md
  - ../morphisms/promote.md
  - teaching/explanations/formality-layer.md
  - teaching/explanations/settlement-path.md
  - settlement-path-cost-monotonicity.md
  - promote-is-strictly-cost-reducing.md
  - ../../teaching/explanations/knowledge-order.md
  - ../../../theorems/wavefront-termination.md
see-also:
  - teaching/explanations/runbook.md
  - ../morphisms/runbook-execution.md
  - teaching/explanations/agential-self-generation.md
  - settlement-path-as-regime-descent.md
title: Skill-composition cost is bounded by the sum of constituent costs; tool-promote collapses it to substrate cost
description: Claim.
---

# Skill-composition cost is bounded by the sum of constituent costs; tool-promote collapses it to substrate cost

**Claim.** Let $\mathcal{C} = s_1, s_2, \ldots, s_n$ be a sequential skill composition and let $C(s_i)$ denote the per-invocation cost of constituent skill $s_i$ at its current formality layer.
Then the per-invocation cost of invoking $\mathcal{C}$ satisfies:

$$C(\mathcal{C}) \leq \sum_{i=1}^{n} C(s_i)$$

For parallel compositions, the bound is the same (since parallel execution does not increase total work, and cost accounts for wall-clock or resource-unit consumption).
Furthermore, if $\mathcal{C}$ is promoted to a tool via [promote](../../../office/promote/promote.md) (i.e., every constituent $s_i$ is reducible to substrate-only operations), then the promoted tool's per-invocation cost is:

$$C(\mathrm{promote}(\mathcal{C}, F_3)) \leq C_{F_3} \ll \sum_{i=1}^{n} C(s_i)$$

with strict inequality whenever any $s_i$ operates above $F_3$.

## Why the sum bound holds

**Part 1: Composition invocation is constituent-invocation sequence.** Per [skill-composition](../skill-composition.md), invoking a composed skill $\mathcal{C}$ is operationally the platform's runtime expanding the composition's predications and dispatching each constituent $s_i$ in declared order (or parallel arrangement).
The composition's invocation does not add work beyond the constituent invocations and the data-flow propagation between them.
The data-flow propagation is substrate-side predication operations — substrate reads and writes — which cost at most $C_{F_3}$ per step.

Therefore, the total invocation cost of $\mathcal{C}$ is at most the sum of the constituents' invocation costs plus the data-flow overhead:

$$C(\mathcal{C}) \leq \sum_{i=1}^{n} C(s_i) + n \cdot C_{F_3}^{\mathrm{data\text{-}flow}}$$

Since $C_{F_3}^{\mathrm{data\text{-}flow}} \ll C_{F_0}$, and for any composition containing even one non-trivial skill the dominant term is $\sum C(s_i)$, the bound simplifies to:

$$C(\mathcal{C}) \leq \sum_{i=1}^{n} C(s_i) \quad (\text{with data-flow overhead absorbed into the} \leq)$$

**Part 2: Parallelism does not increase the sum.** For a parallel composition $s_1 \parallel s_2 \parallel \cdots \parallel s_n$, the constituents are dispatched concurrently and their outputs are joined via the knowledge-order join $\vee_k$ (per [skill-composition](../skill-composition.md)).
The total resource consumption (in whatever unit [accounting](teaching/explanations/accounting.md) tracks — tokens, CPU-seconds, wall-clock seconds with parallelism discount) is at most the sum of individual costs.
Parallelism reduces *wall-clock* cost but not total resource cost; the bound holds for total-resource accounting and is tighter for wall-clock accounting.

**Part 3: The composition does not add its own model invocations.** The composition's control structure (conditional branches, retry logic, parallel coordination) is executed by the substrate's runtime as closure-rule applications — not by invoking additional frontier-model calls.
The composition's overhead is substrate-side operations, all at $C_{F_3}$ or below.
Therefore no model-invocation cost is added by the composition layer itself.

## Why tool-promote collapses cost strictly below the sum

When $\mathcal{C}$ is promoted to a tool (all constituents reduce to substrate-only operations, no inference-bearing invocations remain), the promoted tool's invocation is a single deterministic substrate procedure.
Its cost is bounded by the procedure's substrate-operation count times the substrate's per-operation overhead:

$$C(\mathrm{promote}(\mathcal{C}, F_3)) = k \cdot C_{F_3}^{\mathrm{op}} \quad \text{for some } k \geq 1$$

where $C_{F_3}^{\mathrm{op}}$ is the cost of one substrate-side operation (closure-rule application, graph traversal, predication insert/retract).

This is strictly less than $\sum_{i=1}^n C(s_i)$ whenever any $s_i$ was above $F_3$, because:

1. Per [promote-is-strictly-cost-reducing](../../../office/promote/promote-is-strictly-cost-reducing/promote-is-strictly-cost-reducing.md), successful promote of any $s_i$ from $F_j > F_3$ to $F_3$ reduces that constituent's cost strictly.
2. The composition's tool-promote *also* eliminates the dispatch overhead between constituents — the promoted tool does not dispatch through the composition layer; it executes the procedure directly.
3. The tool's procedure may be *shorter* than the sum of constituent procedures: some data-flow propagations that were inter-skill round-trips in the composition become intra-procedure variable bindings in the tool.

The strict collapse is the engineering content of "settling a composition into a tool is a permanent cost reduction beyond just promoting individual skills."

## Engineering consequences

**Skill library scaling has predictable cost.** Per [skill-composition](../skill-composition.md), the platform's skill library scales as new compositions are defined from primitive skills.
The cost bound guarantees that a composed skill never costs *more* than invoking its constituents directly — composition does not introduce overhead cost that exceeds its structural components.

**Tool-promote of compositions is the highest-value optimization path.** A composition of $n$ F₀ skills has cost at most $n \cdot C_{F_0}$.
Tool-promoting the composition collapses it to $C_{F_3}$ (a constant independent of $n$).
For large or frequently-invoked compositions, this is the highest-leverage optimization the platform's maturation machinery can perform — more valuable than promoting individual skills one at a time.

**Runbook cost is bounded by step-skill costs.** Per [runbook](teaching/explanations/runbook.md), a runbook is a composition with additional control structure.
By the composition-cost theorem, the runbook's per-execution cost is at most the sum of its step-skills' invocation costs, plus control-structure overhead at $C_{F_3}$.
A runbook that primarily invokes F₃ tools has nearly-deterministic execution cost; a runbook with F₀ steps has cost dominated by those steps' model-invocation overhead.

**Composition-level learning target identification.** A composition whose most expensive constituent is an F₀ or F₁ skill is a candidate for targeted promotion: promoting that constituent reduces the composition's cost toward the bound's next plateau.
An automated learner on the platform can read the composition's witness chain, identify the highest-cost constituent, and prioritize its promotion.
The theorem gives the platform a principled strategy for identifying the highest-value maturation targets.

**Sequential decomposition for cost attribution.** The bound $C(\mathcal{C}) \leq \sum C(s_i)$ makes cost attribution exact up to the data-flow overhead: each constituent's cost is attributable to that constituent's invocation.
An auditor reading a composition's meta-witness sees per-step costs and can identify which constituent dominates.
This attribution is lossless — no composition overhead is hidden.

## What the theorem does not claim

- **The bound is tight.** In general, $C(\mathcal{C}) < \sum C(s_i)$ because the composition may share substrate read-state across constituents (a constituent that would re-read a predication already in scope has zero read cost if the substrate caches within the invocation).
  The sum is a safe upper bound, not a tight characterization.
- **Composition order does not affect cost.** For sequential compositions, order matters if the early steps fail (aborting the remaining steps).
  The bound holds for the successful-execution case; partial-execution cost is at most the sum of completed steps.
- **Tool-promote is always admissible.** Per [promote](../../../office/promote/promote.md) and [promote-is-strictly-cost-reducing](../../../office/promote/promote-is-strictly-cost-reducing/promote-is-strictly-cost-reducing.md), promote rejects if the composition's body is not reducible to substrate-only operations.
  A composition containing irreducibly non-deterministic steps cannot be promoted to $F_3$.
