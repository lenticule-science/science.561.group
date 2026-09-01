---
title: Authenticate and Authorize Access
kind: operator
layer: program
status: someday
derived_from:
- machine/operator/recognition
uses:
- program/identity/structure/identity-access-program
- machine/structure/recognition-carrier
- machine/structure/failure-carrier
produces:
- machine/structure/recognition-carrier
- machine/structure/failure-carrier
---

The **Authenticate and Authorize Access** operator runs the core step of the
Identity & Access Program: it validates credentials, applies policy, and
returns an authorised recognition or a failure.

## Inputs
- [RecognitionCarrier](../../../../../documents/articles/notes/recognition-carrier.md) containing
  presented credentials and requested scopes.
- [Identity & Access Program](../../../../../documents/articles/notes/identity-access-program.md)
  wiring that specifies which checks to run.

## Outputs
- [RecognitionCarrier](../../../../../documents/articles/notes/recognition-carrier.md) enriched
  with authorised scopes, audit tags, and topology hints on success.
- [`FailureCarrier`](../../../../../documents/articles/notes/failure-carrier.md) when credentials
  are invalid or policy is violated.

## Behaviour
1. Validate the recognition carrier against the wiring plan (structure, fields).
2. Verify credentials (signature/expiry/issuer) and requested scopes.
3. Apply policy checks (role, separation of duty, topology scope).
4. Emit an enriched recognition carrier on success; otherwise emit a failure
   carrier with origin and violated recognitions.

## Proof
Refines [machine/operator/recognition.md](../../../../relationality-2/ai-generated-relationality/relationality-slop-2026-03-04/phenomena/recognition.md)
by constraining the recognition to identity/policy carriers and requiring an
explicit failure path for invalid credentials or policy violations. The
refinement preserves the kernel’s recognition semantics and failure handling
while specialising to the identity/access domain.
