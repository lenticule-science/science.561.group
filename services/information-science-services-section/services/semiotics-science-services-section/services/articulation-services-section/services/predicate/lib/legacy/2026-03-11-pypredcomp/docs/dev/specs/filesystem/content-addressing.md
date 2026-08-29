---
title: "Content addressing"
description: "SHA-256 over canonical JSON. Cell-id = SHA-256(canonical bytes). Same record on two nodes has the same id by construction."
kind: spec
status: normative
version: "0.1"
---

# Content addressing

Every substrate record is content-addressed: the record's id is the SHA-256 hex digest of its canonical bytes.
This property:

- Two nodes with the same record have the same id.
- Tampering with bytes changes the id.
- Federation peers can sync by id without coordinating namespaces.
- Replication is structurally trivial.

## Grounded in

- [`predicated-computing/theorems/hash-injectivity-under-canonical-form`](../../../../../../../../theories/engineering/theories/tech/theories/computing/theories/predicated-computing/theorems/hash-injectivity-under-canonical-form.md) — the four properties listed above (same record → same id; tampering changes id; federation sync without namespace coordination; structurally trivial replication) are exactly the four engineering consequences of canonical-form hash-injectivity.
  The federation property (§5) and the verify-on-read discipline (§3) rest on the theorem's collision-resistance bound.
- [`predicated-computing/theorems/cache-coherence-via-functorial-projection`](../../../../../../../../theories/engineering/theories/tech/theories/computing/theories/predicated-computing/theorems/cache-coherence-via-functorial-projection.md) — content-addressed records (cells, rules, events sharing the SHA-256 address space per §4) cannot go stale because their content IS their identity; updates are new records with new ids, and consumers track the id they hold.
- See [_patterns/predicated-computing-grounding.md](../_patterns/predicated-computing-grounding.md) for the engineering-layer index.

## 1. Canonical bytes

Per [kernel/canonicalization.md](../kernel/canonicalization.md), canonical JSON has:

- Lexicographic key sort.
- No whitespace beyond intra-string.
- Minimal numeric form.
- UTF-8 encoding.

## 2. Hash

SHA-256, hex-lowercase, 64 chars.

```
id = SHA-256(canonical(record_without_id))
```

The id field is computed without including itself, then re-included to form the final record.

## 3. Verification on read

Every read of a record verifies: the on-disk file's stem must equal SHA-256 of its bytes.
Mismatch: `PCS_CORRUPT_STORE`.

## 4. Address space

Cell-ids, rule-ids, event-ids all share the SHA-256 address space; collisions structurally impossible (negligible probability).

## 5. Federation property

Same record on peer A and peer B has the same id.
`cell/<id>` URL on either peer returns byte-identical content (per [http-addressing.md](../network/http-addressing.md) §9).

## 6. Conformance

Content addressing passes:

1. Hash + recompute round-trips byte-identically.
2. Same record produced on two implementations has same id.
3. Tampering detected on read with `PCS_CORRUPT_STORE`.
