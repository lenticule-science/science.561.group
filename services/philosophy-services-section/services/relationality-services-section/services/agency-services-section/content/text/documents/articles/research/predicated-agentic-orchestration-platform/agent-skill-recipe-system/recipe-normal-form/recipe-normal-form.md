---
type: concept
class: normal-form
status: draft
depends-on: [agent-skill-recipe, skill, skill-invocation]
see-also: [skill-radius, recipe-witness]
title: Recipe-normal form
description: Recipe-normal form is the authoring discipline that makes a skill body reducible to a short, inspectable operation.
---

# Recipe-normal form

Recipe-normal form is the authoring discipline that makes a skill body reducible to a short, inspectable operation.

A skill is in recipe-normal form when its body can be read as one to four ordered steps that transform declared inputs into declared outputs within a declared local jurisdiction.

## Conditions

A skill body is in recipe-normal form when all of the following hold.

1. **Single primary verb.** The skill primarily does one thing: check, find, draft, transform, validate, summarize, invoke, or write.
2. **Declared input boundary.** The skill says what it consumes and what region it may inspect.
3. **Declared output boundary.** The skill says what it produces or changes.
4. **Local failure modes.** The skill names the edge cases that can be resolved inside the invocation.
5. **Witnessable exit.** The skill produces or names an exit record sufficient to audit what happened.

The normal form does not require the body to be deterministic.
It requires the invocation to be bounded.

## Non-normal forms

A skill body is not in recipe-normal form when it contains any of the following as ordinary behavior.

- Multiple independent goals.
- Long-lived state across several phases.
- Branching that selects among different named operations.
- Repeated pauses for captain judgment.
- Hidden dependencies on unlisted files, tools, agents, or norms.
- A body that says only how the agent should sound, rather than what operation should be performed.

These are not defects in themselves.
They indicate that the material belongs in a runbook, agent office, persona, governance rule, or theory note rather than inside one skill.

## Compression test

A recipe-normal skill should survive this compression:

> Given input X, within jurisdiction J, perform operation V to produce output Y, verify condition Z, and witness event W.

If the skill cannot be compressed this way, it is not yet an invocable operation.
It may still be useful prose, but it is not yet a skill recipe.
