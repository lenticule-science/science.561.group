---
type: question
class: structural
status: open
explores:
  - skill
  - skill-record
  - SKILL.md
  - realizes
see-also:
  - ../specifications/skill-colocation.md
  - ../../../../../../../../../engineering/theories/tech/theories/computing/theories/predicated-computing/theories/agential-orchestration-platform/concepts/skill.md
  - ../../../../../../../../../engineering/theories/tech/theories/computing/theories/predicated-computing/theories/agential-orchestration-platform/theories/flatfile-agentic-resource-system/objects/skill-record.md
title: How do operational skills bind to the theories that establish them?
description: "The corpus has two skill-shaped artifacts that currently float free of each other:"
---

# How do operational skills bind to the theories that establish them?

The corpus has two skill-shaped artifacts that currently float free of each other:

1. **Operational `SKILL.md` files** under `governance/skills/<name>/SKILL.md`. These are executable artifacts an agent reads and follows.
2. **The `skill` concept** under [agential-orchestration-platform/concepts/skill.md](../../research/2026/07/31/lenticule-import/animating/content/engineering/theories/tech/theories/computing/theories/predicated-computing/theories/agential-orchestration-platform/concepts/skill.md) and the **`skill-record` object** under [flatfile-agentic-resource-system/objects/skill-record.md](../../research/2026/07/31/lenticule-import/animating/content/engineering/theories/tech/theories/computing/theories/predicated-computing/theories/agential-orchestration-platform/theories/flatfile-agentic-resource-system/objects/skill-record.md). These are the *theoretical* commitments that establish skills as a possible kind of agent activity and define the data shape of a skill record.

The question: how does an operational `SKILL.md` declare its binding to the `skill-record` object that establishes it as possible, and what does the corpus check at validation time?

## Why it matters

Without the binding, the operational skills are uninterpreted artifacts: an agent following a `SKILL.md` cannot see what theoretical claim the skill rests on, and the theory cannot see which of its claims are realized by deployed practice. The whole point of putting operational artifacts in the same corpus as the theory is so each can hold the other accountable.

## Sub-questions

1. **Frontmatter direction.** Does the `SKILL.md` declare `realizes: skill-record` (operations-cites-theory), or does the `skill-record` declare `realized-by: [...]` (theory-cites-operations), or both? The former is local to the skill and easy for contributors; the latter requires the theory to track its operational descendants.
2. **Resolution mechanism.** A `SKILL.md` lives in `governance/skills/<name>/`; the `skill-record` lives deep inside FARS. The path between them is long. Should the binding use a relative path, a corpus-global slug, or a registered identifier?
3. **Conformance.** What does it mean for a `SKILL.md` to *conform* to its `skill-record`? The record specifies fields like name, description, when-to-use, when-not-to-use, available-functions. Conformance presumably means the SKILL.md's frontmatter and body sections cover those fields. But the SKILL.md format already has its own conventions; does conformance require those conventions to be reshaped, or only that the relevant content be present?
4. **What about skills that have no `skill-record` yet?** Most existing operational skills (`orient-to-area`, etc.) predate the FARS skill-record concept. Migrating them is a finite job; meanwhile, what is their status? `unbound: true`? An automatic stub `skill-record` per orphan skill? A grace period?
5. **Validation behavior.** When FARS encounters a `SKILL.md` whose `realizes:` points at a non-existent `skill-record`, what happens? An error? A warning? An auto-created stub?
6. **Skills that establish *new* theory.** A `SKILL.md` for *using* the validation toolkit binds to existing theory. What about a `SKILL.md` for *teaching the corpus discipline itself* (this very theory)? It would bind to a `skill-record` that doesn't exist yet because the theory it would belong to (this one) doesn't have a `skill-record` either. Bootstrapping question.

## What an answer would look like

A short binding specification: which direction the `realizes:` edge goes, how it resolves, what conformance requires, what validation does on missing/broken bindings, and how the migration from currently-unbound skills proceeds.

## What is at stake in the wrong answer

A loose answer leaves operational skills uninterpreted forever, and the FARS `skill-record` concept becomes a never-instantiated abstraction. A heavy answer makes contributing a new skill so onerous that contributors fork their own skill conventions outside the corpus.
