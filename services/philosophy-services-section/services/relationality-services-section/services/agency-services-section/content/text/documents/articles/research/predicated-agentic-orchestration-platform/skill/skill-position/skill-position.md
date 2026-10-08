---
type: concept
class: classification
depends-on: [skill, operation-kinds]
see-also: [operation-kinds, skill-record]
title: Skill position
description: The platform's classification of skills by what kind of reasoning move the skill performs.
---

# Skill position

The platform's classification of [skills](skill.md) by *what kind of reasoning move* the skill performs.
Every skill record carries a `closure-kind` predication declaring its position; the position determines the skill's structural shape and what kinds of substrate operations its body composes.
The position is the agential refinement of the engineering parent's [closure-kind](../../../../../../../../../../../../../../../engineering-services-section/content/text/glossary/concepts/closure-kind.md) taxonomy, which in turn classifies operations by which of the math parent's two [closure operators](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/morphisms/closure-operator.md) the operation leaves at fixed-point.

The four positions:

- **Process.** Executes a named transformation on entities.
  A process skill takes input entities, applies a transformation, and produces output entities.
  Its body is typically a sequence of substrate primitives — [insertions](../../../../../../../../../../../../../../../engineering-services-section/content/text/glossary/terms/insertion.md), [traversals](../../../../../../../../../../../../../information-science-services-section/services/math-services-section/content/text/glossary/terms/traversal.md), and value-domain operations — without inferential reasoning.
  Processes correspond to deterministic, repeatable transformations; mature processes settle into [tool-records](../tool-record/tool-record.md) per [settlement-path](settlement-path.md).
- **Procedure.** Follows prescribed steps to produce an output.
  A procedure skill carries a sequence of sub-skill invocations and the bindings between them.
  Its body is typically a [runbook-record](../objects/runbook-record.md) reference or a structured composition.
  Procedures correspond to recipes — fixed step orderings — and may include conditional branches and accumulated state.
- **Derivation.** Derives a value from existing entities by rule.
  A derivation skill reads substrate state, applies a stated rule (typically a [closure-rule application](../../../../../../../../../../../../../../../engineering-services-section/content/text/glossary/terms/closure-rule-application.md) or a graph computation), and produces a derived predication.
  Derivations correspond to inference — applying known rules to known content to produce new content.
- **Inquiry.** Investigates a question and reports findings.
  An inquiry skill takes a question (typically as input predications declaring what is being asked) and produces an answer (typically as output predications declaring what was found).
  Inquiry skills are the most inference-heavy: their body usually involves [analysis](analysis.md) or [learning](learning.md) operation-kinds and may invoke a frontier model.

## Engineering properties

Three commitments characterize the skill-position discipline:

- **Each skill occupies exactly one position.** A skill that crosses positions is two skills.
  The substrate's validation rejects multi-position skill records as ill-formed.
- **Position is structural, not stylistic.** The position determines what the skill's body must look like (substrate primitives for process, sub-skill sequence for procedure, rule application for derivation, inference for inquiry).
  The substrate's validation can check the body against the declared position.
- **Position determines cost class.** Per [formality-layer](../../scope/formality-layer/formality-layer.md), the position is a strong predictor of cost: process skills run in F3 (deterministic, near-zero cost), procedure skills in F2-F3 (depending on body composition), derivation skills in F2-F1, inquiry skills typically in F0-F1.

## Relationship to operation-kinds

Skill positions and [operation-kinds](../../operation-kinds/operation-kinds.md) are different but related taxonomies:

- The **seven operation-kinds** (observation, guard, accounting, query, mutation, analysis, learning) classify *substrate operations* by what they do to substrate state.
- The **four skill positions** classify *skill records* by what kind of reasoning move they perform.

A skill of any position may invoke operations of any kind in its body.
A *Process* skill typically invokes mutations and queries.
A *Procedure* skill invokes a sequence of others' operations.
A *Derivation* invokes queries followed by mutations.
An *Inquiry* invokes analyses, learnings, and queries.

The skill-position is the skill's *structural identity*; the operation-kinds the skill invokes are its *body content*.
Both are substrate predications, both are queryable.

## Why four positions, not more or fewer

The four positions are not arbitrary.
They correspond to distinct structural patterns:

- *State-change* (process)
- *State-change-with-prescribed-sequence* (procedure)
- *State-derivation-from-rule* (derivation)
- *State-question-with-investigation* (inquiry)

Particular platform realizations may extend with additional positions if the substrate's discipline requires (a meditation position for unstructured agent reflection, an emergency position for safety-critical interventions).
The structural claim is that the four cover the recurring kinds of reasoning move; extensions warrant their own substrate entities and shape constraints.
