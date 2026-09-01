---
title: "Two-sided prompt design"
date-created: 2026-03-07T00:00:00
authors:
  - emsenn
  - claude
type: text
keywords:
  - Emsemioverse
  - AgentialSemioverse
  - Methodology
description: "Effective agent interaction requires training both sides: the agent's interpretation and the user's prompting."
---

The emsemioverse has invested in training the agent to interpret
prompts — the
[encoding loop](the-encoding-loop.md),
[prompt routing](../../technology/specifications/agential-semioverse-repository/theory/prompt-routing.md),
the [interpret-message](../../technology/specifications/agential-semioverse-repository/skills/interpret-message/SKILL.md)
skill, and the signal classification taxonomy. But the interaction
is two-sided: the user's ability to prompt effectively is as
important as the agent's ability to interpret.

## The asymmetry

The current architecture optimizes the receiver but not the sender.
The agent has a dispatch algorithm, trigger phrases, and fallback
logic. The user has nothing — no guide to what makes a good prompt
for this system, no feedback on whether their prompt was efficiently
interpreted, no way to learn the system's vocabulary for their own
benefit.

This asymmetry means emsenn must learn the system's affordances
through trial and error, which is slow and produces the corrections
that the agent then encodes. A prompting guide would let emsenn
learn the system's patterns deliberately, reducing the correction
cycle.

## What a prompting guide would cover

1. **Signal classification markers** — how to make it obvious
   whether a message is a command, correction, meta-commentary, or
   question, so the agent classifies correctly on first pass.
2. **Skill trigger vocabulary** — the phrases that reliably trigger
   specific skills, so emsenn can invoke skills without needing to
   know the `/slash-command` names.
3. **Session initialization patterns** — how to write a first
   message that sets context efficiently: what to include, what to
   omit, how to structure goals.
4. **Scope signals** — how to indicate the size of a task (quick
   fix vs. session-long project vs. multi-session arc) so the agent
   allocates attention appropriately.
5. **Correction patterns** — how to correct the agent in ways that
   produce persistent fixes rather than session-local adjustments.

## Relationship to the encoding loop

The prompting guide is itself an encoding: it takes tacit knowledge
about how to interact with the system and makes it explicit. This
is the encoding loop applied to the interaction protocol itself —
the meta-level of the system.

## Source

emsenn identified this gap on 2026-03-07: "we have not done much to
train me in how to prompt you to facilitate our goals."
