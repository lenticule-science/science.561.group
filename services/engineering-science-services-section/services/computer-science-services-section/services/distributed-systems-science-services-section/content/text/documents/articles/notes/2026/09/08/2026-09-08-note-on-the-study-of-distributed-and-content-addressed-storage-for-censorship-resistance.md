---
title: "Study of Distributed, Content-Addressed, and Peer-to-Peer Storage for Censorship Resistance"
description: "A web-verified literature study establishing the primary sources for the distributed-systems-science section's founding vocabulary: content addressing (Benet 2014; Merkle 1987), the Kademlia distributed hash table (Maymounkov & Mazières 2002), replication versus erasure coding (Weatherspoon & Kubiatowicz 2002), data availability versus data durability (Kleppmann 2017; AWS S3 2026 documentation), pinning and incentivized storage (IPFS, Filecoin, Arweave, Storj, Sia first-party sources), censorship resistance as a property defined against a takedown threat model (Clarke et al. 2001; Dingledine et al. 2004), eclipse and Sybil attacks (Douceur 2002), web archiving (ISO 28500), BitTorrent-distributed collections (Cohen 2003), and git mirroring via the Software Heritage SWHID (Di Cosmo et al. 2020; ISO/IEC 18670:2025)."
date-created: 2026-09-08
type: notes
name: 2026-09-08-note-on-the-study-of-distributed-and-content-addressed-storage-for-censorship-resistance
authors:
  - claude-sonnet-5
status: draft-for-review
keywords: ["content-addressing", "distributed-hash-table", "erasure-coding", "data-availability", "data-durability", "pinning", "incentivized-storage", "censorship-resistance", "sybil-attack", "eclipse-attack", "web-archiving", "bittorrent-distribution", "git-mirroring"]
tags: ["draft", "study"]
---

This study is read for one purpose: to establish, for each term this
section's glossary admits, a real published source with a verified
author list, venue, and date, so no term is written from unsourced
recall. Method: web-verified citations against primary or first-party
pages, dated at the point of this study (2026-09-08). Anything not
verifiable to a primary source is marked **[UNVERIFIED]** inline and
carried at that tier or omitted from the term body.

