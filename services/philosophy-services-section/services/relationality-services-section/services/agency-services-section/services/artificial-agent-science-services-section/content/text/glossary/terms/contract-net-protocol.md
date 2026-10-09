---
name: "Contract Net Protocol"
description: "The foundational task-allocation-by-negotiation protocol for distributed problem solving, introduced by Reid Smith in 1980, in which nodes with tasks broadcast a task announcement, candidate nodes submit bids, and the announcing node awards the task to a bidder — without centralized control — establishing the negotiation pattern that essentially every later auction-based or market-based multi-agent coordination scheme descends from."
date-created: 2026-08-22
aliases:
  - "contract net protocol"
  - "contract net"
  - "CNP"
instance-of: coordination-protocol
---

The contract net protocol (CNP) is a distributed task-allocation mechanism introduced by Reid G. Smith in ["The Contract Net Protocol: High-Level Communication and Control in a Distributed Problem Solver"](https://doi.org/10.1109/TC.1980.1675516), *IEEE Transactions on Computers*, vol. C-29, no. 12 (1980), pp. 1104–1113. It solves a specific coordination problem: how should a task be routed, without a central scheduler, to whichever node among a group of autonomous nodes is actually best placed to execute it.

The protocol runs in three phases. A node holding a task it cannot or should not execute itself broadcasts a **task announcement** describing the task and any eligibility requirements. Nodes capable of the task evaluate it against their own local state and, if interested, submit a **bid**. The announcing node evaluates the bids received and **awards** the task to a chosen bidder, which then executes it (and may itself become an announcer if the task decomposes further).

This structure — announce, bid, award — is the direct ancestor of essentially every later auction-based or market-based approach to multi-agent task allocation, including the routing logic inside many contemporary LLM multi-agent orchestration frameworks, whether or not those frameworks cite it directly. Its well-known limitation is that it assumes cooperative, honest bidding: it does not by itself prevent a bidder from misrepresenting its capability or cost to win a task it should not have. Closing that gap is the work of mechanism design — see the textbook treatment in Shoham and Leyton-Brown's *Multiagent Systems* — which supplies incentive-compatible allocation rules (such as Groves and VCG mechanisms) under which truthful bidding becomes a bidder's dominant strategy.

See the fuller literature survey in [the study note on multi-agent systems science](../../documents/articles/notes/2026/08/22/2026-08-22-note-on-the-study-of-multi-agent-systems-science.md).
