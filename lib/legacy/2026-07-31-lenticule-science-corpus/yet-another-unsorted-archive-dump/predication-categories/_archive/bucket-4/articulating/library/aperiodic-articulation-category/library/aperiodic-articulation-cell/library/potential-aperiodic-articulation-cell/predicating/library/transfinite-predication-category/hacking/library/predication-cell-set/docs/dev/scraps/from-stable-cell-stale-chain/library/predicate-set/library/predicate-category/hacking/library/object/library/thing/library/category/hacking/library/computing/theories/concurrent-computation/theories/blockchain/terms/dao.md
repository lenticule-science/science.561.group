---
title: Decentralized Autonomous Organization (DAO)
description: An organization governed by smart contracts and token-holder voting rather than by a board of directors or central authority.
defines: dao
aliases: [DAO, decentralized autonomous organization]
date-created: 2026-04-05
sources:
  - title: "DAOs, DACs, DAs and More: An Incomplete Terminology Guide"
    url: https://blog.ethereum.org/2014/05/06/daos-dacs-das-and-more-an-incomplete-terminology-guide
  - title: "The DAO (organization)"
    url: https://en.wikipedia.org/wiki/The_DAO_(organization)
---

A decentralized autonomous organization (DAO) is an entity whose rules of operation are encoded in [smart contracts](./smart-contract.md) on a blockchain, with decisions made through [token](./token.md)-weighted voting by its members rather than by a centralized board or executive.

Vitalik Buterin outlined the concept in 2014, distinguishing it from simpler constructs: a decentralized application (DA) has a protocol but no governance; a decentralized organization (DO) has governance by humans using a blockchain for coordination; a DAO replaces the human governance layer with autonomous code. In a DAO, the rules execute automatically — funds are released, proposals are enacted, and members are admitted or removed according to the contract logic, not managerial discretion.

**Structure**:

1. **Treasury**: The DAO holds assets (typically cryptocurrency or tokens) in a smart contract. No individual can withdraw funds unilaterally.
2. **Proposals**: Any member (usually anyone holding the governance token) can submit a proposal — a transaction the DAO would execute if approved.
3. **Voting**: Token holders vote on proposals. Voting power is typically proportional to token holdings, though quadratic and conviction-weighted schemes exist to mitigate plutocracy.
4. **Execution**: If a proposal passes the defined threshold, the smart contract executes it automatically.

**The DAO hack (2016)**: The first major DAO, simply called "The DAO," raised $150 million in ETH. A reentrancy vulnerability in its withdrawal function allowed an attacker to drain $60 million. The Ethereum community hard-forked to reverse the theft — a controversial decision that split the chain into Ethereum and Ethereum Classic. The episode demonstrated that code-is-law has limits: when the code is wrong, communities face a choice between immutability and intervention.

**Modern DAOs** govern DeFi protocols (MakerDAO controls the DAI stablecoin's collateral parameters), fund public goods (Gitcoin Grants), manage investment pools (MetaCartel Ventures), and direct the evolution of [autonomous worlds](./autonomous-world.md). They range from small working groups with multisig wallets to protocols managing billions in assets.

**Tensions**: DAOs inherit the governance problems they aim to solve. Low voter turnout concentrates power among large holders. Proposal complexity exceeds most voters' expertise. Gas costs discourage participation from small holders. Delegation mechanisms help but reintroduce representative structures. The question of whether DAOs are genuinely autonomous or merely automated remains open.

See also: [decentralized governance](./decentralized-governance.md), [token](./token.md), [smart contract](./smart-contract.md)
