---
title: OAuth Credential
id: oauth-credential
role: structure
status: someday
derived_from: computer/type/computer-recognition
proof_refs: []
---



Concrete credential carrier for OAuth-style authentication at the computer
layer. Encodes client identity and proof material as a recognised payload.

## Definition
- Carrier: refinement of [Computer Recognition](../../type/computer-recognition.md)
  specialising the `payload` to OAuth fields.
- Fields (concrete):
  - `recognition_id` (UUID/string): credential id.
  - `client_id` (string): registered client identifier.
  - `client_secret` (string, optional): secret or proof of possession.
  - `redirect_uri` (string): registered redirect URI.
  - `scopes` (array of strings): requested scopes.
  - `provenance` (object `{actor, origin, trace_ref}`).
  - `signature` (string, optional): signature/MAC over the request.
  - `expiry` (ISO-8601 UTC, optional): credential validity window.

## Invariants
- Client ids/redirect URIs match registry; signatures verify when present.
- Scopes are declared and policy-checked before issuance of tokens.
- All provenance fields are present for audit.

## Proof
- Derived from: [Computer Recognition](../../type/computer-recognition.md).
- Shows that: treating OAuth credentials as recognitions fits the computer
  recognition semantics while adding concrete fields for authentication.
