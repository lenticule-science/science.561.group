---
title: Merkle Trees, Merkle Patricia Tries, and Verifiable Computation
description: How cryptographic proofs enable light clients, scalable rollups, and fog of war in on-chain games.
date-created: 2026-04-05
sources:
  - title: "How are Merkle trees used in blockchains?"
    url: https://www.alchemy.com/docs/merkle-trees-in-blockchains
  - title: "Merkle Tree Proofs"
    url: https://medium.com/@ohm.patel1997/merkle-tree-proofs-e531b1b3c7e5
  - title: "Merkle Patricia Trie - ethereum.org"
    url: https://ethereum.org/developers/docs/data-structures-and-encoding/patricia-merkle-trie/
  - title: "Patricia Merkle Tries - Alchemy Docs"
    url: https://www.alchemy.com/docs/patricia-merkle-tries
  - title: "Understanding Zero-Knowledge Proofs: zk-SNARKs for Verifiable Computation"
    url: https://medium.com/@bhaskark2/understanding-zero-knowledge-proofs-part-1-verifiable-computation-with-zk-snarks-ba6cbb8e6001
  - title: "zk-SNARKs vs zk-STARKs: Key Distinctions"
    url: https://hacken.io/discover/zk-snark-vs-zk-stark/
  - title: "ZK Rollups vs Optimistic Rollups"
    url: https://www.cyfrin.io/blog/a-full-comparison-what-are-fraud-proofs-and-validity-proofs
  - title: "Announcing Dark Forest"
    url: https://blog.zkga.me/announcing-darkforest
  - title: "Zero-Knowledge Proofs for Engineers: Introduction"
    url: https://blog.zkga.me/intro-to-zksnarks
---

## Merkle Trees in Blockchains

A Merkle tree is a binary tree where each leaf is a data item and each non-leaf node is the hash of its two children. The root hash, called the Merkle root, is a compact fingerprint of the entire tree.

In Bitcoin, all transactions in a block are arranged into a Merkle tree. The block header stores only the Merkle root, not the full list of transactions. This enables two critical properties:

1. **Tamper detection**: Changing a single transaction changes its leaf hash, which cascades upward through all ancestor nodes, resulting in a completely different Merkle root. Altering even one transaction is immediately apparent.

2. **Efficient verification**: A light client (a device with limited storage) doesn't need to download the entire block. To verify that a specific transaction is in a block, it needs only a "Merkle proof" — a logarithmic number of hashes along the path from that transaction to the root. For a block with 1,000 transactions, a Merkle proof requires about 10 hashes, not 1,000.

The amount of proof data scales logarithmically: proof size = log₂(number of transactions). This is why Merkle trees are the cryptographic backbone of scalable blockchains.

## Merkle Patricia Tries: Ethereum's State Tree

Ethereum stores state (all account balances, smart contract storage, code) in a Merkle Patricia Trie (MPT), a data structure that combines three ideas:

- **Trie** (prefix tree): Keys are organized by shared prefixes, enabling fast lookups
- **Merkle**: Every node is hashed, creating a cryptographic fingerprint of the entire state
- **Patricia**: A radix tree that compresses paths where nodes have a single child, reducing depth and improving efficiency

A "nibble" is a 4-bit unit (a hex digit). Nodes in an MPT can have up to 16 children (one per hex digit), so they're represented as 17-element arrays: 16 children plus a value element, called "branch nodes."

The MPT has three key properties:

1. **Deterministic**: Given a set of key-value pairs, there is exactly one valid MPT. Two identical states must produce the same root hash.

2. **Cryptographically verifiable**: The only way to generate a state root is by computing it from each piece of state. No spoofing is possible.

3. **Updatable in logarithmic time**: Adding, removing, or changing a value requires only O(log n) operations.

Ethereum maintains **three MPTs per block**, each with a root hash stored in the block header:

- **State Trie**: The full state. The key is the Keccak-256 hash of an account address; the value is the account (nonce, balance, storage root, code hash).
- **Transaction Trie**: All transactions in the block.
- **Receipt Trie**: Transaction receipts (logs, gas used, status).

This design lets light clients verify facts about the chain by checking only the root hashes in block headers, not the entire state. A light client can prove "account X has balance Y" by obtaining the Merkle proof from a full node.

## Zero-Knowledge Proofs for Verifiable Computation

A zero-knowledge proof is a protocol where one party (the prover) convinces another (the verifier) that a statement is true without revealing any information beyond the truth of the statement itself.

This enables **verifiable computation**: you can outsource expensive computation to an untrusted party, and they can prove the result is correct without you redoing the work.

### zk-SNARKs

zk-SNARK stands for "Zero Knowledge Succinct Non-Interactive Argument of Knowledge."

- **Succinct**: The proof is small and quick to verify, regardless of computation size
- **Non-interactive**: No back-and-forth between prover and verifier; the proof is a single message
- **Argument of knowledge**: The prover is asserting knowledge of a solution

