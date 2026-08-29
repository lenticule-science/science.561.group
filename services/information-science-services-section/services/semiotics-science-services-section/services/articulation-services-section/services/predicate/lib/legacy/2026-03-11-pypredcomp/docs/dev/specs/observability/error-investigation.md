---
title: "Error investigation"
description: "UI for tracing a failure. Repair logs, witness chains, related events. The substrate's structured-trace approach to debugging."
kind: spec
status: normative
version: "0.2"
---

# Error investigation

When something goes wrong (a respond errored, a driver failed, a federation merge produced unexpected $\top$), admins need to trace why.
The substrate's witness chain + repair log + event linkage make this structurally tractable.

## Grounded in

- [`predicated-computing/theorems/audit-content-via-inconsistency-sheaf-cohomology`](../../../../../../../../theories/engineering/theories/tech/theories/computing/theories/predicated-computing/theorems/audit-content-via-inconsistency-sheaf-cohomology.md) — investigation queries (§2 per-respond, §3 per-cell, §4 per-driver, §5 per-federation) are sheaf-cohomology computations on the inconsistency sheaf $\mathcal{F}_U^{(\top)}$.
  The disagreement-investigation flow (§5 — local view, each peer's view, resolution options) is the explicit enumeration of $H^0(\mathcal{F}_U^{(\top)})$-classes of $\top$-cells; recurring patterns in the chain are $H^1$-classes when the substrate's regime admits non-trivial cohomology.
- [`predicated-computing/theorems/cost-discipline-reads-free`](../../../../../../../../theories/engineering/theories/tech/theories/computing/theories/predicated-computing/theorems/cost-discipline-reads-free.md) — witness-chain inspection (§3), repair-log examination (§2), and related-event traversal (§6) are reads; they contribute the cost quantale's unit.
  This is what makes investigation a free operation in cost terms — admins can query without budget impact.
  Per [decisions/cost-is-lawvere-quantale.md](../../decisions/cost-is-lawvere-quantale.md).
- See [_patterns/predicated-computing-grounding.md](../_patterns/predicated-computing-grounding.md) for the engineering-layer index.

## 1. Investigation entry points

- An error code returned to a caller.
- An anomaly cell asserted by a subsystem.
- A failed conformance vector.
- An admin's hunch ("something seems off about task:X").

## 2. Per-respond investigation

For an errored respond:

```sh
investigate respond exec-id:<id>
```

Returns:

- The original target / payload / sender.
- The full repair log.
- The error code with explanation from [error-codes.md](../kernel/error-codes.md).
- The fiber state at error time.
- Suggested next steps (per the error code's typical causes).

## 3. Per-cell investigation

For a cell with unexpected value:

```sh
investigate cell:<id>
```

Or via UI: click on the cell in the file browser → "Show witness chain".

Returns the witness chain (per [stdlib/witness.md](../stdlib/witness.md)):

```
cell task:write-spec / status / "open" / true
  ← settled by rule:dispatch-engineering-tasks at ord 12345
    bound by:
      $task = task:write-spec (matched at ord 12340)
      $office = office:engineering (matched at ord 12340)
    signed by personnel:emsenn (signature valid)
  ← prior value at ord 12300:
    cell task:write-spec / status / "None"
```

## 4. Per-driver investigation

For a failed driver:

```sh
investigate driver:smtp-imap
```

Returns:

- Current state (failed, in-flight retry, etc.).
- Restart history with reasons.
- Recent driver-internal errors.
- Configuration cells (with secrets redacted).
- Last successful operation timestamp.
- Recommendation: ("Auth failures suggest password rotated at the provider").

## 5. Per-federation investigation

For a $\top$-cell from disagreement:

```sh
investigate disagreement cell:<id>
```

Shows:

- Local view's value with provenance.
- Each peer's view with provenance.
- Resolution options.

## 6. UI presentation

Web GUI: investigation panel with collapsible sections:

- Summary at top.
- Witness chain (expandable).
- Repair log (filtered for relevance).
- Related events (preceding/following with same target).
- Recommendation.

## 7. Cross-implementation determinism

Both Python and Rust produce byte-identical witness chains for byte-identical state.
Investigation results match across implementations.

## 8. Conformance

Error investigation passes:

1. Each entry point produces useful trace.
2. Witness chain verifies cryptographically.
3. Recommendation captures common cause for the error code.
4. Investigation reproducible across implementations.
