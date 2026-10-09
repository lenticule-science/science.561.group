---
name: identity-record
description: The substrate's cryptographic-identity registry entry binding an identity-key to a substrate entity. Per the source at theories/.../predicated-computing/code/structures/identity-record.md the record carries id (= canonical-form hash of public-key-bytes), description, holder, scheme (Ed25519 etc.), public-key-bytes, uses (signing/encryption/both), created-at, valid-from, valid-until, predecessor (for rotation), revocation-status (active/revoked/compromised), revoked-at. The private component is never substrate content.
specializing: entity
realizes:
  - identity-key
  - signature
title: identity-record
---
