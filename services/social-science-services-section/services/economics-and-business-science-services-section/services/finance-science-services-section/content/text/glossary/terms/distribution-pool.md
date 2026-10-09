---
aliases:
  - GDA pool
  - Superfluid pool
description: A distribution pool is a contract-held set of members with integer units to which a distributor sends a lump or a continuous flow, each member earning in proportion to units over total units.
identity: distribution-pool
name: Distribution pool
date-created: 2026-10-08
---
A distribution pool, in Superfluid's general distribution agreement, has an admin and members with integer units; the admin changing a member's units is a mint or burn in the ERC-20 view of the units. A distributor either sends a lump to the pool or sets a flow rate into it, and each member earns rate times units over total units, streamed continuously if the member has connected the pool and claimable if not ([Streaming and Distribution Protocols](../../documents/articles/notes/2026/10/08/2026-10-08-streaming-and-distribution-protocols.md)).

One transaction therefore serves any number of members, and the units are a share ledger. Flow Councils use the same structure as a vote ledger: recipients' pool units are their vote totals, and the stream re-splits when votes change.
