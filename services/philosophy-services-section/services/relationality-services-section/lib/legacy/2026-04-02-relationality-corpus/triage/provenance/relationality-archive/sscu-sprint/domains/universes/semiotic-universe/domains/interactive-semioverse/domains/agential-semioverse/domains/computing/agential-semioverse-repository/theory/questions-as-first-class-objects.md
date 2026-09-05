---

title: Questions as First-Class Objects
questions:
  - "Should the vault treat questions as first-class objects with independent identity?"
  - "How do questions map to the semioverse hierarchy?"
tags:
  - agential-semioverse
  - pedagogy---

This document specifies how an Agential Semioverse Repository treats questions as first-class objects — entities with their own identity, frontmatter, lifecycle, and linking surface — rather than leaving them embedded as prose within other documents.

## Motivation

The vault has well-developed infrastructure for answers: [terms](../directory-organization/index.md) define things, concepts explain them, lessons teach them, curricula sequence them. It has no infrastructure for the questions that motivate those answers. This means:

- Essential questions that span multiple curricula cannot be tracked or linked to.
- Research questions embedded in specification documents cannot be referenced from elsewhere.
- Self-check questions in lessons are structurally invisible — they cannot be searched, tagged, or cross-linked.
- The relationship between a question and the content that addresses it is implicit (both live in the same document) rather than explicit (a typed relation).
- There is no way to record a question that does not yet have an answer, except as prose in an existing document. The vault cannot represent "I do not know" as a first-class state.

### The Structural Alignment Problem

The vault's decolonial pedagogy content endorses problem-posing education over the banking model. The banking model deposits answers; problem-posing education centers questions. If the vault's architecture has robust infrastructure for deposited answers but none for the questions that motivate them, the architecture structurally reproduces the banking model at the organizational level. This is not a surface-level aesthetic concern — it is a structural alignment problem between the vault's stated pedagogy and its implemented architecture.

The relationality framework itself is driven by questions. The [derivation](../../../../relationality/index.md) states: "Each step of the derivation answers this question for what has been produced so far, and each answer exposes a new question." Questions are the engine of the derivation. Giving questions first-class status makes the vault's architecture more consistent with its central philosophical text.

## Pedagogical Grounding

Four traditions treat questions as structurally important knowledge objects.

**Paulo Freire: Generative Themes.** In *Pedagogy of the Oppressed*, Freire's concept of generative themes — the issues and contradictions that emerge from a community's situation and become the raw material for inquiry — treats the question-shaped problem as the fundamental unit of learning. A generative theme is not an answer; it is a problem that structures an investigation.

**Wiggins and McTighe: Essential Questions.** The *Understanding by Design* framework introduces essential questions — questions that are open-ended, recur across a curriculum, and can be returned to at increasing levels of sophistication. An essential question like "What makes a proof convincing?" is not answered once and discarded. It is revisited throughout a learning path, each return yielding deeper engagement. Essential questions are distinct from unit questions (bounded, resolved within a single lesson) and factual questions (which have definite answers).

**Socratic Method.** The Socratic tradition treats questions as epistemically productive instruments. The question is the primary pedagogical unit: understanding develops through a sequence of questions, not through a sequence of statements. A question is not a gap waiting to be filled — it is a tool that shapes what kind of knowledge can emerge.

**Knowledge Management.** Stack Overflow treats a question as a first-class entity with its own identity, lifecycle (open, answered, closed, duplicate), tags, and relation to answers. The question is not consumed by its answer — it persists as a navigational object. In the Zettelkasten tradition, fleeting notes often begin as questions, but the method does not formalize questions as a distinct note type. The Zettelkasten gap is the gap this vault has: questions dissolve into answers and lose their identity.

## Mapping to the Semioverse Hierarchy

### Interactive Semioverse: Question as Suspended Interaction Term

An [interaction term](../../../../mathematics/objects/universes/interactive-semioverse/terms/interaction-term.md) is an expression built from handles and definable operators, interpreted into the Heyting algebra H. In the current formalism, if an interaction term is ill-formed or its application undefined, it interprets as bottom (the failure value). A question is not a failure — it is a *pending* interaction, one whose closure has not yet been computed.

This suggests a natural extension: alongside the failure value bottom, introduce a *suspension* value that represents an interaction whose closure is deferred rather than failed. The handle fragment generated by a question-as-suspended-interaction would be a partial fragment — containing the semantic seeds of the question's handles but lacking the closure that would constitute an answer.

### Footprint as Answer

The [footprint](../../../../mathematics/objects/universes/interactive-semioverse/terms/footprint.md) is the semantic closure of a handle fragment. If a question is a suspended interaction term, then answering a question is the act of computing its closure — applying the composite closure operator S to produce a stable footprint. An unanswered question is an interaction term with a handle fragment but no footprint. A partially answered question is one whose closure is not yet a fixed point. A fully answered question is one whose footprint has stabilized. This gives a precise formal account of the lifecycle of a question.

### Agential Semioverse: Question as Work Unit with Deferred Output

In the [agential semioverse](../../../../mathematics/objects/universes/agential-semioverse/index.md), a [work unit](./work-units-and-chains.md) is a skill invocation with concrete inputs and a closure (expected outputs). A question can be modeled as a work unit whose output slot is unfilled — the inputs are given (the question's framing, context, and scope), but the closure has not been computed. This maps to the [work-unit lifecycle](./work-unit-lifecycle.md): a question is a work unit in a "pending" state, waiting for an agent to execute it.

## Specification

The vault adopts a hybrid approach to question infrastructure.

### `questions/` Subdirectory

`questions/` is a recognized standard subdirectory in the [directory organization specification](../directory-organization/index.md). It holds persistent questions that structure inquiry within a discipline. Each file records a question, its status, and links to content that motivates or addresses it.

Not every question warrants a file. Self-check exercises within lessons and factual questions with definite answers are better left inline. The `questions/` subdirectory is for questions that merit tracking as independent objects: essential questions, research questions, and unresolved problems.

### `type: question` Content Type

`question` is a valid value for the `type:` frontmatter field, as specified in [semantic frontmatter](../semantic-frontmatter.md). It maps to Schema.org `Question`.

Frontmatter for a question file:

```yaml
title: "What does it mean to understand something?"
introduces: question
status: open
tags:
  - Learning
  - Epistemology
```

The `status` field tracks the question's lifecycle:

- `open` — the question has been recorded but not addressed
- `partially-addressed` — some content engages the question, but it remains open
- `resolved` — the question has been addressed to the point where it no longer drives active inquiry (it may still be revisited)

### `questions` and `addresses` Relation Fields

Two typed relation fields in [semantic frontmatter](../semantic-frontmatter.md) create explicit links between questions and the content that engages them:

- `questions:` — a list of questions this page raises, investigates, or is motivated by. These are inquiry-shaping questions, not rhetorical or self-check.
- `addresses:` — a list of questions this page contributes toward answering. The inverse of `questions`.

These fields allow questions to participate in the vault's semantic graph without requiring every question to exist as a standalone file. A text can declare the questions it raises; another text can declare that it addresses one of those questions. The graph connects them.

## What This Changes

1. The [directory organization specification](../directory-organization/index.md) recognizes `questions/` as a standard subdirectory.
2. The [semantic frontmatter specification](../semantic-frontmatter.md) adds `question` to valid `type` values, and adds `questions` and `addresses` as typed relation fields.
3. Head.tsx maps `type: question` to Schema.org `Question` for JSON-LD.
4. The add-type-tags script assigns `type: question` to files in `questions/` directories.
