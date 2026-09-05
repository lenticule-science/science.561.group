---
name: Merkle Root
description: The top hash of a Merkle tree, serving as a cryptographic fingerprint of all data in the tree.
date-created: 2026-04-05
sources:
  - url: https://www.alchemy.com/docs/merkle-trees-in-blockchains
---

A Merkle root is the final hash computed at the top of a Merkle tree. It is the result of recursively hashing pairs of adjacent data items until a single hash remains.

**Properties**:

1. **Fingerprint**: The Merkle root is a compact representation of the entire tree. If even one leaf changes, the root changes completely.

2. **Verification**: You can prove that a specific leaf is in the tree by providing a Merkle proof — a logarithmic number of hashes along the path from that leaf to the root. The verifier recomputes hashes upward and checks they match the root.

3. **Scalability**: For a tree with 1,000 leaves, a proof requires about 10 hashes instead of 1,000 leaves. This is why Merkle trees are used in blockchains — light clients can verify transactions without downloading entire blocks.

In Bitcoin, the Merkle root of all transactions in a block is stored in the block header. In Ethereum, Merkle Patricia Tries produce three roots per block: state root, transaction root, and receipt root.

See: [Merkle Trees, Merkle Patricia Tries, and Verifiable Computation](../texts/merkle-trees-and-verifiable-computation.md)
