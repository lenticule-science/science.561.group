---
title: OAuth Token
id: oauth-token
role: structure
status: someday
derived_from: computer/type/computer-recognition
proof_refs: []
---



Token carrier issued after validating OAuth credentials, used to authorise MCP
requests at the computer layer.

## Definition
- Carrier: refinement of [Computer Recognition](../../type/computer-recognition.md)
  scoped to OAuth tokens.
- Fields (concrete):
  - `recognition_id` (UUID/string): token id.
  - `access_token` (string): bearer or proof-of-possession token.
  - `token_type` (string enum): `bearer` or `pop`.
  - `expires_at` (ISO-8601 UTC): expiry time.
  - `scopes` (array of strings): granted scopes.
  - `subject` (string): principal id.
  - `issuer` (string): issuing authority.
  - `signature` (string): signature/MAC over token body.
  - `provenance` (object `{actor, origin, trace_ref}`).

## Invariants
- Signature/issuer verified; expiry respected.
- Granted scopes are a subset of the validated credential scopes.
- Tokens are bound to subject and issuer; provenance recorded for audit.

## Proof
- Derived from: [Computer Recognition](../../type/computer-recognition.md).
- Shows that: issuing tokens as recognitions maintains the recognition model
  while adding concrete OAuth fields for computer-level auth.
