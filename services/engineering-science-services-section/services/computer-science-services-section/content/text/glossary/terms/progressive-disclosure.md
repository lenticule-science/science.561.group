---
part-of:
  - claude-code

name: "Progressive Disclosure in Agent Instructions"
date-created: 2026-03-07
introduces: concept
keywords:
  - ai-agents
  - claude-code
description: "The principle of layering agent instructions so root files stay minimal and detail lives closer to where it is needed."
type: concept
---

Progressive disclosure is an information architecture principle applied to
AI agent instruction files. The root instruction file (CLAUDE.md or
AGENTS.md) contains only universally applicable rules. Task-specific,
domain-specific, or tool-specific instructions live in subdirectory files,
skill documents, or referenced specifications.

## Why it matters

Every token in a root instruction file loads on every request. Long root
files create three problems:

1. **Budget pressure** — instruction-following quality degrades as
   instruction count rises.
2. **Relevance dilution** — instructions irrelevant to the current task
   compete for attention with relevant ones.
3. **Staleness risk** — more content means more surface area for drift
   between instructions and actual project state.

## The layering pattern

| Layer | File | Loaded when | Contains |
|-------|------|-------------|----------|
| Root | `CLAUDE.md` (repo root) | Every session | Build commands, architectural constraints, what not to touch, pointers to key files |
| Subdirectory | `subdir/CLAUDE.md` | When working in that directory | Local conventions, tool-specific setup, domain rules |
| Skill | `skills/*/SKILL.md` | When skill is invoked | Detailed operational instructions for one task |
| Reference | Specification or guide files | When agent reads them on demand | Full style guides, formalization protocols, domain specs |

## In this repository

The emsenn.net repository applies progressive disclosure across two layers:

- **Root CLAUDE.md** (emsenn-net) — session startup, project overview,
  directory structure, linking and style rules, git conventions
- **Submodule CLAUDE.md** (content) — proof assistant setup, formalization
  conventions, philosophical commitments for formal work
- **SKILL.md files** — individual operational instructions for proof
  writing, content validation, academic search, etc.
- **ASR specifications** — full formal specifications read on demand

---

## Supplementary formulation

```yaml
---
name: "Progressive Disclosure in Agent Instructions"
date-created: 2026-03-07T00:00:00
type: concept
authors:
  - claude
keywords:
  - AIAgents
  - ClaudeCode
description: "The principle of layering agent instructions so root files stay minimal and detail lives closer to where it is needed."
---
```

Progressive disclosure is an information architecture principle applied to
AI agent instruction files. The root instruction file (CLAUDE.md or
AGENTS.md) contains only universally applicable rules. Task-specific,
domain-specific, or tool-specific instructions live in subdirectory files,
skill documents, or referenced specifications.

## Why it matters

Every token in a root instruction file loads on every request. Long root
files create three problems:

1. **Budget pressure** — instruction-following quality degrades as
   instruction count rises.
2. **Relevance dilution** — instructions irrelevant to the current task
   compete for attention with relevant ones.
3. **Staleness risk** — more content means more surface area for drift
   between instructions and actual project state.

## The layering pattern

| Layer | File | Loaded when | Contains |
|-------|------|-------------|----------|
| Root | `CLAUDE.md` (repo root) | Every session | Build commands, architectural constraints, what not to touch, pointers to key files |
| Subdirectory | `subdir/CLAUDE.md` | When working in that directory | Local conventions, tool-specific setup, domain rules |
| Skill | `skills/*/SKILL.md` | When skill is invoked | Detailed operational instructions for one task |
| Reference | Specification or guide files | When agent reads them on demand | Full style guides, formalization protocols, domain specs |

## In this repository

The emsenn.net repository applies progressive disclosure across two layers:

- **Root CLAUDE.md** (emsenn-net) — session startup, project overview,
  directory structure, linking and style rules, git conventions
- **Submodule CLAUDE.md** (content) — proof assistant setup, formalization
  conventions, philosophical commitments for formal work
- **SKILL.md files** — individual operational instructions for proof
  writing, content validation, academic search, etc.
- **ASR specifications** — full formal specifications read on demand
