---
name: Event Sourcing
description: "A software-architecture pattern, named by Martin Fowler in a 12 December 2005 bliki entry, in which every change to an application's state is captured and persisted as an immutable event in the order it occurred, so that the current state is always a derived, replayable projection rather than the primary stored fact - a practitioner-tier pattern with no peer-reviewed canon of its own, whose lifecycle-as-append-only-log idea the claim infrastructure borrows operationally while drawing its formal valid-time/transaction-time guarantees from the separate bitemporal-database literature instead."
date-created: 2026-08-22
aliases:
  - event sourcing pattern
  - ES
instance-of: systems-pattern
---

**Event Sourcing** is the pattern of storing every change to an application's state as a sequence of immutable event objects, in the order they were applied, rather than storing only the current state.
Martin Fowler named and defined the pattern in a bliki entry dated 12 December 2005: "ensures that all changes to application state are stored as a sequence of events," so a system can answer not just "where are we" but "how did we get there" ([martinfowler.com/eaaDev/EventSourcing.html](https://martinfowler.com/eaaDev/EventSourcing.html)).
Current state, under this pattern, is a derived value: it is computed (or "replayed") by folding the event log forward, which means the log itself, not any materialized snapshot, is the durable source of truth.

The pattern is transmitted almost entirely through practitioner writing rather than a peer-reviewed literature: Fowler's own bliki entry is a draft-collection blog post with no citation apparatus, and the pattern's usual companion, CQRS (Command Query Responsibility Segregation), comes from Greg Young's self-published "CQRS Documents" ([cqrs.files.wordpress.com/2010/11/cqrs_documents.pdf](https://cqrs.files.wordpress.com/2010/11/cqrs_documents.pdf), November 2010).
Jay Kreps' essay "The Log" (2013) and Martin Kleppmann's *Designing Data-Intensive Applications* (2017) extend event sourcing into distributed-systems architecture by arguing that an [append-only log](append-only-log.md) is the right general-purpose substrate for this kind of state, but these too are practitioner-tier sources rather than refereed research.

For the claim infrastructure, event sourcing supplies an operational storage idea - a claim's lifecycle (asserted, corroborated, contested, corrected, retracted) can be persisted as an append-only sequence of state-transition events rather than as a mutated row - but it does not by itself supply the formal distinction the program needs between when a claim was true and when the newsroom learned it; that distinction is the valid-time/transaction-time split formalized in the [bitemporal-database](bitemporal-database.md) literature, a separate and older academic tradition event sourcing's practitioner literature rarely cites.

## See also

- [Study of Event-Sourced and Bitemporal State Engineering](../../documents/articles/notes/2026/08/22/2026-08-22-note-on-the-study-of-event-sourced-and-bitemporal-state-engineering.md) - the fuller study this entry summarizes, including the absence of a peer-reviewed canon and the mapping to the claim-infrastructure program's bets
