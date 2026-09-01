---
title: "Drivers"
description: "The driver framework. Interfacers as substrate entities. Named drivers for matrix, hledger, mqtt, smtp/imap, git, fs, mcp."
kind: index
---


Drivers (called "interfacers" in the library) translate between the substrate and external systems.
Each driver is a substrate entity with `kind = "driver"`, a capability declaration, and an attach/detach lifecycle.

## Specs

### Already shipped (v0.1)

- [mcp-driver.md](mcp-driver.md) — Model Context Protocol; the agent-facing primary surface.

### To be written at v0.2

- `driver-model.md` — what a driver record is; capability declarations; attach/detach lifecycle; failure modes.
- `attach-detach.md` — driver lifecycle: register → load → attach → operate → detach → unload.
- `fs-driver.md` — host filesystem (Linux/BSD FS) as cells; read, write, watch.
- `git-driver.md` — git repos as substrate cells; branches, commits, refs as cells.

### To be written at v0.3 (bundled userland)

- `smtp-imap-driver.md` — email driver (uses [network/smtp.md](../network/smtp.md), [network/imap.md](../network/imap.md), [network/pop3.md](../network/pop3.md)).
- `caldav-driver.md` — calendar driver (uses [network/caldav.md](../network/caldav.md)).
- `carddav-driver.md` — contacts driver (uses [network/carddav.md](../network/carddav.md)).
- `matrix-driver.md` — chat driver (uses [network/matrix-cs-api.md](../network/matrix-cs-api.md)).
- `xmpp-driver.md` — chat driver (uses [network/xmpp.md](../network/xmpp.md)).
- `irc-driver.md` — chat driver (uses [network/irc.md](../network/irc.md)).
- `hledger-driver.md` — accounting bidirectional bridge.

### To be written at v0.4 (federation + external-system drivers)

- [github-issues-driver.md](github-issues-driver.md) — GitHub Issues bidirectional bridge (uses [network/github-rest-and-webhooks.md](../network/github-rest-and-webhooks.md); see [decisions/external-systems-get-drivers-peers-get-federation.md](../../decisions/external-systems-get-drivers-peers-get-federation.md)).

### To be written at v0.5 (industrial control)

- `mqtt-driver.md` — IoT messaging (uses [network/mqtt.md](../network/mqtt.md)).
- `modbus-driver.md` — industrial control (uses [network/modbus.md](../network/modbus.md)).

## Theory grounding

The driver framework implements:

- `predicated-computing/concepts/interfacer` — three operations: extract, apply, compose.
- `predicated-computing/concepts/boundary` — driver/substrate boundary discipline.
- `predicated-computing/concepts/driver-substrate-split` — what's substrate, what's driver.
- `predicated-computing/concepts/reification` — driver state reified as substrate cells.
- `flatfile-agentic-resource-system/morphisms/load`, `interpret`, `apply-edit` — concretization at flatfile substrate.

The library has the interfacer model well-developed; this directory adds the **driver lifecycle** (attach/detach, failure handling, restart policies) which is sparse in the library.

## Conformance

The driver framework passes:

1. A driver record loads via the package format and registers with the runtime.
2. Attach/detach is auditable via the event log; a detached driver's cells are quiesced (marked stale).
3. A failing driver doesn't crash the substrate; it transitions to `degraded` and logs the failure.
4. Driver capability discipline rejects operations the driver isn't authorized for.

## Plan 9 / Unix analogue

| Unix concept | Driver analogue |
|---|---|
| Device file (`/dev/...`) | Substrate cells written by a driver |
| Kernel module | Driver record (substrate entity) |
| `insmod` / `rmmod` | attach/detach lifecycle |
| udev | Closure rules firing on attach events |
| Driver framework | This directory's specs |
