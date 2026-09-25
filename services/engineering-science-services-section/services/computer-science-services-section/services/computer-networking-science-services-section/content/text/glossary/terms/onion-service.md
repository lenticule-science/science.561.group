---
description: An onion service is a network service whose location is hidden from both its clients and from network observers, reached through a rendezvous point established via a multi-hop anonymizing circuit rather than a public, routable IP address.
identity: onion-service
name: Onion service
date-created: 2026-09-08
references:
  dingledinemathewsonsyverson2004:
    authors:
      - Roger Dingledine
      - Nick Mathewson
      - Paul Syverson
    title: "Tor: The Second-Generation Onion Router"
    publication: Proceedings of the 13th USENIX Security Symposium
    year: 2004
    url: https://www.usenix.org/conference/13th-usenix-security-symposium/tor-second-generation-onion-router
---
An onion service is a network service whose location is hidden from both its clients and from network observers, reached through a rendezvous point established via a multi-hop anonymizing circuit rather than through a public, routable IP address. [Dingledine, Mathewson, and Syverson's Tor design](../../documents/articles/bibliographies/dingledinemathewsonsyverson2004.md) specifies the mechanism: relays are arranged so that each hop in a circuit can decrypt only one layer of onion-wrapped routing information and knows only its immediate predecessor and successor, and a hidden service publishes introduction points through this same relay network so a client can establish contact without either party learning the other's network location.

An onion service differs from a virtual private network in what each protects: an onion service anonymizes the relationship between a client and a server, neither of which need know the other's location, while a virtual private network authenticates and encrypts a tunnel to a known peer at a known address. It differs from ordinary web hosting reached over Tor as a client-anonymizing proxy in that an onion service also hides the server's own location, not only the client's; see [virtual-private-network](./virtual-private-network.md) and [web-hosting](./web-hosting.md).

Publishing a service as an onion service removes a public IP address and public DNS name as points where a network-level block, a domain seizure, or a hosting-provider takedown can reach the service, since none of those mechanisms names a location the service is actually reachable at. The same rendezvous mechanism that removes those pressure points adds circuit-length latency to every request, which is the trade-off the design paper states explicitly against the location-hiding property gained; see [domain-name-seizure](./domain-name-seizure.md).
