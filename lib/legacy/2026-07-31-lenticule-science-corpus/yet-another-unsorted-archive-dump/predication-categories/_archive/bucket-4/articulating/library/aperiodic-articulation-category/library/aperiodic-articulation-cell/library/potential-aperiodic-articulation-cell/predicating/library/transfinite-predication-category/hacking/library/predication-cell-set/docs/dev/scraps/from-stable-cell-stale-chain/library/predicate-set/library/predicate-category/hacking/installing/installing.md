---
name: installing
gerund: installing
agent-noun: installer
imperative: install
description: Binding a configuration into a host environment such that the host enacts the configuration on next instantiation.
---

An installing transformer takes a substrate-side configuration (a skill record, an MCP server description, a character's agency) and a host environment (Claude Code, a systemd user instance, an editor's plugin directory) and writes the host-side files the environment reads to enact the configuration. The substrate is not altered; the host gains the bytes that make it run the configuration on next start.

## Domain and codomain

- **Domain:** a configuration source (a substrate record or a derived projection) and a host-environment locator (a directory or a configuration filename the host reads).
- **Codomain:** a witness record naming the host-side files written, their content hashes, and whether the write replaced prior content or created the target fresh.

## Preservation conditions

- **Idempotency under unchanged sources.** Two successive `installing` invocations with the same source and host return the same bytes; the second write is byte-identical to the first.
- **No substrate mutation.** A configuration source is read, never altered, by installing.

## Morphological forms in naming grammar

- `gerund: installing` heads skills built on this transformer: `installing-a-claude`, `installing-a-character-as-a-claude-configuration`, etc.
- `agent-noun: installer` heads agents that invoke such skills: `installer-of-a-character-as-a-claude-configuration`, etc.
- `imperative: install` heads scripts that body such skills: `install-a-character-as-a-claude-configuration.mjs`, etc.
