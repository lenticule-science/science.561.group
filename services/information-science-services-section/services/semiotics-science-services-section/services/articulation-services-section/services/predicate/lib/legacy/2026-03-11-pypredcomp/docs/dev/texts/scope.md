---
title: "Scope"
description: "What the OS spec covers and when each part ships."
kind: text
---


The dev docs specify an OS, organized by **subsystem** (what the OS provides) and **release** (when each part ships).
App-level scope (what users do *with* the OS) is largely deferred to v0.7+ and lives in each app's own project directory.

## Subsystems

The OS comprises 13 specifiable subsystems, each with a [`specs/<subsystem>/`](../specs/) directory:

| # | Subsystem | What it is |
|---|---|---|
| 1 | [kernel](../specs/kernel/) | Bilattice algebra, fibers, ISA, `respond`, closure-rule engine, runtime cycles, message language. |
| 2 | [filesystem](../specs/filesystem/) | Cells-as-files, content-addressing, paths, mounts, snapshots, event log. |
| 3 | [process](../specs/process/) | Sessions, dispatch, runbooks, lifecycle, fairness. |
| 4 | [ipc](../specs/ipc/) | Message-passing, signals, pipes-equivalent, federation merge as IPC. |
| 5 | [network](../specs/network/) | Federation, HTTP, WebSocket, Matrix, SMTP/IMAP, CalDAV, ActivityPub, XMPP, IRC, MQTT, Modbus, Gemini. |
| 6 | [drivers](../specs/drivers/) | Interfacer model, attach/detach, named drivers (matrix, hledger, mqtt, smtp-imap, git, fs, mcp). |
| 7 | [shell](../specs/shell/) | REPL, message-language CLI, web GUI shell (default), TUI, command grammar. |
| 8 | [stdlib](../specs/stdlib/) | Coreutils-equivalent verbs (project, filter, fold, materialize, hash, fork, await, settle, witness, audit, retract, assert). |
| 9 | [security](../specs/security/) | Capability model, signing/witnessing, persona/personnel separation, federation trust, sandbox/fuel. |
| 10 | [init-boot](../specs/init-boot/) | Boot sequence, init runlevels, self-test, service supervision. |
| 11 | [packaging](../specs/packaging/) | Package format, Nix flake, Guix manifest, image build, upgrade flow, dependency resolution. |
| 12 | [scheduling](../specs/scheduling/) | Heartbeat, deadlines, periodic rules, cron equivalent. |
| 13 | [bundled-apps](../specs/bundled-apps/) | The standard userland shipping at v0.3+. |

Each subsystem's `_index.md` lists its specs and the load-bearing library theory it implements.

## What ships when

| Release | Adds |
|---|---|
| v0.1 | Kernel; filesystem; partial network (HTTP); partial drivers (MCP); minimal web GUI; partial init/boot; partial packaging (Nix flake bootstrap); partial scheduling (heartbeat). |
| v0.2 | All core subsystems complete; OS is self-hosting. **No bundled apps yet.** |
| v0.3 | Bundled userland: email, calendar, chat, file browser, text editor, terminal, calculator, ledger. Network adds SMTP/IMAP, CalDAV, Matrix client. |
| v0.4 | Federation across nodes; ActivityPub; Matrix S2S. |
| v0.5 | Industrial control: MQTT, Modbus, sensor framework. |
| v0.6 | App development surface: SDK, capabilities-as-API, package authoring. |
| v0.7+ | Apps that *use* the OS (productivity stack, agential layer, learning + publishing, self-developing). App specs live in their own project dirs, not here. |

See [roadmap.md](roadmap.md) for per-release detail.

## Out of scope

- **Predicated Zork, world-sim, Hevî Mala, paracosms, persona-agents, Voidfleet Academy** — content that *runs on* the OS.
  Their porting is a conformance fixture, not a release goal.
  They live in `operations/science/research/` and `operations/engineering/triage/`.
- **The 561 group's productivity stack as full apps** — v0.7 ships the substrate; per-app design happens in each app's project directory.
- **Hardware drivers below the host kernel** — through v0.4 the OS runs on a host kernel and uses its drivers via FS/MCP.
  Direct hardware bindings start v0.5 for ICS.
