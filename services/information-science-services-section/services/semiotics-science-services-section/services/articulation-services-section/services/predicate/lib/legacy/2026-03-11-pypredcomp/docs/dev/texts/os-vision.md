---
title: "OS vision"
description: "What kind of OS this is and how it differs from Unix and Plan 9."
kind: text
---

# OS vision

A real, bootable, federated, multi-user operating system whose kernel is the predicated-computing substrate.
Boots from a Nix or Guix image on commodity hardware.
Has a shell, network stack, drivers, package manager, and bundled email/calendar/chat in the base userland.
The captain runs the ship from it.

## How it differs from Unix

Unix's primitives: file (byte stream), process, pipe, signal, socket.
The substrate's: cell (predication record), session, message, event, driver.

What changes:

- **Cells are typed.** Every cell carries `(subject, predicate, object, value)` plus a bilattice value.
  The kernel can act on cells without parsing them.
- **Bilattice handles partial info natively.** $\bot$ / $t$ / $f$ / $\top$ are first-class.
  Unix can't distinguish "we haven't checked" from "we checked and it's false."
- **Federation is conflict-free by algebra.** $\odot$ is commutative, associative, idempotent.
  Disagreement produces $\top$, retained as a real value.
  No consensus protocol, no leader election.
- **Programs are substrate entities.** Closure rules are content-addressed records.
  Adding a rule is appending an event.
  Replaying the log reproduces every program ever written.
- **Capabilities, not ACLs.** $\Rightarrow$ is the capability check at algebra level.
  No `chmod`.
- **Time is event-ordinal.** Wall-clock is instrumentation.
  Replay is byte-identical.
- **Self-representation is total.** Drivers, network endpoints, packages, init scripts, user accounts — all substrate cells.
  There is no `/etc`.

## How it differs from Plan 9

Plan 9 took "everything is a file" further: every system service is a 9P filesystem.
The substrate goes further still:

- **Everything is a cell, not a file.** Structured, not opaque bytes.
  The kernel composes cells via $\odot$ without parsing.
- **Namespaces are predicate scopes.** Plan 9's per-process namespace is implemented as substrate-level scope predicates.
  A "mount" is a closure rule that admits a peer's cells under a local prefix.
- **The network is the same shape as the disk.** A cell from a peer is the same kind of record as one from local disk; only the `peer` predicate on its event differs.
- **The shell is structured.** The message language has bind variables and lambda; it isn't text.
  The web GUI is the default; the CLI emits the same structured messages.
- **Capability passing is non-amplifying by construction.** $\Rightarrow$ enforces it; you cannot grant more authority than you have.

## What this OS is not

- **Not Unix-as-substrate.** The substrate IS the kernel.
  We may run on a host kernel for hardware drivers in v0.1; by v0.5 most ICS bindings are direct.
- **Not POSIX-compatible.** No goal of running `bash` and `gcc`.
  POSIX is calibration ("v0.2 reaches Plan 9 / coreutils parity"), not a target spec.
- **Not a research OS** and **not a SaaS product.** See [purpose.md](purpose.md).

## Library-grounded vs. fresh design

**Grounded in library theory:** kernel (closure-rule-system, FARS four-layer-rule-architecture); process (agential-orchestration dispatch, heartbeat); IPC (federation handshake, send/receive); security (modal-restriction, capability-non-amplification); HTTP (web-server-platform); filesystem (predication-graph store, FARS flatfile); packaging (container-image); stdlib (insertion, retraction, query, settle, merge).

**Fresh design (citing public specs where relevant):** real network protocols beyond HTTP (SMTP/IMAP, CalDAV, ActivityPub, Matrix, XMPP, IRC, MQTT, Modbus, Gemini); shell command grammar; package management beyond container-image; init runlevels and service supervision; mount points and namespace isolation; container/exec model; user/group mapping to personnel/office; doc format.

Where Plan 9 / Unix / Genode / MINIX / Redox have a working solution we cite them; where the substrate's algebra suggests better, we take that.

## What "the OS works" means

A v0.x OS is working when:

1. It boots from a Nix or Guix image on commodity hardware.
2. Its conformance vectors pass.
3. The release-specific feature set demos end-to-end.
4. The captain (or another operator) can do at least one daily task on it that the previous version couldn't.
5. The next release builds using only this version's tools (self-hosting from v0.2).
