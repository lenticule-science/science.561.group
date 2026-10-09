---
type: concept
class: boundary
depends-on: [skill, agent-skill-recipe, runbook]
see-also: [recipe-normal-form, recipe-witness]
status: draft
title: Skill radius
description: Skill radius is the size of the operational neighborhood a skill may touch during one invocation.
---

# Skill radius

Skill radius is the size of the operational neighborhood a skill may touch during one invocation.

A skill with small radius reads a declared input, touches a small declared region, performs one operation, and emits one witness.
A skill with large radius reads many regions, performs several operations, accumulates state, or requires several judgment points.
Large-radius material is usually a runbook, office duty, or governance procedure misfiled as a skill.

## Radius dimensions

Skill radius has four dimensions.

1. **Object radius.** How many files, cells, messages, records, or entities the skill may inspect or edit.
2. **Operation radius.** How many independent verbs the skill performs.
3. **Judgment radius.** How much open-ended interpretation the skill requires.
4. **Temporal radius.** Whether the invocation finishes in one local pass or persists across phases.

A script-runtime skill can have a wide object radius if the operation radius is small, such as scanning many files for one predicate.
An inference-runtime skill can have a high judgment radius if its object and operation radius are tightly bounded.
Radius is not one number; it is the profile of the invocation.

## Radius rule

A skill is admissible when its radius is small enough that the caller can predict what kind of evidence, action, and witness the invocation will produce.

A skill exceeds its radius when a caller cannot tell whether invoking it will produce an answer, a plan, a rewrite, a refactor, a governance decision, or another skill invocation.

## Engineering use

Skill radius is used during enrichment.

- If radius is too small, the skill may be trivial and should be merged into an adjacent skill or script helper.
- If radius is appropriate, add examples, edge cases, script support, and witness behavior.
- If radius is too large, split the skill or promote the surrounding workflow into a runbook.

The purpose is not to make every skill tiny.
The purpose is to make every invocation locally accountable.
