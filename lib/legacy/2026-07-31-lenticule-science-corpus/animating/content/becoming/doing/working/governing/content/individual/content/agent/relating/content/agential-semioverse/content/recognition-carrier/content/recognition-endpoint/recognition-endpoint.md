---
title: Recognition Endpoint
keywords:
  - recognition
  - endpoint
  - api
layer: spec
status: plan
depends_on:
  - theorem/internal/recognition-operator
  - specifications/recognition-carrier
---

This specification instantiates the **Recognition Operator** as an API surface.
It describes how tools, services, or runbooks accept relational state, criteria, and policies, and return recognition carriers with traces and policy snapshots.

## 1. Inputs

A recognition endpoint accepts:

1. **Relational state reference.** A reference to a concrete `RelationalState` value (path, hash, or identifier) in the sense of the hypertensor/universal‑state specs (a section of the quasicrystalline hypertensor sheaf).

2. **Criterion reference.** A reference to the criterion `ϕ` used for recognition:
   - code, DSL, or configuration describing the judgement,
   - associated documentation that ties it back to internal theorems.

3. **Policy reference.** A reference to the policy `π` drawn from the policy stack, realised as a `PolicySnapshot` in the recognition‑carrier spec:
   - which policy identifiers are active,
   - any runtime parameters or guard settings.

4. **Mode / options.** Optional parameters controlling behaviour, such as:
   - check-only (validate without emitting a new carrier),
   - earn (produce a new carrier if possible),
   - enforce (apply policy decisions to downstream routing).

## 2. Behaviour

Given these inputs, the endpoint must:

- Interpret the state reference as a `RelationalState` value `r`.
- Invoke an implementation of `Rec_{ϕ,π}` from the recognition operator theorem, producing a point in the recognition-carrier structure when recognition succeeds.
- Serialise the resulting recognition carrier into the concrete `RecognitionCarrier` type defined by the recognition‑carrier spec.
- Record any diagnostics when recognition fails (e.g., policy rejection, criterion failure, or trace construction errors).

## 3. Outputs

On success, the endpoint returns:

- a recognition carrier object,
- its trace and policy snapshot (either embedded or referenced),
- provenance information (inputs used, code revision, and time),
- any non-fatal diagnostics.

On failure, it returns:

- status and diagnostics explaining why recognition could not be earned, and
- optionally, partial traces or policy snapshots that help debug the failure.

## 4. Invariants

- **Theorem alignment.**  
  The endpoint must behave as a realisation of `Rec_{ϕ,π}`:
  - soundness: successful responses must have traces and payloads that satisfy
    the recognition operator theorem,
  - idempotence: re-invoking the endpoint with an already-earned carrier and
    the same `(ϕ, π)` must not change the payload,
  - policy monotonicity: making policies stricter must not create new
    successes.

- **Carrier alignment.** All emitted carriers must satisfy the recognition-carrier spec and thus correspond to points in the recognition-carrier structure.

Implementations may expose this behaviour via MCP, HTTP, or other transport, but the relational contract described here is the source of truth.
