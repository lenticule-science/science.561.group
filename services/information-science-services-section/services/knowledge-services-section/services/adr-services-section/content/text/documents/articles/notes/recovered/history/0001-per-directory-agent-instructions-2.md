---
title: "Add per-directory AGENTS.md files to discipline modules"
date-created: 2026-03-07T00:00:00
authors:
  - claude
status: draft
priority: medium
depends-on: []
goal: "001"
---

## Summary

Add AGENTS.md files to discipline module directories, starting with those
that have domain ASR specs (mathematics, philosophy, sociology, games,
education) and expanding to the remaining 18+ disciplines. Each file
defines the interpretive stance for agents working in that directory.

## Motivation

Decision 0002 accepted per-directory agent instructions as bounded
interpretive contexts. This plan implements that decision. Currently
agents working in any discipline directory receive only root and
content-level instructions — no discipline-specific interpretive
guidance. Adding AGENTS.md files gives agents ambient context about
vocabulary, reasoning style, and methodological commitments before
they receive a task.

## Steps

1. Write a `write-directory-agent-instructions` skill (SKILL.md) that
   codifies the process for creating per-directory AGENTS.md files.
2. Create AGENTS.md for the 5 disciplines with domain ASR specs:
   mathematics, philosophy, sociology, games, education.
3. Create AGENTS.md for the remaining discipline modules, prioritized
   by file count (technology, militarism, business, linguistics,
   ecology, etc.).
4. Add AGENTS.md conventions to the ASR directory-organization spec.
5. Update root AGENTS.md to mention per-directory files and routing.

## Done when

- [ ] Skill exists at a suitable location with anti-slop checklist
- [ ] 5 disciplines with domain ASR specs have AGENTS.md files
- [ ] Root AGENTS.md references per-directory convention
- [ ] Directory-organization spec updated

## Dependencies

- Decision 0002 (accepted)
- Domain ASR specs for the first 5 disciplines (exist)

## Log

**2026-03-07** — Created. Decision 0002 accepted same session. Skill
and first batch of AGENTS.md files to follow.
