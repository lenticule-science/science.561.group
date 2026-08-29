---
title: "SOUL.md"
description: "A Markdown-based convention for encoding an AI agent's identity, personality, communication style, and operational boundaries — the agent identity counterpart to project-level AGENTS.md."
defines: SOUL.md
domain: agents
instance-of: context-engineering
governs: agentic-system
delivered-via: system-prompt
contrasts-with: agents-md
date-created: 2026-03-29
date-updated: 2026-03-29
---

SOUL.md is a Markdown-based convention for encoding an AI agent's identity, personality, communication style, expertise, and operational boundaries into files that any LLM-based agent can read and embody. Where [AGENTS.md](./agents-md.md) provides *project-level instructions* (what to do and how), SOUL.md defines *who the agent is* — its voice, worldview, values, and behavioral constraints.

The convention was created by **Aaron J. Mars** (@aaronjmars) and published to GitHub around **February 2, 2026**. It is closely associated with the OpenClaw ecosystem but is designed to be tool-agnostic. The philosophical basis, cited in the project documentation, is *The First Paradigm of Consciousness Uploading* by Liu Xiaoben, which proposes that consciousness is encoded in the language one produces and that a model conditioned on a person's lifetime language output constitutes a form of identity persistence.

The Soul Spec defines five core components:

1. **SOUL.md** — Identity, worldview, opinions, values, and non-negotiable principles.
2. **STYLE.md** — Voice patterns, syntax preferences, tone, and communication characteristics.
3. **SKILL.md** — Operating modes and capabilities (tweet composition, essay writing, technical chat, etc.).
4. **MEMORY.md** — Session continuity, contextual memory, and accumulated experience.
5. **data/** and **examples/** — Raw source material (tweets, essays, transcripts) and canonical output examples.

An extended specification (Soul Spec v0.5) allows expansion into a `.soul/` directory containing `soul.json` (machine-readable metadata), `IDENTITY.md`, `AGENTS.md`, `RULES.md`, and `CONTEXT.md`. The workflow involves feeding an agent a corpus of a person's writing (from Twitter/X, Substack, Medium, Discord, YouTube transcripts, GitHub, etc.), from which the agent extracts worldview and voice patterns and populates the markdown files.

SOUL.md is supported by Claude Code, OpenClaw, Cursor, Windsurf, Continue.dev, Aider, Codex, goose, and any agent that can read Markdown. It has less adoption than [AGENTS.md](./agents-md.md), which benefits from Linux Foundation stewardship and broader tooling support. No formal standards body governs SOUL.md.

SOUL.md is the only widely-known standard that focuses on agent *identity* rather than agent *behavior*. The claim is that a persistent character constrains how an agent interprets and executes its instructions — that identity shapes output beyond what task instructions alone achieve. No published study has tested whether identity-conditioned agents produce measurably different outputs from instruction-conditioned agents given the same task. The claim is testable; it has not been tested.

## Related terms

- [AGENTS.md](./agents-md.md) — project instruction convention (complementary to SOUL.md)
- [Agentic system](./agentic-system.md) — the systems SOUL.md characterizes
