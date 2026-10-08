---
name: erp-web-platform
specialization: idea
date-created: 2026-04-04
serves: semioversal-autonomy
relates-to:
  - web-gui-messaging
  - fars-mash-as-packages
  - unified-record-sketch
  - operational-chart-of-accounts
  - double-entry-operational-accounting
aliases:
  - ERP Web Platform — Task Management + Messaging + Accounting in One UI
title: erp-web-platform
description: We're building an ERP (Enterprise Resource Planning) system.
---

## The idea

We're building an ERP (Enterprise Resource Planning) system.
The web UI isn't just chat — it's modules over the same transactional substrate:

1. **Messaging module** — channels over the event stream (homebrew Slack/Element, Matrix-compatible)
2. **Task management module** — task boards, plan views, dispatch (homebrew Asana/Todoist)
3. **Accounting module** — ledger views, trial balance, budget tracking (homebrew QuickBooks)
4. **Fleet module** — session monitoring, agent status, dispatch controls
5. **Knowledge module** — library browsing, search, graph visualization
6. **Review module** — failure reports, observation logs, instinct tracking

Every module reads from and writes to the same unified record system.
A task completion in the task module shows up as a message in the messaging module, as a credit in the accounting module, and as a data point in the fleet module.
Because every record IS a transaction, cross-module coherence is free.

This is dramatically more powerful than separate tools (Slack + Asana + QuickBooks + custom dashboards) because the underlying data model is unified.
In those systems, connecting a Slack message to an Asana task to a QuickBooks expense requires integrations.
In ours, they're the same transaction viewed through different lenses.

## Captain's words (2026-04-04)

> We're also going to need something like asana, todoist, but obviously, ours can be soooo much more badass.
> And notably, this is just another module in the same web ui, and they'd be so easy to talk between each other.
> We're planning our ERP!

## Architecture

The web UI is a client for the MASH (Multi-Agentic Semiotic Hub) server layer: - REST/WebSocket API served by the Rust daemon (mash-engine) - Matrix protocol for messaging compatibility - The operations graph is the backend for all modules - Modules are views: different queries over the same entities

## Phasing

1. CLI tools (what we have now — FARS)
2. MCP server (what we just built — queryable from agents)
3. TUI (terminal UI for the daemon — next)
4. Web API (REST + WebSocket endpoints on mash-engine)
5. Web UI (modules as described above)
6. Protocol compatibility (Matrix, potentially Slack/Todoist APIs)
