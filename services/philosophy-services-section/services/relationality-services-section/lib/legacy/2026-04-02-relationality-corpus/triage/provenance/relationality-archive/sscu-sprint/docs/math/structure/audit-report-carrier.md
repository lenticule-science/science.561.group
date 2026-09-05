---
name: audit-report-carrier
role: Aggregated summaries over audit events.
inputs: []
outputs:
- id: audit-report-carrier
  name: audit-report
proof_refs: []
introduces: structure
part-of: relational-computer
computer-system-type: primitive
---



## Definition
- Carrier: summaries aggregating [Audit Event](audit-event-carrier.md) entries
  with provenance, state deltas, and integrity checks.
- Fields: set of event ids, aggregation metrics (counts, severities), trace
  spans covered, policy context, integrity hash.

## Invariants
- Completeness: reports reference only existing audit events.
- Integrity: hash covers included events and summary fields.
- Trace scope: report trace span is the union of event spans.

## Proof
- Derived from: [Audit Event Carrier](audit-event-carrier.md).
- Shows that: aggregating audit events yields a report carrier suitable for
  governance and monitoring without altering event semantics.
