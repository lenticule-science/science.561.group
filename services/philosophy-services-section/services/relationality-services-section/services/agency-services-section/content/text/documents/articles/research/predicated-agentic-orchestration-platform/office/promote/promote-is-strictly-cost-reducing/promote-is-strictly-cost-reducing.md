---
type: theorem
class: engineering-claim
status: proved
depends-on:
  - ../morphisms/promote.md
  - teaching/explanations/settlement-path.md
  - teaching/explanations/formality-layer.md
  - teaching/explanations/agential-self-generation.md
  - settlement-path-cost-monotonicity.md
  - settlement-path-as-regime-descent.md
  - ../../teaching/explanations/settling-monotonicity.md
  - ../../../theorems/strict-regime-engineering-envelope.md
see-also:
  - questions/agential-fixed-point-asymptote.md
  - questions/micromodel-training-pipeline.md
  - teaching/explanations/learning.md
  - settlement-path-as-regime-descent.md
title: Promote is strictly cost-reducing; the promote chain terminates in at most three steps
description: Claim.
---

# Promote is strictly cost-reducing; the promote chain terminates in at most three steps

**Claim.** Let $r$ be a substrate record at formality layer $F_i \in \{F_0, F_1, F_2\}$ and let $\mathrm{promote}(r, F_{i+1})$ succeed — i.e., the source record meets the maturity threshold and a promoted record $r'$ at $F_{i+1}$ is produced.
Then the per-invocation cost of $r'$ is *strictly less* than the per-invocation cost of $r$:

