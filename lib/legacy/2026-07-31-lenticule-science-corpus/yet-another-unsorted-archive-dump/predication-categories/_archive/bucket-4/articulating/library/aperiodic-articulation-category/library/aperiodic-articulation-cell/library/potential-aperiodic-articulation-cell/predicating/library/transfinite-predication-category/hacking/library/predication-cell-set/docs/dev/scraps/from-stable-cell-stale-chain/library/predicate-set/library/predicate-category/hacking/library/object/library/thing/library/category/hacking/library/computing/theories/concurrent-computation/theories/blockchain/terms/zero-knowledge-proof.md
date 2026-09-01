---
name: Zero-Knowledge Proof
description: A cryptographic protocol where a prover demonstrates a statement is true without revealing any information beyond that truth.
date-created: 2026-04-05
sources:
  - url: https://medium.com/@bhaskark2/understanding-zero-knowledge-proofs-part-1-verifiable-computation-with-zk-snarks-ba6cbb8e6001
  - url: https://en.wikipedia.org/wiki/Zero-knowledge_proof
---

A zero-knowledge proof is a cryptographic protocol in which one party (the prover) convinces another party (the verifier) that a statement is true without conveying any information beyond the truth of that statement.

**Properties**:

1. **Completeness**: If the statement is true, an honest prover can always convince an honest verifier.
2. **Soundness**: If the statement is false, no dishonest prover can convince the verifier (except with negligible probability).
3. **Zero knowledge**: The verifier learns nothing except that the statement is true.

**Common implementations**:

- **zk-SNARKs**: Succinct, small proofs that verify quickly, but require a trusted setup ceremony. Widely used in Ethereum rollups.
- **zk-STARKs**: Transparent (no trusted setup), larger proofs, slower to generate, but faster to verify and post-quantum secure.

**Applications**:

- **Verifiable computation**: Outsourcing computation and proving the result is correct without redoing the work.
- **Privacy**: Proving a fact about your data (e.g., "my account has $1,000") without revealing the account itself.
- **Game logic**: Dark Forest uses zk-SNARKs to prove moves are valid without revealing player positions to the blockchain.

See: [Merkle Trees, Merkle Patricia Tries, and Verifiable Computation](../texts/merkle-trees-and-verifiable-computation.md)
