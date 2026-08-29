---
title: "Skill-triggering gap analysis"
date-created: 2026-03-08T00:00:00
authors:
  - emsenn
  - claude
type: text
keywords:
  - AgentialSemioverse
  - PromptRouting
  - ProgressiveAutomation
description: "Analysis of why the agent chronically bypasses the skill system and what recent changes make the problem more resolvable."
---

The agent chronically bypasses the skill architecture, executing
actions ad-hoc rather than through skills. This text analyzes the
structural causes and identifies concrete changes enabled by recent
session work.

## The problem

The prompt-routing specification (theory/prompt-routing.md) defines a
three-phase dispatch: direct naming → trigger matching → fallback.
Phase 2 (trigger matching) says the agent "performs this matching by
semantic similarity." In practice, the agent reads the registry table,
does approximate keyword matching against the user's natural language,
and frequently decides the task is "simple enough to just do" without
a skill.

The interpret-message skill addresses this with step 7 (HARD STOP):
verify skill coverage before executing. But step 7 is expensive — it
requires searching for SKILL.md files and matching each action to a
skill — and the agent routinely skips it when the work feels
straightforward.

## Structural causes

1. **Trigger narrowness**. Registry triggers are exact keyword phrases
   ("write term", "create a plan"). The user's natural language
   ("another source of inspiration I want to mark explicitly") does not
   contain these exact phrases. The agent must bridge the semantic gap,
   and when it doesn't, no skill is matched.

2. **Step 7 cost**. The verification step requires listing all skills,
   comparing each action against all triggers, and reading matched
   SKILL.md files. This is 3-5 tool calls per action. The agent
   economizes by skipping it.

3. **Missing skills for common patterns**. Until this session, there
   were no skills for writing derivation texts, creating term/concept
   files, or integrating cross-domain concepts. The agent did these
   ad-hoc because there was nothing to route to.

4. **No feedback mechanism**. When the agent bypasses a skill, nothing
   records the bypass. The next session has no evidence that the agent
   should have used a skill, so the same pattern repeats.

## What recent changes improve

### Skills that fill the gap (direct)

Three new inference skills created this session cover the most common
ad-hoc patterns:

- **write-derivation-text**: covers the pattern of documenting what a
  source domain contributes to the endeavor. Previously done ad-hoc
  for MUD heritage, Starfleet, and cross-domain derivations.
- **write-term-or-concept**: covers term/concept creation with correct
  layer placement. Previously done ad-hoc with varying quality.
- **integrate-cross-domain-concept**: covers the pattern of abstracting
  a domain concept into endeavor vocabulary.

These directly reduce the cases where "no skill exists" was the reason
for bypass.

### The convergent direction (indirect)

The convergent-direction text documents how inference→determinism,
endeavor specification, and token reduction all converge. This frames
skill usage as project-level priority: every action done ad-hoc is a
missed opportunity to encode a skill, which delays the convergence.
This is motivational, not operational, but it strengthens the agent's
reason to route through skills.

### The validate-plan-status script (proof of concept)

Demonstrates the full pipeline from inference to determinism: plan
validation was previously a manual review, now it's a stage-4
procedural script. This proves the progressive automation policy works
when skills are actually created.

## Concrete changes to make now

### 1. Make step 7 cheaper with MCP tool

The `list_skills` MCP tool accepts a `search` parameter. Instead of
manual searching, step 7 can be: "For each action identified in step 6,
call `list_skills(search=KEYWORD)`. If a matching skill is returned,
use it."

This reduces step 7 from 3-5 tool calls per action to 1 MCP call per
action.

### 2. Add a skill-usage report to interpret-message step 0

Step 0 says "review what skills were used in the previous turn." Make
this concrete: enumerate the actions taken, check each against the
registry, and report which were done through skills and which were
ad-hoc. This creates the feedback mechanism (cause 4).

### 3. Expand high-frequency trigger phrases

Add natural-language variants for the most commonly needed skills. The
current triggers are command-form ("write term"); add query-form
("what is this concept", "define X") and description-form ("I want to
document how X contributes").
