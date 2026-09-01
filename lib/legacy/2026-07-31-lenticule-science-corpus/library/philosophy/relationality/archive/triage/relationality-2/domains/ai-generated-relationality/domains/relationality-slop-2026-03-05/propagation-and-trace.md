---
title: "Propagation and Trace"
date-created: 2026-03-05T00:00:00
type: doc
purpose: How relational effects move through the field — the precursor to Flow
sources:
  - "draft 0: Simple Relational Dynamics.md (PropagationEvent, PropagationTrace, Directionality)"
  - "draft 0: derivations to integrate 01.md (Domain 2: Propagation and Trace)"
  - "draft 9: on-relationality.md (TraceStart, TraceAdvance, etc.)"
  - "draft 11: acts-induction-spec.md (StartTrace, AdvanceTrace constructors)"
  - "draft 3 PRE: proposing-a-reflexive-existence.md (Flow as KZ-lax idempotent comonad)"
---

## What propagation and trace are

**Propagation** is the movement of relational effects from one recognition
to another. When a relational act (including, excluding, relating) occurs,
its consequences do not remain local — they propagate through the field,
affecting other recognitions.

**Trace** is the record of a propagation — the path that a relational
effect follows through the field. A trace records which recognitions were
visited, which operations were applied, and what the outcome was at each
step.

Together, propagation and trace constitute the earliest (draft 0)
formalization of what later becomes Movement III's Flow. They are more
granular than Flow — they name the mechanics of directed motion before
those mechanics are compressed into a single comonadic operator.

## Draft 0's formalization

Draft 0 (Simple Relational Dynamics) provides the most detailed treatment:

**PropagationEvent**: A triple (Source, Target, Operation) — a relational
act applied from one recognition to another.

**PropagationTrace**: A sequence of PropagationEvents, equipped with a
TraceMap (the ordered sequence of nodes visited) and a Closure condition
(when propagation halts or cycles).

**Propagation Classes** — four types of propagation:
- **Linear**: effects propagate along a single chain
- **Branched**: effects split at a node, producing multiple paths
- **Cyclic**: effects return to a previously visited node
- **Localized**: effects remain within a bounded region

**Trace Invariants** — properties preserved throughout a trace:
- Node identity (recognitions maintain their identity under propagation)
- Primitive acts (the acts that cause propagation are themselves unchanged)
- Network topology (the structure of connections is preserved)

**Halt Conditions**: Propagation terminates when all reachable recognitions
have been visited, when a cycle is detected, or when no further valid
operations can be applied.

**ReflexivePropagationLoop**: A trace that returns to its starting point —
the recognition from which propagation began is itself affected. This
produces self-referential dynamics and connects to reflexing.

## Directionality

Draft 0 introduces three modes of propagation:
- **Forward**: Source → Target, following the directed modality
- **Backward**: Target → Source, reconstructing conditions
- **Mutual**: Both simultaneously — Source ↔ Target

This introduces trace-level asymmetry within a system that is
reflexively symmetric. The system as a whole is symmetric (any
recognition can serve as source or target), but each individual
propagation has a direction. This asymmetry is the precursor to
Movement III's directed dynamics.

Draft 0 formalizes this as a **DirectionalityMap** (assigning a direction
to each edge in the propagation network) and a **DirectionalityCycle**
(the pattern of directional changes through a cyclic trace).

## How propagation evolves into Flow

| Draft 0 (Propagation) | Mature framework (Flow) |
|---|---|
| PropagationEvent | A single application of Flow |
| PropagationTrace | The comonadic extension (ComposeFlow in PRE) |
| Linear propagation | Flow along a single path |
| Cyclic propagation | Flow's lax-idempotence: F(F(a)) ≤ F(a) |
| Trace Invariants | PreservesCore: Flow preserves the modal core |
| Forward/Backward | LKan/RKan in SDIG (draft 6) |
| Halt Condition | Fixed point: F(a) = a (flow-active elements) |

The compression from propagation to Flow is: propagation names the
MECHANICS (events, traces, directions, invariants), while Flow names
the STRUCTURE (a single operator with algebraic properties). The
algebraic properties of Flow (KZ-lax idempotence, core preservation,
comultiplication) encode ALL the propagation mechanics in a single
formal package.

## Connection to draft 9 and draft 11

Draft 9's Trace operations (TraceStart, TraceAdvance, TraceContinuation,
TraceWhole, TraceHead, TraceTail, TraceStep) are a different granularity
of the same concept: they track how the S-expression derivation itself
propagates through the space of recognitions.

Draft 11's Trace constructors (StartTrace, AdvanceTrace, etc.) are the
implementation-level names for the same operations within the generative
closure algorithm.

All three drafts describe the same phenomenon: relational effects move
through the field in directed, traceable ways. The differences are in
register (physical/mechanical in draft 0, computational in draft 9,
algorithmic in draft 11) and compression (many-step in drafts 0/9/11,
single-operator in the mature framework).

## Relationship to other concepts

- **Flow**: Propagation compressed into a single comonadic operator
- **Directionality**: The asymmetry inherent in each individual propagation
- **Irreducible asymmetry**: Why propagation does not terminate globally
- **Incitement**: What drives propagation forward — incomplete coherence
- **Dynamic Residuation**: The logical structure of propagation:
  Flow(a ∧ b) ≤ c ⟺ a ≤ Flow(b ⇒ c)
