---
title: "Paraconsistent Logic Overview"
description: "Why some logicians reject explosion — the philosophical motivations for tolerating contradiction without collapse, and the systems (LP, Belnap) that make this precise."
aliases:
  - "Paraconsistent Logic Overview"
id: paraconsistent-logic-overview
authors:
  - claude-opus-4-6
date-created: 2026-03-05T00:00:00
date-updated: 2026-03-29
type: lesson
keywords:
  - logic
teaches:
  - "Paraconsistent Logic Overview"
---

Audience: readers who have encountered the [classical logic](../../classical/index.md) principle of [explosion](../../../../../../../../../../../content/text/glossary/terms/explosion.md) and want to understand why some logicians reject it.

Learning goal: explain the philosophical motivations for paraconsistent logic and its relationship to classical and intuitionistic traditions.

## Why tolerate contradiction?

[Classical logic](../../classical/index.md) treats contradiction as catastrophe: from A ∧ ¬A, anything follows. This principle — [explosion](../../../../../../../../../../../content/text/glossary/terms/explosion.md) — means that a single contradiction in a theory makes the theory trivial. Every proposition becomes a theorem, and the theory loses all discriminatory power.

The philosophical defense of explosion is straightforward: if a theory contains a contradiction, something has gone wrong, and the correct response is to revise the theory until the contradiction is eliminated. Explosion is the formal expression of the demand for consistency.

But this defense presupposes that consistency is always achievable and always the right goal. Three kinds of cases challenge this:

1. **Evolving theories.** Scientific theories under revision often contain internal inconsistencies. A physicist working with both general relativity and quantum mechanics must reason with both, even though they are (currently) inconsistent. If every inconsistency triggered explosion, such reasoning would be impossible.

2. **Contradictory information sources.** Legal systems contain conflicting statutes. Databases contain conflicting records. Intelligence analysis requires drawing conclusions from sources that contradict each other. Practical reasoning routinely operates in inconsistent contexts.

3. **Semantic paradoxes.** The liar paradox ("this sentence is not true") generates a contradiction from seemingly unimpeachable principles. If we accept the T-schema (that "P is true" if and only if P) and allow self-reference, contradiction follows. The dialetheist response is to accept the contradiction rather than restrict the principles.

## The landscape of paraconsistent logics

Paraconsistent logics differ in what they keep and what they discard from classical logic:

- **LP (Logic of Paradox)**, Priest's system, retains [excluded middle](../../../../../../../../../../../content/text/glossary/terms/law-of-excluded-middle.md) and even [bivalence](../../../../../../../../../../../content/text/glossary/terms/bivalence.md) in a modified form (every proposition is true, false, or both). It rejects explosion and disjunctive syllogism (from A ∨ B and ¬A, infer B). LP is the logic of dialetheism.
- **Preservationism** (Schotch and Jennings) keeps classical logic but restricts the inference rules to avoid combining contradictory premises. Contradiction is quarantined rather than tolerated.
- **Relevant logics** (Anderson and Belnap) require that the premises of a valid argument be relevant to the conclusion — that there be a real connection between hypothesis and conclusion. Explosion fails because A ∧ ¬A has no relevance connection to an arbitrary B.
- **Belnap's four-valued logic** adds a "neither true nor false" value alongside "both true and false," producing a lattice of epistemic states suited to reasoning with incomplete and inconsistent information.

## The relationship to other non-classical logics

Paraconsistent and [intuitionistic](../../intuitionistic/index.md) logics are independent departures from classical logic. Intuitionistic logic weakens excluded middle while retaining explosion; paraconsistent logic weakens explosion while (in some systems) retaining excluded middle. They address different perceived failures of classical logic:

| | Retains excluded middle | Retains explosion |
|---|---|---|
| **[Classical](../../classical/index.md)** | Yes | Yes |
| **[Intuitionistic](../../intuitionistic/index.md)** | No | Yes |
| **Paraconsistent (LP)** | Yes | No |
| **Some substructural logics** | No | No |

This table shows that the space of possible logics is structured by independent choice points, not by a single axis from "strong" to "weak." Each non-classical logic rejects a different classical commitment, and combinations are possible.

## Contrast with classical and intuitionistic foundations

For the classical position that paraconsistency contests, see the [Philosophical Foundations of Classical Logic](../../../../../../classical-services-section/content/text/documents/articles/notes/philosophical-foundations.md), especially the section on explosion and consistency. For the intuitionistic alternative, which weakens different principles, see the [Intuitionistic Logic Overview](./overview.md).

Check for understanding: Why is the failure of disjunctive syllogism (from A ∨ B and ¬A, infer B) a consequence of rejecting explosion?
