---
name: friction-log
description: "A friction log is a narrative record of an in-the-flow obstacle: a moment during work where the actor had to work around a missing tool, missing theory, missing convention, or broken affordance to keep going."
type: concept
class: development-discipline
status: draft
depends-on: [observation-record, agential-self-generation]
see-also: [questions, ../objects/observation-record]
title: friction-log
---

# Friction log

A *friction log* is a narrative record of an in-the-flow obstacle: a moment during work where the actor had to work around a missing tool, missing theory, missing convention, or broken affordance to keep going.
Friction logs are *stories*, not bug reports.
The arc of a friction-log entry is:

1. *Tried* — the actor was attempting to do X.
2. *Had to* — instead of the natural / harnessed path, the actor did Y as a workaround.
3. *Violates* — Y violates standard / convention / theory commitment Z.
4. *Gap* — the substrate or its tooling has gap W; closing W would let the natural path proceed.

The genre originates in Google's *friction log* dogfooding practice: a developer using their own product writes the running narrative of every bump, however small, in the order encountered.
The value is the *journey* — what an unhardened user actually does — not just the eventual fix.

In FARS, friction logs are first-class because of two structural commitments:

- **Self-representation.** Per [agential-self-generation](../../agent/agential-self-generation/agential-self-generation.md), every operative element of the platform is a substrate entity.
  The actions an agent *takes* are first-class; so are the actions an agent *had to take instead of what it would have*.
  A friction log records the latter.
- **Substrate-as-self-correcting.** Per the platform's research-active discipline, the substrate's tooling is itself substrate content (skills, runbooks, harnesses, validators are all entities).
  When the tooling is incomplete, the workaround leaves a record.
  The friction log is that record's story-form.

## When to write one

A friction-log entry is warranted whenever an actor — human or agent — does substrate work that, in a more complete substrate, would have been done by a tool, by a verb, by a theorem, or by a convention that *should* have existed but didn't.
Triggers include:

- Hand-editing a substrate record where a `fars new`-style verb would have created the right shape.
- Hand-computing a path, slug, or graph traversal that a verb should have produced.
- Discovering a tool that fails on input the substrate's discipline says should be valid.
- Drafting a record that has no obviously-correct directory because the convention hasn't been declared.
- Working around a missing theory section by inventing local language.

A friction log is *not*:

- *A bug report.* Bug reports describe a single failing behavior.
  Friction logs describe a journey including the workaround.
  Bug reports are filed to a tracker; friction logs are committed to the substrate.
- *An [open question](questions/).* Questions ask a theoretical thing-not-yet-resolved.
  Friction logs report an operational thing-already-worked-around.
- *An audit finding.* Audits are review-after-the-fact, scoped, formal.
  Friction logs are during-the-fact, conversational, often a paragraph.

## Where they live

Friction logs are filed under `<theory-or-package>/dev/logs/friction/`, with filenames `YYYY-MM-DD-<slug>.md`.
The `dev/` subtree is the development-record material for a theory (or its implementation package), distinct from the theory's `concepts/objects/morphisms/theorems/...
` proper.
The `logs/` subtree under `dev/` admits other dated-stream material; `friction/` is the friction-log stream specifically.

The directory pattern is intended to be a *corpus-wide convention*: any theory or package may have `dev/logs/friction/`.
The convention is being seeded here in FARS; it should be backfilled into the corpus's theory-directory-convention spec when that spec is next revised.

## Frontmatter

A friction-log entry's frontmatter is light:

```yaml
---
type: friction-log
class: <subject-area>     # e.g., validator, harness, substrate-edit
date: YYYY-MM-DD
status: open | acknowledged | closed-by-<slug>
see-also: [...]            # other friction-logs, questions, theory entries the gap relates to
---
```

`status: closed-by-<slug>` records that the gap was closed by some specific substrate change (a new verb, a theorem, a convention) — making the friction-log archive a feedback signal for substrate development priorities.

## Discipline

Friction logs SHOULD be written *in the flow*, not curated after the fact.
A friction log written hours later loses the texture that makes it useful.
The friction-log directory is a stream, not a curated reference.

Friction logs SHOULD be written even when the actor cannot resolve the gap.
The point of the genre is to capture the gap's existence; resolution comes later, in tooling work that consumes the friction-log stream as priorities.

Friction logs SHOULD be brief.
A paragraph or two is the target.
Multi-page accounts are essays, not friction logs.
