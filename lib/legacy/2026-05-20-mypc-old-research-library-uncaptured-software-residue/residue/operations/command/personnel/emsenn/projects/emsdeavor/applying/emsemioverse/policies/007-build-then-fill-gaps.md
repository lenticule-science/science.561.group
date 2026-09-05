---
title: "Policy 007: Build, then fill gaps"
date-created: 2026-03-07T00:00:00
type: policy
number: 7
keywords:
  - Policies
  - Methodology
  - Pragmatism
description: "Do real work first. When gaps block the work, fill them — then resume. Document neutrally."
---

Do real work first. When gaps block the work, fill them — then resume.
Document neutrally.

## What this means

The emsemioverse develops its infrastructure by using it. We do not
build complete systems before applying them. We attempt the work, and
when we discover that a term is undefined, a method is unencoded, a
directory is missing, or a planning structure does not exist — we pause,
fill that gap, and resume the original work.

This is the pragmatic complement to policy 003 (ground in discipline
practice). Policy 003 says: draw on established methods. This
policy says: discover which methods you need by trying to do
something and noticing what is missing.

The gaps discovered this way are genuine needs, not speculative
infrastructure. A term file created because a text needed to reference
it is more grounded than a term file created because it seemed like a
good idea. A planning structure created because we needed to plan
something is more grounded than one created from abstract principles.

## Document neutrally

When filling a gap, write about the subject itself — not about the
context that revealed the gap. A term file for "methodology" should
define methodology as a concept, not explain that we needed the term
while writing a policy. A planning spec should describe how planning
works, not narrate the session that prompted it.

The git history records when and why something was created. The content
records what it is. These are separate concerns.

This neutrality makes the content composable. A neutrally written term
can be linked from any context. A term written as "we needed this
because..." is anchored to one context and resists reuse.

## Operational implications

- When a task reveals a gap (missing term, missing method, missing
  directory, missing planning structure), pause the task.
- Fill the gap: create the term, encode the method, make the directory,
  write the spec.
- Write the gap-filling content about its subject, not about the task
  that revealed it.
- Resume the original task.
- If filling the gap is itself complex enough to need planning, create
  a plan (in the plans/ directory) for it and return to the original
  task.
- The working-notes.md file is the place to record that a gap was
  discovered and how it was resolved. The content itself does not carry
  this narrative.