$$C_{F_{i+1}}(r') < C_{F_i}(r)$$

Furthermore, the promote chain for any single content item terminates in at most **three** successful promotions: $F_0 \to F_1 \to F_2 \to F_3$.
There is no $F_4$.

## Why promote is strictly cost-reducing

**Grounded in settlement-path-cost-monotonicity.** Per [settlement-path-cost-monotonicity](../../../settlement/settlement-path/settlement-path-cost-monotonicity/settlement-path-cost-monotonicity.md), the per-invocation cost $C_F$ is weakly decreasing in the formality layer: $C_{F_0} \geq C_{F_1} \geq C_{F_2} \geq C_{F_3}$, with strict inequality under realistic implementation assumptions.
The promote operator moves a content item from $F_i$ to $F_{i+1}$; by the monotonicity theorem, the promoted record's invocation cost is at most $C_{F_i}(r)$.

The strict inequality (not merely weak) follows from the promote operator's contract:

- **$F_0 \to F_1$ (observation → instinct):** Promote derives a structured pattern and trigger from the source observations.
  A successful promote satisfies the substrate's reflection rule, meaning the instinct has a recorded pattern whose presence at $F_1$ narrows the model's task scope at each future invocation (per [settlement-path-cost-monotonicity](../../../settlement/settlement-path/settlement-path-cost-monotonicity/settlement-path-cost-monotonicity.md), §$F_0 \to F_1$ transition).
  A successful promote therefore has a strictly smaller per-invocation cost than the F₀ observation, because some per-invocation inference cost has been absorbed into the instinct's substrate content.

- **$F_1 \to F_2$ (instinct → skill):** Promote lifts the instinct's `suggested-response` into a structured procedure — preconditions, steps, postconditions.
  A successful promote means the procedure is substrate content that the skill-invocation operator dispatches without consulting the frontier model for structurally-determined steps.
  The model's role shrinks from interpreting the full operation to handling only remaining non-deterministic steps (if any), strictly reducing per-invocation cost.

- **$F_2 \to F_3$ (skill → tool):** Promote verifies that the skill's body is reducible to substrate-only operations (no inference-bearing skill-invocations remain).
  A successful promote means the promoted tool's body contains only closure-rule applications and deterministic substrate operators — the frontier model is not invoked at all.
  Per [strict-regime-engineering-envelope](../../../theorems/strict-regime-engineering-envelope.md), the tool's per-invocation cost is bounded by the substrate's per-operation overhead, which is strictly less than any model-invoking layer.

The strict cost reduction at each stage is not merely a realistic-implementation assumption: it is built into the promote operator's admission condition.
Promote rejects at each stage if the maturity threshold is not met — if the source records do not satisfy the conditions that would make the promoted record genuinely cheaper to invoke.
A promote that would produce no cost reduction is a promote that does not satisfy the threshold; it produces a rejection, not a promoted record.
Successful promotes strictly reduce cost by design.

## Why the chain terminates in at most three promotions

The promote chain $F_0 \to F_1 \to F_2 \to F_3$ has exactly three transitions and four layers.
Per [formality-layer](../../../scope/formality-layer/formality-layer.md), the four layers are exhaustive: there is no $F_4$ layer beyond the tool.
A content item at $F_3$ has no further promote target; promote applied to a tool-layer record returns a rejection (no target stage).
The chain is therefore bounded: at most three successful promotes per content item.

This termination is structurally grounded by [settlement-path-as-regime-descent](../../../settlement/settlement-path/settlement-path-as-regime-descent/settlement-path-as-regime-descent.md): the formality layers $F_0$–$F_3$ correspond to the four-regime classification's nested bounds ($F_0$ unconstrained, $F_1 \leq$ Scott-continuous, $F_2/F_3$ strict).
Regime descent is a finite partial order with four elements; there is no infinite descending chain.

## Engineering consequences

**Promote has a well-founded termination structure.** Any sequence of promote operations on a content item is strictly descending in the formality-cost order.
The cost order is well-founded (it has a minimum: the substrate's per-operation overhead at $F_3$).
Therefore, no content item can be promoted more than three times total, and any automated promotion loop terminates.

**The micromodel training pipeline is cost-bounded.** Per [micromodel-training-pipeline](../../../micromodel-training-pipeline/micromodel-training-pipeline.md), the platform's pipeline for training micromodels from tool-call logs involves multiple promote cycles.
Each cycle promotes some content from $F_1$ (instinct, micromodel-mediated) toward $F_2$ (skill, structured procedure) or $F_3$ (tool, substrate-only).
By the theorem, each pipeline cycle strictly reduces the per-invocation cost for promoted content; the pipeline's total effect on platform economics is a monotone decrease in invocation cost that terminates at the substrate-operator floor.

**Per-content improvement is bounded above by three rounds.** The platform cannot improve the same content item's invocation cost more than three times through promotion.
Ongoing cost reduction therefore requires identifying *new* content patterns (new observation records to promote) rather than re-promoting already-promoted content.
This distinguishes maturation (bounded per item) from learning (unbounded as new patterns arrive).

**Promote rejection is an informative signal.** When promote rejects ($r$ fails the maturity threshold for $F_{i+1}$), the witness records the missing condition.
The platform can use the rejection witness to identify what additional evidence (more observations for $F_0 \to F_1$, higher confidence for $F_1 \to F_2$, body reducibility for $F_2 \to F_3$) is needed before the next promote attempt.
The rejection is not a failure of the promote operator but a correctly-implemented admissibility gate.

**Formality distribution as asymptote signal.** Per [agential-fixed-point-asymptote](../../../agent/agential-self-generation/agential-fixed-point-asymptote/agential-fixed-point-asymptote.md), the regime-distribution signal — the fraction of operative elements at the strict regime ($F_3$) — is the canonical measurement of the platform's approach to the agential-self-generation asymptote.
Promote is the operator that advances this signal: each successful $F_2 \to F_3$ promote increments the strict-regime fraction.
The signal increases monotonically as promotes succeed; it is bounded above by 1.0 (all operative elements at $F_3$); it approaches but never necessarily reaches 1.0 for content that is irreducibly non-deterministic.

## What the theorem does not claim

The theorem establishes that *successful* promotes reduce cost strictly.
It does not claim that:

- **All content can be promoted to $F_3$.** Content whose work is irreducibly judgmental (research synthesis, strategic triage) has F₀ or F₁ content that resists promotion past the instinct or skill layer.
  Per [settlement-path-cost-monotonicity](../../../settlement/settlement-path/settlement-path-cost-monotonicity/settlement-path-cost-monotonicity.md), the platform's lower bound for such content is $C_{F_1}$ or $C_{F_2}$, not $C_{F_3}$.
- **Promote is automatic.** Each promote attempt is an explicit substrate operation that requires maturity-threshold evidence and produces a witness.
  The theorem covers what happens when promote succeeds; whether the evidence ever accumulates to trigger a successful promote is a separate matter.
- **The one-time cost of the promote transition is small.** Synthesizing an instinct from observations, lifting an instinct to a skill, or verifying a skill's body is reducible — these are non-trivial operations.
  The theorem covers the *per-invocation* cost of the promoted record, not the one-time cost of the transition itself.
