---
title: "Restructure agent instruction files for progressive disclosure"
date-created: 2026-03-07T00:00:00
authors:
  - emsenn
  - claude
status: accepted
---

## Context

The root CLAUDE.md had grown to ~430 lines, mixing universal project
context with domain-specific detail (proof tactics, formalization status,
style guide rules, ASR theory, work cycle descriptions). This caused
two problems:

1. **Context pollution**: every session loaded hundreds of lines of
   instructions irrelevant to the current task, degrading
   instruction-following quality.
2. **Staleness**: formalization status, proof patterns, and other
   transient state embedded in CLAUDE.md drifted from actual project
   state.

Community best practices (Anthropic docs, HumanLayer, Dometrain guides)
consistently recommend keeping CLAUDE.md under 300 lines, focusing on
what the agent would get wrong without explicit instruction, and using
progressive disclosure to push detail into subdirectory files and
referenced documents.

## Decision

Restructure the agent instruction files into three layers:

1. **Root CLAUDE.md** (~85 lines) — session startup, project identity,
   content structure, linking/frontmatter rules, style pointer, git
   conventions, do-not list. Universal to every session.
2. **Content CLAUDE.md** (~50 lines) — formalization-specific: proof
   assistant setup, constructive logic commitment, anti-slop checklist,
   structure meanings, skill pointers. Loaded only when working in the
   content submodule.
3. **SKILL.md files and ASR specs** — detailed operational instructions
   loaded on demand when the agent invokes a skill or reads a spec.

Also restructure AGENTS.md to be a concise cross-tool file (~45 lines)
with build commands, content structure, and conventions.

## Consequences

- Root CLAUDE.md drops from ~430 to ~85 lines
- Content CLAUDE.md drops from ~120 to ~50 lines
- AGENTS.md drops from ~73 to ~45 lines
- Formalization status, proof tactics, and work-cycle theory are no
  longer in any CLAUDE.md — they live in their proper locations (the
  content CLAUDE.md for setup, SKILL.md files for procedures, ASR specs
  for theory)
- New sessions start with less context noise
- The "do not" list is compressed to single-line items

## Alternatives considered

- **Symlink CLAUDE.md to AGENTS.md**: deferred. The project currently
  uses only Claude Code. Can revisit if cross-tool needs arise.
- **Single CLAUDE.md with sections**: rejected. Even well-organized long
  files suffer from context dilution. Progressive disclosure is better.
- **Move everything to skills**: would leave no session-start context.
  Root CLAUDE.md still needed for project identity and universal rules.
