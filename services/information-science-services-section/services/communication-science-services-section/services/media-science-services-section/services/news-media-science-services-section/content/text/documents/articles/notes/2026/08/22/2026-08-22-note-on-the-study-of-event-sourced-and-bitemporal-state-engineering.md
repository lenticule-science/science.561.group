---
title: "Study of Event-Sourced and Bitemporal State Engineering for the Claim Infrastructure"
description: "A literature-and-systems study of event sourcing, CQRS, log-centric architecture, and bitemporal databases finds a peer-reviewed core only in the temporal-database line (Snodgrass & Ahn's 1985/1986 valid-time/transaction-time taxonomy, the TSQL2 consensus effort, Jensen & Snodgrass's 1996 semantics synthesis, and SQL:2011's temporal features per Kulkarni & Michels 2012), while event sourcing, CQRS, and the log-as-unifying-abstraction thesis remain practitioner-tier blog and conference-talk material (Fowler 2005, Young 2010, Kreps 2013, Kleppmann 2014/2017) with no peer-reviewed canon of their own, and production bitemporal engines (Datomic, XTDB) are vendor-documented rather than independently verified, leaving a formally specified mapping from bitemporal valid-time/transaction-time semantics onto a multi-valued claim-state lifecycle, and a peer-reviewed treatment of correction-as-retroactive-bitemporal-update at graph-propagation scale, as gaps carried forward."
date-created: 2026-08-22
type: notes
name: 2026-08-22-note-on-the-study-of-event-sourced-and-bitemporal-state-engineering
authors:
  - claude-sonnet-5
status: draft-for-owner-review
keywords: ["event-sourcing", "cqrs", "bitemporal-database", "valid-time", "transaction-time", "append-only-log", "kafka", "tsql2", "sql-2011", "datomic", "xtdb", "immutability", "claim-infrastructure"]
tags: ["draft", "study"]
---


This is a study of the engineering literature behind event-sourced and bitemporal state storage,
read for one purpose:
to establish, for this engineering sub-literature,
which claims trace to peer-reviewed research, IETF/W3C specifications, or documented production systems
versus blog folklore and vendor marketing,
so that the claim-infrastructure implementation builds on the right kind of source.
Method: web-verified citations.
Every load-bearing claim below carries a markdown-linked source
(DOI, RFC number, W3C TR page, or stable URL),
and anything not verifiable to the primary source is marked **[UNVERIFIED]** inline.
The short finding, stated first:
this sub-literature has an unusual shape -
its most-cited foundational texts (event sourcing, CQRS, "the log") are practitioner essays with no peer-reviewed canon behind them,
while its actual formal rigor sits one field over, in a distinct and older academic literature (temporal databases) that the practitioner essays rarely cite and mostly reinvent under new names.

## 1. Event sourcing and CQRS: a practitioner pattern with no peer-reviewed canon

**Event sourcing** as a named pattern for application architecture traces to Martin Fowler's bliki entry "Event Sourcing," dated 12 December 2005 ([martinfowler.com/eaaDev/EventSourcing.html](https://martinfowler.com/eaaDev/EventSourcing.html)),
which defines the pattern plainly: "ensures that all changes to application state are stored as a sequence of events," so that "we don't just want to see where we are, we also want to know how we got there."
The entry sits in Fowler's "eaaDev" collection - draft material for a never-completed sequel to *Patterns of Enterprise Application Architecture* - and is a practitioner bliki post, not a refereed publication; it carries no citation apparatus of its own and does not reference CQRS or Greg Young.

**CQRS** (Command Query Responsibility Segregation) has a comparably informal origin.
Greg Young's "CQRS Documents," dated November 2010 ([cqrs.files.wordpress.com/2010/11/cqrs_documents.pdf](https://cqrs.files.wordpress.com/2010/11/cqrs_documents.pdf)), is the canonical citation for the pattern - a self-published PDF, not a paper, growing out of Young's consulting and training material and building explicitly on Fowler's and Udi Dahan's prior writing on task-based UIs and command/query separation.
It argues for splitting the write model (commands, validated against business rules) from the read model (queries, optimized for display), with event sourcing named as the natural way to persist the write side.

