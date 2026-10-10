---
title: "Bootstrap-user manifest"
description: "Canonical schema, byte-form, and hashing recipe for the deployment manifest consumed by Phase 3 §4.1 bootstrap-users."
kind: spec
status: normative
version: "0.2"
---


This spec pins the on-disk shape of the **bootstrap-user manifest** — the deployment-time input that Phase 3 §4.1 of [`boot-sequence.md`](boot-sequence.md) reads to provision the initial user set.
The manifest hash is recorded in the substrate (as `(deployment, bootstrap-user-manifest-hash:<hex>) = t`) and gates the idempotence path: an unchanged manifest is a no-op re-boot; a changed manifest is detected and audited.

Cross-implementation byte-identity (Python ↔ Rust) requires that every conforming implementation produce the **same canonical bytes and the same SHA-256 hash** for a given manifest.
This spec is the contract that pins it.

## Grounded in

- [`specs/kernel/canonicalization.md`](../kernel/canonicalization.md) — the manifest's byte form is the canonical-JSON form defined there.
  No separate canonicalization is introduced here.
- [`decisions/canonical-json-conventions.md`](../../decisions/canonical-json-conventions.md) — lexicographic key sort, no whitespace, minimal numeric form.
- [`decisions/content-hash-via-sha256.md`](../../decisions/content-hash-via-sha256.md) — SHA-256 over canonical bytes; lowercase hex digest.
- [`decisions/identity-is-boundary-projection.md`](../../decisions/identity-is-boundary-projection.md) — each user is a boundary entity with four canonical projection fibers.
- [`predicated-computing/theorems/boot-determinism`](../../../../../../../../theories/engineering/theories/tech/theories/computing/theories/predicated-computing/theorems/boot-determinism.md) — boot is a deterministic function of (deployment image, persistent set); a stable manifest hash is necessary for the persistent-set component to be well-defined across implementations.

## 1. Manifest location

The boot harness reads the manifest path from the environment variable `SUBSTRATE_BOOTSTRAP_MANIFEST`.
When the variable is unset, the implementation MUST fall back to a built-in single-captain default (`user:captain`, role `admin`) — the same default surfaced by `init_boot.bootstrap_users.default_manifest()`.
A set-but-missing path is a hard error (`PCM_PAYLOAD_INVALID`); silent fallback to default would mask deployment misconfiguration.

The manifest file is JSON.
The on-disk file MAY contain non-canonical whitespace and key ordering for human authoring; canonicalization happens in-memory before hashing.

## 2. Schema

The manifest is one JSON object with one required key, `users` — an array of zero or more user entries.

```json
{
  "users": [
    {
      "slug":         "user:captain",
      "display_name": "Captain",
      "role":         "admin",
      "capabilities": ["signal:custom:demo"]
    }
  ]
}
```

### 2.1. User entry fields

| Field          | Type         | Required | Constraints                                                                                  |
|----------------|--------------|----------|----------------------------------------------------------------------------------------------|
| `slug`         | string       | yes      | MUST start with `user:`; MUST be unique within the manifest.                                 |
| `display_name` | string       | yes      | UTF-8; non-ASCII characters are permitted and round-trip verbatim through canonicalization.  |
| `role`         | string       | yes      | One of `admin`, `member`, `observer` (matching `init_boot.bootstrap_users.Role`).             |
| `capabilities` | string array | no       | Extra capabilities unioned with the role default. Default `[]`. Order is not significant.    |

Unknown keys at any level are rejected (`PCM_PAYLOAD_INVALID`) — the schema is closed, not open.
This keeps the canonical form stable: a future implementation that silently dropped an unknown key would produce a different canonical hash than one that retained it.

### 2.2. Validation

Implementations MUST reject:

- A missing or non-array `users` value.
- A user entry missing any required field.
- A user entry with an unknown role string.
- Two user entries with the same `slug` within one manifest.
- A `slug` that does not start with `user:`.
- Any unknown top-level or per-entry key (closed schema).

Validation failures surface as `PCM_PAYLOAD_INVALID` with the offending field path in `details`.

## 3. Canonical form

The canonical form is what gets hashed.
It is **derived** from the loaded manifest (after schema validation) and is independent of the on-disk file's whitespace, key order, or capability ordering.

### 3.1. Construction

The canonical form is the JSON object:

