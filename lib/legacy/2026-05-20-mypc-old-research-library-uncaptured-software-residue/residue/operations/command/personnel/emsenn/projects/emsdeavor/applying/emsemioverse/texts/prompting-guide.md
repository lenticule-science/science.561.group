---
title: "Prompting guide"
date-created: 2026-03-07T00:00:00
authors:
  - claude
  - emsenn
type: text
keywords:
  - Emsemioverse
  - AgentialSemioverse
  - Methodology
description: "How to prompt the emsemioverse agent effectively — patterns that reduce corrections, maximize encoding, and conserve agent context."
---

This guide describes prompting patterns that work well with the
emsemioverse's skill architecture. The system interprets prompts
through
[signal classification](../../technology/specifications/agential-semioverse-repository/theory/prompt-routing.md)
(command, correction, meta, question) and routes them to
[skills](../../../.claude/skills/registry.md). These patterns help
the classification and routing work on the first pass.

## Session-opening messages

The first message sets the session's scope. The agent uses
[interpret-first-message](../../technology/specifications/agential-semioverse-repository/skills/interpret-first-message/SKILL.md)
to parse it.

**What to include:**

- **Session goals** — what should be accomplished. Be concrete: "we
  should have an interpret-first-message skill by the end of this
  session" is better than "let's work on improving skills."
- **Priority signals** — what matters most if time runs short.
- **Continuity** — what has changed since the last session, what you
  have been thinking about, what you noticed in the repo.
- **Meta-guidance** — how the agent should approach the work. "Focus
  on creative thought, not boilerplate" tells the agent to optimize
  for context economy.

**What to omit:**

- Detailed technical specs the agent can read from the repo. Say
  "check the prompt-routing spec" rather than restating its contents.
- Exhaustive background. The agent reads working notes and TODO; you
  don't need to recapitulate them.

**Structure:**

A good first message has this shape:

1. Any mechanical setup ("pull latest, update submodule")
2. The session's overarching goal (1-2 sentences)
3. Specific deliverables or focus areas (a short list)
4. Meta-guidance if any

## Commands

Commands invoke skills. Three ways to give one:

1. **Slash command**: `/assess-page philosophy/concepts/care.md` —
   unambiguous, fastest.
2. **Trigger phrase**: "assess the care page" — relies on the
   registry's trigger matching. Works when the trigger vocabulary
   is known.
3. **Natural language**: "take a look at the care page and tell me
   what would improve it" — requires the agent to classify and
   match. Slower, but fine when the exact skill isn't known.

For operations you do often, learning the slash command or trigger
phrase saves agent context because classification is instant.

## Corrections

Corrections fix agent behavior persistently. The agent encodes them
in CLAUDE.md, a policy, a skill, or an ASR spec.

**Effective corrections:**

- "Stop doing X" — clear, unambiguous.
- "X should be Y" — states the desired behavior.
- "I keep saying X but you keep doing Y" — signals a pattern, not a
  one-off.

**Less effective:**

- "That's not quite right" — the agent doesn't know what to fix.
- Subtle hints embedded in other instructions — the agent may miss
  them.

The more specific the correction, the more precisely the agent can
encode it. "Don't use wikilinks" is more encodable than "the linking
looks wrong."

## Meta-commentary

Meta-commentary changes how the system works, not what it produces.

**Examples:**

- "I think we should have a skill for X" — the agent creates the
  skill.
- "The problem is that you spend too much context on Y" — the agent
  modifies its approach to Y.
- "This isn't working because Z" — the agent diagnoses and fixes Z
  in the infrastructure.

Meta-commentary is the most powerful prompt type because it improves
the system itself. Every piece of meta-commentary should result in a
persistent artifact (policy, spec, skill, or CLAUDE.md update).

## Compound prompts

Multiple operations in one message work when joined by sequencing
words:

> "Split X into separate files, then write curricula, then create a
> learning skill"

The agent decomposes this into a skill chain. Put the operations in
dependency order — later operations may use earlier outputs.

## Scope signals

Help the agent allocate effort correctly:

- **Quick fix**: "just rename X to Y" — signals minimal effort.
- **Session task**: "let's work on X this session" — signals
  sustained focus.
- **Multi-session arc**: "over the next few sessions, I want to..." —
  signals the agent should create a plan and not try to finish
  everything now.

Without a scope signal, the agent defaults to treating the prompt as
a session task.

## Embedding ideas

Any substantive claim in a prompt gets encoded as content through the
[encoding loop](the-encoding-loop.md). If you want an idea captured
in the repository, say it in a prompt. The agent will write a text,
refine terms, and note research questions.

If you want an idea discussed but NOT encoded (yet), say so
explicitly: "I'm thinking out loud about X, don't encode this yet."
Otherwise the default is to encode.

## What the agent reads at session start

Understanding what the agent already knows helps you avoid restating
it:

1. **CLAUDE.md** — always loaded, contains all operational rules.
2. **Working notes** — always read, points to active work.
3. **TODO.md** — always read, lists all work items and plans.
4. **Skills registry** — always available, maps triggers to skills.
5. **Policies** — loaded by Claude Code from `.claude/rules/policies/`.

You don't need to remind the agent of anything in these files. You DO
need to tell it about things that have changed since the last session
that aren't reflected in the repo (thoughts you had, things you
noticed, priorities that shifted).
