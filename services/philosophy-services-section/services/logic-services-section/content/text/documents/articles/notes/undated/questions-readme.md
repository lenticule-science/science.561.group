---
title: questions/
description: Open mathematical questions, conjectures with no current attempt, and program-shaping questions about what to construct next.
---
# questions/

Open mathematical questions, conjectures with no current attempt, and program-shaping questions about what to construct next.

A question lives here when it is a genuine open. A claim that is precisely stated and believed-true but unproven goes in `theorems/` with `status: stated`, not here.

## Frontmatter

```yaml
---
kind: question
status: open | partial | abandoned
explores: [...]                  # objects/concepts the question is posed in terms of
---
```

`explores:` declares the entities the question is inquiring into. It's the question-specific analogue of `depends-on:` — questions don't load-bear on the rest of the corpus (nothing depends on a question), so they declare their relation outward via inquiry, not load-bearing dependency. The validator treats `explores:` as an outgoing graph edge for orphan and reference checks.

`status: partial` means the question has been refined or some sub-case is settled, but the main question remains open. When a question is fully answered the question note is *deleted* — the resolving theorem is the live record. When a question is abandoned (no longer worth pursuing), it is also deleted, optionally with a brief note in the abandoning commit.

## Two flavors of question

Both belong here; they differ in body shape.

**Mathematical questions.** "Does the closure 2-monad on $\mathbf{T}(\mathcal{C}, \lambda)$ satisfy Beck–Chevalley?" Statement, what is known, what would settle it.

**Program-shaping questions.** "What is the right notion of *deformation* for an predication-hyperdoctrine?" Statement, why it matters for the program, what kind of construction would count as an answer. These are the questions that determine which objects we build next; they should be plentiful.

## When questions become other things

When a program-shaping question has been answered well enough to start construction, the resulting object goes to `objects/` and the question note is deleted. When a mathematical question is settled, the proof goes to `theorems/` and the question note is deleted. The resolving artifact is the live record; a redirect-only question note creates confusion.
