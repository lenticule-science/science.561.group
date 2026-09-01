---
title: Connections in Blockchain Design
description: How cryptographic primitives, storage infrastructure, and economic design interact in practice.
date-created: 2026-04-05
---

The three major domains of blockchain engineering — cryptographic verification, storage, and economic incentives — are deeply interdependent.

## Verification Enables Decentralization

Merkle trees and zero-knowledge proofs don't just provide security; they enable decentralization by eliminating the need for a trusted third party to verify claims.

In IPFS, the Merkle DAG structure means any peer can verify that downloaded content matches the CID you requested. There's no central server to confirm authenticity — the hash itself is the proof.

In Dark Forest, zero-knowledge proofs allow the blockchain to verify that moves are valid without a server controlling game logic. Players can prove facts about their state without revealing it.

In Filecoin, Proof of Replication and Proof of Spacetime create verifiable storage markets where clients don't need to trust providers — the proofs are the trust mechanism.

**The pattern**: Cryptography replaces trust in institutions with mathematical certainty.

## Storage Requires Economic Incentives

Cryptographic proofs alone don't guarantee storage. A Merkle hash is worthless if no one maintains a copy of the data.

IPFS relies on pinning services (and their economic incentives) to ensure persistence. Arweave builds permanence into its consensus: miners must prove they have random historical blocks to earn rewards. Filecoin creates a market where providers compete to store data and prove its availability.

Without economic incentives aligned correctly, storage fails. The Axie Infinity NFTs were hosted on centralized servers that their creators controlled — even though the blockchain recorded their hashes, the data disappeared when servers went offline.

**The pattern**: Cryptographic proofs create verifiability, but economic incentives create persistence.

## Economic Design Requires Verification

For token economies to avoid Axie Infinity's collapse, they need:

1. **Verifiable scarcity**: A cap on token supply that can't be changed without consensus. Ethereum stores this in code; anyone can verify that no more ETH than promised can ever be minted.

2. **Verifiable transactions**: Every transaction is verified by the network. No one can spend coins they don't own. This is enforced by Merkle trees and digital signatures.

3. **Verifiable state**: The state trie (Merkle Patricia Trie in Ethereum) creates a cryptographic commitment to account balances. You can prove you own X tokens without a central database.

Without verification, a token economy becomes a ledger run by a company. The company can change the rules (Axie Infinity did this repeatedly), print more tokens (all unsustainable play-to-earn games do this), or shut down entirely (the risk with any centralized service).

**The pattern**: Cryptographic verification gives economic guarantees real teeth.

## Composability Emerges from All Three

Loot succeeded where Axie Infinity failed because it combined all three principles:

1. **Storage**: Loot data is stored on-chain (Merkle state tree), making it verifiably permanent and accessible.

2. **Verification**: Any developer can query the contract and verify what items a Loot bag contains. The contract's hash commitment means the data cannot be forged.

3. **Economic incentives**: Every derivative (Realms, Adventure Gold, etc.) increases the utility of owning Loot, which increases Loot's value. New economic layers don't compete with the original — they compound.

This is composability: new projects can build on Loot's primitives because the data is verifiable and permanent.

In contrast, Axie Infinity's game state is centralized. Only Axie Infinity can determine what breeding costs, what SLP is worth, or whether a player's account is valid. Other developers can't build on top of Axie because they have no cryptographic guarantees about state.

## The Core Insight

Blockchain engineering is about replacing trust in institutions with:
1. Cryptographic proofs (verification)
2. Economic incentives (persistence)
3. Open data (composability)

When any of these is missing, the system fails:
- Missing verification: centralized control, rug pulls, censorship
- Missing incentives: data loss, network collapse, abandoned infrastructure
- Missing openness: vendor lock-in, inability to compose, monopolistic control

The most durable Web3 systems (Bitcoin, Ethereum, Loot) have all three. Most failures (Axie Infinity, centralized exchanges, proprietary rollups) miss at least one.

## See Also

- [Content-Addressed Storage: IPFS, Arweave, and the Permaweb](texts/content-addressed-storage.md)
- [Merkle Trees, Merkle Patricia Tries, and Verifiable Computation](texts/merkle-trees-and-verifiable-computation.md)
- [Web3 Game Economies: From Play-to-Earn Collapse to Sustainable Design](texts/web3-game-economies.md)
