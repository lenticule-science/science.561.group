---
type: question
status: open
see-also:
  - teaching/explanations/retrieval-augmented-generation.md
  - ../theorems/retrieval-failure-modes.md
  - ../theorems/context-window-limits.md
title: How should long-term memory be evaluated?
description: What does it mean to evaluate the long-term memory of an LLM agent?
---

# How should long-term memory be evaluated?

## The question

What does it mean to evaluate the *long-term memory* of an
LLM agent? Existing benchmarks measure adjacent things:

- **Knowledge benchmarks** (TriviaQA, NaturalQuestions)
  measure parametric factual recall — closer to semantic
  memory in weights.
- **Long-context benchmarks** (needle-in-haystack,
  RULER, Long-Bench) measure within-context recall — closer
  to working memory.
- **RAG benchmarks** measure retrieval quality and
  groundedness given a fixed external corpus — closer to
  externalized semantic memory.

None of these directly evaluate what most users mean by
"memory" in an agent: *does it remember our previous
conversations*? *does it learn from cumulative experience*?
*does it recall specific past events when relevant*?

## Why this is hard

Long-term memory is intrinsically *temporal*: an evaluation
must span across sessions, across tasks, across time. This
clashes with standard benchmark design:

- **Single-shot.** A standard benchmark asks one question,
  scores one answer. Long-term memory needs multi-session
  evaluation.
- **Reproducible.** Standard benchmarks need to be runnable
  many times for comparison. Long-term memory evaluation
  produces different results depending on prior session
  history — by design.
- **Composable.** Standard benchmarks evaluate one capability
  in isolation. Long-term memory entangles encoding,
  retrieval, integration, and forgetting.
- **Workload-shaped.** What "memory" should look like depends
  on the deployment workload (customer support, personal
  assistant, research collaborator). One benchmark cannot
  serve all.

## Candidate evaluation patterns

- **Long-conversation benchmarks.** Multi-turn dialogues
  testing whether the agent recalls earlier-stated user
  preferences, facts, or commitments.
- **Across-session benchmarks.** Two-session evaluations
  where session 2 references session 1's events, with the
  agent's memory architecture managing the persistence.
- **Temporal-knowledge benchmarks.** Evaluations testing
  whether the agent's knowledge stays current across model
  releases or fine-tuning checkpoints.
- **Memory-stress benchmarks.** Capacity tests asking the
  agent to manage many simultaneous facts across long
  contexts.
- **Forgetting benchmarks.** Tests for whether the agent
  *can* forget on request (privacy, content moderation).

Each captures part of "long-term memory"; none is
comprehensive.

## Why this matters

Without an evaluation protocol, memory architecture decisions
are made by intuition and limited side-by-side comparison.
Production deployments report user-perceived memory as
strongly variable across systems, but quantitative comparison
is hard. The field cannot easily say "system X has better
memory than system Y" except in narrow benchmark conditions.

Evaluation infrastructure for long-term memory is a
recognized gap. Several research directions are underway
(LongMemEval, ConversationalQA-LongTerm, MemoryGPT
benchmarks); none has become dominant.

## Status

Open. Evaluation infrastructure is the binding constraint on
progress in long-term-memory architectures. Without good
evaluation, claims about memory architectures cannot be
validated rigorously.