The tradeoff: zk-SNARKs require a **trusted setup** ceremony. Both the prover and verifier use a shared public parameter (the Common Reference String, or CRS) that was generated by a trusted party. If that party keeps a copy of the randomness used to generate the CRS, they could forge proofs. To mitigate this, multi-party computation is used: many participants each contribute random values, and the CRS is secure as long as at least one participant is honest.

zk-SNARKs generate proofs 68x faster with 123x smaller proof sizes than alternatives, but verify slower and require trusted setup.

### zk-STARKs

zk-STARK stands for "Zero Knowledge Scalable Transparent Argument of Knowledge," introduced in 2018 as an alternative to SNARKs.

The key difference: zk-STARKs are **transparent** — they require no trusted setup. The public parameters are generated using publicly verifiable randomness, so there's no secret that could be weaponized.

The tradeoff: zk-STARK proofs are larger and generation is slower than SNARKs. But verification is faster, and they're post-quantum secure (resistant to attacks from quantum computers).

## Rollups: Optimistic vs. Zero-Knowledge

Both optimistic and ZK rollups compress transactions off-chain and submit a proof to the main chain, reducing on-chain computation.

### Optimistic Rollups

Optimistic rollups **assume all transactions are valid by default** and only verify them if someone challenges them. The system includes a dispute period (typically 7 days) where anyone can submit a "fraud proof" to challenge a transaction batch.

A fraud proof proves that a specific transaction is invalid — that the post-transaction state doesn't match what was claimed. This requires showing a counterexample, which can be substantial.

**Pros**: Simple to implement, no complex cryptography required, cheap to submit batches (40,000 gas per batch).

**Cons**: Long withdrawal times (users must wait for the dispute period), and if a dishonest sequencer submits an invalid batch, the entire system must halt and reorg to fix it.

### ZK Rollups

ZK rollups compute a zero-knowledge proof for each transaction batch that cryptographically proves the batch is valid. The proof is submitted on-chain and verified by a smart contract.

Every new batch comes with a zk-SNARK or zk-STARK proving the batch computation produces the correct new state root.

**Pros**: Fast finality (withdrawals are instantaneous because transactions are already validated), and no dispute period needed.

**Cons**: Complex to implement, expensive per batch due to proof verification (500,000 gas for a zk-SNARK batch), and the trusted setup (for SNARKs) creates a governance risk.

The practical difference: Optimistic is simpler but slower to exit; ZK is more complex but enables instant finality.

## Dark Forest: Fog of War via Zero-Knowledge Proofs

Dark Forest is an MMO space-conquest game where players discover and conquer planets in a procedurally-generated, cryptographically-specified infinite universe. The game uses zk-SNARKs to implement "cryptographic fog of war" — a game state where information is hidden not by a central server withholding it, but by mathematics.

In a traditional MMO, the server knows all player positions and uses that to decide what each player sees. A cheater can modify the client to request all data. In Dark Forest, the blockchain itself can't see where players are.

The mechanism:

1. **Commitment**: A player doesn't submit planet coordinates directly. Instead, they submit the hash of (coordinates || secret). This commitment is public but cryptographically binds them to specific coordinates.

2. **Hidden movement**: When a player moves from one planet to another, they submit the hash of the starting planet and the hash of the destination, along with a zero-knowledge proof that:
   - The move is from a hashed coordinate they previously published
   - The destination is within valid range
   - No rules are violated

3. **Discovery**: The only way to find other players is through brute force. Players hash regions of the game universe looking for coordinates that match published hashes. This computable search is the "fog of war" — you can only see what you compute.

The result: the smart contract can verify moves are valid without ever knowing player positions. The blockchain is the source of truth for game state, but that state is mathematically hidden until players choose to reveal it.

This demonstrates a critical insight: **zero-knowledge proofs enable decentralized game logic**. The server no longer needs to be trusted to know or conceal player positions. The proof mechanism itself enforces the rules.

## Verifiable Computation in Practice

The shift from "everyone computes the same thing" to "one party computes and everyone verifies the proof" is profound:

1. **Efficiency**: Computation is expensive; verification is cheap. Scale computation once, verify it many times.

2. **Privacy**: The prover can keep inputs private while proving the output is correct. A company can prove their accounting is correct without revealing all transactions.

3. **Decentralization**: Instead of relying on a trusted server, participants can verify proofs locally.

4. **Incentive alignment**: Provers are economically incentivized to be correct because invalid proofs can be detected and punished.

The tradeoff: the overhead of generating proofs can be substantial. For some applications (especially simple ones), the cost of proof generation outweighs the savings from efficient verification. But for complex computation — especially on-chain state updates — the math becomes favorable quickly.

## See Also

- [Content-Addressed Storage: IPFS, Arweave, and the Permaweb](2026-04-05-content-addressed-storage.md)
- [Web3 Game Economies: From Play-to-Earn Collapse to Sustainable Design](2026-04-05-web3-game-economies.md)
