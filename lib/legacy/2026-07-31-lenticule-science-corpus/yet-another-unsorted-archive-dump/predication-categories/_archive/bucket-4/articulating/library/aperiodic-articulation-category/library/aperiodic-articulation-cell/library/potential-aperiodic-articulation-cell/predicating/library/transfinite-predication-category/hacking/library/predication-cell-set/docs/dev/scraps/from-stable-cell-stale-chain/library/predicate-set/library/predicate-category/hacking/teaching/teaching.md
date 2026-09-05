---
name: teaching
gerund: teaching
agent-noun: teacher
imperative: teach
description: Conferring a recorded capability or knowledge on a bearer such that the bearer henceforth bears it as a predication on its record.
---

A teaching transformer takes a named record (a skill record, a piece of memory, a doctrine) and a bearer record (a character, a persona, an officer), and adds the predication on the bearer that names the conferred record. The conferred record is unchanged; the bearer's record gains the cell that asserts it bears the named record henceforth. Where `installing` binds a configuration into a host environment, `teaching` writes the cell on the bearer's record that the host environment (or another reader) later resolves.

## Domain and codomain

- **Domain:** a conferred object (the substrate record of a skill, a memory, a doctrine, etc.) and a bearer record (a character, persona, or other entity whose record can carry the `has-<predicate>` cell that names the conferred object).
- **Codomain:** a witness record naming the bearer, the predicate added, the conferred object, and whether the predication was newly added or already present.

## Preservation conditions

- **Idempotency under unchanged input.** Two successive `teaching` invocations with the same bearer and conferred object leave the bearer's record byte-identical after the first; the second invocation is a no-op write and the witness records that the predication was already present.
- **No mutation of the conferred object.** The conferred object's record is read for validation (existence, conformance) but never altered by teaching.
- **Bearer-record conformance preserved.** If the bearer is governed by a spec (e.g. `agent.md` for characters), the teaching operation refuses if adding the cell would violate that spec.

## Distinction from installing

[`installing`](installing.md) writes host-environment-side files so a host enacts a substrate configuration on next start. `teaching` writes the substrate-side predication that the host (or any other reader) later resolves. A skill is *taught* to a character by adding `has-skill(character, skill)` to the character's record; the character is then *installed* into Claude Code by the `installing` transformer's projection of the character's now-extended skill list into `.claude/`.

## Morphological forms in naming grammar

- `gerund: teaching` heads skills built on this transformer: `teaching-a-skill-to-a-character`, `teaching-a-doctrine-to-a-persona`, etc.
- `agent-noun: teacher` heads agents that invoke such skills: `teacher-of-a-skill-to-a-character`, etc.
- `imperative: teach` heads scripts that body such skills: `teach-a-skill-to-a-character.mjs`, etc.

