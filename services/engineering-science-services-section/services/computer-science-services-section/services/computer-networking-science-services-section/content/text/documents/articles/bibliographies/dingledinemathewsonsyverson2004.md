---
authors:
  - Roger Dingledine
  - Nick Mathewson
  - Paul Syverson
publication: Proceedings of the 13th USENIX Security Symposium
key: dingledinemathewsonsyverson2004
reference-type: paper
title: "Tor: The Second-Generation Onion Router"
year: 2004
---

13th USENIX Security Symposium, August 2004.

## Why this is central

This is the design paper for Tor, the onion-routing implementation
this section's `onion-service` term names. It specifies the
circuit-based low-latency overlay (a client builds a multi-hop circuit
through volunteer relays, each hop able to decrypt only one onion
layer and knowing only its immediate neighbors) and, in the same
paper, the rendezvous-point design for a location-hidden service: a
server publishes introduction points through the same relay network
rather than a public IP address, so that neither a client nor a
network observer learns where the server runs.

## What it does not settle

The 2004 paper specifies the first-generation hidden-service design
(what the Tor Project's later documentation calls v2); the current
production onion-service protocol (v3), with a different key exchange
and directory-lookup scheme, is specified in Tor's own proposal and
specification documents published after this paper, which this
section treats as continuing the same architecture without restating
it as a distinct primitive.

## Bridges

- To [onion-service](../../../glossary/terms/onion-service.md), which
  states the rendezvous mechanism as its defining structure.
- To [virtual-private-network](../../../glossary/terms/virtual-private-network.md),
  whose distinction from onion-service (a private tunnel to a known
  peer, versus an anonymizing overlay to an unknown one) this paper's
  design goal makes explicit.
- To danezisdiaz2008, which places onion routing within the broader
  family of anonymous-communication designs.
