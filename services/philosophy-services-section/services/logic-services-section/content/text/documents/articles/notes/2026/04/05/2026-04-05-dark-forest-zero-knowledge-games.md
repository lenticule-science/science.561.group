---
title: "Dark Forest: Pioneering On-Chain Gaming with Zero-Knowledge Proofs"
description: "Analysis of Dark Forest, the first real-time strategy game running on Ethereum, and its cryptographic fog of war system using zkSNARKs. How zero-knowledge proofs enable private state in public blockchains, and how this influenced autonomous world design."
date-created: 2026-04-05
domain: blockchain-games
subjects:
  - dark-forest
  - zero-knowledge-proofs
  - zk-snarks
  - fog-of-war
  - on-chain-privacy
sources:
  - title: "Announcing Dark Forest"
    url: "https://blog.zkga.me/announcing-darkforest"
  - title: "Zero-Knowledge Proofs for Engineers: Introduction"
    url: "https://blog.zkga.me/intro-to-zksnarks"
  - title: "Zero-Knowledge Proofs: Adventures in the Dark Forest"
    url: "https://hackernoon.com/zero-knowledge-proofs-adventures-in-the-dark-forest-jij3xyn"
  - title: "This groundbreaking sci-fi blockchain game could help create a metaverse that no one owns"
    url: "https://www.technologyreview.com/2022/11/10/1062981/dark-forest-blockchain-video-game-creates-metaverse/"
  - title: "Dark Forest: A Beacon of Light for Blockchain Games"
    url: "https://naavik.co/deep-dives/dark-forest-beacon-of-light/"
  - title: "Cryptographic Fog of War"
    url: "https://www.ingonyama.com/blog/cryptographic-fog-of-war"
  - title: "Dark Forest — One interesting game with zk-SNARK technology"
    url: "https://starli.medium.com/dark-forest-one-interesting-game-with-zk-snark-technology-47528fa7691e"
---

Dark Forest is an infinite, procedurally-generated, real-time strategy game running entirely on Ethereum. Players discover and conquer planets in a universe specified cryptographically. The radical innovation is that the game maintains incomplete information: each player knows the location of planets they have discovered, but the blockchain itself does not reveal coordinates to anyone, enforced using zero-knowledge proofs (zkSNARKs).

Launched in 2020 by Brian Gu (using the pseudonym Gubsheep) at MIT, Dark Forest demonstrated that fully on-chain gaming was possible and influenced the design of later frameworks like MUD. The game is named after Liu Cixin's science fiction novel and operates under the principle that in a hostile universe, information asymmetry is your defense.

## The Incomplete Information Problem

Traditional games played on blockchains face a fundamental tension:

- Blockchain states are public by design. Anyone can inspect a contract and see all variables.
- But many games require hidden information: the locations of your enemies, the contents of your hand in poker, the positions of your units in strategy games.

If a game stores all state on-chain in plain form, all players instantly see everything. There can be no fog of war, no bluffing, no surprise. This makes many game genres unplayable on public chains.

Dark Forest solves this using zero-knowledge proofs.

## Cryptographic Fog of War

Instead of storing planet coordinates directly on-chain, Dark Forest stores only their hashes. Players can prove they have discovered a planet without revealing its location.

### How It Works

Each planet is identified by a unique coordinate pair. The developer hashes this coordinate using a hash function (e.g., Keccak-256). Only the hash is public. The original coordinates are secret.

When a player discovers a planet (by computing and finding a hash that matches a known planet hash), they learn the coordinates. They can then:

1. Submit the coordinates to prove they own the planet
2. Generate a zero-knowledge proof asserting the coordinates are valid without revealing them

The proof cryptographically certifies: "I know a coordinate pair that hashes to this known hash, and it is a valid move from my current planet." The blockchain verifies the proof without learning the coordinates.

To find planets, players must brute-force search: they hash coordinate pairs across the universe, looking for matches to known hashes. The game space is so large (and hashing so expensive) that brute-forcing is practical only for nearby regions. This creates a natural fog of war based on computational work, not server-side cheating.

## Zero-Knowledge Proofs: The Technical Foundation

A zero-knowledge proof (ZKP) is a cryptographic primitive that allows one party to prove a statement is true without revealing the information used to prove it.

### Formal Definition

A ZKP system allows a prover to convince a verifier of a statement S such that:

1. **Completeness** — If S is true, the verifier will accept the proof
2. **Soundness** — If S is false, the verifier will reject the proof with overwhelming probability
3. **Zero-knowledge** — The verifier learns nothing except that S is true; the proof reveals no other information

### zkSNARKs in Dark Forest

Dark Forest uses **zkSNARKs** (Zero-Knowledge Succinct Non-Interactive Arguments of Knowledge):

