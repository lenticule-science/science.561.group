---
title: "POP3"
description: "Post Office Protocol v3 per RFC 1939. Optional alternative to IMAP for inbound mail."
kind: spec
status: normative
version: "0.3"
---

# POP3

Per RFC 1939 (https://datatracker.ietf.org/doc/html/rfc1939).
Optional alongside IMAP for the captain's specific use cases (e.g., legacy mail providers).

## 1. Operations

- USER, PASS — authentication.
- STAT, LIST, UIDL — message metadata.
- RETR — retrieve message.
- DELE — mark for deletion.
- QUIT — commit deletes and close.

## 2. Substrate translation

Per [imap.md](imap.md) §1: same message cell shape; `imap-folder` becomes `pop3-folder` (typically just "INBOX").

## 3. Implementation

Python: `aiopoplib` or stdlib `poplib`.
Rust: `pop3-rs` or custom.

## 4. Conformance

Round-trip with Dovecot's POP3 module in CI.
