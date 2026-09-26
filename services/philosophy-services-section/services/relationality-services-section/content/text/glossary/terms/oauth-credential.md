---
name: "OAuth Credential"
description: "An OAuth credential is a recognized payload carrying a client identity and authentication proof material for an OAuth-style request."
keywords:
  - oauth
date-modified: 2026-09-09
role: structure
proof_refs: []
derives-from: computer/type/computer-recognition
---



An **OAuth credential** is a recognized payload that carries client identity
and authentication proof material for an OAuth-style request. It is distinct
from a bearer token and from a general credential: this carrier only states the
OAuth-style authentication payload described below.

## Definition
- Carrier: a refinement of computer recognition whose `payload` has OAuth
  fields.
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

Concrete credential carrier for OAuth-style authentication at the computer
layer. Encodes client identity and proof material as a recognised payload.

## Proof
- Derived from: [Computer Recognition](../../documents/articles/notes/computer-recognition.md).
- Shows that: treating OAuth credentials as recognitions fits the computer
  recognition semantics while adding concrete fields for authentication.
