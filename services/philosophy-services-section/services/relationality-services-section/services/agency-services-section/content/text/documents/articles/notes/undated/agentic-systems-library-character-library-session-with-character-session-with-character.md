---
name: session with character
description: A running session whose scope and pre-parameterization derive from a character's agency rather than from a single agent.
title: session with character
---

A session-with-character is a session whose tool surface is the union of the agencies of its named character, with per-skill defaults supplied by the agency entries. Two structural axes:

- **Scope (set-theoretic):** the union of `{transformers, structures}` declared by each agent named in the character's `agency:`. The MCP harness's verb-and-noun filter is applied against this union, producing the registered skill set.
- **Defaults (per-skill):** each registered skill is attributed to the first agency entry whose agent claimed its verb-and-noun pair. That entry's `defaults` map provides values for skill arguments the caller omits; caller-supplied values always take precedence.

A session-with-character differs from a session-with-agent in that its scope is a union rather than a singleton and that its skills carry per-call pre-parameterizations bound to the character's identity. The same skill can be invoked through different characters' sessions and resolve to different default arguments.
