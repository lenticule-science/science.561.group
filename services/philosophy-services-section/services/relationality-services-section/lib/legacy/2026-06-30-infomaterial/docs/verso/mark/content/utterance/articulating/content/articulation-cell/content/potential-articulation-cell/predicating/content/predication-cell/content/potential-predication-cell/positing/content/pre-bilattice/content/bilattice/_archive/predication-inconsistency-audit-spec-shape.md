---
title: "Inconsistency / H¹ audit: §-section of sigma-delta-passes.md or sibling spec?"
description: "substrate/inconsistency.py exists; specs/kernel/ has no inconsistency-audit.md. Default disposition is to add a §-section to sigma-delta-passes.md; captain may overrule."
kind: question
status: agent-discharged
opened: 2026-05-02
opened-by: agent
default-disposition: "Add §-section to specs/kernel/sigma-delta-passes.md."
---

# Inconsistency / H¹ audit — spec shape

## Context

`pypredcomp/src/substrate/inconsistency.py` ships an H¹ audit pass. No
`specs/kernel/` document covers it by name; the substance is grounded
in [`regime-classification-is-load-bearing`](../decisions/regime-classification-is-load-bearing.md)
(audit is a regime concern) and in
`specs/kernel/sigma-delta-passes.md` (the σ/Δ machinery the audit
operates against).

## Options

1. **§-section of `specs/kernel/sigma-delta-passes.md`.** The audit is
   a third pass in the same family (σ saturates, Δ stabilises, H¹
   audits the result for inconsistency cohomology). One document, one
   reading order.
2. **Sibling `specs/kernel/inconsistency-audit.md`.** The audit is
   conceptually separate from σ/Δ closure; it operates on the result
   rather than producing the result. A separate document is cleaner
   for cross-references and for future expansion (e.g., higher
   cohomology, sheaf-cohomology over the federation graph).

## Agent's discharge

**Default: §-section of `sigma-delta-passes.md`.** Reasons:

- The audit shares fuel envelope semantics with σ and Δ (see `cost.py`).
- The audit's emission discipline is the same (cells with `derived_via = "h1-audit"` and standard repair-log markers).
- The reader who reaches σ/Δ is the reader who needs to know about H¹ audit.

If higher cohomology lands later (H²+, sheaf-cohomology), a sibling
document SHOULD be split out at that time.

## Captain's answer

(captain may overrule the default; if no answer is given, the agent
proceeds with the §-section disposition during the next records pass.)

## Discharge (2026-05-02)

Discharged by **both** dispositions:

- **§-section** — added to [specs/kernel/sigma-delta-passes.md](../specs/kernel/sigma-delta-passes.md) §9 "H¹ audit pass", recording the pass's relationship to σ/Δ, the regime-determined cohomology routine, the repair-log codes, and four conformance gates.
- **Sibling spec** — written as [specs/kernel/inconsistency-repair.md](../specs/kernel/inconsistency-repair.md), covering the lifecycle of an `InconsistencyWitness` (detection → source-classification → optional `repair_resolution`), the projection to $H^0/H^1$, federation interaction, and conformance gates.

The split is justified retrospectively: the §-section in `sigma-delta-passes.md` records the *pass shape* (when it runs, what repair-log codes it emits, how it composes with σ and Δ); the sibling spec records the *witness lifecycle* (detection sites, source classification, repair-resolution discipline). Both reference the same source module ([`src/substrate/inconsistency.py`](../../../src/substrate/inconsistency.py)).

Status: closed.
