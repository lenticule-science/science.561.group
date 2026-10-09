---
name: Bitemporal Database
description: "A database that records, for every fact, two independent time dimensions - valid time (when the fact is true in the modeled reality) and transaction time (when the fact was recorded in the database) - a distinction formalized by Richard Snodgrass and Ilsoo Ahn in 1985/1986 SIGMOD and IEEE Computer papers, consolidated into the TSQL2 query language (1995), synthesized by Jensen and Snodgrass (1996), and eventually standardized (on different design terms than TSQL2) as SQL:2011's SYSTEM_TIME and application-time PERIOD FOR features, giving the claim infrastructure its formal model for a correction as a new transaction-time record whose valid-time range reaches back to when it should have applied."
date-created: 2026-08-22
aliases:
  - bitemporality
  - valid time
  - transaction time
instance-of: data-structure
---

A **bitemporal database** tracks two orthogonal time dimensions for every stored fact: **valid time**, the time span during which the fact is true in the reality being modeled, and **transaction time**, the time span during which the fact was the database's recorded belief about that reality.
Richard Snodgrass and Ilsoo Ahn established this taxonomy in "A Taxonomy of Time in Databases," *SIGMOD* 1985, DOI [10.1145/318898.318921](https://dl.acm.org/doi/10.1145/318898.318921), and expanded it in "Temporal Databases," *IEEE Computer* 19(9) (1986), DOI [10.1109/MC.1986.1663327](https://ieeexplore.ieee.org/document/1663327).
A database supporting only transaction time can answer "what did we believe, and when did we believe it" but not represent that a fact's real-world validity period differs from when it was recorded; a database supporting both - a bitemporal database - can represent, and query, corrections: a new transaction-time record can carry a valid-time range that reaches backward to when the correction should actually have applied, without erasing the earlier (now-superseded) transaction-time record.

The field consolidated this model into the **TSQL2** query language, a Snodgrass-chaired committee consensus published as *The TSQL2 Temporal Query Language* (Kluwer, 1995, ISBN 0-7923-9614-6), and Christian Jensen and Snodgrass gave the model its fullest formal treatment in "Semantics of Time-Varying Information," *Information Systems* 21(4):311-352 (1996), [ScienceDirect](https://www.sciencedirect.com/science/article/abs/pii/0306437996000178).
TSQL2's `PERIOD` datatype partially entered ISO SQL3 standardization in the mid-1990s, but that project was canceled in 2001; temporal support instead reached the SQL standard, in a simpler design, as SQL:2011's system-versioned `SYSTEM_TIME` tables (transaction time) and application-time `PERIOD FOR` tables (valid time), documented in Krishna Kulkarni and Jan-Eike Michels, "Temporal Features in SQL:2011," *SIGMOD Record* 41(3) (2012), DOI [10.1145/2380776.2380786](https://dl.acm.org/doi/abs/10.1145/2380776.2380786).
Production engines Datomic and XTDB each implement a bitemporal model under their own vocabulary (transaction time in Datomic; system time and valid time in XTDB), documented respectively at [docs.datomic.com](https://docs.datomic.com/datomic-overview.html) and [docs.xtdb.com](https://docs.xtdb.com/about/time-in-xtdb.html), though both are vendor documentation rather than independently reviewed sources.

For the claim infrastructure, bitemporality is the direct formal answer to the program's first bet: a claim's valid-time dimension carries when it was actually true (or corroborated, contested, corrected) in the world, and its transaction-time dimension carries when the newsroom's own records changed to reflect that - two dimensions the program's claim-state lifecycle needs kept separate, and exactly the two dimensions this literature names and formalizes.

## See also

- [Study of Event-Sourced and Bitemporal State Engineering](../../documents/articles/notes/2026/08/22/2026-08-22-note-on-the-study-of-event-sourced-and-bitemporal-state-engineering.md) - the fuller study this entry summarizes, including the SQL3/SQL:2011 standardization history and the mapping to the claim-infrastructure program's bets
- [Event Sourcing](event-sourcing.md) - the complementary practitioner-tier storage pattern for persisting a bitemporal fact history as an append-only sequence