- **Succinct** — The proof is very small (a few hundred bytes) regardless of the statement's complexity
- **Non-interactive** — The prover and verifier do not need to communicate back-and-forth; a single message is sufficient
- **Arguments of knowledge** — The proof is computationally sound; it cannot be forged in reasonable time

In Dark Forest v0.3, zkSNARKs verify two operations:

1. **Planet initialization (init)** — Proof that a planet coordinate hashes to a known hash and is valid for initialization
2. **Planet movement (move)** — Proof that transferring energy from one planet to another follows the rules (the source planet exists, has enough energy, etc.) without revealing coordinates

The proofs use the **Groth16** proving system, a widely-used zkSNARK construction that is efficient to verify on-chain.

## The Procedurally-Generated Universe

Dark Forest's universe is infinite and procedurally generated. Coordinates are not pre-computed; instead, the validity of a coordinate is determined by a hash function. If a coordinate hashes to a value with certain properties (e.g., the first N bits are zero), it is a valid planet location.

This means:

- The universe is deterministic: the same coordinates always have the same properties
- The universe is infinite: new regions can always be explored
- Planets are discovered, not assigned: players find planets by brute-forcing hashes

The function used is typically Keccak-256 with a difficulty parameter. A valid planet might be a coordinate where Keccak256(coordinate) < 2^256 / difficulty. Players find planets by searching their local region of the coordinate space.

This creates emergent geopolitics: players near each other compete for resources, distant players are isolated, and border conflicts naturally arise as populations expand.

## Game Mechanics

Within the fog of war:

- **Planets** — Resources to be discovered and conquered. Each planet has energy, production capacity, and defense.
- **Units** — Energy-based forces that attack and defend. Players send energy from one planet to another; the amount that arrives depends on travel time and distance.
- **Strategy** — Hide your home planet to avoid attack, scout your neighbors without revealing your position, attack weak targets while defending your borders.

The fog of war is not arbitrary; it is derived from the cryptographic structure of the universe. The game rules are transparent and immutable; the asymmetry comes from information, not from hidden state.

## Influence on Autonomous Worlds

Dark Forest was revolutionary because it demonstrated:

1. **Fully on-chain games are feasible** — Complex, real-time gameplay can run entirely on Ethereum
2. **Cryptography solves incomplete information** — Zero-knowledge proofs are the right tool for private state on public chains
3. **Community extensions are valuable** — The community built custom clients, visualization tools, and gameplay mods that enhanced the experience
4. **Decentralized games are attractive** — Players preferred Dark Forest's permissionless extensibility and permanence over traditional games

MUD's architecture was influenced by Dark Forest's success. Both embrace:

- Fully on-chain state storage
- Permissionless extension (custom Systems in MUD, custom clients in Dark Forest)
- Separation of concerns (state vs. logic)
- Community governance and forking (DF Ares, a community revival, is a separate instance on the same contract infrastructure)

## Technical Challenges and Lessons

### Proof Generation Cost

Generating zkSNARK proofs is computationally expensive. In Dark Forest, players generate proofs client-side before submitting transactions. This requires:

- Downloading the proving key (several megabytes)
- Running the prover circuit on-chain logic (takes minutes on a laptop)
- Submitting the proof and waiting for on-chain verification

This created a barrier to mobile play and made real-time interaction difficult. Later games use proof delegation (proofs generated on the server) or different privacy mechanisms.

### Verifier Gas Cost

Even verifying a zkSNARK proof costs gas. A single move in Dark Forest costs ~200k gas to verify the proof and update state. With Ethereum at typical gas prices, this makes every action expensive. Subsequent games use Layer 2 rollups to reduce costs.

### Proof Soundness

The strength of Dark Forest's privacy depends on the security of the hash function and the soundness of Groth16. If either is broken, the fog of war collapses. The game uses Keccak-256, which is well-studied, and Groth16, which is a widely-audited construction, but the risk remains.

## Dark Forest's Legacy

Dark Forest remains the canonical example of a fully on-chain strategy game. Though development has slowed, the community maintains it (DF Ares is an active community fork), and it continues to demonstrate that decentralized games are viable and attractive to players.

The game also influenced the development of zero-knowledge gaming frameworks and demonstrated the potential for privacy-preserving on-chain applications beyond games.

---

## See Also

- [Autonomous Worlds](2026-04-05-autonomous-worlds-concept.md) — the broader vision that Dark Forest exemplifies
- [Zero-Knowledge Proofs](../../../../../../../../../../../engineering-science-services-section/services/computer-science-services-section/content/text/glossary/terms/zero-knowledge-proof.md) — the cryptographic primitive enabling Dark Forest's privacy
- [MUD Framework Architecture](../../../../../../../../../../../../../public-services-section/services/public-media-services-section/services/public-fiction-media-services-section/services/public-paracosm-media-services-section/services/teraum-paracosm-services-section/content/text/triage/2026-08-26-computer-mud-engineering-triage/mud-framework-architecture.md) — the successor framework addressing scalability and extensibility
