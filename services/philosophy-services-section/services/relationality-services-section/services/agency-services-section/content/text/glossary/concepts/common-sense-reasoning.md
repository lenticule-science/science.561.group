---
type: concept
class: foundational
status: active
depends-on:
  - reasoning.md
see-also:
  - ../theorems/common-sense-difficulty.md
references:
  - references/mccarthy-commonsense1959.md
title: Common-sense reasoning
description: "Common-sense reasoning is everyday inference about the world: things falling when dropped, water being wet, people having intentions, time flowing forward."
---

# Common-sense reasoning

**Common-sense reasoning** is everyday inference
about the world: things falling when dropped, water
being wet, people having intentions, time flowing
forward. The vast body of mostly-tacit knowledge
that humans acquire effortlessly and apply
constantly.

A long-standing AI challenge: easy for humans, very
hard for symbolic systems.

## What's distinctive

Common-sense knowledge:

- **Vast.** Millions of facts about everyday
  situations.
- **Tacit.** Mostly unstated; acquired through
  experience.
- **Heterogeneous.** Spans physics, psychology,
  social rules, language conventions.
- **Defeasible.** Most rules have exceptions.
- **Context-sensitive.** What "counts" depends on
  context.

These properties make formalization hard.

## McCarthy's program

John McCarthy's 1959 paper "Programs with Common
Sense" set the agenda: AI systems should have a
*formalized common sense* that allows them to reason
about everyday situations.

Six decades of work followed:

- **Cyc** (Lenat 1984+). Massive hand-coded
  common-sense KB.
- **Open Mind Common Sense** (1999+). Crowdsourced.
- **ConceptNet.** Crowdsourced semantic network.
- **ATOMIC.** If-then common-sense reasoning.

These collectively contain millions of facts. None
fully solves the problem.

## Why it's hard

Per [common-sense-difficulty](../../documents/articles/research/2026/07/31/lenticule-import/animating/content/becoming/doing/working/governing/knowing/content/reasoning/_archive/from-language-models-reasoning/theorems/common-sense-difficulty.md):

- **Coverage requirements vast.** Every situation
  brings new common-sense knowledge.
- **Defeasibility.** Rules with exceptions need
  non-monotonic logic; computationally awkward.
- **Tacit acquisition.** Hand-coding can't keep up
  with what humans know tacitly.
- **Frame problem** (McCarthy-Hayes 1969).
  Specifying what *doesn't* change after an action
  is intractable.
- **Contextual inference.** Deciding what
  common-sense knowledge applies in a context is
  itself hard.

These have stymied symbolic approaches for decades.

## Famous failures

Symbolic common-sense reasoning has notable
failures:

- **Cyc.** After 30+ years and immense investment,
  hasn't delivered on promise.
- **Frame problem.** Not solved; worked around.
- **Story understanding.** Long an AI goal; symbolic
  approaches limited.
- **Robust dialogue.** Required deep common-sense
  reasoning; pre-LLM systems brittle.

## The LLM turn

LLMs trained on web-scale text encode substantial
common-sense knowledge implicitly:

- Strong performance on common-sense benchmarks
  (HellaSwag, COPA, Winograd, SocialIQA).
- Can answer common-sense questions in natural
  language.
- Handles defeasibility and context-sensitivity
  reasonably (not perfectly).

This is one of LLMs' most striking accomplishments —
a problem that resisted decades of symbolic effort
yields partially to scale + statistical learning.

## Limitations of LLM common sense

- **Inconsistency.** Different prompts may yield
  contradictory answers.
- **Hallucination.** Plausible-sounding but
  wrong common-sense claims.
- **Cultural bias.** Reflects training-data
  cultures; non-Western, non-English common sense
  underrepresented.
- **Edge cases.** Performance drops on adversarial
  or unusual common-sense queries.
- **No verification.** Unlike a KB, can't audit.

## Benchmarks

Standard common-sense reasoning benchmarks:

- **CommonsenseQA.** Multiple-choice common-sense
  questions.
- **HellaSwag.** Sentence completion requiring
  common sense.
- **COPA / SocialIQA.** Social common sense.
- **Winograd schemas.** Pronoun resolution requiring
  common sense.
- **PIQA.** Physical common sense.

LLMs have made dramatic progress; humans still
outperform on hardest items.

## In contemporary AI

- **LLMs as common-sense engines.** Standard
  application.
- **Hybrid systems.** Use LLMs for common sense
  alongside symbolic components for verification.
- **Cultural-bias mitigation.** Active research on
  multilingual / multicultural common sense.
- **Reasoning models** improve common-sense
  benchmark performance further.

## Limits

- **Coverage still incomplete.** Long tail.
- **Verifiability low.** Can't check LLM common
  sense as we'd check a KB.
- **Robustness uneven.** Adversarial common-sense
  prompts break models.

## Status

Long-standing AI challenge made tractable (not
solved) by LLMs. The shift is one of AI's most
notable recent achievements. Active work on
reliability, robustness, and cultural breadth.
