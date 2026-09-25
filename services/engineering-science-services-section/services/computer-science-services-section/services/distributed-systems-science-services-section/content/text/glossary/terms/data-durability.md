---
description: Whether written, acknowledged data survives indefinitely rather than being permanently lost, a property concerned with loss events rather than momentary unresponsiveness, and the property replication and erasure coding are engineered to maximize.
identity: data-durability
name: Data Durability
date-created: 2026-09-08
provenance:
  sources:
    - /home/emsenn/info/lib/emsenn/services/561-group/services/science-services-section/services/engineering-science-services-section/services/computer-science-services-section/services/distributed-systems-science-services-section/content/text/documents/articles/notes/2026/09/08/2026-09-08-note-on-the-study-of-distributed-and-content-addressed-storage-for-censorship-resistance.md
references:
  kleppmann2017:
    authors:
      - Martin Kleppmann
    title: Designing Data-Intensive Applications
    publisher: O'Reilly Media
    year: 2017
    note: ISBN 978-1-4493-7332-0
  aws2026:
    authors:
      - Amazon Web Services
    title: Data protection in Amazon S3
    publication: Amazon S3 User Guide
    year: 2026
    url: https://docs.aws.amazon.com/AmazonS3/latest/userguide/DataDurability.html
---
Data durability is whether written, acknowledged data survives indefinitely once written, a property concerned with permanent loss rather than momentary unresponsiveness. Martin Kleppmann's *Designing Data-Intensive Applications* (O'Reilly, 2017, ISBN 978-1-4493-7332-0) distinguishes durability from [availability](./data-availability.md): durability asks whether the bytes still exist somewhere recoverable, a question unaffected by whether the system answering requests right now happens to be reachable, so a system can be fully durable while temporarily unavailable, or briefly available while silently non-durable if it has already lost the only copy of what it claims to hold.

Amazon's own [S3 documentation](https://docs.aws.amazon.com/AmazonS3/latest/userguide/DataDurability.html) states a durability figure of 99.999999999% (eleven nines) computed over a given year, separately from a 99.99% availability figure, because durability is computed over redundant copies surviving independent loss events — disk failure, a data-center loss, a bit flip — rather than over request-serving uptime. Replication and erasure coding (both covered as separate terms in this glossary) are the two mechanisms engineered specifically to raise this number: each additional independent copy or fragment reduces the probability that every holder loses its copy in the same window.

For a corpus threatened with removal, durability is the number that answers "will this still exist in ten years even if every operator currently hosting it is individually compelled to delete its copy," which is the property censorship resistance depends on; availability answers a narrower, shorter-horizon question about whether a reader can fetch it right now.
