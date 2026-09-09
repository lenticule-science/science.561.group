---
id: message-channel
name: Message channel
type: concept
date-created: 2026-09-09
components:
  - actor
  - resource
  - message
  - channel
requires:
  - entity
  - predication-cell
communication-via: channel
delivers: message
uses: resource
distinction: "The component names are scoped roles in this mechanism, not an identification of all same-named terms across ActivityPub, record authorship, FROG, biology, or GFRTU."
---

# Message channel

A message channel is the directed, causal arrangement through which an actor
transmits an immutable message to a receiving actor. The channel supplies the
medium and ordering constraints; it is not the message. A receiving actor may
read a resource when interpreting a message, but a resource remains a
claim-bearing carrier and is not thereby an operation.

This concept composes the existing scoped terms without replacing their
custody. It makes no universal subclass claim: Thing remains the broad
distinguishable base, Entity remains a relatum in a predication cell, and a
particular computer representation may bind one of these roles to an Entity
only through its declared contract. Message traces retain source, target,
ordering, causality, and observation provenance; a partial trace must still
preserve its witnessed ordering constraints.
