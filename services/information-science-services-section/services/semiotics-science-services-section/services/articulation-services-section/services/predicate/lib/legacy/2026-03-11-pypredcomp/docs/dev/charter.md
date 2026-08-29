---
title: "Charter"
description: "What the pypredcomp dev project is, what counts as it being done, and who decides what."
kind: charter
status: open
---

# Charter

Governs the **pypredcomp dev project** — the design records under `pypredcomp/docs/dev/` and the Python implementation under `pypredcomp/src/`.
The Rust sibling at `operations/engineering/services/mash/` inherits the same charter, decisions, and specs and passes the same conformance vectors byte-identically.

## What we're building

**The 561 group's operating system.** A predicated-computing OS whose kernel is the bilattice substrate, serving as the operational infrastructure of a confederacy whose function is **Black Liberation and Indigenous Sovereignty**.

Concretely: a real, bootable, federated OS in the same shape as Plan 9 or Unix is an OS — kernel, filesystem, network stack, driver model, shell, stdlib, init system, package manager, and a userland that ships in the base image.
The kernel is the predication algebra (`respond` + closure rules + the four-valued bilattice).
The file system is content-addressed cells.
Processes are sessions.
IPC is message-passing under $\odot$.
The network stack speaks real public protocols (HTTP, WebSocket, Matrix, ActivityPub, IMAP/SMTP, CalDAV, MQTT, Modbus, XMPP, IRC, Gemini) at byte-level fidelity.
The shell is the message language as REPL plus a server-rendered web GUI.
The package format is a Nix flake / Guix manifest. v0.3 ships email, calendar, chat, file browser, terminal, text editor, calculator, and ledger.

The substrate's algebra makes the OS *predicated* rather than imperative.
The math is forced; the engineering is the construction.

## The ambition

We have better math than anyone else who has built an OS — the adjunction is forced (Lambek 1958; Lawvere 1969; Busaniche–Cignoli 2014 in three independent traditions); federation as $\odot$-merge is conflict-free by algebra; the bilattice handles partial and contradictory information natively.
None of this is available to an OS designer working from POSIX.

The captain's instruction: do the impossible.
Plan 9 / Unix-class feature parity and self-hosting **by v0.2**; bundled userland v0.3; federation v0.4; industrial control v0.5; third-party app surface v0.6; the captain's productivity stack v0.7; agential layer v0.8; continuous learning + publishing v0.9; **fully self-developing OS at v1.0**, where agents inside the OS write OS code.

See [texts/roadmap.md](texts/roadmap.md) for what each release delivers concretely.

## Whose OS it is

The captain (emsenn, BDFL) of the [RSC Quiescent](../../personas/calder-underhill.md), one ship of the **561 group**.
Also operated by other 561 members on federated nodes, by persona-agents (Cassia Lorne, Calder Underhill, Josh Blevins) with their own publication channels, and by external services and outposts running near physical infrastructure.

## Constraints (non-negotiable)

- **Predication first.** No SQL, no Mongo, no "graph database with bilattice tags."
  The store *is* a content-addressed log of predication cells; the algebra *is* the query engine; closure rules *are* programs.
- **Self-representation everywhere.** Every closure rule, skill, agent, office, governance constraint, view, driver, package, network endpoint is a substrate entity.
  No privileged system table.
- **Reproducibility.** Every executable artifact rebuilds from a Nix flake or Guix manifest.
  No `pip install` outside a pinned environment.
- **Web GUI is first-class** — the default shell, not a stretch goal.
  Every UI affordance is a structured message into the substrate.
- **Plain text is the wire.** Markdown-with-frontmatter for humans; JSONL canonical wire format; Python (PydanticAI + LangGraph + FastAPI) for v0.1 → v0.x; Rust for v0.x → v1.0.
- **Federation-ready from day one.** Records are content-addressable.
  Adding peers is a config change, not a rewrite.
- **No mocks of the algebra.** The four-value algebra is live or the system is not predicated.
- **Real network protocols.** Where a protocol is publicly documented (RFC, W3C, vendor spec), the OS speaks it at byte-level fidelity.
  We don't reinvent SMTP.
- **Self-hosting by v0.2.** The OS rebuilds itself from its own source tree.
  Bootstrap from another OS is required only for the first build.
- **Capabilities, not ACLs.** Every authorization is a capability fiber; the substrate's $\Rightarrow$ is the check.

## Decision authority

- **Captain decides** product scope, protocol commitments, release-target ambition, anything affecting confederacy peers.
- **Agent decides** implementation tactics within the constraints above and the [decisions/](decisions/).
- **Agent files a question** in [questions/](questions/) when a decision crosses an unresolved interpretation.
  Captain answers asynchronously; agent doesn't block on it for tasks not gated by it.

This charter is updated when the captain's commitments change.
Not edited mid-task by the agent.
