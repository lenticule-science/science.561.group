---
name: Zero-Knowledge Proof
description: "A cryptographic method allowing one party to prove a statement is true to another party without revealing any information used in the proof. In blockchain gaming, enables private state and fog of war on public ledgers."
date-created: 2026-04-05
domain: blockchain-games
aliases:
  - ZKP
  - zkSNARK
  - zero-knowledge
subjects:
  - cryptography
  - privacy
  - blockchain
  - game-design
sources:
  - title: "Zero-Knowledge Proofs for Engineers: Introduction"
    url: "https://blog.zkga.me/intro-to-zksnarks"
  - title: "A Review of Zero Knowledge Proofs"
    url: "https://timroughgarden.github.io/fob21/reports/r4.pdf"
  - title: "Zero-Knowledge Proofs: Adventures in the Dark Forest"
    url: "https://codeclimbing.com/zero-knowledge-proofs-adventures-in-the-dark-forest/"
  - title: "Cryptographic Fog of War"
    url: "https://www.ingonyama.com/blog/cryptographic-fog-of-war"
---

A zero-knowledge proof (ZKP) is a cryptographic protocol in which one party (the prover) convinces another party (the verifier) that a statement is true without revealing any information used to construct the proof.

Formally, a ZKP protocol has three properties:

1. **Completeness** — If the statement is true, the prover can construct a proof that the verifier will accept
2. **Soundness** — If the statement is false, the prover cannot construct a valid proof (except with negligible probability)
3. **Zero-knowledge** — The verifier learns nothing except that the statement is true; the proof reveals no additional information

## Example: Knowing a Discrete Logarithm

Suppose Alice claims to know a value x such that g^x = y (where g and y are public). Alice wants to prove she knows x without revealing x.

A simple ZKP protocol:
1. Alice picks a random r and sends g^r to Bob
2. Bob sends a random challenge bit c
3. Alice sends z = r + c*x
4. Bob checks: g^z = g^r * y^c

If Alice knows x, she can always satisfy step 4. If she doesn't know x but commits to g^r, she cannot respond correctly to both c=0 and c=1 (she'd have to guess Bob's challenge beforehand). Bob is convinced and learns nothing about x.

## zkSNARKs: Succinct Non-Interactive Arguments of Knowledge

Most blockchain applications use zkSNARKs (zero-knowledge succinct non-interactive arguments of knowledge):

- **Succinct** — The proof is very small (a few hundred bytes) and quick to verify, regardless of computation size
- **Non-interactive** — No back-and-forth between prover and verifier; one message suffices
- **Arguments of knowledge** — Computationally sound; an adversary with polynomial time cannot forge a proof

Common zkSNARK constructions:

- **Groth16** — Used in Dark Forest; compact proofs and fast verification, but requires a trusted setup
- **Plonk** — More recent; universal trusted setup, more flexible circuit design
- **STARKs** — Newer alternative; post-quantum secure, no trusted setup, but larger proofs

## Application in Gaming: Cryptographic Fog of War

Zero-knowledge proofs enable private game state on public blockchains.

In Dark Forest, planets are identified by coordinates. Instead of storing coordinates on-chain, only hashes are public. A player who discovers a planet (by brute-force searching for coordinates that hash to a known value) can prove they know valid coordinates without revealing them.

The player submits a zkSNARK asserting: "I know a coordinate pair that hashes to this hash, and moving energy from planet A to planet B follows the game rules." The blockchain verifies the proof without learning the coordinates, and the move is recorded. Other players see that an attack happened but not from where or to where (until they discover the planets themselves).

This is the core insight: ZKPs decouple private information from public verification. The game state is public, but strategic information remains private.

## Computational Cost

Generating zkSNARK proofs is computationally expensive:

- **Prover** — Must execute the computation being proven, then perform additional cryptographic operations. A 1-2 minute computation for a typical game move.
- **Verifier** — On-chain verification is much cheaper (100k-500k gas for a Groth16 proof) but still significant compared to a simple state read.

This means:

- Players generate proofs on their client before submitting transactions
- Proof generation is a user-facing latency cost (can be mitigated with proof delegation—a server generates proofs on behalf of the user)
- Verification on-chain is a gas cost that must be paid

## Limitations and Alternatives

**Trusted setup** — Groth16 requires a trusted setup phase where a trusted ceremony is run to generate public parameters. If the ceremony is compromised, proofs can be forged. Subsequent schemes (Plonk, Halo2) eliminate this with universal or transparent setups.

**Circuit complexity** — Writing the circuit (the logic being proven) is complex and error-prone. Circuit languages (Circom, Noir) aim to simplify this, but it remains specialized work.

**Practicality for large computations** — Proving very large computations is still expensive. Games are typically constrained to game-logic proofs (move validity, not entire physics simulation).

**Proof size** — While zkSNARK proofs are smaller than STARKs, they are still hundreds of bytes, adding to transaction size and cost.

---

## See Also

- [Dark Forest](../texts/dark-forest-zero-knowledge-games.md) — pioneering use of ZKPs in gaming
- [Imminent Solace](../texts/mud-games.md) — modern MUD game using ZK fog of war
