---

name: error-envelopes
  - "Error envelopes as a design Discipline"
  - "error envelopes as a design discipline"
date-created: 2026-01-06T00:00:00
date-updated: 2026-03-09T00:00:00
---


An error envelope is a stable, versioned interface whose sole job is to communicate failure semantics across boundaries. Adopting one is a promise: clients never need raw text, stack traces, or ad-hoc fields to react to errors. The promise holds only if you honor these constraints:

1) **Structural invariance** — Same top-level fields for every error, regardless of cause/endpoint. Optional fields never invalidate the core shape; no conditional schemas or overloaded meanings.
2) **Two-layer identification** — Human-facing text may change; machine-facing code/identifier is immutable once published. Clients branch on codes, never on text; changing meaning requires a new code.
3) **Semantic codes** — Codes name what is wrong, not how it was detected (e.g., `INVALID_INPUT`, not `JSON_PARSE_ERROR` unless parsing is the contract).
4) **Stable categories** — Coarse, enumerable categories (validation, authorization, conflict, unavailable…) distinct from codes, changing rarely, so clients can reason at a higher level.
5) **Correlation id** — Every envelope carries a correlation identifier generated at ingress and propagated unchanged through logs/traces; surfaced explicitly.
6) **Responsibility clarity** — Envelope makes clear whether the fault is client, system, or dependency to drive retry/escalation decisions without guessing.
7) **Scoped sub-errors** — Additive, scoped details (e.g., per-field validation) that never redefine the top-level error; each uses constrained vocabularies, not free-form prose.
8) **Versioned contract** — Evolution rules are explicit: adding fields is backward-compatible; renames/removals or meaning changes are not. Breaking changes require a new envelope version.
9) **Transport-agnostic** — Same envelope meaning over HTTP, MQ, jobs, or logs; transport statuses are mappings layered on top, not embedded.
10) **Public surface** — Documented, reviewed, and tested like any interface. Tests assert envelope conformance; any internal exception not expressible in the envelope is a design failure.

With these constraints, error envelopes become a stabilizing structure: internal code can evolve, failure handling stays predictable, and clients gain a reliable language for reasoning about what went wrong—without needing to inspect system internals.
