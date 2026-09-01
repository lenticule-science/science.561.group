---
name: Fog of War
description: A game mechanic where players can only see information they have computed or discovered, preventing a central server from revealing hidden state.
date-created: 2026-04-05
sources:
  - url: https://blog.zkga.me/announcing-darkforest
---

Fog of war is a game mechanic where the information available to a player is limited to what they have discovered or can see from their current vantage point. It creates uncertainty and the need for exploration.

In traditional games, the server knows all player positions and chooses what to reveal to each client. A cheater can modify the client to request all data.

In cryptographic fog of war (used in Dark Forest), the blockchain itself cannot see hidden information. Players commit to positions by hashing them, and only through brute-force computation can they discover other players' positions.

**How it works in Dark Forest**:

1. A player submits the hash of (coordinates || secret), binding themselves to specific coordinates.
2. When moving, the player submits zero-knowledge proofs that the move is valid without revealing their position.
3. Other players can only discover positions by hashing regions of the game universe and checking if the hash matches a published commitment.

This approach makes fog of war enforced by cryptography rather than server trust. The blockchain verifies moves are valid without knowing positions.

See: [Merkle Trees, Merkle Patricia Tries, and Verifiable Computation](../texts/merkle-trees-and-verifiable-computation.md), [Web3 Game Economies](../texts/web3-game-economies.md)
