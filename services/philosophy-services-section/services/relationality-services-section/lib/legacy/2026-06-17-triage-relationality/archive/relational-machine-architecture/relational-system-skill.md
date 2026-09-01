---
specialization:
  - relational-entity
  - reasoning-unit
  - morphism
occupies: nuclear-quartet-position
named-as: entity
abstract-counterpart-of: fars-skill
grounded-in: nuclear-quartet-subalgebra
date-created: 2026-03-18
date-modified: 2026-03-18
---

# Relational System Skill

## What this is

A **RelationalSystemSkill** is a named reasoning unit in [R](relations-system.md).
It is a morphism in R that occupies exactly one position in the nuclear quartet: [Process](process.md), [Procedure](procedure.md), [Derivation](derivation.md), or [Inquiry](inquiry.md).
Its position is declared by [closure-kind](flatfile-agential-resource-system-closure-kind.md).

A RelationalSystemSkill is itself a [RelationalEntity](relational-entity.md): it has `id` and `description` and is in R.
This is what it means for reasoning to be structured — the reasoning unit is not ephemeral, it is a named object the system can reference, shape, and compose.

A RelationalSystemSkill encapsulates one step of judgment.
Sequencing, I/O, looping, and orchestration belong in a [Runbook](runbook.md), not in a skill.
The boundary between skill and runbook is the boundary between one judgment and the structure that sequences judgments.

## Position in the nuclear quartet

The four positions correspond to the four closure kinds in the nuclear quartet:

| Position | ClosureKind | What the skill does |
|---|---|---|
| Process | process | Executes a named transformation on entities |
| Procedure | procedure | Follows prescribed steps to produce an output |
| Derivation | derivation | Derives a value from existing entities by rule |
| Inquiry | inquiry | Investigates a question and reports findings |

A skill MUST occupy exactly one position.
A skill that crosses positions is two skills.

## Scope

A RelationalSystemSkill is always scoped.
It operates on entities of a specific kind, declared by its `domain:` and `codomain:` fields.
There is no scope-independent skill.
The scope determines which entities are valid inputs and which entities are valid outputs.

A RelationalSystemSkill MUST be itself an entity in R: it has `id` and `description` and is referenceable from frontmatter.
A RelationalSystemSkill MUST take RelationalEntities as inputs and produce RelationalEntities as outputs.
A RelationalSystemSkill MUST occupy exactly one nuclear quartet position.

## Relationship to Runbooks

A Runbook sequences skills.
A Skill does not sequence itself — it does not know what comes before or after.
The same skill can appear in multiple runbooks without duplication.
This decouples judgment (Skill) from orchestration (Runbook).

## Open questions

- Whether the nuclear quartet position is a property of the skill's type (its morphism class in the categorical structure) or a property of its runtime behavior. The current model treats it as a declared property.
- The formal type system for skill inputs and outputs — what it means for two skills to compose cleanly — is not yet specified. Blocked by skill-object-types spec.