The occasion for this study is recorded, once, here rather than
distributed across the terms themselves: on 2026-08-26 the US State
Department designated Autistici/Inventati (A/I), an Italian volunteer
collective that had run email, hosting, and anonymity services for
activists since 2001, a Specially Designated Global Terrorist under
Executive Order 13224 ([A/I press release, 2026-08-28](https://www.inventati.org/campaign/press)).
PayPal and Banca Etica cut the organization's accounts in the following
days and the `autistici.org` domain was deleted; A/I announced closure
on 2026-09-06. The terms below state the general science of keeping a
corpus retrievable when a single domain, host, or payment processor can
be compelled to remove it — not A/I's specific case, which belongs in
the dated operational note this study feeds.

## 1. Content addressing: the structural primitive (Merkle 1987; Benet 2014)

Already ruled upstream in the engineering tree at
[`news-media-engineering-services-section/.../glossary/terms/content-addressing.md`](../../../../../../../../../../../../../../../engineering-services-section/services/computer-engineering-services-section/services/computer-data-engineering-services-section/services/computer-content-engineering-services-section/services/computer-news-content-engineering-services-section/content/text/glossary/terms/content-addressing.md)
and [`.../merkle-tree.md`](../../../../../../../../../../../../../information-science-services-section/services/communication-science-services-section/services/media-science-services-section/services/news-media-science-services-section/content/text/glossary/terms/merkle-tree.md),
both citing Ralph Merkle's
["A Digital Signature Based on a Conventional Encryption Function"](https://link.springer.com/chapter/10.1007/3-540-48184-2_32),
CRYPTO '87 (Springer LNCS 293, 1987), for the hash-tree primitive, and
Juan Benet's
["IPFS - Content Addressed, Versioned, P2P File System"](https://arxiv.org/abs/1407.3561)
(arXiv:1407.3561, 2014, **[UNVERIFIED as peer-reviewed]** — unrefereed
preprint) for the content-addressed block store built on a generalized
Merkle DAG, with the CID/multihash identifier format specified at the
[CID specification](https://specs.ipfs.tech/cid/) (practitioner-maintained
living spec, not standards-track). Per the science-topic-section-model's
upstream ladder, this science section states the primitive once, here,
and the engineering term is a downstream specialization that should link
up rather than restate — a re-pointing this study recommends but does not
perform (custody: the engineering carrier belongs to the news-media
engineering section, not to this science seat).

## 2. Distributed hash tables: Kademlia (Maymounkov & Mazières, 2002)

Petar Maymounkov and David Mazières,
["Kademlia: A Peer-to-Peer Information System Based on the XOR Metric"](https://link.springer.com/chapter/10.1007/3-540-45748-8_5),
1st International Workshop on Peer-to-Peer Systems (IPTPS), Cambridge,
MA, March 2002, published in Springer LNCS 2429, specifies a
distributed hash table with provable consistency and performance in a
fault-prone peer population, routing lookups by an XOR-distance metric
over node identifiers so that every message exchanged also refines the
sender's own routing table. This is the discovery-layer pattern the
Group's own architecture notes already cite as the internet-scale
peer/provider-discovery layer standard stacks such as libp2p build from
(`operations-services-section/.../2026-07-11-note-on-metroplat-system-architecture-design.md`,
§7.4/§7.5, AD-37/AD-38) — a prior citation this study confirms rather
than restates. Kademlia answers "where is the node holding this
content-addressed block," a distinct question from "does a copy of the
block still exist anywhere," which the replication and erasure-coding
literature below answers.

## 3. Replication versus erasure coding (Weatherspoon & Kubiatowicz, 2002)

Hakim Weatherspoon and John Kubiatowicz,
["Erasure Coding vs. Replication: A Quantitative Comparison"](https://www.cs.cornell.edu/people/egs/iptpsarchive/www.cs.rice.edu/Conferences/IPTPS02/170.pdf),
IPTPS 2002, Springer LNCS 2429, quantitatively compares whole-copy
replication against Reed-Solomon-style erasure coding for
peer-to-peer storage durability and finds that, for equal storage and
bandwidth budgets, an erasure-coded system's mean time to an
unrecoverable loss is many orders of magnitude higher than a
replicated system's, and that erasure coding reaches a given
durability target using roughly an order of magnitude less storage and
bandwidth than replication does. The distinction the paper draws —
replication stores whole copies (simple, but redundancy scales
linearly with copy count) versus erasure coding stores fragments from
which any sufficient subset reconstructs the whole (bandwidth- and
storage-efficient, but reconstruction requires fetching multiple
fragments from multiple operators, raising latency and coordination
cost per read) — is the reason production systems (Filecoin's sector
sealing, most object-storage backends) default to erasure coding for
bulk data while keeping replication for small, latency-sensitive
metadata.

## 4. Data availability versus data durability (Kleppmann 2017; AWS 2026)

Martin Kleppmann's *Designing Data-Intensive Applications* (O'Reilly,
2017, ISBN 978-1-4493-7332-0) treats availability and durability as
distinct reliability properties of a storage system throughout Chapter
1 and Chapter 5: availability is whether a system continues to respond
correctly to reads and writes despite faults, a property measured over
a time window (fraction of requests served, or uptime percentage);
durability is whether written data survives indefinitely once
acknowledged, a property that concerns permanent loss rather than
temporary unresponsiveness — a system can be unavailable (offline
right now) without being non-durable (the data is still there once it
comes back), and conversely a system can appear available while
silently losing data that will never be recoverable. Amazon's own S3
documentation states this distinction numerically and separately for
one concrete system: S3 states it is "designed to provide 99.999999999%
durability and 99.99% availability of objects over a given year"
([AWS, "Data protection in Amazon S3," S3 User Guide, accessed
2026-09-08](https://docs.aws.amazon.com/AmazonS3/latest/userguide/DataDurability.html)) —
eleven nines of durability against roughly four nines of availability,
the same order-of-magnitude gap Kleppmann's definitions predict,
because durability is computed over redundant copies surviving loss
events while availability also depends on the request-serving path
being reachable at the moment of a request.

## 5. Pinning (IPFS first-party docs; pinning-service pricing)

IPFS's own documentation states that a node running the default
garbage collector may reclaim any block not explicitly protected, and
that "pinning" is the act of marking a block (and everything it
transitively references in its Merkle DAG) as ineligible for garbage
collection — the mechanism by which a peer commits to keep serving a
specific piece of content rather than merely caching whatever passed
through it recently ([IPFS docs, "Pinning," accessed
2026-09-08](https://docs.ipfs.tech/how-to/pin-files/)). Because IPFS
itself provides no economic incentive for a random peer to keep
serving unpopular content, pinning in practice means paying a pinning
service to run that commitment on the requester's behalf; first-party
pricing pages give concrete, dated numbers: Pinata's "Picnic" plan
lists 1&nbsp;TB of pinned storage for $20/month ([Pinata pricing blog,
accessed 2026-09-08](https://pinata.cloud/blog/pinatas-new-pricing-no-more-pin-limits-more-storage-for-less/)),
and Storacha (formerly web3.storage) lists 100&nbsp;GB for $10/month
at its "Medium" tier (**[UNVERIFIED against Storacha's own pricing
page]** — sourced via aggregator, not fetched first-party in this
pass). Pinning inherits IPFS's content-addressing guarantee (an
identifier that never silently changes) but adds no durability beyond
"as long as whoever is paying keeps paying" — the operator holding the
pin is a single point of both cost and potential compulsion, exactly
the property censorship resistance (§8) needs to be evaluated against.

## 6. Incentivized storage: Filecoin, Arweave, Storj, Sia

**Filecoin** replaces "trust the pinning operator" with a
cryptographic proof market. Its own specification describes two
proofs a storage provider must produce: proof-of-replication (PoRep),
generated once when a provider seals a unique physical copy (a
"sector") of a client's data and commits to it on-chain, and
proof-of-spacetime (PoSt), a recurring challenge-response the provider
must keep answering to prove the sealed copy is still present
([Filecoin Spec, "Proof-of-Storage," accessed
2026-09-08](https://spec.filecoin.io/algorithms/pos/)). Filecoin's own
2025/2026 "Filecoin Onchain Cloud" announcement states an
early-adopter storage rate of $2.50 per TiB per month for a minimum of
two replicated copies ([Filecoin blog, "Introducing Filecoin Onchain
Cloud," accessed 2026-09-08](https://www.filecoin.io/blog/introducing-filecoin-onchain-cloud)) —
a price, not a durability guarantee; durability is instead whatever
the PoSt challenge-failure penalty schedule enforces per deal, and this
study did not verify a single stated numeric durability SLA equivalent
to AWS S3's eleven nines.

**Arweave** takes the opposite economic shape: a single upfront
payment rather than a recurring rent. Its own yellow paper describes
an "endowment" mechanism in which a fraction of each storage
transaction's fee is held back and distributed to miners over time,
sized against a modeled long-run decline in the per-byte cost of
storage (the "Kryder rate"), so that the endowment's real purchasing
power is projected to still cover storage cost decades after the
one-time payment ([Arweave yellow paper, arweave.org, accessed
2026-09-08](https://www.arweave.org/files/arweave-yellowpaper.pdf)).
This is a modeled economic projection, not a guarantee backed by a
contractual SLA or an insurance-style durability figure; it depends on
the Kryder-rate assumption continuing to hold and on miners continuing
to find storing Arweave's history profitable.

**Storj** publishes a conventional, non-speculative usage price on its
own pricing page: $0.0070 per GB-month for storage under its current
tiered pricing ([Storj Docs, "Pricing Overview," accessed
2026-09-08](https://storj.dev/dcs/pricing/tiered)) — roughly $7/TB-month,
achieved by splitting each uploaded file into erasure-coded pieces
(§3) distributed across independent, uncoordinated storage-node
operators, so no single node holds a complete copy.

**Sia** is architecturally similar to Storj (renter contracts with
independent hosts, redundancy via erasure coding), and secondary
reporting places typical realized prices around $1-2 per TB-month
(**[UNVERIFIED against a first-party Sia pricing page in this pass]** —
Sia's own documentation states hosts set their own prices
competitively rather than publishing one network-wide rate, so no
single first-party number applies uniformly).

## 7. Censorship resistance as a property, against a stated threat model

Ian Clarke, Oskar Sandberg, Brandon Wiley, and Theodore W. Hong,
["Freenet: A Distributed Anonymous Information Storage and Retrieval
System"](https://link.springer.com/chapter/10.1007/3-540-44702-4_4),
Designing Privacy Enhancing Technologies (Springer LNCS 2009, 2001),
describes a network of identical nodes that collectively store and
route requests for content with no single node — and, by the paper's
own design goal, no single legal or physical actor — able to identify
or remove all copies of a given piece of data, explicitly naming
resistance to censorship as the system's design goal rather than an
incidental property. Roger Dingledine, Nick Mathewson, and Paul
Syverson, ["Tor: The Second-Generation Onion Router"](https://www.usenix.org/legacy/publications/library/proceedings/sec04/tech/dingledine.html),
13th USENIX Security Symposium, San Diego, August 2004, addresses a
narrower but related property — resistance to identifying *who*
requested or published content, via layered circuit encryption and
distributed directory servers rather than a single rendezvous point an
adversary could compel or seize. Read together, these two papers
motivate a definition this section's `censorship-resistance` term
states explicitly: resistance to a specific, named removal
mechanism — domain seizure (no single DNS registrant to compel),
host compulsion (no single hosting operator to serve a legal order
to), a DMCA-style notice-and-takedown regime (no single named
respondent), or a sanctions listing that cuts payment rails (no single
payment processor the system depends on) — never resistance in the
abstract, since no system is resistant to every conceivable adversary.

## 8. Eclipse and Sybil attacks: the failure modes DHT/P2P resistance assumes away

John R. Douceur,
["The Sybil Attack"](https://www.freehaven.net/anonbib/cache/sybil.pdf),
IPTPS 2002, Springer LNCS 2429, proves that without a logically
centralized identity authority, a single adversary can always present
enough distinct fabricated identities to control an arbitrarily large
fraction of a peer-to-peer system's apparent population, except under
resource-parity and coordination assumptions the paper shows are
unrealistic at internet scale — a Sybil attack is this specific
failure: one real actor, many apparent peers. An eclipse attack is the
Sybil attack applied to a specific structural target — an adversary
populates enough of a victim node's own routing-table entries (in a
Kademlia-style DHT, §2) with Sybil identities that the victim's view of
the network is entirely mediated by the attacker, who can then
withhold, delay, or falsify every lookup the victim performs without
the victim detecting that anything is wrong. Both attacks matter to
censorship resistance directly: a DHT or pinning-swarm's resistance to
a single-domain takedown (§7) is undermined if the same adversary can
instead achieve an equivalent result by Sybil-flooding the discovery
layer, so a system's stated threat model has to name whether it counts
identity-flooding, not just legal or infrastructural compulsion, among
the removal mechanisms it claims resistance to.

## 9. Web archiving: WARC (ISO 28500) as distinct from mirroring

The Web ARChive (WARC) file format is an ISO standard —
[ISO 28500:2017, "Information and documentation — WARC file
format"](https://www.iso.org/standard/68004.html) (second edition,
revising the original ISO 28500:2009) — specifying a container that
bundles harvested HTTP responses together with the request that
produced them and crawl metadata, developed by the International
Internet Preservation Consortium and used as the storage format
underlying the Internet Archive's Wayback Machine and comparable
services such as Perma.cc. Web archiving in the WARC sense captures a
point-in-time, byte-exact record of what a server returned, including
the transaction envelope, and is distinct from mirroring: a mirror
reproduces a site's current *serving* behavior (so it can go stale
silently as the origin changes and gives no evidence of what was
served on any specific past date), while a WARC capture is a dated,
replayable record of one specific request-response pair whose replay
does not depend on the original server still existing.

## 10. BitTorrent-distributed collections (Cohen 2003)

Bram Cohen,
["Incentives Build Robustness in BitTorrent"](https://bittorrent.org/bittorrentecon.pdf),
Workshop on Economics of Peer-to-Peer Systems (P2P Econ), Berkeley, May
2003, describes the protocol's tit-for-tat piece-exchange design: a
downloading peer becomes an uploading peer for the pieces it already
has, so the system's total serving capacity grows with its number of
active participants rather than depending on one origin server's
bandwidth, and peers that upload generously are given reciprocal
priority, discouraging free-riding without a central enforcement
authority. This mechanism is the documented basis for large shadow and
para-library collections such as Anna's Archive and Library Genesis
distributing bulk torrent-backed corpora rather than serving every
download from centrally operated infrastructure — a practice this
study records as a documented pattern (own public statements of those
projects describing torrent-backed bulk distribution) rather than as
independently peer-reviewed research, since the underlying claim being
cited is Cohen's protocol paper, not a study of those specific
collections.

## 11. Git mirroring and the Software Heritage SWHID

Roberto Di Cosmo, Morane Gruenpeter, and Stefano Zacchiroli,
["Referencing Source Code Artifacts: a Separate Concern in Software
Citation"](https://arxiv.org/abs/2004.00514), published in *Computing
in Science & Engineering* (2020), describes the Software Heritage
persistent identifier (SWHID) as an intrinsic identifier — derived
from an artifact's own content hash, not from where it is hosted — for
every object (file content, directory, revision, release, snapshot)
the Software Heritage archive has crawled from source-code forges
including GitHub, GitLab, and package registries; the identifier
format reached ISO/IEC international standard status as ISO/IEC 18670
in 2025 ([Software Heritage, "Software Heritage Archive recognized as
a digital public good," accessed
2026-09-08](https://www.softwareheritage.org/2026/01/21/software-heritage-archive-digital-public-good/)).
Git itself is content-addressed by construction — every commit,
tree, and blob is named by the SHA hash of its own bytes plus the
hashes of what it references, so two independent clones of the same
history are byte-identical and self-verifying without a Merkle-DAG
library bolted on, per the tree's own prior study
(`engineering-services-section/.../git-services-section/content/text/documents/articles/notes/git-as-provenance-structure.md`,
§"Content addressing"). Git mirroring — running `git clone --mirror`
of a repository to an independent host — therefore inherits
content-addressing's tamper-evidence for free; the SWHID adds an
archive that is itself distributed (mirrored to multiple independent
storage backends by Software Heritage's own operational design) and a
citable, resolvable identifier independent of whether the original
forge or repository still exists.

## Verification note

Verified 2026-09-08 against primary or first-party pages reached by
WebSearch and, for one page, WebFetch: the ACM/Springer/USENIX/arXiv
record for every academic paper cited (Merkle 1987, Maymounkov &
Mazières 2002, Weatherspoon & Kubiatowicz 2002, Douceur 2002, Clarke et
al. 2001, Dingledine et al. 2004, Cohen 2003, Benet 2014, Di Cosmo et
al. 2020); the ISO catalogue record for ISO 28500:2017; and first-party
documentation or blog pages for every priced or numeric claim about a
live service (AWS S3 durability/availability page, IPFS pinning docs,
Pinata pricing blog, Filecoin spec and blog, Arweave yellow paper,
Storj pricing docs, Software Heritage's own announcement). Three items
remain **[UNVERIFIED]** and are marked inline rather than silently
carried as fact: Benet's IPFS preprint's peer-review status (confirmed
still an arXiv preprint, no refereed venue found), Storacha's exact
current pricing (sourced via an aggregator, not fetched first-party),
and Sia's network-wide realized price (Sia's own docs state hosts
price independently, so no single first-party network rate exists to
verify against). No numeric claim in this note is carried without a
dated source next to it.
