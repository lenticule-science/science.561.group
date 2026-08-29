---
title: Identity & Access Program
id: identity-access-program
role: structure
status: someday
derived_from:
- computer/type/documentation-interpreter
proof_refs: []
---


# Identity & Access Program

The **Identity & Access Program** is a computer-layer assembly that runs over
the kernel to authenticate principals and enforce policy on every request. It
packages recognition, wiring, and failure handling into an acyclic program that
can be instantiated by services needing identity and access control.

## Carrier
- **Wiring plan.** A finite acyclic plan over computer operators that sequences
  recognition, credential verification, policy checks, and telemetry hooks
  using [Computer Wiring Plan](../../type/computer-wiring-plan.md).
- **Recognition carriers.** Inputs and outputs that hold authentication claims,
  policy scopes, and audit tags via
  [Computer Recognition](../../type/computer-recognition.md).
- **Failure carriers.** Typed failures emitted when credentials are invalid,
  policy is violated, or wiring constraints are not met, expressed as
  [Computer Failure](../../type/computer-failure.md).

## Behaviour
- Ingest authentication material (tokens/credentials) into a recognition
  carrier.
- Apply recognition and policy checks according to the wiring plan; enrich the
  carrier with audit and topology scope.
- Emit a success carrier for authorised requests, or a failure carrier with
  origin, arguments, and violated recognitions.

## Invariants
- No request is marked authorised without a valid recognition and policy check.
- All failures are emitted as [Computer Failure](../../type/computer-failure.md)
  with sufficient context to audit.
- Wiring remains acyclic and uses only earned kernel operators.

## Proof
This program refines the documentation interpreter by wiring recognition and policy
operators into a concrete identity/access flow. The refinement preserves the
kernel’s acyclicity and failure semantics while specialising inputs/outputs to
identity carriers. A full proof shows that every successful path maintains the
policy and audit invariants, and every unsuccessful path yields a failure
carrier.
