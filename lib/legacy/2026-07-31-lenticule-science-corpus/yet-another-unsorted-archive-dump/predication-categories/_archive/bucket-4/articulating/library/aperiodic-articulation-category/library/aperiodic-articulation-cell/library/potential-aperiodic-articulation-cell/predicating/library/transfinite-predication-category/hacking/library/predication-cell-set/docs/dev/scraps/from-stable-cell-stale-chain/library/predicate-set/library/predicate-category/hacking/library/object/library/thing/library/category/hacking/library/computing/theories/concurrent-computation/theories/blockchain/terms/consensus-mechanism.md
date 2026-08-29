---
title: Consensus Mechanism
description: The protocol by which nodes in a distributed network agree on a single canonical state without a central authority.
defines: consensus-mechanism
aliases: [consensus mechanism, consensus algorithm, consensus protocol]
date-created: 2026-04-05
sources:
  - title: "Bitcoin: A Peer-to-Peer Electronic Cash System"
    url: https://bitcoin.org/bitcoin.pdf
  - title: "Ethereum Proof-of-Stake"
    url: https://ethereum.org/en/developers/docs/consensus-mechanisms/pos/
---

A consensus mechanism is the protocol by which nodes in a distributed network reach agreement on a single canonical version of the ledger's [on-chain state](./on-chain-state.md), without requiring a trusted central coordinator.

The problem a consensus mechanism solves is fundamental: in a network of thousands of independent computers, each receiving transactions in different orders at different times, how does the network agree on which transactions are valid and in what sequence? A centralized database solves this trivially — one server is authoritative. A decentralized network needs a protocol that tolerates dishonest participants, network delays, and conflicting claims.

**Proof of Work (PoW)**:

Satoshi Nakamoto's Bitcoin whitepaper (2008) introduced the first practical solution. Miners compete to solve a computationally expensive puzzle (finding a hash below a target threshold). The first miner to solve it proposes the next block. Other nodes verify the solution (cheap) and accept the block if valid. The longest chain — the one with the most accumulated computational work — is canonical.

PoW's security comes from economics: attacking the network requires more computational power than the honest majority, which costs real electricity and hardware. Bitcoin's PoW has been continuously operational since January 2009.

**Proof of Stake (PoS)**:

Ethereum transitioned from PoW to PoS in September 2022 (the "Merge"). Instead of expending computation, validators lock cryptocurrency as collateral (32 ETH minimum on Ethereum). Validators are randomly selected to propose blocks, and committees of validators attest to block validity. Dishonest validators lose their stake (slashing).

PoS eliminates the energy expenditure of PoW (Ethereum's energy consumption dropped ~99.95% after the Merge) but introduces different trust assumptions: validators with more stake have more influence, and the security model depends on the economic value of the staked assets.

**Other mechanisms**:

- **Delegated Proof of Stake (DPoS)**: Token holders elect a fixed set of validators (used by EOS, Tron). Faster but more centralized.
- **Proof of Authority (PoA)**: Known, trusted validators sign blocks. Used in private/consortium chains where decentralization is less important than throughput.
- **Byzantine Fault Tolerance (BFT) variants**: Tendermint (used by Cosmos) achieves instant finality through multi-round voting among a validator set. Tolerates up to one-third malicious validators.

The choice of consensus mechanism determines a chain's throughput, finality time, energy cost, and degree of decentralization — the parameters that shape what applications are feasible to build on it.

See also: [on-chain state](./on-chain-state.md), [gas fee](./gas-fee.md), [smart contract](./smart-contract.md)
