---
title: "The bundled MCP catalog is normative"
description: "The OS ships a normative bundled catalog of agent-facing MCP servers — `sequential-thinking`, `playwright`, `evalview`, `omega-memory` — wired into office work by default. Each carries a default capability profile, a default risk profile, and a substrate-cell entry in the boot image. Per-deployment additions are normal substrate state."
kind: decision
date: "2026-05-02"
status: committed
---


## What

The OS commits to a bundled catalog of agent-facing MCP servers that ship in the v0.2 boot image and are wired into office work by default.
The four committed servers are:

| Slug | Purpose | Default surface |
|---|---|---|
| `mcp:sequential-thinking` | Step-by-step reasoning scaffolding for Tier-3 dispatch. | One tool: `think`. |
| `mcp:playwright` | Headless browser automation for office work that needs DOM-level interaction. | Tools: `browser-open`, `browser-navigate`, `browser-click`, `browser-fill`, `browser-screenshot`, `browser-extract`. |
| `mcp:evalview` | Substrate-aware code/data evaluation surface (the captain's existing `evalview` discipline). | Tools: `eval`, `view`, `inspect-cell`. |
| `mcp:omega-memory` | Long-term cross-session memory store (the captain's existing `omega-memory` discipline; capability-bounded by personnel/persona/office boundaries). | Tools: `remember`, `recall`, `forget`, `list`. |

Each entry in the catalog is a substrate cell per [`drivers/mcp-driver.md`](../specs/drivers/mcp-driver.md) §3, carrying:

- A `mcp-server-record` with transport (stdio for bundled, optionally TCP/WebSocket for remote), version pin, and start-command.
- A default capability profile per [`security/capability-model.md`](../specs/security/capability-model.md) §6 (which sender-boundaries get which tools).
- A default risk profile per [`security/tool-risk-scoring.md`](../specs/security/tool-risk-scoring.md) §1 (so each tool starts scored sensibly).
- A default office-wiring per [`process/dispatch-as-scheduler.md`](../specs/process/dispatch-as-scheduler.md): which offices have these tools available without per-deployment opt-in.

Per-deployment additions, removals, and overrides are normal substrate state — the captain may extend the catalog (a custom MCP server for a specific workflow) or restrict it (omit `playwright` on a sealed deployment) by appending substrate events.

The catalog ships in the `boot/mcp-servers/` namespace of the boot image.
Updates to a bundled server's version are a substrate event with `supersedes` pointing at the prior version cell.

The full normative content extends [`specs/drivers/mcp-driver.md`](../specs/drivers/mcp-driver.md) (new "Bundled MCP catalog" section).
The captain's source idea is [`ecc2-feature-port.md`](../../../engineering/triage/operations/command/ideas/triage/ecc2-feature-port.md) §4.

## Why

The captain has been running ECC2 (the predecessor everything-claude-code Rust TUI) with a curated set of MCP servers wired in by default — `sequential-thinking`, `playwright`, `evalview`, `omega-memory` — because those are the ones that pay for themselves across office work.
Re-discovering this default per-deployment is wasted work.

Committing the catalog is a small spec move with a large operational payoff:

- **Office work is wired correctly out of the box.** Without a bundled catalog, every new deployment has to wire MCP servers per office; the choices the captain has already made stay made.
- **Capability and risk profiles are pre-shipped.** Each tool comes with sane defaults: `sequential-thinking` is low-risk and broadly available; `playwright` is medium-risk with default-deny on outbound destructive operations; `evalview` inherits the substrate's audit discipline; `omega-memory` is bounded by per-boundary memory scopes.
- **The catalog is normative, not a recommendation.** A v0.2 deployment claiming OS-class compatibility includes these four.
  Per-deployment exclusions are substrate edits that show up in audit, not silent omissions.
- **Federation peers can negotiate.** When two peers federate, knowing the bundled catalog's slugs lets them route cross-peer office work without per-tool capability handshakes for the canonical four.
- **The continuous-learning pipeline (v0.9) has stable surface.** Tier-3 traces against `mcp:sequential-thinking`'s `think` tool can be observed and promoted into Tier-2 models or Tier-1 closure rules ([`scheduling/tier-routing.md`](../specs/scheduling/tier-routing.md) §9).
  A stable catalog gives the pipeline stable evidence.

The four servers were chosen for what they cover, not what was easy:

- `sequential-thinking` is the substrate's commitment to keeping Tier-3 LLM dispatch *structured* ([`cheapest-sufficient-computation-tier.md`](cheapest-sufficient-computation-tier.md)).
  The `think` tool gives the LLM a scaffold rather than free-form prose.
- `playwright` is the office-work browser surface — the captain's offices that interact with non-substrate web services (publishing, scraping for federation, OAuth flows) need DOM-level access; subprocess-shell-and-curl is brittle.
- `evalview` is the captain's existing discipline for inspecting code and data without leaving the agent surface; it composes naturally with substrate-cell inspection.
- `omega-memory` is the captain's long-term memory mechanism that respects boundary projection (per [`identity-is-boundary-projection.md`](identity-is-boundary-projection.md)).
  Memory is per-boundary, capability-bounded, and federation-replicable.

These four cover the recurring needs of v0.8-era agential office work without overshooting; future additions are normal substrate edits.

Source: this conversation (2026-05-02); the captain's [`ecc2-feature-port.md`](../../../engineering/triage/operations/command/ideas/triage/ecc2-feature-port.md) (2026-05-02); ECC2's MCP server inventory at `operations/engineering/fars/src/everything-claude-code/ecc2/` (referenced, not read).

## What it rules out

- Per-deployment ad-hoc selection of MCP servers without a documented baseline.
  The four are the floor.
- A v0.2 deployment claiming OS-class compatibility while omitting one of the four (without an explicit substrate event documenting the omission and rationale).
- Bundled MCP servers without capability profiles.
  Every entry ships with a default profile.
- Bundled MCP servers without risk profiles.
  Every entry ships with sensible per-tool risk scoring per [`tool-calls-are-risk-scored-at-log-time.md`](tool-calls-are-risk-scored-at-log-time.md).
- A separate "MCP server registry" service.
  The catalog is substrate cells.
- Hard-coding tool calls into office wiring such that the catalog can't be extended at runtime.
  Wiring is via substrate cells; new MCP servers are substrate events.

## What it does not constrain

- The specific version pinned for each bundled server in any given v0.2 release.
  Versions are substrate cells with `supersedes` chains; updates are normal substrate state.
- The startup transport (stdio vs. TCP vs. WebSocket) for each bundled server.
  The default is stdio; per-server choice is documented in the catalog cell.
- The exact tool surface each server ships.
  Catalog entries declare the tools the server exposes; future tool additions are substrate edits.
- Whether to expose bundled servers to federated peers.
  Each catalog cell has its own `federate-to-peer` capability list.
- Per-office wiring beyond the defaults.
  Offices may add or restrict per-tool availability via substrate cells.
- Custom MCP servers operators choose to add.
  The catalog is the floor, not a ceiling.
- Whether bundled servers run in-process, as subprocesses, or as detached daemons.
  The driver-model spec ([`drivers/driver-model.md`](../specs/drivers/driver-model.md)) governs lifecycle; the catalog cell declares the runtime expectation.
- Per-tool prompt or system-message conventions for `mcp:sequential-thinking`.
  That is per-deployment authoring, not OS spec.
