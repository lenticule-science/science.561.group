---
name: principle
description: "A Principle is a safety invariant for a locale — a formula φ that must hold in every reachable state of the system, bounding all operations and decisions within the locale's scope."
governs: [act, judgment]
component-of: locale
instance-of: proposition
date-created: 2026-03-18
date-modified: 2026-03-19
---


## What this is

A **Principle** is a safety invariant: a formula that must hold in every reachable state of a locale.

The mathematical invariant comes from model checking and temporal logic (Clarke, Emerson, Sifakis 1981; Pnueli 1977). In temporal logic, a **safety property** is a formula of the form □φ — "φ holds in all reachable states." A safety property says nothing bad ever happens. The system satisfies □φ iff for every reachable state s, φ(s) holds.

A Principle is exactly a safety invariant □φ for the locale: a formula φ such that no reachable state of the locale satisfies ¬φ. When ¬φ(s) holds, the locale has entered a **forbidden state** — a state that should be unreachable under correct operation.

This distinguishes a Principle from:

- A **rule** (a conditional: if P then Q) — rules govern specific transitions; principles constrain all reachable states.
- A **plan** (a sequence of operations) — plans describe what to do; principles describe what must never be violated while doing it.
- A **permission** (what agents are allowed to do) — permissions govern individual actions; principles are invariants over all actions.

A Principle is the ground that rules stand on: when a rule and a shortcut conflict, the Principle determines which wins because the Principle constrains all paths, not just specified ones.

## Stability

Safety invariants are stable by nature: □φ is either always satisfied or has been violated. A "principle" that changes frequently is not a safety invariant — it is a rule or a plan encoded in the wrong place.

The test: if φ could be derived from the current task list or permission declarations rather than from the locale's fundamental purpose, it is not an invariant — it is a condition of the current operational state.

## Structure of a Principle

Every Principle MUST have:

- **Name**: a short phrase that uniquely identifies the invariant within the locale
- **Statement**: the formula φ stated as a positive claim — what must always be true
- **Failure mode**: what ¬φ(s) looks like — the forbidden state the invariant exists to prevent

A Principle SHOULD have:

- **Implication**: what φ requires in practice — how it constrains day-to-day decisions

## Consistency constraints

Principles within a locale MUST be mutually consistent — no two principles can require contradictory states simultaneously. Child-locale principles MUST NOT contradict root-locale principles. (A parent safety invariant □φ subsumes the child: the child's reachable states are a subset of the parent's, so the parent's invariant must hold there too.)

## Open questions

- Whether the set of a locale's Principles is required to be consistent (satisfiable) or whether inconsistency is permitted and detected operationally.
- Whether Principles correspond to the nucleus axioms of the relational universe — nucleus extensiveness, idempotence, and meet-preservation as the three primitive safety invariants of any closure system.
