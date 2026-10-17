---
description: Whether a storage system continues to respond correctly to reads and writes despite faults, measured over a time window as a fraction of requests served or an uptime percentage, distinct from whether the underlying data has been permanently lost.
identity: data-availability
name: Data Availability
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
Data availability is whether a storage system continues to respond correctly to reads and writes despite faults, a property measured over a time window such as the fraction of requests served or an uptime percentage. Martin Kleppmann's *Designing Data-Intensive Applications* (O'Reilly, 2017, ISBN 978-1-4493-7332-0) treats this as distinct from [durability](./data-durability.md): a system can be unavailable right now (offline, unreachable, overloaded) without the underlying data being lost, and a system can appear available while silently losing data it will never be able to serve again.

Amazon's own [S3 documentation](https://docs.aws.amazon.com/AmazonS3/latest/userguide/DataDurability.html) states these as two separately numbered guarantees for one system — 99.999999999% durability against 99.99% availability over a given year — because availability also depends on the request-serving path being reachable at the moment of a request, a dependency durability does not share: the eleven-nines figure is computed over redundant copies surviving loss events, while the four-nines figure also has to account for the serving infrastructure itself being briefly unreachable during maintenance, network partition, or overload, none of which loses a single byte.

For a corpus a house wants resistant to removal, availability is the property a reader experiences on any given day; durability is the property that determines whether the corpus can still be recovered after an outage ends. A pinning operator or storage provider can quote either number without the other, and the two are not interchangeable evidence for a claim of resistance to removal.
