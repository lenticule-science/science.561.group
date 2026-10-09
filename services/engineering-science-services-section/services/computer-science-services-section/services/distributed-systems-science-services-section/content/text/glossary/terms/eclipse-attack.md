---
description: An attack in which an adversary populates enough of a victim node's own peer connections or routing-table entries with fabricated identities that the victim's entire view of the network is mediated by the attacker, without the victim detecting anything is wrong.
identity: eclipse-attack
name: Eclipse Attack
date-created: 2026-09-08
provenance:
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
An eclipse attack is an attack in which an adversary populates enough of a victim node's own peer connections or routing-table entries with fabricated identities that the victim's entire view of the network is mediated by the attacker, without the victim detecting anything is wrong. Where a [Sybil attack](./sybil-attack.md) (John R. Douceur, ["The Sybil Attack"](https://www.freehaven.net/anonbib/cache/sybil.pdf), IPTPS 2002, Springer LNCS 2429) describes an adversary gaining disproportionate influence across a system as a whole, an eclipse attack applies the same fabricated-identity mechanism against a single named victim's local view rather than the system's global state — it is the Sybil mechanism aimed, not spread.

In a [Kademlia-style distributed hash table](./distributed-hash-table.md), a node's routing table is built from whichever peers it has happened to contact; an adversary that can win enough of those slots controls what the victim believes the network looks like. Once eclipsed, the attacker can withhold, delay, or falsify every lookup the victim performs — including a lookup meant to locate a redundant copy of removed content — without the victim's own honest behavior revealing anything is wrong, since every response the victim receives still looks like a normal DHT response.

The consequence for censorship resistance is direct: a distributed-hash-table-based system's resistance to a single compelled node is undermined if the same adversary can instead achieve an equivalent result by eclipsing the discovery layer for a specific reader, rather than by compelling a hosting operator. A stated threat model for a censorship-resistant storage system has to name eclipse and Sybil resistance alongside legal and infrastructural takedown resistance, not as an afterthought.