**There is no peer-reviewed canon for either pattern.**
Neither concept originates in, nor has since accumulated, a primary literature in a refereed database-systems or software-engineering venue comparable to what exists for temporal databases (Section 4) or transactional systems generally; both patterns are transmitted almost entirely through blog posts, conference talks, vendor framework documentation (Axon, EventStoreDB, Marten), and secondary books that cite Fowler and Young rather than any peer-reviewed source.
This is a finding, not an oversight of this study: an implementation drawing state-machine discipline from "event sourcing" as a named pattern is drawing on codified practitioner consensus, not on adjudicated research, and should be honest about that distinction in its own documentation.

## 2. The log as a unifying abstraction

Jay Kreps' "The Log: What every software engineer should know about real-time data's unifying abstraction," published on the LinkedIn Engineering blog on 16 December 2013 ([engineering.linkedin.com](https://engineering.linkedin.com/distributed-systems/log-what-every-software-engineer-should-know-about-real-time-datas-unifying)), is the practitioner-tier essay that connects event sourcing to distributed-systems infrastructure.
It defines a log as "the simplest possible storage abstraction... an append-only, totally-ordered sequence of records ordered by time," and argues that this one structure - not a message queue, not a database table - is the right unifying substrate for data integration, real-time processing, and distributed consistency across a whole company's systems.
This essay, like Fowler's and Young's, is a blog post: influential, widely cited in later engineering writing, but not peer-reviewed.

