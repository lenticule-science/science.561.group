---
description: A peer-to-peer file-distribution protocol in which downloading peers simultaneously re-upload the pieces they already hold, so total serving capacity scales with the number of active participants rather than depending on one origin server's bandwidth.
identity: bittorrent-distribution
name: BitTorrent Distribution
date-created: 2026-09-08
provenance:
  sources:
    - /home/emsenn/info/lib/emsenn/services/561-group/services/science-services-section/services/engineering-science-services-section/services/computer-science-services-section/services/distributed-systems-science-services-section/content/text/documents/articles/notes/2026/09/08/2026-09-08-note-on-the-study-of-distributed-and-content-addressed-storage-for-censorship-resistance.md
references:
  cohen2003:
    authors:
      - Bram Cohen
    title: Incentives Build Robustness in BitTorrent
    publication: Workshop on Economics of Peer-to-Peer Systems (P2P Econ)
    year: 2003
    url: https://bittorrent.org/bittorrentecon.pdf
---
BitTorrent distribution is a peer-to-peer file-distribution protocol in which a downloading peer simultaneously becomes an uploading peer for the pieces it already holds, so total serving capacity scales with the number of active participants rather than depending on one origin server's bandwidth. Bram Cohen's [design paper](https://bittorrent.org/bittorrentecon.pdf) (Workshop on Economics of Peer-to-Peer Systems, 2003) describes a tit-for-tat piece-exchange mechanism that gives peers that upload generously reciprocal priority in what they receive, discouraging free-riding without a central enforcement authority.

This differs from a client-server or CDN distribution model, where serving capacity is provisioned and paid for by one operator regardless of how many peers are simultaneously downloading, and where that one operator is consequently the single point at which the distribution can be throttled, billed, or shut down.

Because no single origin server bears the full bandwidth cost or is the sole removable point under BitTorrent's design, large bulk collections distributed as torrents — the documented practice of shadow libraries such as Anna's Archive and Library Genesis distributing torrent-backed bulk corpora — remain retrievable as long as any seeding peer remains, independent of whether any particular site hosting the original torrent file itself stays online. What must still be tracked independently is the `.torrent` file or magnet link itself, and the swarm's seed count over time, since a torrent with zero remaining seeders is unrecoverable regardless of the protocol's design.
