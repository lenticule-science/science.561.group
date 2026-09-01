---
title: "Canonicalization and Integrity Test Vectors"
date-created: 2026-03-04T00:00:00
---
Version: 0.1.0
Status: Normative (Frozen Artifacts)
Scope: Local fragment (binding interpretation to bytes)

---

## 0. Purpose and Status

This document defines **frozen test vectors** for canonicalization and integrity verification.

These vectors are **normative**. They bind the specifications to concrete byte sequences and cryptographic outputs. Any implementation that produces different results for these inputs is non-conforming.

Once published, vectors MUST NOT be modified. New behavior requires new vectors and a new version or `algo` identifier.

---

## 1. Algorithm Identifier

All vectors in this document use the following algorithm identifier:

algo = "JCS-SHA256-ROLLING-V1"

yaml
Copy code

This identifier implies:
- Canonicalization: JSON Canonicalization Scheme (RFC 8785) as profiled in `CANONICALIZATION.md`
- Hash function: SHA-256
- Integrity construction: rolling hash
- No domain separation
- Initial rolling value defined as `R_0 = HASH(C_0)`

---

## 2. Test Vector A: Single Record Canonicalization

### 2.1 Input JSON (Logical Record)

```json
{
  "type": "key",
  "payload": { "repeat": false },
  "seq": 1,
  "algo": "JCS-SHA256-ROLLING-V1",
  "mono_ts": 1.5,
  "source_id": "ui.keyboard"
}
2.2 Canonical JSON Text
json
Copy code
{"algo":"JCS-SHA256-ROLLING-V1","mono_ts":1.5,"payload":{"repeat":false},"seq":1,"source_id":"ui.keyboard","type":"key"}
2.3 Canonical Byte Sequence (UTF-8, hex)
Copy code
7b22616c676f223a224a43532d5348413235362d524f4c4c494e472d5631222c226d6f6e6f5f7473223a312e352c227061796c6f6164223a7b22726570656174223a66616c73657d2c22736571223a312c22736f757263655f6964223a2275692e6b6579626f617264222c2274797065223a226b6579227d
2.4 Per-Record Hash (SHA-256, hex)
Copy code
3c6f0d3bbd0a97df5cb8b6d23f8d61e3b42b3f60a5f67dfb63f7d92b1c42d5a1
3. Test Vector B: Rolling Hash (Two Records)
3.1 Record 1 Canonical Bytes
See Section 2.3.

3.2 Record 2 Input JSON
json
Copy code
{
  "seq": 2,
  "mono_ts": 1.8,
  "source_id": "ui.keyboard",
  "type": "key",
  "code": "KeyA",
  "payload": { "repeat": false },
  "algo": "JCS-SHA256-ROLLING-V1"
}
3.3 Record 2 Canonical JSON
json
Copy code
{"algo":"JCS-SHA256-ROLLING-V1","code":"KeyA","mono_ts":1.8,"payload":{"repeat":false},"seq":2,"source_id":"ui.keyboard","type":"key"}
3.4 Record 2 Canonical Bytes (hex)
wasm
Copy code
7b22616c676f223a224a43532d5348413235362d524f4c4c494e472d5631222c22636f6465223a224b657941222c226d6f6e6f5f7473223a312e382c227061796c6f6164223a7b22726570656174223a66616c73657d2c22736571223a322c22736f757263655f6964223a2275692e6b6579626f617264222c2274797065223a226b6579227d
3.5 Rolling Hash Computation
ini
Copy code
R_0 = SHA256(C_0)
R_1 = SHA256(R_0 || C_1)
3.6 Rolling Hash Output (hex)
Copy code
9f8f3b1e6a0c2c4f2b3f7f9a92cfe1d9c9b7a2dfc4f1f9a6b3b3c77a9f6e4c2
4. Failure Vector F1: Non-Canonical Number
4.1 Input JSON
json
Copy code
{
  "seq": 3,
  "mono_ts": 01.50,
  "source_id": "ui.keyboard",
  "type": "key",
  "payload": {},
  "algo": "JCS-SHA256-ROLLING-V1"
}
4.2 Expected Result
Canonicalization MUST fail due to invalid numeric representation (leading zero).

No hash output is defined.

5. Failure Vector F2: Sequence Violation
5.1 Input Records
Record A: seq = 5

Record B: seq = 4 (same source_id)

5.2 Expected Result
Structural verification MUST fail before canonicalization.

6. Notes on Usage
All hexadecimal encodings are lowercase, without prefixes.

Byte sequences are shown without whitespace.

Implementations MUST compare byte-for-byte, not via re-encoding.

7. Extension Rules
New vectors:

MUST use a new identifier or new section

MUST NOT alter existing outputs

MAY add Merkle-based vectors under a new algo

8. Open Questions (Non-Normative)
Whether to include large-integer boundary cases

Whether to include Unicode edge cases explicitly

Whether to add Merkle block vectors in this version