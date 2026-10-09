---
type: concept
class: operator
description: A reusable unit of capability that an agent can invoke within the OpenClaw gateway.
status: draft
depends-on: []
---

# Skill

A **skill** is a named, reusable unit of capability that an agent can invoke within the OpenClaw gateway.
Skills encapsulate specific actions such as reading files, running shell commands, searching the web, or interacting with external services.

In the OpenClaw theory: - Skills are first-class entities in the platform; they are discovered, loaded, and executed by the gateway. - Each skill has a well-defined interface (typically a prompt and a set of allowed tools). - Skills can be composed: one skill may invoke another as part of its implementation. - Skills are versioned and can be shared across workspaces or agents.

The concept of a skill abstracts away from any particular implementation (e.g., a shell script, a Python function, or an LLM tool definition) and focuses on its role as an operable unit within the agent orchestration platform.
