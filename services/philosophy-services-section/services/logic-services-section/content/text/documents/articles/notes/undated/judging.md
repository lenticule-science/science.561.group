---
name: judging
gerund: judging
agent-noun: judge
imperative: judge
description: A transformer that takes a question and a body of evidence and emits a verdict — a structured answer to the question grounded in the evidence.
title: judging
---

A judging transformer reads a question (what is being asked) and a body of evidence (what is given), considers the evidence against the question, and emits a verdict. The verdict's shape is dictated by the question — a yes/no decision, a chosen subset, a classification label, a numeric assessment, or a structured answer object.

Judging is distinct from filtering (which returns a subset of an input set against a predicate) and reviewing (which compares a record to later evidence and recommends an action on the record). A judging operation has no fixed output shape and no requirement that the input be a set or a record; the verdict's shape is part of the question.

Judging composes naturally with the dispatch chain when the question requires reasoning that deterministic closure rules cannot settle: a procedure wrapper builds the question, dispatches a derivation or inquiry workitem naming the judgment capability, and parses the verdict the LLM receiver produces.

## Domain and codomain

- **Domain:** a question (the thing being asked, typically a structured prompt) and a body of evidence (text, records, observations).
- **Codomain:** a verdict — a structured answer to the question.

## Morphological forms in naming grammar

- `gerund: judging` heads skills built on this transformer: `judging-skill-mention-in-a-paragraph`, `judging-skill-amendment-from-a-diary-entry`.
- `agent-noun: judge` heads agents that invoke such skills: `judge-of-skill-mentions`.
- `imperative: judge` heads scripts that body such skills (when the skill carries one): `judge-skill-mention.mjs`.

## Capability-only skills

A judging skill MAY be capability-only — a record with `SKILL.md` + `_index.md` declaring `closure-position: derivation` or `inquiry` and no `scripts/`. Such a skill exists only as a capability description that inference-model receivers advertise via their `skills:` lists. The dispatch chain routes workitems naming the capability to the model receiver; no local script body is needed.
