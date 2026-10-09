---
name: making
description: A predicate whose cells record provenance — which entity was brought into existence by which making skill, and with what bilattice-valued outcome.
title: making
---

## Subjects and objects

Subject: the entity produced — the new member of $E$ created by the making process.

Object: the making skill — the skill entity whose execution scaffolded and validated the new entity.

## Cell values

- **true**: the entity was successfully created by this skill.
  It exists in $E$, it passed the skill's lint gate, and the creation was witnessed.
- **false**: the making process was attempted but failed — the entity either could not be scaffolded or failed its lint gate and was not written.
- **mystery**: no making relationship is recorded for this entity — either it predates the making infrastructure or was created outside it.
- **contradiction**: conflicting provenance records — two making processes each claim to have produced the entity.

## Mathematical structure

Making is the provenance predicate on entities.
Per AgOP's agential-self-generation invariant, every operative element of the substrate is itself a substrate entity, which means the creation of entities must itself be substrate-recorded.
Making is that record.

Formally: a making skill $m$ applied to parameters $(\text{name}, \text{description}, \ldots)$ produces a new entity $e$ by: (1) scaffolding the file at the kind-appropriate path, (2) running the lint gate (linting cells for $e$ against the relevant kind rules), and (3) if the lint passes, emitting a witness and setting the making cell $(e, \mathtt{making}, m)$ to true.
If the lint fails, the making cell is set to false and the entity is not persisted.

The making cell is thus the substrate's record of both provenance (which skill produced this entity) and initial conformance (that the entity passed its lint gate at the moment of creation).
It does not guarantee that the entity remains conformant after subsequent edits — that requires linting cells to be updated.

## Role in the substrate

Making cells enable the substrate to answer "how was this entity created?" without inspecting git history or external tooling.
They also provide a basis for auditing to detect entities that were created outside the making infrastructure (mystery cells) and flag them for retrospective validation.
The making transformer is the predication-fibration grounding for a substrate that can account for its own construction.
