---
title: "Capability note: @emsenn/agents"
date: 2026-06-29
source-package: "sites/triage.bare-cedar-fog.emsenn.net/src/apps/agents.561.group"
---

# Capability note: @emsenn/agents

- Package path: `sites/triage.bare-cedar-fog.emsenn.net/src/apps/agents.561.group`
- Package kind: `src-app`
- Declared workspace entries: none found in the scanned workspace declarations
- Description: agents.561.group — an OpenAI-compatible chat surface over the 561 Group character roster. Users authorize with Google OAuth, pick a character to talk with, and each character keeps a discrete, per-user memory it fuses with its own domain context. The same OAuth authorization server lets a user connect their ChatGPT/Anthropic account to a character as an MCP endpoint.
- Capability tags from manifest/source hints: `application`, `service`, `agent-harness`, `workspace-analysis`, `operations`
- Bins: none
- Export subpaths: `./serve`, `./package.json`
- Scripts: `serve`, `check`
- Dependencies: `@emsenn/http-server`, `@emsenn/organizing-with-the-web`, `@emsenn/organizing-with-openai-agents`, `@emsenn/organizing-with-llm-agents`, `@emsenn/relating`

## Local Evidence

- sites/triage.bare-cedar-fog.emsenn.net/src/apps/agents.561.group/README.md: An OpenAI-compatible chat surface over the 561 Group character roster. Users authorize with Google OAuth, pick a character to talk with, and each character keeps a **discrete, per-user memory** that it fuses with its own domain context on every turn. The same OAuth authorization server lets a user connect their ChatGPT or Anthropic account to a character as an **MCP endpoint**.
- Source hints: `src/auth.mts`, `src/characters.mts`, `src/engine.mts`, `src/mcp-app.mts`, `src/openai-app.mts`, `src/serve.mts`, `src/webux.mts`

## Relation To Infography Baseline

- Direct surface overlap with `@emsenn/infography`: `./package.json`
- Capability classes not directly realized by infography's exported package surface: `application`, `agent-harness`, `operations`

This note is generated from manifest, nearby prose, and source-path evidence.
It should be checked against opened source before making migration or deletion decisions.
