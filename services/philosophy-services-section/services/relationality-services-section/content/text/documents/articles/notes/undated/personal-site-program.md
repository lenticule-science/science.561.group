---
title: Personal Site Program
kind: structure
layer: program
status: someday
uses:
- system/structure/recognition-carrier
- system/structure/trace-carrier
produces: []
derives-from:
  - computer/structure/computer-kernel
description: This program renders a personal site from recognitions so content, links, and provenance are explicit.
---

This program renders a personal site from recognitions so content, links, and
provenance are explicit.

## Behaviour

- Map recognitions (posts, projects, profiles) to site views with traceable
  links.
- Support dynamic updates from the relational graph while preserving what was
  shown when.
- Respect policy/consent for what is published.

## Intended operators

- Generate and publish site pages from queries.
- Record navigation/interactions as recognitions for audit or adaptation.
- Export static snapshots for archiving or sharing.

## Proof
- Derived from: [Computer Kernel](../../../../triage/triage/computer/structure/computer-kernel.md).
- Shows that: this program instantiates the computer kernel to realise the described behaviour without extending machine semantics.
