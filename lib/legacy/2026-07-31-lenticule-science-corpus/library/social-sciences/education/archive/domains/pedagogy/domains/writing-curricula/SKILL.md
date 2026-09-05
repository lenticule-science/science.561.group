---
name: writing-curricula
description: >-
  Write curriculum lessons and sequences that teach through concrete examples,
  build understanding rather than depositing information, and meet the vault's
  pedagogical and citation standards.
---

# Writing Curricula

## What you will be able to do

- Write a lesson that teaches a single core idea through concrete-before-abstract ordering, with a worked example and self-check exercises.
- Sequence multiple lessons into a curriculum with explicit prerequisites and forward-links.
- Apply the vault's citation standards to educational content: cite the sources each lesson draws on, cite the original treatment of concepts being taught.
- Recognize when a lesson is acting as a reference document (depositing information) rather than a teaching document (building understanding), and restructure it.
- Write in Plain Technical General American English (PTGAE) as specified in the [Style Guide](../../../../../writing/texts/style-guide.md), adapted for a teaching context.

## Prerequisites

- **learn-lesson-design** — backward design, concrete-before-abstract ordering, scaffolding, exercise design
- **learn-decolonial-pedagogy** — the banking model (what to avoid) and problem-posing education (what to aim for)
- Familiarity with the [Style Guide](../../../../../writing/texts/style-guide.md) — the PTGAE rules apply to lessons; this skill extends them for pedagogical contexts

## Reference documents

- [Designing Effective Lessons](../../curricula/designing-effective-lessons.md) — the canonical lesson structure
- [Designing Curricula](../../curricula/designing-curricula.md) — how to sequence lessons into a curriculum
- [Style Guide](../../../../../writing/texts/style-guide.md) — the PTGAE style rules, including the lesson content-type section
- The `write-lesson` agent skill (`.claude/skills/write-lesson/SKILL.md`) — the operational checklist for creating lessons

## Conventions specific to curricula

### Voice in lessons

Lessons use PTGAE with two modifications:
- **Second person is acceptable**: "you" can address the learner directly. This is the one context where the vault's usual third-person default relaxes.
- **Imperatives are acceptable**: "Consider a poset with three elements" is fine in a lesson context.

### Citation in lessons

Lessons cite their sources, but the citations serve the learner, not just the scholar. When citing a source, note what the learner can find there: "For a full treatment, see [@[lattice](../../../../../mathematics/objects/posets/terms/lattice.md)-theory, ch. 3]" is more useful than a bare citation.

### Exercises

Self-check exercises test application, not recall. "Define X" is a bad exercise. "Given Y, determine whether X applies and explain why" is a good one. Include answers in a collapsible details block.

### Prerequisites

State what the learner needs from each prerequisite — not "familiarity with [partial orders](../../../../../mathematics/objects/posets/terms/partial-order.md)" but "the definition of a [partial order](../../../../../mathematics/objects/posets/terms/partial-order.md) and the ability to draw a Hasse diagram."

## Scope

This skill covers writing educational content for this vault. It doesn't cover:
- Subject-specific pedagogy (how to teach mathematics vs. how to teach philosophy — that's the subject discipline's concern)
- Assessment design for institutional contexts (this vault's lessons are self-directed)
- The general style rules (covered by the [Style Guide](../../../../../writing/texts/style-guide.md))

## Verification

You have this skill if you can: (1) take a topic and produce a lesson that opens with a worked example before any formal definition, (2) write exercises that test application rather than recall, (3) cite the sources the lesson draws on in a way that's useful to the learner, and (4) identify where a draft lesson is depositing information rather than building understanding.
