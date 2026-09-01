---
name: "OpenClaw Skill"
date-created: 2026-03-09T00:00:00
authors:
  - claude
date-updated: 2026-03-09T00:00:00
aliases:
  - "OpenClaw Skill"
  - "openclaw skill"
keywords:
  - OpenClaw
  - Extensibility
  - Skills
  - AgentInfrastructure
description: "A directory-based instruction and tool bundle that teaches an OpenClaw agent how to perform a specialized task."
cites:
  - "OpenClaw Skills"
  - "OpenClaw Creating Skills"
---

An OpenClaw skill is a directory-based instruction and tool bundle that teaches an OpenClaw agent how to perform a specialized task.
The official docs define a skill as a directory containing a `SKILL.md` file and, optionally, scripts or other resources.

## Loading model

The official skills documentation describes three main loading locations:

- bundled skills shipped with OpenClaw
- managed or local skills under `~/.openclaw/skills`
- workspace skills under `<workspace>/skills`

When names conflict, workspace skills take precedence over shared and bundled skills.

## Function

Skills are the main way an OpenClaw workspace becomes specialized for a domain such as research, calendaring, or note retrieval.
They are more specific than the assistant's general identity files and narrower than plugins, which extend broader runtime capability.

## Sources

- [Skills](https://docs.openclaw.ai/skills)
- [Creating Skills](https://docs.openclaw.ai/tools/creating-skills)
