---
type: concept
class: skill
depends-on: [skill, skill-invocation, witness, runbook]
see-also: [recipe-normal-form, skill-radius, runbook]
status: draft
title: Agent skill recipe
description: An agent skill recipe is the body-form of a skill when the skill is written for repeated agential invocation rather than one-off human reading.
---

# Agent skill recipe

An agent skill recipe is the body-form of a skill when the skill is written for repeated agential invocation rather than one-off human reading.

A skill already exists as an invocable substrate entity: it has preconditions, body, postconditions, and witness behavior.
The recipe is the shape of the body when that body is made operationally small enough for dispatch.
It says how a calling agent turns declared inputs into declared outputs under the skill's jurisdiction.

## Canonical slots

A recipe has four canonical slots.

1. **Orient.** Establish the local context: read declared inputs, inspect the minimum declared region, and identify the exact object or relation being acted on.
2. **Act.** Perform the single operation that the skill exists to perform: search, validate, transform, draft, write, invoke, compare, or decide.
3. **Verify.** Check that the operation produced the declared output and that local edge cases have been handled: no result, ambiguous result, invalid input, insufficient evidence, or forbidden write.
4. **Witness.** Emit or name the audit record: actor, skill, input, output, touched region, exit status, and any generated artifact or substrate event.

The slots are not necessarily four prose headings in every `SKILL.md`.
A script-runtime skill may realize all four slots inside an executable script.
An inference-runtime skill may realize `Act` as model judgment.
What matters is that the invocation can be audited against the four functions.

## Difference from a prompt

A prompt asks an agent to behave in a certain way.
A recipe specifies a bounded operation.
It gives enough procedural structure that the operation can be invoked, checked, revised, and eventually promoted into a more deterministic form.

The distinction matters because the repository treats skills as substrate content, not as private prompt fragments.
A recipe is therefore not just instructional prose.
It is the inspectable body of a skill entity.

## Difference from a runbook

A recipe is one bounded operation.
A runbook is a composition of bounded operations with inter-step state.

A recipe can call another skill only when that call is subordinate to the primary operation.
If the called skill is a named phase, introduces branching, or produces state consumed by later independent phases, the material belongs in a runbook.

## Authoring implication

When improving a skill, first ask whether its body can be restated as a recipe.
If it cannot, do not enrich it by adding more prose.
Narrow it, split it, or promote the workflow into a runbook.
