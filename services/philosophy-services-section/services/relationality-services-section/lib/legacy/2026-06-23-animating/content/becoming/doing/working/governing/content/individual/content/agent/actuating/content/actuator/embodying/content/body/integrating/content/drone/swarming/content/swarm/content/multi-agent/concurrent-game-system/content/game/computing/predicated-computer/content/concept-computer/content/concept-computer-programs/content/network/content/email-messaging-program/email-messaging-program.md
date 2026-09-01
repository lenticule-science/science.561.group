---
title: Relational Email and Messaging Program
kind: structure
layer: program
status: someday
derived_from:
- computer/structure/computer-kernel
uses:
- system/structure/recognition-carrier
- system/structure/trace-carrier
produces: []
---

This program treats messages, conversations, and notifications as recognitions
so “inbox” views become relational slices instead of flat lists.

## Behaviour

- Define message, conversation, and notification recognitions with headers,
  bodies, attachments, participants, and threading topology.
- Enforce intake policy: schema checks, identity/auth (DKIM/DMARC), spam/abuse
  checks, and provenance recorded in trace carriers.
- Expose views such as Inbox, Priority, and Muted as queries over the message
  topology and measurements (latency, read/reply rates).

## Intended operators

- Ingest external protocols into recognition carriers with verified provenance.
- Triage, label, snooze, or escalate threads into tasks/runbooks.
- Generate digests and alerts using measurement slices and policy filters.

## Proof
- Derived from: [Computer Kernel](../../../computer/structure/computer-kernel.md).
- Shows that: this program instantiates the computer kernel to realise the described behaviour without extending machine semantics.

