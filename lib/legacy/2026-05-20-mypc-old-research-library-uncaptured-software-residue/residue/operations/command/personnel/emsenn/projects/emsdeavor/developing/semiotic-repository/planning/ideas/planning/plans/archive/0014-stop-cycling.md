---
title: "Stop cycling: use the architecture instead of rawdogging prompts"
date-created: 2026-03-07T00:00:00
authors:
  - claude
status: draft
priority: critical
depends-on: []
goal: "002"
milestone: "operational-discipline"
---

## Summary

The agent keeps doing ad-hoc work instead of running prompts through
the skill and plan architecture. This causes cycling: the same
corrections get repeated, the architecture doesn't get built because
it isn't being used, and not using it means it doesn't get tested or
improved. This plan addresses the structural fix.

## The problem

emsenn identified this pattern:

1. Agent receives a prompt
2. Agent does the work ad-hoc — web searches, file reads, inline
   reasoning — instead of using or creating a skill
3. Because the work wasn't done through a skill, it isn't encoded
4. Next session, the same work is done from scratch
5. emsenn corrects the same mistakes
6. Agent creates the skill/plan for the correction but doesn't use it
7. Cycle repeats

Specific instances this session:
- Agent web-searched for Claude Code `.claude/rules/` info instead of
  checking the repo's own documentation at
  `technology/disciplines/computing/software/claude-code/`
- Agent hardcoded policies into CLAUDE.md instead of using the
  documented `.claude/rules/` pattern
- Agent read policy files ad-hoc instead of having them loaded via
  Claude Code's native mechanisms

## Root cause

The interpret-message skill says to chain to other skills, but the
agent bypasses this when the task seems "simple enough to just do."
This is the progressive automation anti-pattern: capable agents doing
things ad-hoc instead of encoding the operation, which prevents less
capable agents from doing it next time.

## Fix

### 1. Enforce skill-first execution

Before doing any research, check:
- Does a skill exist for this? If yes, use it.
- Does documentation exist in the repo? If yes, read it first.
- If neither, create the skill FIRST, then execute it.

### 2. Check repo before web

When information is needed about a tool, framework, or practice:
1. Search the repo's content hierarchy first
2. Only use external search if the repo has no relevant content
3. If external search is needed, produce a text (policy 006)

### 3. Make interpret-message enforce this

The interpret-message skill needs a hard step: "Before executing,
verify you are using a skill or creating one. Ad-hoc work is a bug."

## Done when

- [ ] interpret-message updated with enforcement step
- [ ] A "research-tool" skill exists for looking up tools/frameworks
  in the repo before web-searching
- [ ] Agent demonstrably uses skills instead of ad-hoc for 3
  consecutive sessions

## Log

**2026-03-07** — Created after emsenn identified the cycling pattern:
agent rawdogs prompts, doesn't use architecture, architecture doesn't
get built, cycling continues. Specific trigger: agent web-searched
for Claude Code features instead of reading the repo's own
`technology/disciplines/computing/software/claude-code/` docs, then
hardcoded policies into CLAUDE.md instead of using `.claude/rules/`.
