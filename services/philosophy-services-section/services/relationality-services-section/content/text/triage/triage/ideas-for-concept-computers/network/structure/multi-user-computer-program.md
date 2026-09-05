---
title: Multi-User Computer Program
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

This program specifies multi-user operation of the relational computer so
identities, sessions, and isolation are explicit.

## Behaviour

- Represent users, sessions, permissions, and resource allocations as
  recognitions with provenance.
- Enforce isolation and policy boundaries between users while sharing the
  kernel and system carriers.
- Track audit trails of user actions and shared artefacts.

## Intended operators

- Create/manage users and sessions with policy bindings.
- Allocate resources and enforce quotas; mediate shared objects.
- Audit multi-user activity and resolve conflicts.

## Proof
- Derived from: [Computer Kernel](../../../computer/structure/computer-kernel.md).
- Shows that: this program instantiates the computer kernel to realise the described behaviour without extending machine semantics.
