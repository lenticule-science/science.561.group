---
type: concept
class: pattern
depends-on: [skill, runbook]
see-also: [skill-invocation, runbook-execution, skill-composition-cost-is-bounded-by-constituent-sum]
title: Skill composition
description: The platform's pattern for combining smaller skills into larger ones.
---

# Skill composition

The platform's pattern for *combining smaller skills into larger ones*.
A composed skill is a substrate-resident specification declaring an ordered or partially-ordered sequence of constituent skills, the data flow between them, and the composition's net effect on substrate state.
Skill composition is what makes the platform's skill library scale beyond hand-written individual skills: a small number of primitive skills compose into many higher-level skills, with the composition itself substrate content.

## Two composition shapes

The platform admits two structural shapes of skill composition:

- **Sequential composition.** A composed skill specifies steps $s_1, s_2, \ldots, s_n$, with each step's input being some function of prior steps' outputs.
  The composed skill's invocation runs the steps in order, propagating data along declared bindings.
  Per [runbook](runbook.md), a runbook is a sequential composition with additional control structure (conditional branches, parallel tracks, retry logic).
  A simple sequential composition without these control elements is itself a skill — runbooks are the composition pattern's richer instance.

- **Parallel composition.** A composed skill specifies steps $s_1, s_2, \ldots, s_n$ that operate independently and whose outputs are joined per the substrate's value-domain — the [knowledge-order](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/concepts/knowledge-order.md) join in the math parent's [predication fiber algebra](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/predication-fiber-algebra.md).
  The composed skill's invocation dispatches the steps concurrently (or sequentially, for runtimes that lack concurrency), then composes the outputs.
  Per [merge](../../../../../../../../../../../../../../../engineering-services-section/content/text/glossary/terms/merge.md), the value-domain join makes parallel composition deterministic regardless of the actual execution order.

Most useful skill compositions are mixed: largely sequential with parallel pockets, or largely parallel with sequential synchronization points.
The substrate's discipline does not privilege one shape over the other; the composition's predications declare which steps are sequential and which are parallel.

## Predication structure

A composed skill's substrate-resident specification includes:

- **`steps`** — predications listing the constituent skills in their declared order or partial order.
- **`data-flow`** — predications declaring how each step's input is computed from prior steps' outputs (or from the composed skill's own input).
  The data-flow is itself substrate content; per [shape](../../scope/shape/shape.md), the bindings are validated against the steps' input/output kinds.
- **`control-structure`** — predications declaring conditional branches (per [closure-rule](../../teaching/explanations/closure-rule.md), conditions are closure-rule premises), parallel tracks, retry policy, fail-fast or fail-safe semantics.
- **`net-effect`** — predications declaring the composition's overall input kind, output kind, and side-effects on substrate state.
  The net-effect is what the composed skill's caller sees; the steps' individual effects are encapsulated.

## Composition's substrate semantics

A composed skill's invocation is dispatched like any other skill (per [skill-invocation](../skill-invocation/skill-invocation.md)).
The platform's runtime expands the composition: reads the composed skill's predications, dispatches each constituent step in its declared order (or parallel arrangement), propagates data per the data-flow, applies the control structure.
The substrate sees the composition's invocation as a sequence of constituent skill invocations; per [witness](../../teaching/explanations/witness.md), each step produces its own witness, and the composition produces a meta-witness recording the sequence.

Per [settlement-determinism](../../../../../../../../../../../../../../../engineering-services-section/content/text/glossary/concepts/settlement-determinism.md), composed-skill invocation is deterministic given the same composition specification, the same input, and the same substrate state.
Two invocations of the same composed skill with the same input produce the same constituent-step sequence and the same final result.

## What composition enables

- **Skill libraries scale.** A platform with $n$ primitive skills admits up to $O(n^k)$ distinct composed skills for sequences of length $k$.
  Most of those are not useful; the platform's *useful* composed-skill library is smaller, but the composition's structural shape is what makes the library extensible without runtime changes.
- **Domain-specific skills emerge from primitives.** The substrate's primitive skills (insert, retract, traverse, dispatch, witness) compose into domain skills (publish-document, dispatch-task, escalate-incident) through composition.
  Adding a domain skill is admitting a composition specification; the runtime executes it as a sequence of primitive skills.
- **Skills audit through their constituents.** A composed skill's witness chain decomposes into its steps' witnesses.
  An auditor can reconstruct what the composition did by walking the substrate's witnesses.
- **Composition itself is a maturation step.** Per [settlement-path](settlement-path.md), a frequently-invoked composition can be settled into a deterministic procedure (an F3 tool) that performs the same effect without dispatching through the constituent skills.
  The cost of the F3 tool is bounded by the substrate's per-operation overhead; the cost of the composition's dispatch is the sum of the constituents' costs.

## What composition does not do

- **No host-runtime skill code.** A composed skill's specification is substrate content.
  Its execution is the runtime expanding the predications and dispatching the steps.
  There is no host-runtime function that special-cases composed skills.
- **No implicit composition.** Two skills are not composed unless an explicit composition specification names them as constituents.
  The substrate does not infer composition from co-occurrence in dispatch history.
- **No type-system-imposed limits on what composes.** Any two skills whose data-flow can be declared compose.
  The composition's validity is determined by the input/output kind matching at the data-flow boundaries; per [shape](../../scope/shape/shape.md), shape mismatches surface as substrate-level violations at composition-admission time, not at runtime.

## Position in the platform

Skill composition is the platform's *skill-library scaling discipline*.
Combined with [settlement-path](settlement-path.md), it is what lets the platform's accumulated skill content grow without bound while the per-invocation cost stays bounded by the substrate's locality contract.

The pattern composes with [skill](skill.md) (the primitives), with [runbook](runbook.md) (the richer composition pattern with full control structure), with [skill-invocation](../skill-invocation/skill-invocation.md) (the operator that dispatches both primitive and composed skills), and with [agential-self-generation](../../agent/agential-self-generation/agential-self-generation.md) (the platform may compose its own skill compositions, producing higher-order compositions that audit lower-order ones).
