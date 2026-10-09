---
type: concept
class: witness
depends-on: [agent-skill-recipe, skill-invocation, witness]
see-also: [recipe-normal-form, skill-radius]
status: draft
title: Recipe witness
description: A recipe witness is the audit record produced by an invocation of a skill recipe.
---

# Recipe witness

A recipe witness is the audit record produced by an invocation of a skill recipe.

It is not merely a log line saying that the skill ran.
It records enough of the recipe's four slots to let a later agent inspect whether the invocation stayed inside its declared radius and satisfied its postcondition.

## Minimal witness fields

A recipe witness should identify:

- the invoked skill;
- the actor or agent that invoked it;
- the declared inputs;
- the inspected or edited region;
- the operation performed;
- the output or change produced;
- the verification result;
- the exit status;
- any generated artifact, commit, file path, message, or substrate event.

The fields may be represented as predications, JSON output, markdown prose, commit metadata, or another substrate-native record.
The representation is secondary.
The witness must make the invocation inspectable.

## Failure witnesses

Failure is still a witnessed exit.

A failed recipe invocation should distinguish at least invalid input, no admissible target found, ambiguous target found, insufficient evidence, forbidden or unsafe action, tool or substrate error, and postcondition failure.

These are not exceptional afterthoughts.
They are part of the recipe's interface.
