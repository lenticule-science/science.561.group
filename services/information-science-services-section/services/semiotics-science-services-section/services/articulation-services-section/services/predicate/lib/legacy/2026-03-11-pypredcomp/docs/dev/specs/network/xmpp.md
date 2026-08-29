---
title: "XMPP"
description: "Extensible Messaging and Presence Protocol per RFC 6120/6121. Optional driver for additional federation."
kind: spec
status: normative
version: "0.3"
---

# XMPP

Per RFC 6120 (https://datatracker.ietf.org/doc/html/rfc6120) and RFC 6121 (https://datatracker.ietf.org/doc/html/rfc6121).
Optional alongside Matrix for the captain's specific federation needs.

## 1. Substrate cells

```json
{"subject": "xmpp-jid:<jid>", "predicate": "kind", "object": "xmpp-jid", "value": "True"}
{"subject": "xmpp-message:<id>", "predicate": "from-jid", "object": "xmpp-jid:<jid>", "value": "True"}
```

## 2. Operations

- Connect, authenticate (SASL PLAIN/SCRAM).
- Presence (RFC 6121 §4).
- Messages (RFC 6121 §5).
- Roster (RFC 6121 §2).
- Multi-User Chat (XEP-0045).

## 3. Implementation

Python: `slixmpp` or `aioxmpp`.
Rust: `tokio-xmpp`.

## 4. Conformance

Round-trip with prosody / ejabberd in CI.
