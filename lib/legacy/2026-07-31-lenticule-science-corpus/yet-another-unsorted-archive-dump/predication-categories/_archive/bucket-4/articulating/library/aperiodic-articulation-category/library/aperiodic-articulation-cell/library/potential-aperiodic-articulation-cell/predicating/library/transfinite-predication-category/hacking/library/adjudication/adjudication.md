---
name: adjudication
description: "The role of producing an epistemic state at every predication-cell from accumulating, possibly conflicting, possibly partial sources of information. The substrate's framework-level commitment to inconsistency-without-trivialization, partial-information-distinct-from-negation, and temporal-monotonic-accumulation."
depends-on: [predication-cell]
derives-from: docs/dev/scraps/adjudication.md
---

# Adjudication

The role of producing an **epistemic state at every predication-cell** from accumulating, possibly conflicting, possibly partial sources of information.

## What a framework must do to adjudicate

A framework realizes adjudication when it represents three features of practical knowledge systems on a single structure:

**1. Inconsistency.** Distinct sources may assert contradictory facts about the same predication-cell. The framework must represent contradiction directly, **without trivialization** — without contradictory predication-cells causing the inferential structure to collapse globally.

**2. Partial information.** A predication-cell may be uninformed — neither asserted nor refuted. The framework must distinguish **unknownness from negation**; absence of information is not denial.

**3. Temporal accumulation and distribution.** Information arrives over time and from independent sources, in varying orders and possibly with duplication. The framework must produce a state that depends on the set of information received, **growing monotonically** as more information arrives, and **converging to the same final state across knowledge replicas** without requiring them to coordinate every update.

## Why FOUR is exactly what adjudication requires

These three features are the operational reading of the FOUR-derivation (CLAUDE.md, "Fregean predication forces FOUR"):

- Inconsistency-without-trivialization needs `⊤` as a value distinct from `⊥` — both truth-neutral but for different reasons (no evidence vs contradictory evidence).
- Unknownness-distinct-from-negation needs `⊥` as a value distinct from `f`.
- Monotone accumulation needs the knowledge order `≤_k`; coordinatewise commutativity gives replica-merge convergence.

Adjudication is the **operational name** for what the bilattice's structure provides.

## Position

`transfinite-predication-category/hacking/library/adjudication/`. Placed at predicating tier because adjudication IS what predicating's evidence-injection function realizes operationally: each call to `v ↦ v ∨_k δ_{(φ,q)}` is one adjudicative step on the affected cell.

## Derivation source

Adapted from `predication-categories/concepts/adjudication.md`, preserved at `docs/dev/scraps/`.
