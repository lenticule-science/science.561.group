---
title: "Canonical operational-content layout"
description: "Where skills, agents, personas, and runbooks live going forward. How the existing scatter consolidates."
kind: decision
date: "2026-05-02"
status: committed
---

# Canonical operational-content layout

## What

Operational content (skills, agents, personas, runbooks) lives at fixed canonical paths under `operations/`:

| Kind | Canonical path | One entity per |
|---|---|---|
| Skill | `operations/engineering/skills/<slug>/SKILL.md` (+ optional `scripts/`) | directory |
| Agent | `operations/engineering/agents/<slug>.md` | top-level file |
| Persona | `operations/engineering/personas/<slug>.md` (+ optional `<slug>/` content directory) | top-level file |
| Runbook | `operations/engineering/runbooks/<slug>.md` | top-level file |

Sprint-scoped admin runbooks (those tied to one project's deployment workflow) MAY also live at `operations/command/projects/<project>/tasks/admin/<slug>.md`.
Engineering runbooks not tied to one project live in the canonical `operations/engineering/runbooks/`.

The `operations/engineering/_index.md` root indexes the four canonical directories plus the authoring guide.

## Why

The audit at [authoring/audit-2026-05-02.md](../../../../../engineering/authoring/audit-2026-05-02.md) found the same kinds of operational content scattered across at least nine locations, with three failure modes:

1. **Triage twins of canonical directories.** `operations/engineering/triage/operations/engineering/skills/` carries 13 named-but-empty skill marker directories that shadow names in the canonical `operations/engineering/skills/`.
  The triage twins promised work; none arrived; their existence makes "where is skill X?" ambiguous.
2. **Command-tier agents stuck in triage.** Four named agent drafts (`bookkeeper`, `chief-of-staff`, `first-officer`, `operations-officer`) sit at `operations/engineering/triage/operations/command/agents/triage/<slug>/` with substantive duties already drafted but no graduation path.
3. **Persona files in ad-hoc subdirectory locations.** Only `cassia-lorne` is graduated to a top-level `<slug>.md`.
  The others live in subdirs with title-case filenames (`Sigmund Vexler.md`, `Nik Koios.md`) that don't match the slug discipline.

Without a canonical layout, every domain skill-pack task in this sprint reproduces the same scattering at higher fidelity.
Naming the layout once, here, is the prerequisite for those tasks landing as findable additions rather than another scatter pile.

## What it rules out

- **Skill SKILL.md files outside `operations/engineering/skills/<slug>/`.** Content in `operations/engineering/triage/operations/engineering/skills/<slug>/` either has a canonical superseder (and the triage stub is retired) or it does not, in which case it stays in triage as research material — not as an operative skill.
- **Multiple top-level files per persona.** `operations/engineering/personas/<slug>.md` is the persona record.
  Existing under-directories like `operations/engineering/personas/sigmund-vexler/` keep their content (drafts, posts, asset records) but do not carry the persona's identity record.
- **Operational agents living under `operations/engineering/triage/operations/command/agents/triage/`.** The triage path is for in-progress drafts; an agent the captain is willing to invest is graduated to `operations/engineering/agents/<slug>.md`.
- **A separate `runbooks/` tree per department.** All engineering runbooks live in `operations/engineering/runbooks/`.
  Sprint-scoped admin runbooks (which read like they ship in a release artifact) live in `operations/command/projects/<project>/tasks/admin/`.
- **Storing operational content in `library/`.** Library is research content — theories, theorems, definitions, narratives.
  Operational content (the verbs the ship operates by) lives in `operations/`.

## What it does not constrain

- **`operations/science/skills/` and `operations/science/agents/`.** Both currently empty.
  The decision keeps them as parallel science homes for science-tier operational content.
  When the science department grows operational content, it lives there with the same shape (`<slug>/SKILL.md`, `<slug>.md`).
- **`.agents/` at the repo root.** Currently empty but version-tracked.
  Reserved for agent harness installation surfaces (the `.claude/`-style kit per [agents/quartermaster.md](../../../../../engineering/agents/quartermaster.md)).
  Does not duplicate the canonical agents directory.
- **Existing under-directory content in `operations/engineering/personas/<slug>/`.** Drafts, post archives, asset records, voice studies, and per-persona content stay where they are.
  The top-level `<slug>.md` is the persona record; the under-directory is the persona's working space.
- **Where research-content moves.** This decision only addresses operational content (skills/agents/personas/runbooks).
  Library content placement is governed by `fars where`.

## Consolidation plan

Per-domain task work performs the moves.
This decision names them; the relevant skill-pack tasks execute them.

| What | From | To | Owning task |
|---|---|---|---|
| 13 empty triage skill stubs | `operations/engineering/triage/operations/engineering/skills/<slug>/` | retire (delete) where the canonical pack supersedes them; keep as research where no canonical version exists | each domain pack as it lands |
| 4 graduated command-tier agents | `operations/engineering/triage/operations/command/agents/triage/<slug>/` | `operations/engineering/agents/<slug>.md` (where the agent's pack is built) | sprint-management pack (operations-officer); future packs for the others |
| 6 ungraduated personas | `operations/engineering/personas/<slug>/` (under-directory) | top-level `operations/engineering/personas/<slug>.md` (with under-directory preserved) | persona-content pack |
| Sprint admin runbooks already at `tasks/admin/` | (stays where it is) | (stays where it is — sprint-scoped) | none |
| New engineering runbooks (composing pack skills) | (new) | `operations/engineering/runbooks/<slug>.md` | each owning pack |

## Concrete consequences

- The new directory `operations/engineering/runbooks/` is created by the first runbook to land.
  The first owner is the sprint-management pack with `decide-and-spec.md`.
- The new directory `operations/engineering/authoring/` is created by this decision's companion deliverable: the authoring guide and four templates.
- Skills authored from this decision forward use the SKILL frontmatter contract specified in [authoring/authoring-guide.md](../../../../../engineering/authoring/authoring-guide.md).
  Older skills are migrated piecewise as their domain pack lands.
- Agents authored from this decision forward use the agent frontmatter contract in the authoring guide.
  The contract is extracted from existing high-quality exemplars (`architect.md`, `librarian.md`, `quartermaster.md`, `triage-processor.md`).
- Personas authored from this decision forward use the persona frontmatter contract from `cassia-lorne.md`'s shape.
- Runbooks use the runbook frontmatter contract drawn from `tasks/admin/deploy-fresh.md`.

Source: audit at [authoring/audit-2026-05-02.md](../../../../../engineering/authoring/audit-2026-05-02.md).
