---
title: "Capturing a Threatened Corpus into Distributed Datastores"
description: "For a corpus of tens of thousands of text documents plus generated PDFs, the measured tradeoffs among the mechanisms this section's glossary states — self-hosted git mirroring, the Software Heritage archive, IPFS pinning, incentivized storage (Filecoin, Arweave), BitTorrent distribution, and WARC web archiving — against cost per GB-year, durability guarantee, who can compel removal, what an operator must run, and the pinning operator's own legal exposure, ending in a ranked recommendation for the house."
date-created: 2026-09-08
type: notes
name: 2026-09-08-note-on-capturing-a-threatened-corpus-into-distributed-datastores
authors:
  - claude-sonnet-5
status: draft-for-owner-review
keywords: ["censorship-resistance", "pinning", "incentivized-storage", "web-archiving", "bittorrent-distribution", "git-mirroring"]
tags: ["draft", "note"]
---

This note applies this section's terms to one bounded operational
question: for a corpus on the order of tens of thousands of text
documents plus generated PDFs, what are the actual, measured options
for keeping the corpus retrievable if the operator currently serving
it — one domain, one host, one payment processor — is compelled or
removed, and what does the house get and give up for each. The
occasion is Autistici/Inventati's 2026-08-26 designation and
2026-09-06 closure (recorded fully in this section's
[study note](2026-09-08-note-on-the-study-of-distributed-and-content-addressed-storage-for-censorship-resistance.md));
the mechanisms below are general and state what any similarly-threatened
volunteer archive or advocacy corpus can do, not A/I's specific case.

## Sizing the corpus

No figure in this note is invented. Tens of thousands of Markdown-scale
text documents at a typical few-tens-of-kilobytes each, plus one
generated PDF per document at typically several hundred kilobytes to a
few megabytes, puts a corpus of this description in the low tens of
gigabytes total — this is a modeled envelope stated from the corpus
description given, not a measured figure for any specific named
archive, and the ranked recommendation below is chosen to be
insensitive to where in that envelope the real number falls: every
option costs at most tens of dollars per year at this scale, so the
deciding factors are the removal-resistance and operational
properties below, not price. A house adopting this note for a
specific named corpus should replace this envelope with that corpus's
own measured byte count before budgeting.

## The options, measured

**Self-hosted git mirroring** (see [git mirroring](../../../../../../glossary/terms/git-mirroring.md)).
Cost: the price of a small VPS per mirror operator, on the order of a
few dollars a month, since a text-and-PDF corpus of tens of gigabytes
is well within any commodity disk. Durability: as strong as the number
of independent mirror operators kept current, since git's own content
addressing (§"content addressing" in the study note) makes every
mirror self-verifying against every other. Who can remove it: whoever
controls one mirror's own host or domain can remove that one mirror,
but not any other; removal of the whole corpus requires compelling
every independent operator individually. What an operator must run: a
server, a scheduled `git fetch --all` or push-mirror job, and nothing
else. Legal exposure of the operator: ordinary hosting liability —
each mirror operator is as identifiable and as compellable as any
other host, so resistance comes from multiplying independent,
multi-jurisdiction operators, not from any property of git itself.

