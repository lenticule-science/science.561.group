---
authors:
  - George Danezis
  - Claudia Diaz
publication: Microsoft Research Technical Report MSR-TR-2008-35
key: danezisdiaz2008
reference-type: report
title: "A Survey of Anonymous Communication Channels"
year: 2008
---

Microsoft Research Technical Report MSR-TR-2008-35, February 2008.

## Why this is central

Danezis and Diaz survey the field of anonymous-communication design
from Chaum's 1981 mix-net proposal forward, organized by underlying
mechanism (semi-trusted relays, mix systems, remailers, onion routing,
robust-mixing systems) and by the threat and usage model each family
provides. The survey's load-bearing claim for this section's
`email-metadata` term is that content encryption and traffic-analysis
resistance are separate properties: an adversary positioned on the
network can learn who communicates with whom, how often, and when,
from routing and timing metadata alone, whether or not the message
content is encrypted, and the systems the survey catalogs are
precisely the ones built to resist that inference rather than only to
hide content.

## What it does not settle

The survey is a 2008 snapshot of the field; it predates and does not
cover Signal's Double Ratchet, WireGuard, or the current Tor onion-service
design (v3), each specified after 2008 and each covered by this
section under its own citation. It states the general metadata problem
and the design families that address it, not a complete or current
census of deployed systems.

## Bridges

- To [email-metadata](../../../glossary/terms/email-metadata.md), whose
  distinction from `end-to-end-encryption` rests on this survey's
  central claim.
- To [onion-service](../../../glossary/terms/onion-service.md), one
  member of the onion-routing family this survey names, specified in
  full by dingledinemathewsonsyverson2004.
