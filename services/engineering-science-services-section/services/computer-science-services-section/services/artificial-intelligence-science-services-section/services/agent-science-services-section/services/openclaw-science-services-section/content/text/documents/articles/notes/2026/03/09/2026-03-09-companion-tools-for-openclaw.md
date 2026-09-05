---
title: "Companion Tools for OpenClaw, March 2026"
date-created: 2026-03-09T00:00:00
authors:
  - claude
date-updated: 2026-03-09T00:00:00
type: text
aliases:
  - "Companion Tools for OpenClaw, March 2026"
  - "companion tools for openclaw march 2026"
keywords:
  - OpenClaw
  - AgentInfrastructure
  - SelfHosting
  - ToolingEcosystem
description: "Survey of the recurring tools and companion services used with OpenClaw in current docs and guide material, with attention to what they reveal about OpenClaw practice."
cites:
  - "OpenClaw Tailscale"
  - "OpenClaw Brave Search"
  - "OpenClaw LiteLLM"
  - "OpenClaw Ollama"
  - "OpenClaw OpenRouter"
  - "OpenClaw Memory"
  - "OpenClaw Browser"
  - "OpenClaw Docker"
  - "OpenClaw Skills"
  - "OpenClaw ClawHub"
  - "OpenClaw Hooks"
  - "OpenClaw ACP Agents"
  - "OpenClaw OpenProse"
  - "OpenClaw Personal Assistant Setup"
  - "OpenClaw Onboarding Wizard"
  - "Jason Cochran: OpenClaw Complete Guide"
---

## Purpose

This text surveys the tools that most often recur around OpenClaw in
current official documentation and practical guide material as of March
9, 2026. The source base does not support exact usage counts, so
"often used" here means recurring companions in the current OpenClaw
ecosystem rather than measured market share.

## What the tool stack reveals

The current OpenClaw ecosystem is converging on a distinctive practice.
OpenClaw itself stays as the long-running control plane, memory layer,
and multi-channel agent surface. Specialized work is pushed outward:

- networking to tools like Tailscale
- search to external providers such as Brave Search
- model routing to gateways such as LiteLLM or OpenRouter
- local inference to runtimes such as Ollama
- memory retrieval to [QMD](../../../../../../glossary/terms/qmd.md)
- repeatable workflows to [OpenProse](../../../../../../glossary/terms/openprose.md) and
  [OpenClaw hooks](../../../../../../glossary/terms/openclaw-hook.md)
- highly specialized coding work to [OpenClaw ACP agents](../../../../../../glossary/terms/openclaw-acp-agent.md)

That is one of OpenClaw's more important innovations. The product is
not trying to be a single monolith that owns every capability. It is
becoming a composable personal-agent platform with typed tools,
workspace files, plugins, and external runtime bridges.

## Tailscale for private remote access

Tailscale is the clearest recurring networking companion. The official
Gateway docs now support Tailscale Serve and Funnel directly. In the
recommended Serve pattern, the Gateway stays bound to loopback while
Tailscale provides HTTPS, routing, and identity-aware access.

This matters because OpenClaw's security posture assumes the Gateway is
powerful. Community deployment advice converges on the same point: keep
the Gateway private, then add remote access in a controlled way.
Tailscale therefore functions as the default remote-access answer for
operators who want reachability without turning the Gateway into a
public web service.

## Brave Search for web retrieval

Brave Search is the recurring search companion because OpenClaw's
`web_search` tool is built around it. The onboarding wizard explicitly
recommends setting up a Brave Search API key early so web search works
in real tasks.

This is a small detail, but it reveals a larger practice. Many of
OpenClaw's useful workflows assume the assistant can retrieve current
web information. Search is therefore not an optional luxury in the same
way as an extra voice feature. It is part of the normal operating
surface for research, monitoring, and briefing.

## Model routers and local model runtimes

Three tools recur around model access:

- LiteLLM for routing, spend control, logging, and failover
- OpenRouter for a simpler multi-provider API surface
- Ollama for local open-weight model execution

The official LiteLLM docs are especially clear about why operators use
it: centralized cost tracking, model routing, virtual keys, logs, and
fallbacks. OpenRouter fills a similar role when the priority is a
single OpenAI-compatible endpoint rather than a full local routing
proxy. Ollama appears when the goal is local-first inference on the
operator's own hardware.

Taken together, these tools show that current OpenClaw practice is
increasingly provider-agnostic. Operators want the assistant surface to
stay stable while the model backend can change under it.

## QMD for local-first memory retrieval

[QMD](../../../../../../glossary/terms/qmd.md) is a more specialized companion than Tailscale or
Brave Search, but it is one of the more interesting ones for
research-heavy OpenClaw use. The official memory docs describe it as an
experimental backend that swaps the built-in SQLite indexer for a local
search sidecar combining BM25, vectors, and reranking while keeping
Markdown as the source of truth.

This fits the broader OpenClaw method well. Memory stays human-readable
and reviewable on disk, while retrieval can become more capable without
turning the assistant's durable record into an opaque database.

## ClawHub for skill discovery and distribution

[ClawHub](../../../../../../glossary/terms/clawhub.md) is the public skill registry for
OpenClaw and one of the most visible ecosystem tools around it. The
official skills docs position it as the normal way to discover, install,
update, and back up skills, and the CLI flows are straightforward:
search, install, update, sync.

