---
type: concept
class: operation-kind
depends-on: [operation-kinds, settlement-path, agential-self-generation]
see-also: [observation-record, instinct-record, promote]
title: Learning
description: "The platform's self-composition operation kind: an operation that applies the substrate's machinery to the substrate's own content (its event log, its operator specifications, its agents' behavior) to produce new substrate entities…"
---

# Learning

The platform's *self-composition* operation kind: an operation that applies the substrate's machinery to the substrate's own content (its event log, its operator specifications, its agents' behavior) to produce new substrate entities (instincts, skills, tools, refined operator specifications) the platform then uses.
Learning is what makes [agential self-generation](../../agent/agential-self-generation/agential-self-generation.md) operationally meaningful.

A learning operation is structurally distinct from other operation kinds:

- A [query](../../query/query.md) reads substrate state and returns content; learning reads substrate state and produces *new* substrate entities derived from it.
- A [mutation](../mutation/mutation.md) directly inserts proposed predications; learning derives the predications from observed patterns.
- A [guard](../../governance/guard/guard.md) admits or rejects; learning produces.

## The learning loop

A learning operation typically has the structure:

1. *Read.* Read substrate content — observation records, recent witnesses, operator behavior records, [memory](memory.md) regions.
2. *Pattern-detect.* Apply a substrate-resident pattern-detection rule (a closure rule, a fine-tuned classifier, an analysis skill) to the read content.
  Identify recurring patterns, anomalies, or stable structures.
3. *Synthesize.* Generate the new substrate entity: the pattern's identification gives an [instinct-record](../objects/instinct-record.md); a stable instinct gives a [skill-record](../objects/skill-record.md); a stable skill gives a [tool-record](../../skill/tool-record/tool-record.md).
  Per [promote](../../office/promote/promote.md), each synthesis cites its source records.
4. *Insert.* The new entity is inserted into the substrate.
  The platform's subsequent operations may now consult the learned entity.

## Engineering properties

- **Substrate-grounded.** Per [agential self-generation](../../agent/agential-self-generation/agential-self-generation.md), learning operates on substrate content and produces substrate content.
  There is no out-of-band training set or out-of-band model parameters whose changes the substrate cannot see.
- **Provenance-preserving.** Per [provenance](../../teaching/explanations/provenance.md), every learned entity cites the substrate content it was derived from.
  An audit can trace any learned skill back to the observations that produced it.
- **Threshold-gated.** Learning is admissible only when the source content meets declared maturity thresholds (sufficient confidence, stable pattern, coverage breadth).
  Below threshold, the learning operation rejects.
- **Witness-recorded.** Every learning operation produces a witness; the substrate's audit can replay the derivation.

## Position in the platform

Learning is what shifts the platform's per-invocation cost over time.
A platform that does not learn pays the highest formality cost on every invocation; a platform that learns gradually settles its content into deterministic [tools](../../skill/tool-record/tool-record.md) the substrate runs at near-zero marginal cost.
Per the [formality-layer](../../scope/formality-layer/formality-layer.md) discipline, learning is the engineering primitive that produces the cost reduction.

Particular learning patterns:

- **Observation-aggregation.** Many observation records sharing a pattern are aggregated into an instinct.
- **Instinct-stabilization.** A stable instinct is consolidated into a skill.
- **Skill-deterministic-reduction.** A skill whose body has stabilized to substrate-only operations is reduced to a tool.
- **Failure-pattern-detection.** Failure-diagnosis records sharing a pattern are aggregated into an instinct that warns subsequent dispatch about the recurring failure.
- **Vocabulary-extension.** Recurring co-occurrence of related predications motivates a new substrate predicate; the learning operation produces a predicate-entity record (and the corresponding shape, governance, etc.).

Learning that occurs entirely outside the substrate (a training run on an external system that updates an external model) is not learning in this corpus's sense; it is a substrate gap.
The platform's commitment is that learning is a substrate operation kind, performed by substrate operators, recorded as substrate content.
