---
title: Accept Connection
id: accept-connection
role: operator
status: someday
inputs:
- computer/library/type/mud-session
outputs:
- computer/library/type/mud-session
- computer/type/computer-failure
transformation:
- return
- value
proof_refs: []
derives-from: computer/function/recognition
description: Admits a new client, establishes a MUD Session, and binds it to the documentation interpreter via the recognition operator.
---



Admits a new client, establishes a [MUD Session](../../../../../../../../engineering-science-services-section/services/computer-science-services-section/services/computer-systems-science-services-section/services/computer-mud-system-engineering-services-section/content/text/documents/mud-server/structure/mud-session.md),
and binds it to the documentation interpreter via the recognition operator.

## Definition
- Inputs: connection request (endpoint + player credentials) plus the current
  session table.
- Outputs: new/updated [MUD Session](../../../../../../../../engineering-science-services-section/services/computer-science-services-section/services/computer-systems-science-services-section/services/computer-mud-system-engineering-services-section/content/text/documents/mud-server/structure/mud-session.md) or
  [Computer Failure](./computer-failure.md).
- Behaviour: validates credentials, allocates a session handle, initialises
  session bindings (starting room, player entity), and registers the session in
  the evaluation state. On failure, emits a computer failure and leaves state
  unchanged.

## Invariants
- Authentication: only authorised clients obtain sessions.
- Isolation: new session starts with clean bindings and no pending commands.
- Failure purity: failures do not mutate session tables/world state.

## Proof
- Derived from: [Computer Recognition](./recognition.md).
- Uses: [MUD Session](../../../../../../../../engineering-science-services-section/services/computer-science-services-section/services/computer-systems-science-services-section/services/computer-mud-system-engineering-services-section/content/text/documents/mud-server/structure/mud-session.md) as the session carrier.
- Shows that: refining computer recognition to admit network clients yields
  session creation consistent with kernel semantics.
