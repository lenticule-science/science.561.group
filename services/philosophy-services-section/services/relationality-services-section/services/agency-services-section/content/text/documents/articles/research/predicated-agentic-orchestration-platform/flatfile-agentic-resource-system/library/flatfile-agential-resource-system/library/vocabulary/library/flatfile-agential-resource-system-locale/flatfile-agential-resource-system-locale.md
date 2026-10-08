---
id: flatfile-agential-resource-system-locale
description: "An AgentialRelationsSystemLocale within a FlatfileAgentialResourceSystem: an AgentialRelationsSystemLocale constituted by six context files and a skills directory in a git-versioned directory."
implements: AgentialRelationsSystemLocale
satisfies: Container
date-created: 2026-03-18
date-modified: 2026-03-19
params:
  soul: relational-universe-morphism
  agents: relational-universe
  context-files: relational-universe
  skills-directory: relational-universe
output: relational-universe
ast:
  locale-constitution:
    - soul
    - agents
    - context-files:
        - soul
        - agents
    - skills-directory:
        - context-files
title: Flatfile Agential Resource System Locale
---

# Flatfile Agential Resource System Locale

## Formal definition

A **FlatfileAgentialResourceSystemLocale** is a 7-tuple $L$:

$$L = (\mathrm{AGENTS},\; \mathrm{SOUL},\; \mathrm{MEMORY},\; \mathrm{INBOX},\; \mathrm{PLANS},\; \mathrm{IDEAS},\; \mathrm{skills})$$

where each component is a named file or directory in a git-versioned directory satisfying:

| Component | Type | U_G condition |
|---|---|---|
| `AGENTS.md` | Charter — covering structure | Condition 1: agents and scope declared |
| `SOUL.md` | Teleology — governing commitment | Condition 2: locale purpose distinct |
| `MEMORY.md` | Global section accumulator | Condition 7: cross-session sheaf accumulation |
| `INBOX.md` | Incoming section receiver | Condition 7: receiving new local sections |
| `PLANS.md` | Active operation sequence | Conditions 3–6: generative operations active |
| `IDEAS.md` | Raw unplanned input | Condition 1: raw material before nucleus evaluation |
| `skills/` | Skill library for this locale | Conditions 3–6: judgment operations available |

**Distinctness conditions.** A directory is a locale iff: 1. $L.\mathrm{SOUL} \neq L'.\mathrm{SOUL}$ for all other locales $L'$ — distinct teleology 2. $L.\mathrm{AGENTS} \neq L'.\mathrm{AGENTS}$ for all other locales $L'$ — distinct method

Two directories with the same soul and the same agents are one locale, not two.

**Locale as agent.** $L$ is itself a [FlatfileAgentialResourceSystemAgent](../flatfile-agential-resource-system-agent/flatfile-agential-resource-system-agent.md): it submits steps to other locales' interfaces via INBOX deposit and receives steps at its own interface.
The locale's collective output is the sequence of observations its agents have produced, accumulated in $L.\mathrm{MEMORY}$.

## What this is

A **FlatfileAgentialResourceSystemLocale** is an [AgentialRelationsSystemLocale](../../../../../agential-relations-system/library/vocabulary/library/agential-relations-system-locale/agential-relations-system-locale.md) within a [FlatfileAgentialResourceSystem](../../../../flatfile-agential-resource-system.md).

It is what an [AgentialRelationsSystemLocale](../../../../../agential-relations-system/library/vocabulary/library/agential-relations-system-locale/agential-relations-system-locale.md) looks like when the substrate is markdown files: the seven closure conditions are satisfied through a defined set of context files and a skills directory.
The directory IS the locale.
The files ARE the locale's logic.

Two things make a directory a FlatfileAgentialResourceSystemLocale rather than just a directory:

1. **Distinct teleology** — a stated reason for existing that differs from every other locale's.
  Declared in `SOUL.md`.
2. **Distinct method** — a documented way of working that differs from every other locale's.
  Declared in `AGENTS.md` and grounded in its skills.

If two directories share the same why and the same how, they are one locale, not two.
A FlatfileAgentialResourceSystemLocale CANNOT share teleology or method with another locale.

## Context files

Every FlatfileAgentialResourceSystemLocale MUST maintain six context files, read in this order on every agent entry:

| File | Purpose | Growth stage |
|------|---------|--------------|
| `AGENTS.md` | Who acts here; scope; entry-point skills; operational policies | Charter — covering structure declared |
| `SOUL.md` | Why this locale exists; core principles; what must never be compromised | Locale — governing commitment of the constituted community |
| `MEMORY.md` | Accumulated cross-session knowledge; patterns; lessons learned | Locale — condition 7 sheaf accumulation |
| `INBOX.md` | Incoming messages from other locales; triaged before planning | Locale — condition 7 receiving new sections |
| `PLANS.md` | Active work; open items only | Locale — generative operations active |
| `IDEAS.md` | Raw unplanned material; mined into PLANS when ready | Locale — generative operations active |

**AGENTS.md precedes SOUL.md in the growth sequence.** A charter has `AGENTS.md` (the covering structure: who acts and under what policies).
The `SOUL.md` document cannot be written before the agent community is declared — the soul constrains the practice of that specific community, and cannot govern a community that has not yet been constituted.
The soul is the first substantial act of a live locale, not a precondition for agents.

**MEMORY.md and INBOX.md come last** because condition 7 (sheaf gluing) requires the generative operations of condition 6 to be present first.
MEMORY accumulates settled sections; INBOX receives new steps from outside.

A locale without all six files is not fully constituted — it is an [Outpost](../flatfile-agential-resource-system-outpost/flatfile-agential-resource-system-outpost.md), [Blueprint](../flatfile-agential-resource-system-blueprint/flatfile-agential-resource-system-blueprint.md), or [Charter](../flatfile-agential-resource-system-charter/flatfile-agential-resource-system-charter.md) depending on which files are present, valid at its current depth but not yet a locale.

## Skills

Every FlatfileAgentialResourceSystemLocale has a `skills/` subdirectory.
Skills are what agents use to do work within the locale's scope.
Every locale MUST have at minimum one skill that implements the improvement loop for that locale's content.

## Dependencies

Locales CAN declare dependency relations to other locales.
A downstream locale takes the upstream locale's output as its primary input.
The dependency direction is one-way: a locale CANNOT modify the content of a locale it depends on.
Cross-locale findings MUST be routed via message — a locale CANNOT write to another locale's files directly.
Any FARS deployment may define its own locale structure and dependency order.

## Open questions

- Whether the six context files are themselves specced units with defined structure, or whether their format is left to each locale.
- Whether a locale can contain sub-locales, and if so how scope nesting interacts with the U_G closure conditions.
