---
id: flatfile-agential-resource-system-charter
description: "An AgentialRelationsSystemCharter within a FlatfileAgentialResourceSystem: a Blueprint directory with AGENTS.md declaring the covering structure — the agent community is constituted, but no SOUL.md and not yet live."
implements: AgentialRelationsSystemCharter
date-created: 2026-03-18
date-modified: 2026-03-18
params:
  blueprint: relational-universe
  agents-file: relational-universe
output: relational-universe
ast:
  covering-structure-declaration:
    - blueprint
    - agents-file:
        - agent-community-declaration
        - operational-policies-declaration
title: Flatfile Agential Resource System Charter
---

# Flatfile Agential Resource System Charter

## What this is

A **FlatfileAgentialResourceSystemCharter** is an [AgentialRelationsSystemCharter](../../../../../agential-relations-system/library/vocabulary/library/agential-relations-system-charter/agential-relations-system-charter.md) within a [FlatfileAgentialResourceSystem](../../../../flatfile-agential-resource-system.md).

In the flatfile substrate, a charter is a blueprint directory to which `AGENTS.md` has been added.
The `AGENTS.md` file IS the Grothendieck topology for this scope: it declares who the agents are, what their scope of operation is, and what their entry-point skills are.
With that declaration, the scope becomes a site — a blueprint equipped with a covering structure.

A FlatfileAgentialResourceSystemCharter MUST satisfy all requirements of [FlatfileAgentialResourceSystemBlueprint](../flatfile-agential-resource-system-blueprint/flatfile-agential-resource-system-blueprint.md) and MUST have `AGENTS.md` declaring the agent community.

## File structure

```
spec/{id}/
  {id}.md           # the entity's own spec file
  AGENTS.md         # agent community declaration — the covering structure
  skills/
    {skill-id}.md
    ...
  runbooks/
    {runbook-id}.md
    ...
shacl/
  {id}-*.ttl
```

No `SOUL.md`, no `INBOX.md`, no `PLANS.md`, no `IDEAS.md`, no `MEMORY.md`.

## AGENTS.md before SOUL.md

The `SOUL.md` of a scope states what the scope fundamentally exists for and what the agents of that scope must never compromise.
A charter has `AGENTS.md` (who acts here, under what policies) but not yet `SOUL.md` (what the agents of this scope have committed to).
A charter CANNOT have `SOUL.md` without a declared agent community — the soul cannot precede the community.
A charter CANNOT have `INBOX.md`, `PLANS.md`, `IDEAS.md`, or `MEMORY.md` — those make it a locale.

## What the charter is waiting for

A FARS charter has the full structure needed for the locale to form: skills, shapes, runbooks, and a declared agent community.
What it is waiting for is condition 7 — the locale going live.
That happens when `SOUL.md` is written (the constituted community's governing commitment) and the live operational files (`INBOX.md`, `PLANS.md`, `IDEAS.md`, `MEMORY.md`) are opened.

## Growing past charter

A FARS charter becomes a [FlatfileAgentialResourceSystemLocale](../flatfile-agential-resource-system-locale/flatfile-agential-resource-system-locale.md) when the following files are added, in this order:

1. `SOUL.md` — the governing principles of the constituted agent community
2. `MEMORY.md` — cross-session accumulated knowledge (sheaf accumulation begins)
3. `INBOX.md` — receiving new sections from outside (sheaf gluing activated)
4. `PLANS.md` — active work items (generative operations)
5. `IDEAS.md` — uncommitted potential work (generative operations)

## Open questions
