---
title: "Content-Addressed Storage: IPFS, Arweave, and the Permaweb"
description: "How identity-by-hash enables decentralized, permanent storage and solves the NFT metadata problem."
date-created: 2026-04-05
sources:
  - title: Content Addressing - Protocol Labs Research
    url: https://research.protocol.ai/tutorials/resnetlab-on-tour/content-addressing/
  - title: IPFS Content Identifiers (CIDs) Documentation
    url: https://docs.ipfs.tech/concepts/content-addressing/
  - title: Merkle Directed Acyclic Graphs (DAG)
    url: https://docs.ipfs.tech/concepts/merkle-dag/
  - title: Arweave - A community-driven ecosystem
    url: https://www.arweave.org/
  - title: Arweave Yellow Paper
    url: https://www.arweave.org/yellow-paper.pdf
  - title: Best Practices for Storing NFT Data using IPFS
    url: https://docs.ipfs.tech/how-to/best-practices-for-nft-data/
  - title: "When good NFTs go bad: sampling 500,000 NFTs"
    url: https://medium.com/alwaysnft/when-good-nfts-go-bad-bd4ab48b0a9f
  - title: IPFS Persistence and Pinning Documentation
    url: https://docs.ipfs.tech/concepts/persistence/
  - title: Guide to IPFS garbage collection
    url: https://blog.logrocket.com/guide-ipfs-garbage-collection/
  - title: Content Addressable Storage - Wikipedia
    url: https://en.wikipedia.org/wiki/Content-addressable_storage
---

## The Address Problem

The World Wide Web uses location addressing: URLs point to servers, and the server's location determines the address. This creates dependency on continuous availability and trust in the server operator. If a server goes offline, gets hacked, or its operator decides to change the content, the address breaks.

In the NFT ecosystem, this became a critical failure mode. An NFT smart contract stores metadata as a URL — typically an IPFS gateway or centralized server. The blockchain only stores the address, not the content. A study sampling almost 500,000 NFTs found that roughly 20% were broken: 76,000 had unresolvable addresses, 4,600 had broken image links, and 19,000 had IPFS links that couldn't resolve. "Rug pulls" exploit this weakness — creators host metadata on centralized servers, then take them down when the NFT reaches peak value.

Content addressing solves this by making the address itself a function of the content's hash. If content changes, the address changes. A URL cannot point to two different images.

## IPFS: Chunking, DAGs, and Content Identifiers

IPFS (Interplanetary File System) divides files into fixed-size chunks (default 256KB), hashing each chunk and building them into a Merkle Directed Acyclic Graph (DAG). A Merkle DAG is a DAG where each node's identifier is the cryptographic hash of its payload and the hashes of its children. This creates immutability by construction: any change to a node's content changes its hash and thus the hashes of all ancestors.

A Content Identifier (CID) is a label that points to material on IPFS based on the content itself, not its location. When you add a file to IPFS, each chunk gets a unique CID, and the root node's CID becomes the file's identifier. The CID encodes the hash function used (SHA256), the hash value, and the data structure type (DAG node, raw file, etc.).

**Key property**: The CID of a node is univocally linked to the contents of its entire subtree. Any change in a node would alter its identifier and thus affect all ancestors in the DAG. This self-verifying structure means:

- Verification happens locally by rehashing the content
- No central server is needed to confirm authenticity
- The entire history of changes is cryptographically auditable

## Pinning and Garbage Collection

IPFS nodes can cache resources they download and share them with peers, but storage is finite. Nodes periodically run garbage collection, a process that frees up used resources to make room for new files. Without intervention, cached data ages out and is deleted.

Pinning prevents data loss during garbage collection. When you pin a file to an IPFS node, you mark it as "keep this indefinitely." There are three types of pins:

- **Direct pins**: Pin a single block and no others
- **Recursive pins**: Pin a block and all of its children (this is the default for `ipfs add`)
- **Indirect pins**: A block pinned as a child of another pinned block

Pinning services like Pinata operate pinning infrastructure specifically for NFT and application data. Instead of relying on a single node, you distribute pins across multiple nodes to ensure persistence. A well-constructed NFT stores metadata and media on IPFS, uses a pinning service to guarantee files persist, and stores only the IPFS hash (CID) on the blockchain.