**Software Heritage archive** (see [git mirroring](../../../../../../glossary/terms/git-mirroring.md), §SWHID).
Cost: free to the submitting operator; Software Heritage crawls and
stores the archive on its own infrastructure. Durability: operated
independently of the house, with its own stated mission to preserve
what it crawls indefinitely, though this note did not verify a
first-party numeric durability SLA equivalent to AWS S3's stated
figure. Who can remove it: Software Heritage itself, a French
nonprofit hosted at Inria — a single legal entity, so this option adds
a third-party-operated, independently-addressable copy but is not
itself immune to a French-jurisdiction legal order. What an operator
must run: nothing beyond registering the repository origin for
crawling. Applicability: this option assumes the corpus is held in a
git repository Software Heritage can crawl, which is true for a corpus
already kept in git (as this note's Part 2 concrete case is) and not
true for a corpus that exists only as rendered HTML or PDF with no
version-controlled source.

**IPFS pinning** (see [pinning](../../../../../../glossary/terms/pinning.md)).
Cost: at Pinata's own dated rate of $20/month per TB (2026-09-08), a
corpus in the low tens of gigabytes costs a few dollars a month per
pinning service used. Durability: bounded by "as long as whoever pays
keeps paying," per pin — using two or more independent pinning
services in different jurisdictions turns this from a single point of
both cost and compulsion into an option with the same
multiply-independent-operator property git mirroring has. Who can
remove it: each pinning service is a company that can be compelled or
can simply stop serving on nonpayment; the content-addressed identifier
itself does not change, so a removed pin can be re-pinned elsewhere
without renaming anything a citation points at. What an operator must
run: nothing, if paying a pinning service; an IPFS daemon, if
self-hosting a pin. Legal exposure of the pinner: ordinary hosting-like
exposure, concentrated on whichever named account holds the pin.

**Incentivized storage — Filecoin and Arweave** (see
[incentivized storage](../../../../../../glossary/terms/incentivized-storage.md)).
Cost: Filecoin's own 2026 early-adopter rate of $2.50/TiB/month for
two replicated copies prices a corpus this size at a few dollars a
month; Arweave's one-time endowment payment has no first-party dollar
figure this study could verify to a dated page (§6 of the study note),
so its cost cannot be stated without inventing a number. Durability:
Filecoin's proof-of-spacetime enforces continued storage
cryptographically rather than by trust, which is a stronger guarantee
than a pinning service's plain payment relationship; Arweave's
endowment model is a modeled economic projection, not a contractual
SLA. Who can remove it: no single storage provider holds the only
copy under either design, but the client account that pays for the
deal (Filecoin) or holds the wallet that made the one-time payment
(Arweave) is a single identifiable party whose compulsion does not
remove existing sealed data but could prevent renewing it. What an
operator must run: wallet custody and either deal-making tooling
(Filecoin) or an upload tool (Arweave, ArDrive, or similar) — more
operational complexity than a pinning service or a plain git mirror.

**BitTorrent distribution** (see
[BitTorrent distribution](../../../../../../glossary/terms/bittorrent-distribution.md)).
Cost: near zero beyond whatever bandwidth volunteer seeders donate.
Durability: exactly as strong as the number of active seeders, which
is not a stated guarantee but an observed count that can fall to zero.
Who can remove it: no single seeder's removal affects any other, but
the `.torrent` file or magnet link's index — a website listing it — is
itself a single removable point unless that index is independently
mirrored too, so this option does not by itself solve the
domain/host-seizure problem, only the storage-removal problem once a
reader already has the link. What an operator must run: a seedbox or
a volunteer-run seeding node kept online. Legal exposure: low for a
corpus under a permissive or CC license (the documented Anna's
Archive/Library Genesis pattern applies mainly to material under
contested copyright status, which does not describe most activist
text/PDF corpora).

**WARC web archiving** (see [web archiving](../../../../../../glossary/terms/web-archiving.md)).
Cost: free to submit to the Internet Archive's Wayback Machine or to
Perma.cc. Durability: operated by a third party (the Internet
Archive, a single US 501(c)(3)) with its own stated preservation
mission but, like Software Heritage, a single legal entity subject to
US-jurisdiction legal process, not a distributed-by-design system in
the sense the other options are. What an operator must run: nothing
beyond submitting URLs for capture. What this option uniquely buys: a
dated, replayable record of what the site actually served on a given
date, evidentiary value none of the other options provide, since they
preserve the underlying documents rather than the served transaction.

## Ranked recommendation

No single mechanism above is resistant to every removal vector this
section's `censorship-resistance` term names (domain seizure, host
compulsion, notice-and-takedown, sanctions-driven payment-rail
removal) — each option's "who can remove it" column names a different
single point the others do not share, which is the reason to combine
them rather than choose one:

1. **Git-mirror the corpus to at least three independently operated
   hosts in at least two jurisdictions**, at near-zero marginal cost
   for a corpus this size. This is the first line: it removes the
   single-domain and single-host dependency for the raw content
   itself using a mechanism the house can run without depending on
   any third-party operator's continued goodwill.
2. **Register the git repository with the Software Heritage
   archive**, free, for a third-party-operated, citable copy
   independent of every house-run mirror — applicable directly to a
   corpus already kept in git.
3. **Pin the content-addressed corpus to at least two independent
   IPFS pinning services in different jurisdictions**, a few dollars
   a month at this corpus's size, to add a content-addressed,
   location-independent retrieval path distinct from any one git
   host's domain.
4. **WARC-capture the served site into the Internet Archive and
   Perma.cc**, free, for the dated evidentiary record neither the
   git mirrors nor the pins provide.
5. **Treat Filecoin and Arweave as a later addition, not a first
   move, at this corpus's size.** Their per-GB economics matter most
   at the hundreds-of-gigabytes-to-terabyte scale, where a pinning
   service's per-GB price or a self-hosted mirror's disk cost starts
   to matter; at tens of gigabytes, the added operational complexity
   of wallet custody and deal-making tooling is not justified by a
   cost difference of a few dollars a month. Revisit this ranking if
   the corpus this note is applied to grows past that scale, or if
   generated PDFs and media substantially inflate the size envelope
   stated above.

This ranking optimizes for what a small, resource-constrained
volunteer operation can actually run continuously, not for the
theoretically strongest single mechanism — the house's own working
agreements name exactly this priority (simplest architecture that
realizes the required capability) as the standard to hold engineering
decisions to.