```
{
  "users": [
    { "capabilities": [<sorted strings>],
      "display_name": <string>,
      "role":         <string>,
      "slug":         <string> },
    ...
  ]
}
```

with the following normalisations:

1. **Users array** sorted lexicographically by `slug` (UTF-8 byte order).
2. **Capabilities array** within each user sorted lexicographically (UTF-8 byte order).
3. Each user entry carries **exactly the four fields** above — no more, no less.
  An entry whose source omitted `capabilities` carries `"capabilities": []` in the canonical form.
4. The keys appear in lexicographic order — guaranteed by the canonicalization layer's `sort_keys` rule per [`canonicalization.md`](../kernel/canonicalization.md) §1.

### 3.2. Byte form

Apply [`specs/kernel/canonicalization.md`](../kernel/canonicalization.md) §1 to the canonical-form dict:

- Object keys sorted lexicographically.
- No inter-token whitespace.
- UTF-8 encoded.
- `ensure_ascii=False` — non-ASCII characters appear verbatim, NOT as `\uXXXX` escapes.
- Numbers in minimal canonical form (no numeric fields appear in the manifest schema today, but the rule applies to any future additions).

The reference Python implementation at [`init_boot.bootstrap_users.canonical_manifest_bytes`](../../../../src/init_boot/bootstrap_users.py) returns the canonical bytes; conforming Rust / Go / JavaScript implementations MUST produce byte-identical output.

### 3.3. Hashing

The manifest hash is the lowercase hex SHA-256 digest of the canonical bytes:

```python
hashlib.sha256(canonical_manifest_bytes(manifest)).hexdigest()
```

The Python reference is [`init_boot.bootstrap_users.manifest_hash`](../../../../src/init_boot/bootstrap_users.py).

## 4. Substrate-cell encoding

After computing the hash `<H>`, the bootstrap routine asserts the cell:

```
(deployment, bootstrap-user-manifest-hash:<H>, t)
```

When a re-boot detects a different prior hash, it FIRST asserts:

```
(deployment, bootstrap-user-manifest-changed, t)
```

then asserts the new `bootstrap-user-manifest-hash:*` cell.
The change cell is the audit-trail anchor: an interrupted boot leaves the change-marker visible without requiring the new hash cell to have landed.

## 5. Conformance

A conforming implementation MUST:

1. Reject every malformed manifest enumerated in §2.2 with `PCM_PAYLOAD_INVALID`.
2. Produce the canonical bytes defined in §3 byte-identically with the reference Python implementation.
3. Produce the SHA-256 hash defined in §3.3 byte-identically.
4. Emit the substrate cell defined in §4 on first boot and on every detected change.
5. Be idempotent across re-boots when the manifest hash is unchanged: zero new substrate events from the bootstrap-user routine.
  The full byte-grain idempotence claim is exercised by [`tests/conformance/test_t02_141f_bootstrap_users_idempotence.py`](../../../../tests/conformance/test_t02_141f_bootstrap_users_idempotence.py).

The pinning vector (a sample manifest plus its expected canonical bytes plus its expected hash) lives at [`tests/fixtures/bootstrap/manifest-3-users.json`](../../../../tests/fixtures/bootstrap/manifest-3-users.json), with witnesses pinned by [`tests/conformance/test_t02_142f_bootstrap_manifest_canonicalization.py`](../../../../tests/conformance/test_t02_142f_bootstrap_manifest_canonicalization.py).
Cross-implementation diversity per [`decisions/trusting-trust-bootstrap-path.md`](../../decisions/trusting-trust-bootstrap-path.md) replays this fixture against the Rust sibling once the Rust port covers bootstrap.

## 6. What this spec does not cover

- **Token delivery.** Per `boot-sequence.md` §4.1, plaintext bearer tokens for newly-created users are delivered out-of-band via `$SUBSTRATE_CAPTAIN_TOKEN_FILE` or the boot log; the substrate retains only the bcrypt digest.
  The manifest does not carry tokens.
- **Lifecycle changes.** User retirement, role changes, capability grants/revokes after first boot go through `respond` per [`decisions/single-respond-primitive.md`](../../decisions/single-respond-primitive.md).
  The manifest is *bootstrap-only*; a manifest mutation never edits an existing user.
- **Per-deployment policy.** Capability sets beyond the role-default union are deployment policy, not substrate semantics.
  The schema admits arbitrary capability strings; the substrate's authorization layer enforces them per [`specs/security/capability-model.md`](../security/capability-model.md).
