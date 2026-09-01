---
title: Computer Recognition Carrier
id: computer-recognition
role: structure
status: later
derived_from: machine/structure/recognition
proof_refs: []
---



## Definition
- Carrier: program-facing recognitions, derived from the machine [Recognition Carrier](./recognition.md).
- Fields (concrete at the computer layer):
  - `recognition_id` (string/UUID): stable identifier for the recognition.
  - `payload` (object): typed content accepted by the recognised operator (schemas are declared in the wiring plan).
  - `policy_scopes` (array of strings): scopes that authorise subsequent use.
  - `provenance` (object `{actor, origin, trace_ref}`): where the recognition came from and which trace node it binds.
  - `signature` (optional string): signature or MAC over payload+provenance.
  - `expiry` (optional string, ISO-8601 UTC): validity window.
- Purpose: expose recognition requests/results to computer/SDK code without leaking machine internals, while binding policy and provenance.

## Invariants
- Recognition data matches machine recognitions; no additional semantics are introduced.
- Policy/provenance fields are required for any recognition that will be reused across steps.
- Stable under machine validation; failures are represented separately via the computer failure carrier.

## Proof
- Derived from: [Machine Recognition Carrier](./recognition.md).
- Shows that: lifting machine recognitions to the computer layer yields a carrier suitable for program consumption while preserving machine correctness.
