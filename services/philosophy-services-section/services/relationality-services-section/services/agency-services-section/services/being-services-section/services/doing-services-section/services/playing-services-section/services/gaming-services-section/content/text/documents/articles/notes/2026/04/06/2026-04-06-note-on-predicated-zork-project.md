---
title: Bilattice Algebra as Zork I Computation Substrate
description: Dual-engine Zork I implementation project using rule-based and algebraic engines to validate bilattice algebra as a computation substrate.
date-created: 2026-04-06
type: note
name: predicated-zork-project
keywords:
  - bilattice-algebra
  - zork
  - state-transition
  - linear-rules
  - algebraic-engine
  - computation-substrate
specialization: project
goal:
  - paradigm-applications
  - ordering-first-computation
serves-system: fars
source-code: operations/engineering/fars/src/zork1
research: lib/emsenn/services/561-group/services/engineering-services-section/services/computer-engineering-services-section/services/computer-systems-engineering-services-section/services/semiotic-computer-system-services-section/lib/legacy/2026-04-06-predicated-zork/triage
---

## Purpose

Zork I is a known artifact with deterministic behavior. If the ⊙/⇒ algebra on bilattice-valued fibers can reproduce Zork's behavior — spatial navigation, object interaction, inventory management, state machines, NL parsing — then we have empirical proof the algebra works as a computation substrate.

## Source material

- ZIL source: `operations/engineering/fars/src/zork1/` (MIT licensed, historicalsource/zork1)
- Research workspace: `lib/emsenn/services/561-group/services/engineering-services-section/services/computer-engineering-services-section/services/computer-systems-engineering-services-section/services/semiotic-computer-system-services-section/lib/legacy/2026-04-06-predicated-zork/triage/`

## Status (2026-04-06)

**Plan 1 (predicated-zork-translation):** COMPLETE. Rule engine plays through the opening sequence — 20/20 tests pass. 250 entities, 72 linear rules, zero game-specific engine code.

**Discovery:** The ⊙/⇒ algebra itself — not rules built on it — can compute state transitions. State change is passage through ⊤ (contestation) via ∨_k/⊙. Verified on 5 entities. Documented in `library/.../state-change-as-passage-through-contestation.md`.

**Plan 2 (predicated-zork-algebraic):** Extend the algebraic engine to handle full Zork. Room navigation, cross-entity cascades, combat, the thief, darkness, scoring, the maze. Both engines run against the same test suite.

## What success looks like

Two engines that play the complete Zork I — one via linear rules (Ceptre-style), one via pure ∨_k/⊙ algebra. Both produce correct output for every known command. The rule engine is the practical implementation. The algebraic engine is the proof that the bilattice algebra is a computation substrate.
