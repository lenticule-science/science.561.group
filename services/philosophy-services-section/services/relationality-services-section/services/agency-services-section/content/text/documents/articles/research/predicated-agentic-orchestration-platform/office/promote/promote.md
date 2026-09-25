---
type: morphism
class: settlement-operator
realizes: [settlement-path, agential-self-generation]
depends-on: [settlement-path, observation-record, instinct-record, skill-record, tool-record]
see-also: [governance-decision, promote-is-strictly-cost-reducing, skill-composition-cost-is-bounded-by-constituent-sum]
title: Promote
description: "The operator that advances substrate content one stage along the settlement path: observation → instinct, instinct → skill, or skill → tool."
---

# Promote

The operator that advances substrate content one stage along the [settlement path](teaching/explanations/settlement-path.md): observation → instinct, instinct → skill, or skill → tool.
Promote is what *learning* operationally is on the platform: each successful promotion is a movement of substrate content from a less-mature stage to a more-mature stage, with the corresponding decrease in per-invocation [formality](../../scope/formality-layer/formality-layer.md) cost.

## Signature

`promote(source-records, target-stage, scope) → (promoted-record, witness) | (rejection, witness)`

Inputs:

- **`source-records`** — references to the source-stage records being consolidated.
  For observation → instinct, a set of [observation-records](../objects/observation-record.md) sharing a pattern.
  For instinct → skill, a stable [instinct-record](../objects/instinct-record.md) (or family of them).
  For skill → tool, a [skill-record](../objects/skill-record.md) whose body is reducible to substrate-only operations.
- **`target-stage`** — the stage being promoted to: `instinct`, `skill`, or `tool`.
- **`scope`** — reference to the [scope](../../scope/scope.md) within which the promotion applies.

Outputs:

- **`promoted-record`** — the new substrate entity at the target stage: a synthesized [instinct-record](../objects/instinct-record.md), [skill-record](../objects/skill-record.md), or [tool-record](../../skill/tool-record/tool-record.md), with `derived-from` predications citing the source records.
- **`rejection`** — promotion declined: the source records do not satisfy the target stage's requirements (insufficient confidence, pattern not stable, body not reducible).
- **`witness`** — records the promotion's source records, target stage, derivation rule applied, and resulting record's hash.

## Operational semantics

Promote proceeds in four phases per the target stage:

**Observation → Instinct:** 1.
Read the source observation records; identify the recurring pattern across them.
2.
Derive an instinct's `pattern`, `trigger`, `diagnosed-cause`, `suggested-response` predications by applying the substrate's reflection-rule (a closure rule that synthesizes instinct content from observation patterns).
3.
The new instinct's `confidence` is initialized to a starting value derived from the count and consistency of the source observations.
4.
Insert the instinct-record; the witness records the derivation.

**Instinct → Skill:** 1.
Read the source instinct (and any derived-from observations); the instinct must have reached a stability threshold (declared per scope).
2.
Synthesize a skill's `domain`, `codomain`, `preconditions`, `postconditions`, `body` predications by lifting the instinct's `suggested-response` into a structured procedure.
3.
The new skill's body cites the closure rules and operations the instinct's response named.
4.
Insert the skill-record; the witness records the derivation.

**Skill → Tool:** 1.
Read the source skill; verify its body is reducible to substrate-only operations (no inference-bearing skill-invocations remain).
2.
Compose the body into a deterministic procedure: substrate primitives, [closure-rule applications](../../../../../../../../../../../../../../../engineering-services-section/content/text/glossary/terms/closure-rule-application.md), graph operators.
3.
The new tool's `formality` is set to F3 (deterministic, near-zero cost).
4.
Insert the tool-record; the witness records the consolidation.

## Engineering invariants

- **Source citations preserved.** Every promoted record's `derived-from` cites its source records by canonical hash.
  The provenance chain is queryable backward from any tool to its founding observations.
- **Promotion is admissible at threshold, not on demand.** Each stage transition requires the source to meet a declared maturity threshold (confidence above a level, pattern stable across a window, body reducible).
  Below threshold, promote rejects with a witness recording the missing condition.
- **Promotion produces new entity, not edit.** The source records remain unmodified; the promoted entity is new.
  The settlement-path stages are layered, not replaced.

## Failure modes

- **Insufficient confidence.** The source instinct's confidence is below the declared promotion threshold; promote rejects with the threshold gap recorded in the witness.
- **Body not reducible.** A skill being promoted to tool has body operations that are still inference-bearing; the tool target requires substrate-only operations; promote rejects.
- **Pattern not stable.** Observations being promoted to instinct have not yet converged on a recurring pattern; the substrate's reflection rule does not produce a derivable instinct; promote rejects.

## Position in the platform

Promote is the operator that makes [agential self-generation](../../agent/agential-self-generation/agential-self-generation.md) operationally meaningful at the learning level.
Without promote, observations accumulate but never mature; the platform's per-invocation cost stays at the highest formality.
With promote, the platform progressively settles its content into deterministic tools, paying the inference cost once per pattern rather than once per invocation.
