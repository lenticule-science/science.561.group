---
title: "When does Rust catch up to Python feature parity?"
description: "Both implementations are canonical, but Python ships first. When does Rust catch up to v0.x parity?"
kind: question
status: closed-out-of-scope
closed: 2026-05-03
closed-reason: "Captain directive 2026-05-03: stop developing RustyPredComp; PyPredComp is the only canonical implementation. Parity question is moot."
date: "2026-05-02"
---

# Python-Rust feature parity

Per [decisions/engine-language-rust.md](../decisions/engine-language-rust.md), Python is primary v0.1 → v0.x; Rust catches up later.

The roadmap in [implementation/_index.md](../implementation/_index.md) shows:

| Release | Python | Rust |
|---|---|---|
| v0.1 | Primary | Stretch (algebra-only via mash-engine) |
| v0.2 | Primary | Begin port (kernel only) |
| v0.3 | Primary | Continue port (substrate + drivers) |
| v0.4 | Primary | Catch up; both shippable |
| v0.5+ | Both | Both, with Rust taking over for ICS |

But this needs the captain's calibration: at v0.4, is Rust required to be at parity, or just "shippable"?
At v0.7, does the productivity stack ship in Python only or both?

## Options

- **A.** Aggressive: Rust at parity by v0.4.
  Burns effort but gets the hardened version sooner.
- **B.** Conservative: Rust at parity by v0.7.
  Python carries weight through productivity stack; Rust hardens later.
- **C.** Per-feature: each new feature lands first in Python; Rust port is a separate, later task.
  Different features may have different lag.

## Captain's call

(pending)