This matters because OpenClaw's extensibility is moving toward public,
versioned bundles rather than one-off local hacks. ClawHub makes skill
distribution legible. It also reinforces a practical pattern: use
workspace skills for project-local behavior, then use ClawHub when you
want discovery or reuse across operators.

## OpenProse and hooks for repeatable work

[OpenProse](../../../../../../glossary/terms/openprose.md) and
[OpenClaw hooks](../../../../../../glossary/terms/openclaw-hook.md) are two of the more
interesting workflow-layer additions in the current docs.

OpenProse is a markdown-first workflow format that runs through an
OpenClaw plugin and `/prose` command. Its documented use cases include
multi-agent research and synthesis with explicit parallelism, plus
repeatable approval-safe workflows.

Hooks provide an event-driven layer inside the Gateway itself. The hook
system is now directory-discovered, precedence-aware, and manageable by
CLI. Bundled hooks such as `session-memory`, `bootstrap-extra-files`,
`command-logger`, and `boot-md` show where OpenClaw is heading:
repeatable automation attached to lifecycle events rather than embedded
as ad hoc prompt habits.

These two systems together mark a meaningful innovation in OpenClaw
practice. The agent is no longer only a chat surface. It is becoming a
workflow host with both explicit programs and event-triggered behavior.

## ACP agents for specialist harnesses

[OpenClaw ACP agents](../../../../../../glossary/terms/openclaw-acp-agent.md) may be the
clearest sign of OpenClaw's current direction. The official ACP docs
say OpenClaw can route work to external coding harnesses such as Pi,
Claude Code, Codex, OpenCode, and Gemini CLI through an ACP backend.

This matches the stronger community advice from current guides: let
OpenClaw supervise specialized tools instead of forcing it to do all
technical work itself. In practice, ACP lets OpenClaw keep the
long-running thread, channel presence, and session routing while a more
specialized external runtime handles code-heavy or harness-specific
tasks.

That is a substantive innovation. It turns OpenClaw from a personal
assistant that happens to use tools into an orchestrator that can manage
other agent runtimes.

## Docker and isolated browser surfaces

Docker and the managed browser are not universal requirements, but they
recur whenever operators want stronger isolation.

The Docker guide is explicit that Docker is optional. It is useful for
a containerized Gateway or for validating the Docker flow, but it is
not the fastest normal path. That is consistent with current OpenClaw
practice: use Docker when isolation or reproducibility matters, not as
a mandatory wrapper for every installation.

The browser system shows the same pattern in a different layer. The
managed browser gives the agent a separate, agent-only browser profile
that does not touch the operator's personal profile. For remote or
hosted browser control, the docs also support Browserless and node-host
proxy flows. This is another sign that OpenClaw is converging on
segregated control surfaces instead of direct reuse of the operator's
everyday environment.

## Assessment

The recurring companion stack around OpenClaw is coherent. The current
ecosystem favors:

- private networking instead of broad exposure
- external search and model-routing services instead of hard-coding one
  provider
- public skill distribution plus local overrides
- local-first retrieval sidecars on top of Markdown memory
- workflow and event layers for repeatability
- specialist external harnesses for exact technical work
- isolated execution surfaces when the assistant needs stronger access

That pattern makes OpenClaw more interesting than a single assistant
app. It is becoming a coordination layer for a family of tools,
services, and runtimes that can be swapped without losing the operator's
workspace, memory, and channel presence.

## Sources

- Official Tailscale guide:
  [docs.openclaw.ai/gateway/tailscale](https://docs.openclaw.ai/gateway/tailscale)
- Official Brave Search guide:
  [docs.openclaw.ai/brave-search](https://docs.openclaw.ai/brave-search)
- Official LiteLLM provider guide:
  [docs.openclaw.ai/providers/litellm](https://docs.openclaw.ai/providers/litellm)
- Official Ollama provider guide:
  [docs.openclaw.ai/providers/ollama](https://docs.openclaw.ai/providers/ollama)
- Official OpenRouter provider guide:
  [docs.openclaw.ai/providers/openrouter](https://docs.openclaw.ai/providers/openrouter)
- Official browser guide:
  [docs.openclaw.ai/tools/browser](https://docs.openclaw.ai/tools/browser)
- Official Docker guide:
  [docs.openclaw.ai/install/docker](https://docs.openclaw.ai/install/docker)
- Official skills guide:
  [docs.openclaw.ai/tools/skills](https://docs.openclaw.ai/tools/skills)
- Official ClawHub guide:
  [docs.openclaw.ai/tools/clawhub](https://docs.openclaw.ai/tools/clawhub)
- Official hooks guide:
  [docs.openclaw.ai/automation/hooks](https://docs.openclaw.ai/automation/hooks)
- Official ACP agents guide:
  [docs.openclaw.ai/tools/acp-agents](https://docs.openclaw.ai/tools/acp-agents)
- Official OpenProse guide:
  [docs.openclaw.ai/prose](https://docs.openclaw.ai/prose)
- Official personal assistant setup:
  [docs.openclaw.ai/start/openclaw](https://docs.openclaw.ai/start/openclaw)
- Official onboarding wizard:
  [docs.openclaw.ai/start/wizard](https://docs.openclaw.ai/start/wizard)
- Independent guide:
  [OpenClaw Complete Guide: Deploy Your Personal AI Assistant](https://blog.jasoncochran.io/openclaw-complete-guide/)
