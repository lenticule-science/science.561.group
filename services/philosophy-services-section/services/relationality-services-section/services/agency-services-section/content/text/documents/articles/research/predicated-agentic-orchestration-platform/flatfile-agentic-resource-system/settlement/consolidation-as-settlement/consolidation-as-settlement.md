---
name: consolidation-as-settlement
description: "The discipline that between-session memory consolidation in FARS is a settle of observations against themselves: not a separate summarization step, not an LLM-pass over chat logs, but a closure-rule application where the substrate's algebra composes accumulated observations into stable patterns (instincts), and stable patterns into procedures (skills), and procedures into deterministic tools."
type: concept
class: framing
depends-on: [settle, fiber, three-tier-memory, session-as-entity]
see-also: [consolidate, observation-record, instinct-record, formality-progression, instinct-confidence-is-closure-fixpoint-measure]
title: consolidation-as-settlement
---

# Consolidation as settlement

The discipline that *between-session memory consolidation in FARS is a [`settle`](../../code/transformers/settle.md) of observations against themselves*: not a separate summarization step, not an LLM-pass over chat logs, but a closure-rule application where the substrate's algebra composes accumulated observations into stable patterns (instincts), and stable patterns into procedures (skills), and procedures into deterministic tools.

The discipline is the operational content of the *CL pipeline settlement path* the prior-art survey surfaced: **observation → instinct → skill → tool**.
Each arrow is a closure step.
The path is *sharpening* (per [formality-progression](../../formality-progression/formality-progression.md)) applied to the substrate's own operational outputs: F1 observations (narrative records of what happened) settle into F2 instincts (structured patterns with triggers); F2 instincts settle into F3 skills (deterministic procedures); F3 skills MAY settle into pure tools (closure rules running at $0 LLM cost).

The framing is what frees FARS from a separate "memory consolidation engine."
There is no curator process; there is no dream subsystem; there is no reflection layer.
Consolidation IS [`settle`](../../code/transformers/settle.md) operating on the substrate's [`Observation`](../objects/observation-record.md) entities under closure rules that produce [`Instinct`](../objects/instinct-record.md) entities.
The substrate's existing audit, replay, and federation properties apply to consolidation runs the same way they apply to any other settle.

## The CL pipeline settlement path

Per the learning-and-feedback prior-art and the FARS-internal CL pipeline design:

### Observation → Instinct

The substrate's `learning`-channel closure rules (per [seven-channel-decomposition](../../architecture/seven-channel-decomposition/seven-channel-decomposition.md)) match against accumulated [`Observation`](../objects/observation-record.md) entities: when multiple observations carry concordant predicates ("agent invoked Grep, agent invoked Edit, edit succeeded — both predicates seen N times"), the rule's conclusion produces an [`Instinct`](../objects/instinct-record.md) entity with `pattern: t`-predicates capturing the recognized regularity.

The number of observations required to produce an instinct is *not* a hard threshold — per the FARS-internal design, *confidence is closure measure (idempotence under further training), not count*.
An instinct is "learned" when applying the consolidation operator produces no further change at that pattern; the pattern has reached fixed-point under the rule system.
Few observations may be enough for stable patterns; many observations may not be enough for unstable ones.

### Instinct → Skill

Instincts that crystallize into stable, replicable patterns SHALL be promotable to [`SkillRecord`](../objects/skill-record.md)s.
The promotion is a substrate edit (per [`apply-edit`](../../code/transformers/apply-edit.md)) that creates a new skill record whose `body` references the instinct's pattern, whose `preconditions` derive from the instinct's triggers, whose `postconditions` derive from the instinct's outcomes.

The promotion is not automatic; it requires substrate-curated agreement that the instinct is sound.
Per the AgOP discipline, promotion may require a closure rule whose premise checks instinct confidence AND a captain-or-equivalent authorization predicate; an unauthorized auto-promotion is a `guard`-channel diagnostic.

### Skill → Tool

Skills at F3 (per [formality-progression](../../formality-progression/formality-progression.md)) MAY be demoted to deterministic tools: the skill's body is a closure rule running at $0 LLM cost; the realization's stepping map executes it without invoking a model.
The demotion is realization-side mechanism, not substrate content; the substrate-side artifact is the skill record at F3 with the closure-rule body.

## Why consolidation is settle

Per [validation-as-settlement](../validation-as-settlement/validation-as-settlement.md), the substrate's algebra IS the validator; it does not need a separate validator.
By the same discipline, the substrate's algebra IS the consolidator; it does not need a separate consolidation engine.
The consolidation rules are [`ClosureRuleRecord`](../objects/closure-rule-record.md) entities; their premise patterns match observation cells; their conclusions produce instinct entities.
[`settle`](../../code/transformers/settle.md) runs the rules; [`emit-event`](../../code/transformers/emit-event.md) records the consolidations on the `learning` channel.

This means consolidation has the substrate's standard properties:

- **Deterministic.** Same observations + same rules produce same instincts.
- **Replayable.** Replaying the consolidation run from the event log reproduces the resulting instincts.
- **Auditable.** An instinct cites its source observations by hash via the witness chain.
  An auditor can ask "where did this instinct come from?" and traverse to the answer.
- **Editable.** Consolidation rules are substrate entities; tuning consolidation is editing predications.

## What consolidation is not

- **Not summarization.** A summary compresses content into a shorter form; an instinct is a *settled pattern* represented as substrate predicates.
  Summaries lose information; instincts crystallize information into a richer form.
- **Not LLM dreaming.** OpenClaw's "dreaming" pattern uses LLM passes to consolidate memory between sessions; FARS's consolidation uses closure rules.
  A FARS realization MAY use an LLM-flavored skill as a step in consolidation (an F1 consolidation rule with an LLM body), but the substrate-level operation is still settle.
- **Not garbage collection.** Consolidation does NOT delete observations after producing instincts.
  Per [event-sourcing](event-sourcing.md), the event log is append-only; observations remain in the searchable tier permanently.
  Instincts are *additional* substrate content, not replacements.
- **Not bounded by tier transitions.** An instinct does not have to "graduate" to a skill to be useful; many instincts remain instincts permanently and inform dispatch via fiber composition without ever becoming skills.
  The settlement path is *available*, not mandatory.

## Position

Consolidation-as-settlement is what makes [`consolidate`](../../code/transformers/consolidate.md) coherent — that morphism is one [`settle`](../../code/transformers/settle.md) call on the `learning`-channel rule system across observation entities.
The framing depends on [`settle`](../../code/transformers/settle.md) (the operator), [`ClosureRuleRecord`](../objects/closure-rule-record.md) (the consolidation rules as substrate entities), [`Observation`](../objects/observation-record.md) (the input), [`Instinct`](../objects/instinct-record.md) (the output).
It composes with [three-tier-memory](../../architecture/three-tier-memory/three-tier-memory.md) (consolidation moves content up the tiers over time) and [formality-progression](../../formality-progression/formality-progression.md) (the path observation → instinct → skill → tool IS sharpening).