## Arweave: Permanent Storage via Economic Incentive

Arweave takes a different approach: it makes permanent storage economically rational for miners. Instead of one-time payments and explicit pinning, Arweave requires only a single payment upfront, and the network's consensus mechanism incentivizes miners to keep data indefinitely.

Arweave uses a **blockweave** architecture where each block links to its immediate predecessor and to a randomly chosen "recall block" from earlier history. To mine a new block, nodes must cryptographically prove they can access the recall block. This proof is called Proof of Access.

The probability that a node possesses the recall block is proportional to how much of the blockweave's history that node stores. A node with 1% of the network's historical data has a 1% chance of being selected to provide a recall block. To maximize mining rewards, nodes are incentivized to store as much historical data as possible.

In 2021, Arweave upgraded to **Succinct Proofs of Random Access (SPoRA)**, which adds a "proof of work" style computation on top of data retrieval. This dual requirement optimizes for both fast data access and competitive mining — nodes must be able to retrieve old data quickly AND perform the computational work to prove it.

The permaweb is what results: a permanent version of the web where information cannot be altered or deleted, funded by a one-time payment rather than ongoing fees.

## Bundling and Irys: Scaling Storage Transactions

The problem with Arweave and IPFS is that every file upload requires a transaction, which can be slow or expensive on congested networks. Bundling services batch many uploads into a single transaction.

Bundlr (now rebranded as Irys) handled over 80% of transactions on Arweave at its peak, bundling thousands of transactions per block. Instead of waiting for your upload to be processed individually, you pay Irys a fee, and Irys guarantees your data will arrive on-chain.

Irys added a second mission: provenance — a ledger of record for digital information that tracks data origins and modifications. This turns bundling from a pure scaling solution into an infrastructure for combating misinformation at the protocol layer.

## Filecoin: Verifiable Storage Markets

Filecoin extends content addressing by building a market where storage providers bid on the right to store data. Instead of trusting a single provider, clients can distribute files across competing providers who must continuously prove they're storing the data.

Filecoin uses two proof mechanisms:

- **Proof of Replication (PoRep)**: A provider proves they hold a unique, encoded replica of the data. This proof happens once at sealing time. The encoding process is intentionally slow and computationally heavy, making it difficult to fake.

- **Proof of Spacetime (PoSt)**: The provider continuously proves they still have the data. There are two variants:
  - **WinningPoSt**: Used in block consensus — a selected provider proves they have the data at a specific time
  - **WindowPoSt**: All providers prove they maintain their stored data continuously over time

The market structure:
1. **Discovery**: Clients identify providers and request prices
2. **Negotiation**: Both parties agree on terms
3. **Publishing**: The deal is recorded on-chain
4. **Handoff**: The provider adds the data to a sector and begins proving storage

Providers receive a 10x multiplier on storage power for storing "verified" deals (deals made with verified clients), which increases their block rewards. This incentivizes providers to accept lower prices for verified deals and build reputation.

## Why Content Addressing Matters

Location addressing assumes:
- Servers are always online
- Content is immutable
- A central operator controls access

Content addressing assumes:
- Participants are self-interested (miners/nodes store data for rewards)
- Content's identity is determined by its hash
- Peers can serve content from anywhere

This shift enables:

1. **Censorship resistance**: No single point of control can remove content
2. **Provenance**: You can verify that content hasn't been altered since publication
3. **Redundancy**: Multiple providers can serve the same content by hash
4. **Long-term preservation**: Incentives can be designed to reward keeping data indefinitely

The tradeoff: Content addressing requires discipline in the application layer. An NFT that stores a URL to a centralized server gets no benefit from IPFS. An NFT that stores a CID on IPFS but doesn't pin it might lose access when the provider's node goes offline. True permanence requires explicit pinning, and that cost should be borne upfront.

## See Also

- [Merkle Trees and Verifiable Computation](2026-04-05-merkle-trees-and-verifiable-computation.md)
- [Web3 Game Economies](2026-04-05-web3-game-economies.md)
