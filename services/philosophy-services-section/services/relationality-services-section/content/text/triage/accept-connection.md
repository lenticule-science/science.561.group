---
title: Accept Connection
id: accept-connection
role: operator
status: someday
derived_from: computer/function/recognition
inputs:
- computer/library/type/mud-session
outputs:
- computer/library/type/mud-session
- computer/type/computer-failure
transformation:
- return
- value
proof_refs: []
---



Admits a new client, establishes a [MUD Session](../type/mud-session.md),
and binds it to the documentation interpreter via the recognition operator.

## Definition
- Inputs: connection request (endpoint + player credentials) plus the current
  session table.
- Outputs: new/updated [MUD Session](../type/mud-session.md) or
  [Computer Failure](../../../computer/type/computer-failure.md).
- Behaviour: validates credentials, allocates a session handle, initialises
  session bindings (starting room, player entity), and registers the session in
  the evaluation state. On failure, emits a computer failure and leaves state
  unchanged.

## Invariants
- Authentication: only authorised clients obtain sessions.
- Isolation: new session starts with clean bindings and no pending commands.
- Failure purity: failures do not mutate session tables/world state.

## Proof
- Derived from: [Computer Recognition](../../../computer/function/recognition.md).
- Uses: [MUD Session](../type/mud-session.md) as the session carrier.
- Shows that: refining computer recognition to admit network clients yields
  session creation consistent with kernel semantics.
