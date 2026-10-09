---
name: Append-Only Log
description: "An append-only, totally-ordered sequence of records, named as a unifying storage abstraction by Jay Kreps in a 16 December 2013 LinkedIn Engineering blog post and given its one peer-reviewed implementation in Kreps, Narkhede & Rao's Kafka paper (NetDB 2011), that lets many independent systems agree on the same ordered history of events without a shared mutable database - the transport-layer substrate the claim infrastructure's correction-propagation bet needs, distinct from and complementary to the append-only fact model of a bitemporal database."
date-created: 2026-08-22
aliases:
  - the log
  - commit log
  - append-only sequence
instance-of: systems-pattern
---

An **append-only log** is the simplest possible storage abstraction: a totally-ordered sequence of records that grows only by appending new records at the end, never by mutating or deleting existing ones.
Jay Kreps named this structure as a general unifying abstraction for distributed data systems in "The Log: What every software engineer should know about real-time data's unifying abstraction," published on the LinkedIn Engineering blog on 16 December 2013 ([engineering.linkedin.com](https://engineering.linkedin.com/distributed-systems/log-what-every-software-engineer-should-know-about-real-time-datas-unifying)), arguing that a log - rather than a queue or a database table - is the right substrate for data integration, real-time stream processing, and keeping many systems in agreement about the same history of events.
Martin Kleppmann extended the same argument in a Strange Loop 2014 talk written up as "Turning the Database Inside-Out" (4 March 2015, [martin.kleppmann.com](https://martin.kleppmann.com/2015/03/04/turning-the-database-inside-out.html)) and in *Designing Data-Intensive Applications* (O'Reilly, 2017).

Unlike the essays that popularized it, the append-only log has at least one peer-reviewed technical description behind it: Kreps, Narkhede, and Rao, "Kafka: a Distributed Messaging System for Log Processing," NetDB 2011 (workshop co-located with SIGMOD, Athens, June 2011; [official PDF](https://cwiki.apache.org/confluence/download/attachments/27822226/Kafka-netdb-06-2011.pdf)), which describes Apache Kafka's design as a partitioned, replicated commit log built for exactly this workload.
The log's core guarantee - every consumer sees the same ordered sequence of appended records, and nothing already appended is ever rewritten - is what makes it a viable transport for propagating an event to many independent downstream consumers without requiring them to share a database.

For the claim infrastructure, the append-only log is the substrate the correction-propagation bet needs: a correction, modeled as an event appended to the claim's log, is something every downstream copy (a cached summary, a syndicated republication, an archived snapshot) can detect and re-derive from, in contrast to an in-place edit that leaves no trace for a downstream system to notice.
This is a distinct role from the [bitemporal-database](bitemporal-database.md) literature's valid-time/transaction-time semantics: the log supplies the ordered transport and detectability of a change; bitemporality supplies the formal meaning of what changed and when it took effect.

## See also

- [Study of Event-Sourced and Bitemporal State Engineering](../../documents/articles/notes/2026/08/22/2026-08-22-note-on-the-study-of-event-sourced-and-bitemporal-state-engineering.md) - the fuller study this entry summarizes, including the practitioner/peer-reviewed distinction between the log essays and the Kafka paper
- [Event Sourcing](event-sourcing.md) - the application-state pattern that treats an append-only log as its primary store
