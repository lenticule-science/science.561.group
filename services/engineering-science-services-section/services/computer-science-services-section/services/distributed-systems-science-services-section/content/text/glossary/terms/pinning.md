---
description: Marking a content-addressed block, and everything its Merkle DAG transitively references, as protected from garbage collection, so an operator commits to keep serving specific content rather than merely caching whatever recently passed through it.
identity: pinning
name: Pinning
provenance:
  date-created: 2026-09-08
  sources:
    - /home/emsenn/info/lib/emsenn/services/561-group/services/science-services-section/services/engineering-science-services-section/services/computer-science-services-section/services/distributed-systems-science-services-section/content/text/documents/articles/notes/2026/09/08/2026-09-08-note-on-the-study-of-distributed-and-content-addressed-storage-for-censorship-resistance.md
references:
  ipfs2026:
    authors:
      - Protocol Labs
    title: Pinning
    publication: IPFS Docs
    year: 2026
    url: https://docs.ipfs.tech/how-to/pin-files/
  pinata2026:
    authors:
      - Pinata
    title: "Pinata's New Pricing: No More Pin Limits, More Storage For Less"
    publication: Pinata Blog
    year: 2026
    url: https://pinata.cloud/blog/pinatas-new-pricing-no-more-pin-limits-more-storage-for-less/
---
Pinning marks a content-addressed block, and everything its Merkle DAG transitively references, as protected from garbage collection, so an operator commits to keep serving that specific content rather than merely caching whatever recently passed through it. This differs from ordinary caching, which a node's own garbage collector may reclaim at any time once space is needed; a pin is an explicit, standing commitment rather than an incidental side effect of having recently served a request ([IPFS Docs, "Pinning," 2026](https://docs.ipfs.tech/how-to/pin-files/)).

Because content addressing itself provides no economic incentive for a random peer to keep serving unpopular content indefinitely, pinning in practice means paying a pinning service to hold that commitment on the requester's behalf. First-party pricing gives one concrete, dated figure: Pinata's "Picnic" plan lists 1 TB of pinned storage at $20/month as of 2026-09-08 ([Pinata pricing blog](https://pinata.cloud/blog/pinatas-new-pricing-no-more-pin-limits-more-storage-for-less/)).

The consequence for censorship resistance is that pinning inherits content addressing's tamper-evidence (the identifier never silently changes) but adds no durability guarantee beyond "as long as whoever is paying keeps paying and the pinning operator keeps running." A single pinning operator is a single point of both cost and potential legal compulsion — exactly the property a corpus resistant to a single-domain or single-host takedown needs to avoid, which is why resilience against removal requires multiple independent pins across operators in different jurisdictions, not one pin treated as sufficient.
