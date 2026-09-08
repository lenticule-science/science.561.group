---
description: A single adversary presenting many fabricated identities to a peer-to-peer system that lacks a centralized identity authority, gaining influence disproportionate to the real resources the adversary controls.
identity: sybil-attack
name: Sybil Attack
provenance:
  date-created: 2026-09-08
  sources:
    - /home/emsenn/info/lib/emsenn/services/561-group/services/science-services-section/services/engineering-science-services-section/services/computer-science-services-section/services/distributed-systems-science-services-section/content/text/documents/articles/notes/2026/09/08/2026-09-08-note-on-the-study-of-distributed-and-content-addressed-storage-for-censorship-resistance.md
references:
  douceur2002:
    authors:
      - John R. Douceur
    title: The Sybil Attack
    publication: 1st International Workshop on Peer-to-Peer Systems (IPTPS), Springer LNCS 2429
    year: 2002
    url: https://www.freehaven.net/anonbib/cache/sybil.pdf
---
A Sybil attack is a single adversary presenting many fabricated identities to a peer-to-peer system that lacks a centralized identity authority, gaining influence — over routing, voting, or apparent redundancy — disproportionate to the real resources the adversary controls. John R. Douceur's [foundational paper](https://www.freehaven.net/anonbib/cache/sybil.pdf) (IPTPS 2002, Springer LNCS 2429) proves that without a logically centralized identity authority, a single adversary can always present enough distinct identities to control an arbitrarily large fraction of a system's apparent population, except under resource-parity and coordination assumptions the paper shows are unrealistic at internet scale.

This differs from an [eclipse attack](./eclipse-attack.md), which is the same fabricated-identity mechanism aimed at one specific target: an eclipse attack surrounds a single victim node's own view of the network with Sybil identities, while a Sybil attack more generally describes gaining disproportionate influence across the system as a whole (ballot-stuffing a reputation score, appearing to be many independent storage-replica holders, or outvoting honest participants in a consensus mechanism).

The consequence is that a system's redundancy assumption — that data replicated or erasure-coded across several distinct operators is safer than data held by one — fails silently if enough of those apparent operators are actually one adversary's fabricated identities, which is why redundancy alone, without an independent identity check, does not by itself establish resistance to a coordinated single actor: a stated count of "operators holding a copy" is only as trustworthy as the identity scheme that produced the count.
