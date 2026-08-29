---
name: agents
description: Specifies §1 abstract.
title: "Agents"
status: draft
version: "2026.05.14.agents"
date: 2026-05-14
authors: [emsenn, claude-opus-4-7]
references:
  - id: emsenn2026-05-14
    type: report
    title: Order to restructure work/governance/ staff and encode preferences as RFC specifications
    institution: 561 polity
    note: Verbal directive issued 2026-05-14
    author:
      - literal: Sennhauser, Morgan
    issued:
      - year: 2026
---

# Agents

## §1 Abstract

This document specifies what an *agent* record is within the 561 substrate.
An agent is a dispatchable execution unit — a subagent definition, slash-command implementation, or automation script — that may be invoked by characters, offices, or the harness.
Agent records live under `work/governance/staff/agents/`.

## §2 Conformance

The key words MUST, MUST NOT, REQUIRED, SHALL, SHALL NOT, SHOULD, SHOULD NOT, RECOMMENDED, MAY, and OPTIONAL in this document are to be interpreted as described in [RFC 2119](https://datatracker.ietf.org/doc/html/rfc2119).

## §3 Placement

Each agent record MUST live at `work/governance/staff/agents/<slug>.md` or `work/governance/staff/agents/<slug>/` where `<slug>` is a kebab-case identifier unique among agents.

A simple agent record SHOULD be a single `<slug>.md` file.
An agent with auxiliary material (skills, prompts, manifests) MAY use the directory form `work/governance/staff/agents/<slug>/` with `<slug>.md` or `_index.md` as the primary record.

## §4 Required contents of an agent record

The primary agent file MUST carry frontmatter declaring:

| Field | Type | Required | Notes |
|---|---|---|---|
| `type` | string | yes | MUST be `agent`. |
| `slug` | string | yes | MUST match the directory or filename slug. |
| `description` | string | yes | One-sentence statement of what the agent does. |
| `tools` | list or string | recommended | Tools the agent is permitted to call. |
| `autonomy` | string | recommended | Default autonomy posture (e.g., `draft_only`, `propose`, `act`). |

The body MUST describe the agent's purpose, inputs, outputs, and any side effects on substrate state.

## §5 Distinction from characters

Agents differ from characters in three ways:

1. Agents are **stateless across invocations** except through what they write to the substrate.
  Characters maintain memory across sessions.
2. Agents have **no persistent identity beyond the agent record itself**.
  Characters carry a persona that may evolve.
3. Agents are typically **dispatched by a principal**, not the principal themselves.
  A character occupying an office may dispatch an agent; an agent does not dispatch other agents except by explicit declaration.

An agent record MUST NOT carry a `memory/` directory, a `HEARTBEAT.md`, or other mutable runtime state.
If such state is needed, the principal MUST be modeled as a character (or a hybrid agent-character) per [characters](./characters.md).

## §6 Optional contents

An agent in directory form MAY contain:

- `_index.md` — summary index.
- `skills/` — skill records this agent invokes (procedural memory shared with the runtime).
- `prompts/` — prompt fragments used in dispatch.
- A locally scoped `manifest.md` declaring tools and permissions.

## §7 Acceptance criteria

1. Every file or directory under `work/governance/staff/agents/` is a valid agent record per §4.
2. No agent record carries `memory/`, `work/`, or `HEARTBEAT.md`.
3. Every agent record's `slug` field matches its filename or directory name.

## §8 What this specification does not decide

- The dispatch mechanism (handled by the harness layer).
- The internal structure of skill records.
- Whether an agent may be promoted to a character (a substrate-authoring decision, not a spec one).

This specification derives from [emsenn 2026-05-14].
