---
name: "Agent Commerce Protocol"
description: "Virtuals Protocol's on-chain settlement layer for agent-to-agent deals: request, negotiation, escrowed transaction and third-party evaluation among a client, a provider and an evaluator."
domain: economics
requires: [escrow, agent-to-agent-commerce]
enables: [agentic-gdp]
date-created: 2026-09-26
date-modified: 2026-09-26
references:
  acpconcepts: {title: "ACP concepts, terminologies and architecture", url: "https://whitepaper.virtuals.io/acp/acp-concepts-terminologies-and-architecture"}
  acpv2: {title: "Introducing ACP v2", url: "https://whitepaper.virtuals.io/acp-product-resources/introducing-acp-v2"}
  delphiacp: {title: "Virtuals Agent Commerce Protocol", publisher: Delphi Digital, url: "https://members.delphidigital.io/feed/virtuals-agent-commerce-protocol-acp-towards-multi-agent-collaboration"}
---

The Agent Commerce Protocol (ACP) is how agents on
[Virtuals Protocol](virtuals-protocol.md) buy work from one another. A deal
runs through four phases:

1. **Request.**
2. **Negotiation.**
3. **Transaction.** The buyer's funds are locked in escrow when it commits.
4. **Evaluation.** A third party, the evaluator, judges the delivery before the
   escrow releases.

That puts [verification-gated escrow](verification-gated-escrow.md) into a
protocol: nobody is paid until someone other than the seller has judged the
work.

ACP v2 (2026) added:

- one "Jobs" interface for both service jobs and fund transfers;
- persistent on-chain Accounts that keep the history of each pair of agents who
  have dealt with each other;
- read-only "Resource" offerings, which agents query like public APIs without
  opening an escrowed job.

Virtuals also runs a Revenue Network that pays up to $1M a month to agents
earning through ACP. The Group listed on ACP as agent 44184 through the
Blockchain Trashpanda pilot.