Martin Kleppmann extended the same thesis in a Strange Loop 2014 talk, later written up as "Turning the Database Inside-Out" (expanded transcript dated 4 March 2015, [martin.kleppmann.com](https://martin.kleppmann.com/2015/03/04/turning-the-database-inside-out.html)), which reframes a database as "an always-growing collection of immutable facts" processed functionally as a stream, and in his textbook *Designing Data-Intensive Applications* (O'Reilly Media, 2017, [publisher page](https://www.oreilly.com/library/view/designing-data-intensive-applications/9781491903063/)), which gives event sourcing, change-data-capture, and "state, streams, and immutability" a full chapter-length synthesis.
The book is an industry-standard reference and is far more rigorously argued and cross-cited than the blog posts it draws on, but it is still a practitioner textbook aimed at working engineers, not a peer-reviewed monograph; its own bibliography leans on Kreps, Fowler, and systems papers (Kafka, Bigtable, Dynamo) rather than an academic canon specific to event sourcing.

## 3. Kafka's original paper: the one genuinely peer-reviewed artifact in this lineage

Kreps, Narkhede, and Rao, "Kafka: a Distributed Messaging System for Log Processing," presented at NetDB 2011 (the 6th International Workshop on Networking Meets Databases, co-located with SIGMOD, Athens, Greece, June 2011; official PDF at [cwiki.apache.org](https://cwiki.apache.org/confluence/download/attachments/27822226/Kafka-netdb-06-2011.pdf)), is the one document in this whole event-sourcing/log lineage that went through workshop peer review.
It describes Kafka's design as it existed at LinkedIn in 2011: a partitioned, replicated commit log optimized for high-throughput log aggregation, deliberately simpler than a general message queue (no per-message acknowledgment bookkeeping, sequential disk I/O, consumer-tracked offsets) because it targets log-style workloads rather than general messaging semantics.
The paper is the direct technical ancestor of the "log as unifying abstraction" essays in Section 2 - Kreps wrote both - and is the strongest available evidence that the log-centric architecture pattern has at least one artifact behind it that cleared independent technical review, even though that review was a workshop track, not a full peer-reviewed database-systems conference or journal.

## 4. Temporal databases: the peer-reviewed core this sub-literature mostly does not cite

The formal foundation for "when was this true" versus "when did we learn it" predates event sourcing by two decades and comes from a distinct academic literature: temporal databases.

Richard Snodgrass and Ilsoo Ahn established the field's central distinction in two papers: "A Taxonomy of Time in Databases," *Proceedings of the 1985 ACM SIGMOD International Conference on Management of Data*, pp. 236-246, DOI [10.1145/318898.318921](https://dl.acm.org/doi/10.1145/318898.318921); and "Temporal Databases," *IEEE Computer* 19(9):35-42 (September 1986), DOI [10.1109/MC.1986.1663327](https://ieeexplore.ieee.org/document/1663327).
These papers define **valid time** (the time a fact is true in the modeled reality) and **transaction time** (the time the fact was recorded in the database) as orthogonal dimensions, and classify databases by which dimensions they support - a **bitemporal** database supports both simultaneously, retaining old transaction-time states even as valid-time corrections are applied.
This is, term for term, the distinction the claim-infrastructure program needs between when a claim was true and when the newsroom knew it.

The field consolidated this taxonomy into a concrete query language through the **TSQL2** effort: a committee chaired by Snodgrass, with members including Ahn, Ariav, Batory, Clifford, Dyreson, Elmasri, Jensen, and others, published *The TSQL2 Temporal Query Language* (Kluwer, 1995, ISBN 0-7923-9614-6, [dblp record](https://dblp.org/db/books/collections/snodgrass95.html)) as a consensus upward-compatible extension of SQL-92.
TSQL2's constructs were partially carried into the ISO SQL3 standardization process - Snodgrass began working with ANSI X3H2 and ISO/IEC JTC1/SC21/WG3 in December 1994, and TSQL2's `PERIOD` datatype was incorporated into a January 1996 ISO working draft for a proposed SQL/Temporal (Part 7) standard - but the SQL/Temporal project was ultimately canceled in 2001 over disagreements about where temporal support belonged in the standard, and TSQL2 itself was never adopted wholesale by any vendor or standards body (Snodgrass, Böhlen, Jensen & Steiner, "Transitioning Temporal Support in TSQL2 to SQL3," in *Temporal Databases: Research and Practice*, Springer LNCS 1399, 1998, [chapter PDF](https://homes.cs.aau.dk/~csj/thesis/pdf/chapter25.pdf)).

Christian Jensen and Snodgrass then synthesized the field's first decade into "Semantics of Time-Varying Information," *Information Systems* 21(4):311-352 (1996) ([ScienceDirect](https://www.sciencedirect.com/science/article/abs/pii/0306437996000178)), which formalizes bitemporal relations as facts carrying exactly one valid-time and one transaction-time timestamp each, and works out the query semantics that follow.

Temporal support finally entered the SQL standard proper, on different design terms than TSQL2 proposed, as part of **SQL:2011**: Krishna Kulkarni and Jan-Eike Michels, "Temporal Features in SQL:2011," *ACM SIGMOD Record* 41(3):34-43 (October 2012), DOI [10.1145/2380776.2380786](https://dl.acm.org/doi/abs/10.1145/2380776.2380786) ([open-access version](https://sigmodrecord.org/2012/09/30/temporal-features-in-sql2011/)), describes `SYSTEM_TIME` (transaction time, system-maintained) and `PERIOD FOR` application-time periods (valid time, user-maintained) as period-typed columns on ordinary tables, with `AS OF` and `FOR PORTION OF` query support - a materially simpler design than TSQL2's, adopted by later vendor implementations (SQL Server, DB2, Oracle, MariaDB) with SQL:2011 as the actual, shipped, standards-track answer to bitemporal storage.
This is a peer-reviewed and standards-body lineage in the strict sense the practitioner literature in Sections 1-2 lacks: refereed SIGMOD/IEEE Computer papers, a committee-consensus language specification, and an ISO/ANSI standardization history with a documented outcome (partial adoption, one project canceled, a later and different standard shipped).

## 5. Bitemporal engines in production: vendor-documented, not independently verified

Two production systems implement bitemporal or time-aware immutable storage and are commonly cited alongside the temporal-database literature, but both are known to this study only through vendor documentation, not independent peer review.

**Datomic**, created by Rich Hickey's team and first released in 2012, stores data as immutable atomic facts ("datoms" - entity/attribute/value/transaction tuples) that are only ever added, never updated or deleted in place; every datom carries the transaction that asserted it, so a database value can be queried "as of" any point in transaction history without maintaining separate snapshots ([Datomic overview docs](https://docs.datomic.com/datomic-overview.html)).
This is vendor documentation (published by Nubank, Datomic's current maintainer) rather than a peer-reviewed system description, and this study did not find an independent academic evaluation of Datomic's design.

**XTDB** documents an explicit bitemporal model with two named axes: **system time** (when a row version was recorded, read-only, automatic) and **valid time** (when a fact is true in the modeled domain, user-editable, defaultable to system time), letting a correction be recorded with a system-time timestamp of when it was learned while carrying a valid-time timestamp of when it actually took effect ([Time in XTDB docs](https://docs.xtdb.com/about/time-in-xtdb.html); [Bitemporality, v1 docs](https://v1-docs.xtdb.com/concepts/bitemporality/)).
This vocabulary maps directly onto Snodgrass & Ahn's valid-time/transaction-time pair from Section 4, under different names, and is again vendor documentation (JUXT, XTDB's maintainer) rather than independently reviewed.
Both engines should be read as evidence that bitemporal semantics are implementable and have shipped in production, not as independent confirmation of any specific correctness or performance claim either vendor makes about its own system.

## 6. Immutability as the connecting argument

Pat Helland's "Immutability Changes Everything," presented at CIDR 2015 and published as *ACM Queue* 13(9) (2015) (CIDR paper: [cidrdb.org PDF](https://www.cidrdb.org/cidr2015/Papers/CIDR15_Paper16.pdf); ACM Queue version: [queue.acm.org](https://queue.acm.org/detail.cfm?id=2884038)), is the argument that ties Sections 1-5 together at the level of principle rather than product: as storage gets cheaper, the right default increasingly becomes never overwriting data, only ever appending new immutable facts, because immutable data is what lets independent parties coordinate at a distance without a shared mutable lock.
CIDR is a peer-reviewed systems-research conference (Conference on Innovative Data Systems Research), so this is one of the few sources in this note that is both about the *event-sourcing* line's core assumption (immutable, append-only fact accumulation) and independently refereed - it is the closest thing to a peer-reviewed justification for why event sourcing and bitemporal storage are the right shape of solution, even though it does not itself formalize either pattern.

## 7. Mapping to the program's three bets

This section maps the above findings to the three research bets named in [the program note](../../../../../../../../../../content/text/documents/articles/notes/2026/08/22/2026-08-22-note-on-the-web-news-media-research-program.md).

**Bet 1 (claim-state and correction semantics).**
The program's needed distinction - when a claim was true versus when the newsroom knew it - is exactly the valid-time/transaction-time split formalized by Snodgrass & Ahn (Section 4) and implemented as `SYSTEM_TIME`/`PERIOD FOR` columns in SQL:2011 (Kulkarni & Michels) and as system-time/valid-time axes in XTDB (Section 5).
This is the one place in this study where the peer-reviewed literature maps onto the program's need directly and by name, not by analogy: a claim-state lifecycle (asserted -> corroborated -> contested -> corrected -> retracted) is a bitemporal relation whose valid-time dimension carries the claim's real-world status history and whose transaction-time dimension carries the newsroom's epistemic history of when it learned each status change.
Event sourcing (Section 1) supplies a complementary, practitioner-tier idea for how to *store* that lifecycle operationally - as an append-only sequence of state-transition events rather than as mutated rows - but the formal guarantee that valid time and transaction time are the right two axes, and what a bitemporal query over them means, comes from Section 4's literature, not from Section 1's.

**Bet 2 (correction propagation).**
A correction is, in bitemporal terms, exactly a retroactive assertion: a new transaction-time entry whose valid-time range reaches back to when the correction actually should have applied, without erasing the prior (now-superseded) transaction-time record - the same operation XTDB's documentation walks through directly (Section 5) and that Helland's immutability argument (Section 6) explains why one would want structurally: the old fact is never overwritten, only superseded by a new fact layered on top, which is precisely what lets a correction propagate as an appendable event that every downstream consumer can detect and re-derive from, rather than as an in-place edit that downstream copies have no signal to notice.
The log-as-unifying-abstraction literature (Section 2) and Kafka's peer-reviewed design (Section 3) supply the transport-layer half of this bet - a correction modeled as an event on an append-only, replicated, ordered log is the substrate the propagation problem in the program note (corrections as a graph event syndication is obligated to carry) can be built on - but neither Kreps' essay nor the Kafka paper addresses claim semantics at all; they solve "how do many systems reliably see the same ordered sequence of events," not "what does it mean for a claim to be corrected."

**Bet 3 (per-claim conformance).**
This study found no direct load-bearing connection between event-sourced/bitemporal storage and per-claim conformance checking; conformance is a validation-and-attestation problem (covered by the sibling claim-and-provenance-standards study, not this one) rather than a storage-semantics problem.
The one indirect connection worth naming: a conformance check that must be re-run whenever a claim's bitemporal state changes (a correction, a retraction) is a natural consumer of the append-only event log this note's Sections 2-3 describe, so the storage architecture this note establishes is a precondition for Bet 3's re-validation triggers, even though it does not itself supply any conformance semantics.

## Gaps carried forward

1. **No peer-reviewed canon for event sourcing or CQRS as named patterns** - Fowler (2005) and Young (2010) remain the field's own citations for its own foundational patterns, and this study found no refereed paper that formalizes either one; any specification the claim infrastructure writes citing "event sourcing" should say so plainly rather than borrow implied academic weight the pattern does not have.
2. **A formal mapping from bitemporal valid-time/transaction-time semantics onto a multi-valued claim-state lifecycle** (asserted -> corroborated -> contested -> corrected -> retracted, per the program note's bilattice-valued settlement) does not exist in any source this study found - Section 4's literature gives the two time axes and Section 7 argues they are the right ones, but no paper or standard defines the claim-state vocabulary itself in bitemporal terms.
3. **A peer-reviewed treatment of correction-as-retroactive-bitemporal-update at graph-propagation scale** - the temporal-database literature (Section 4) treats corrections to single relations; the log/streaming literature (Sections 2-3) treats propagation of ordered events across systems; no source found here treats the combination (a bitemporal correction that must propagate as an event across an arbitrary graph of downstream artifacts) as one problem.
4. **Independent verification of Datomic's or XTDB's specific correctness or performance claims** - both engines are documented only by their own vendors in this study; no third-party benchmark, formal proof, or academic evaluation of either was found.
5. **Whether SQL:2011's `SYSTEM_TIME`/`PERIOD FOR` design, TSQL2's richer but unadopted design, or a schema-less document/graph bitemporal model (as XTDB and Datomic each choose independently of SQL:2011) is the right fit for claim-state storage** was outside this study's scope and is not settled by any source found here; it is a design decision the implementation still has to make.
6. **[UNVERIFIED]**: whether Fowler's Event Sourcing bliki entry or Young's CQRS Documents cite, or were influenced by, the Snodgrass/Jensen temporal-database literature (Section 4) - this study found no citation from either practitioner source to the academic temporal-database literature, and no interview or retrospective by either author addressing the question directly, so the two lineages' independence (rather than one quietly building on the other uncredited) is treated as the working assumption here but is not confirmed.

## Verification note

Verified 2026-08-22 against primary sources (Crossref REST API for DOIs; direct fetch or cached copy of publisher/vendor/blog pages for dates, quotes, and venue details).
15 load-bearing citations checked: Fowler's Event Sourcing bliki entry (date and defining quote); Young's CQRS Documents (author and date); Kreps' "The Log" (date and defining quote); Kleppmann's "Turning the Database Inside-Out" (date, Strange Loop 2014 origin, quote) and *Designing Data-Intensive Applications* (2017, O'Reilly); Kreps/Narkhede/Rao's Kafka paper (title, authors, venue); Snodgrass & Ahn's 1985 SIGMOD paper and 1986 *IEEE Computer* paper (DOIs, pages, title resolved directly against secondary bibliographic sources after Crossref's own metadata truncated the title); the TSQL2 book (ISBN, publisher, full committee roster); the TSQL2-to-SQL3 transition chapter; Jensen & Snodgrass's 1996 *Information Systems* paper (volume/issue/pages); Kulkarni & Michels' SQL:2011 paper (DOI, pages); the Datomic and XTDB vendor docs; and Pat Helland's "Immutability Changes Everything" (venue, ACM Queue issue).
2 corrected: (1) the Kafka paper's venue, NetDB 2011, was misdescribed as "the 3rd International Workshop on Networking Meets Databases" - the Microsoft Research event page and independent workshop listings confirm NetDB 2011 was the **6th** International Workshop on Networking Meets Databases (NetDB '07 was the 3rd); corrected in Section 3. (2) The TSQL2-to-SQL3 transition paper was attributed to "Snodgrass & Jensen" alone; the paper itself (fetched directly) lists four authors - **Snodgrass, Böhlen, Jensen, and Steiner** - matching the same four-author attribution independently confirmed for the related SQL3 valid-time/transaction-time proposals; corrected in Section 4.
0 newly marked unverified: no additional load-bearing claim among the 15 checked required a fresh **[UNVERIFIED]** marker; the pre-existing marker in Gaps item 6 (whether the practitioner and academic lineages cite each other) remains appropriately unresolved, as no source found in this pass settles it either way.
