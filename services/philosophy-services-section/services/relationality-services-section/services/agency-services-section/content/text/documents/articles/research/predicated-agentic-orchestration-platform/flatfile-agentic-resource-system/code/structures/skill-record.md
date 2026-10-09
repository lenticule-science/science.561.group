---
name: skill-record
description: Skill record
type: definition
class: record
instantiates: [skill, skill-record]
depends-on: [agential-self-generation, fiber, witness]
see-also: [agent-record, runbook-record, office-record, invoke-skill]
title: skill-record
---

# Skill record

The substrate-record holding one *skill* — an invocable procedure that an agent can run at a scope, with declared preconditions, body, postconditions, and witness format.
A `SkillRecord` is FARS's realization of AgOP's [skill-record](../../../objects/skill-record.md) at the bilattice value-domain.
Per [self-representation](../../../../../../../../../../../../../../../../engineering-services-section/content/text/glossary/concepts/self-representation.md), the skill IS the record: a skill that is not representable as a substrate entity is outside the substrate, and the substrate's discipline treats only skills-as-entities.

A `SkillRecord` is what [`invoke-skill`](../transformers/invoke-skill.md) reads at invocation time.
The record's fiber declares what the skill needs to be invoked, what it does, and what witness it produces; the realization's stepping map (per [four-layer-rule-architecture](../../architecture/four-layer-rule-architecture/four-layer-rule-architecture.md)) executes the body against the inputs and produces the witnessed outputs.

## Required fields

Every conforming realization SHALL hold, for each `SkillRecord`:

### Identity & classification

- **`name`** — canonical identifier.
  Used by agents and dispatch to cite the skill.
- **`description`** — human-readable account of what the skill does.
  Used for [`dispatch`](../morphisms/dispatch.md)-by-description matching at F1 formality.
- **`kind`** — the skill's *category* (`query`, `governance`, `mutation`, `analysis`, `learning`, `meta`, `composed`).
  Maps onto the [seven-channel-decomposition](../../architecture/seven-channel-decomposition/seven-channel-decomposition.md): a skill of kind `query` writes to the query channel; a skill of kind `mutation` writes to the mutation channel.
- **`work-type`** — what kind of work this skill performs (`process`, `derivation`, `procedure`, `inquiry`).
  The substrate's work-type taxonomy from the prior-art operations-loop work; informs dispatch matching.
- **`formality`** — declared per the [formality-progression](../../formality-progression/formality-progression.md) scale (F0–F3).
  A skill's body's formality determines which substrate cost-tier it runs at: F3 skills are deterministic tools; F1–F2 skills are LLM-flavored.

### Preconditions and postconditions

- **`preconditions`** — predication pattern that SHALL hold (over the substrate, the agent's fiber, and the input bundle) before invocation is admissible.
  A precondition is a closure-rule-shape pattern: failing to match produces $\top$ on the precondition cell, blocks invocation, and emits a `guard`-channel diagnostic.
- **`postconditions`** — predication pattern that SHALL hold after successful invocation.
  The skill's *guarantee*; the realization checks postconditions against the post-invocation substrate state and produces a witness diagnostic if they fail.
  Postconditions weaker than preconditions (in the truth-order sense) are a substrate-coherence diagnostic — the skill cannot guarantee less than what was admitted.

### Body

- **`body`** — the skill's executable specification.
  May be:
  - **Closure-rule reference** for F3 skills: the skill's body IS a [`ClosureRuleRecord`](closure-rule-record.md) reference; invocation runs the rule via [`settle`](../transformers/settle.md).
  - **Tool reference** for F2 skills: the skill's body IS a deterministic tool the realization runs (a script, a function, a database query).
    The tool's signature SHALL match the skill's input/output specifications.
  - **Runbook reference** for composed skills: the skill's body IS a [`RunbookRecord`](runbook-record.md); invocation runs the runbook via [`execute-runbook`](../transformers/execute-runbook.md).
  - **Prose specification** for F1 skills: the skill's body is narrative the agent reads-and-summarizes via LLM.
    Treated as the highest-cost case per the cost-settlement path.

### Witness format

- **`witness-format`** — declared shape of the witness this skill emits.
  Used by auditors to know what content the witness cites; required for skills whose witnesses participate in cross-substrate federation.
- **`channel`** — the channel the skill emits its primary event on.
  Defaults from `kind` (kind=query → channel=query; kind=mutation → channel=mutation; …).

### Invocation policy

- **`required-capabilities`** — capability predicates an invoking agent SHALL have.
  Read by [`dispatch`](../morphisms/dispatch.md) to filter eligible agents.
- **`scope-bound`** — the substrate region the skill operates within.
  Invocations from agents at non-matching scopes SHALL be rejected.
- **`enables-capabilities`** — capabilities the skill *contributes* when an agent has it.
  An agent with `skill: design-review` has the `enables-capability: review` predicate by virtue of holding the skill.

## Invariants

- **Substrate entity.** A `SkillRecord` SHALL be a substrate entity addressable like any other.
  New skills are added by creating new `SkillRecord` entities; the substrate's *skill registry* IS the set of `SkillRecord` entities, not a privileged compiled list.
- **First-class.** Per AgOP's [skill](../../teaching/explanations/skill.md), skills are first-class: a query for "what skills can be invoked at this scope?" is a [traversal](../../../../../../../../../../../../../../information-science-services-section/services/math-services-section/content/text/glossary/terms/traversal.md) of the substrate's `SkillRecord` entities filtered by scope, NOT a call into a privileged registry.
- **Pre/postcondition-declared.** A skill SHALL declare both.
  A skill without declared preconditions cannot be checked; without declared postconditions, cannot be audited.
  Such skills are non-conformant.
- **Witness-emitting.** Every invocation of the skill SHALL produce a witness per [`invoke-skill`](../transformers/invoke-skill.md); the witness is what makes the invocation replayable.
- **Body-reachable.** The skill's `body` reference SHALL resolve to a substrate-resident object (closure rule, tool, runbook, or specification entity).
  Dangling body references make the skill unrunnable; the substrate flags this as a `guard`-channel diagnostic at next dispatch.

## What a `SkillRecord` is not

- **Not a function pointer.** A function pointer has a calling convention but no preconditions, postconditions, or witness format.
  A `SkillRecord` is a substrate-level *agreement* about what gets called and what guarantees the caller has.
- **Not a tool.** A *tool* is a realization's deterministic operator (a Python function, a shell script, a database query).
  A skill MAY have a tool as its body at F2; the skill is the substrate-level wrapper that adds preconditions, postconditions, witness, and dispatch eligibility.
- **Not a command.** A command is an instance of *invoking a skill from a particular surface* (CLI, MCP, programmatic API).
  The same skill can be invoked from many commands across many surfaces.

## Position

`SkillRecord` is the substrate-level statement of "this skill exists, with this body, at this formality, with these preconditions/postconditions, emitting this witness."
It is what makes [`invoke-skill`](../transformers/invoke-skill.md) coherent: that morphism reads the skill record, checks preconditions, runs the body, checks postconditions, emits the witness.

The record composes with [`AgentRecord`](agent-record.md) (which references skills the agent can invoke), [`OfficeRecord`](office-record.md) (which references the constructor set the office grants), and [`RunbookRecord`](runbook-record.md) (which references skills as steps in a composed procedure).
