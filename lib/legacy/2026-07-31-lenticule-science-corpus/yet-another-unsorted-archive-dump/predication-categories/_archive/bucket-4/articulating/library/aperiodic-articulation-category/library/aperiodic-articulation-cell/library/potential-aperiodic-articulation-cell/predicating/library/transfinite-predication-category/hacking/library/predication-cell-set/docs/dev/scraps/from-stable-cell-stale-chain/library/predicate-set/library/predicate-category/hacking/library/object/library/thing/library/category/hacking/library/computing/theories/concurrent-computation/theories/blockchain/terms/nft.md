---
name: Non-Fungible Token (NFT)
description: A blockchain token with a unique identifier, representing ownership of a distinct digital or physical asset.
aliases: [NFT, non-fungible token, NFTs, ERC-721]
date-created: 2026-04-05
extends: token
sources:
  - title: "ERC-721 Non-Fungible Token Standard"
    url: https://eips.ethereum.org/EIPS/eip-721
  - title: "CryptoKitties"
    url: https://www.dapperlabs.com/cryptokitties
---

A non-fungible token (NFT) is a [token](./token.md) where each unit carries a unique identifier, making it distinguishable from every other token in the same contract. Unlike fungible tokens (where one unit equals any other), each NFT represents a specific asset — a piece of art, a game character, a plot of virtual land, a membership credential.

The ERC-721 standard, authored by William Entriken, Dieter Shirley, Jacob Evans, and Nastassia Sachs in January 2018, formalized this pattern on Ethereum. The contract maps each token ID to exactly one owner address and provides functions for transferring individual tokens. The standard also includes a metadata extension: each token ID can point to a URI describing the asset's properties (name, image, attributes).

**What an NFT actually stores**:

The token contract itself stores only ownership mappings and metadata URIs — not the asset. A JPEG "stored as an NFT" typically means the blockchain records who owns token #42 and that token #42 points to a URL or [content identifier](./content-identifier.md) where the image lives. If that URL breaks, the NFT still exists but the art is gone. Projects that store metadata and assets on-chain (like Loot, which stores item descriptions directly in the contract) avoid this fragility but pay higher [gas](./gas-fee.md) costs.

**CryptoKitties (2017)** was the first widely-adopted NFT project, congesting the Ethereum network and demonstrating both the appeal and the scalability limits of on-chain collectibles. Each kitty was an ERC-721 token with genetic attributes determined by its parents' traits — an early example of on-chain generative content.

**Applications beyond art**:

- **Game assets**: Characters, items, and land in [autonomous worlds](./autonomous-world.md) are NFTs, enabling true ownership and cross-game portability.
- **Identity and credentials**: Soulbound tokens (non-transferable NFTs) represent achievements, certifications, or reputation.
- **Financial instruments**: NFTs can represent unique positions — a specific liquidity provision range in Uniswap v3, for instance.

The Loot project demonstrated how NFTs function as composable primitives: 8,000 bags of text-only adventurer gear spawned over 40 derivative projects, each reading from and building on the original contract. The NFT was not the art — it was the shared data layer.

See also: [token](./token.md), [composability](./composability.md), [on-chain state](./on-chain-state.md)
