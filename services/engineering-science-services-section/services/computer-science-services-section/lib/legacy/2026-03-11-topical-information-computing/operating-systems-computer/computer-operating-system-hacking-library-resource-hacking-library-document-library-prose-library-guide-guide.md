---
name: guide
description: A prose refinement for the Diátaxis task mode. Sentence positings address procedural cells — what to do to accomplish a specific task — and admit second-person imperatives. Distinct from a tutorial in that the reader is assumed to know what they are trying to do.
derives-from:
  - prose.md
---

A guide is a [`prose`](prose.md) body whose addressing surface is the procedure for accomplishing a named task.
The mode commits the prose to the reader's question *I know what I want to do; how do I do it*; admissible positings answer that question with the procedural sequence.

## Admissible cells

The cells a guide addresses are predicates of the form *to-accomplish-X-do-Y*, *required-input*, *expected-output*, *precondition*, *postcondition*, *failure-mode-and-recovery*.
The subject is the named task; the object is the step or condition.

## Admissible voice

A guide admits second-person imperatives: *run this command*, *edit this file*, *verify the output matches*.
Imperatives are the natural form of procedural positings; restricting to declaratives only would force awkward circumlocutions without changing the cell content.

## Inadmissible cells

A guide must not posit on:

- Conceptual *why* cells (those belong in an [`explanation`](explanation.md)).
  A guide may reference an explanation by link but does not include the explanation's content.
- First-encounter signposting (that belongs in a [`tutorial`](tutorial.md)).
  A guide assumes the reader has done the relevant tutorial or otherwise has the prerequisite knowledge.
- Open-ended lookup tables (those belong in a [`reference`](reference.md)).

## Position

The Diátaxis task mode.
The location for content that lets a reader who knows their goal accomplish it without re-deriving why the procedure works.
Distinguished from a tutorial by the reader's assumed competence: a tutorial leads a learner; a guide serves a practitioner.
