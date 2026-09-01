---
title: "Blockchain and Web3 Patterns for Autonomous Systems"
description: "What decentralized coordination, provenance tracking, governance, autonomous execution, and incentive design from blockchain and web3 can teach builders of non-blockchain autonomous systems."
date-created: 2026-04-05
domain: computing
subjects:
  - autonomous-systems
  - decentralized-coordination
  - governance
  - provenance
  - incentive-design
  - entity-component-systems
sources:
  - title: "Compound Governor Bravo Audit"
    url: "https://blog.openzeppelin.com/compound-governor-bravo-audit"
  - title: "Delegated Voting in DAOs: A Scoping Review"
    url: "https://www.frontiersin.org/journals/blockchain/articles/10.3389/fbloc.2025.1598283/full"
  - title: "DAO Voting Mechanism Resistant to Whale and Collusion Problems"
    url: "https://www.frontiersin.org/journals/blockchain/articles/10.3389/fbloc.2024.1405516/full"
  - title: "MUD Documentation"
    url: "https://mud.dev/"
  - title: "Lattice Blog: MUD An Engine for Autonomous Worlds"
    url: "https://lattice.xyz/blog/mud-an-engine-for-autonomous-worlds"
  - title: "Autonomous Worlds (0xparc)"
    url: "https://0xparc.org/blog/autonomous-worlds"
  - title: "Announcing Dark Forest"
    url: "https://blog.zkga.me/announcing-darkforest"
  - title: "ERC-4337: Account Abstraction"
    url: "https://eips.ethereum.org/EIPS/eip-4337"
  - title: "Chainlink Automation Economics"
    url: "https://docs.chain.link/chainlink-automation/automation-economics/"
  - title: "Soulbound Tokens: Decentralized Society"
    url: "https://papers.ssrn.com/sol3/papers.cfm?abstract_id=4105763"
    note: "Buterin, Weyl, Ohlhaver (May 2022)"
  - title: "ERC-6551: Token Bound Accounts"
    url: "https://eips.ethereum.org/EIPS/eip-6551"
  - title: "Retroactive Public Goods Funding"
    url: "https://medium.com/ethereum-optimism/retroactive-public-goods-funding-33c9b7d00f0c"
  - title: "Content Addressing (Protocol Labs)"
    url: "https://research.protocol.ai/tutorials/resnetlab-on-tour/content-addressing/"
  - title: "Axie Infinity Has Left Filipino Gamers Despondent"
    url: "https://time.com/6199385/axie-infinity-crypto-game-philippines-debt/"
  - title: "Loot: The Epitome of Composability"
    url: "https://naavik.co/deep-dives/loot-deconstruction-pro/"
  - title: "Anatomy of a Run: The Terra Luna Crash"
    url: "https://corpgov.law.harvard.edu/2023/05/22/anatomy-of-a-run-the-terra-luna-crash/"
  - title: "The DAO Controversy: The Case for a New Species of Corporate Governance?"
    url: "https://www.frontiersin.org/journals/blockchain/articles/10.3389/fbloc.2020.00025/full"
  - title: "IPFS Content Identifiers Documentation"
    url: "https://docs.ipfs.tech/concepts/content-addressing/"
  - title: "Ethereum Merkle Patricia Trie Documentation"
    url: "https://ethereum.org/developers/docs/data-structures-and-encoding/patricia-merkle-trie/"
  - title: "ZK Rollups vs Optimistic Rollups"
    url: "https://www.cyfrin.io/blog/a-full-comparison-what-are-fraud-proofs-and-validity-proofs"
---

Blockchain systems have spent a decade solving problems that any autonomous system eventually faces: how do independent agents coordinate without a central authority? How do you track who created what, and who owns it now? How do you make rules self-enforcing? How do you motivate contribution when you cannot compel it?

Most of these solutions are over-engineered for our purposes — we do not need trustless consensus among adversaries, and we are not issuing tokens. But the *patterns* are portable. This text extracts the design lessons from DAOs, smart contracts, NFTs, web3 game economies, tokenomics, content-addressed storage, Merkle verification, and the MUD autonomous worlds framework, and maps each to concrete adoption recommendations for non-blockchain autonomous systems.

## 1. DAOs and On-Chain Governance

### What Crypto Does

A Decentralized Autonomous Organization encodes governance rules in smart contracts. Proposals are submitted on-chain, voted on by token holders, and executed automatically if they pass.

**Compound Governor Bravo** is the canonical implementation, used by Uniswap, Nouns DAO, and dozens of others. Its lifecycle: a holder with sufficient tokens (25,000 COMP in Compound's case) submits a proposal. A 2-day review period precedes a 3-day voting window. If the proposal achieves quorum (400,000 votes) and majority approval, it queues to a timelock — a 2-day delay before automatic execution. The timelock exists so that anyone who disagrees can exit before the change takes effect.

**Voting mechanisms** vary:

- *Token-weighted*: one token = one vote. Simple but plutocratic — the top 10% of holders control 76.2% of voting power across major DAOs.
- *Quadratic voting*: cost scales as the square of vote count, mathematically dampening whale influence. Vulnerable to Sybil attacks (splitting tokens across fake wallets).
- *Conviction voting*: voting power accumulates the longer a holder maintains their position. Rewards sustained commitment over flash-loan governance attacks.

**Delegation** implements liquid democracy: holders assign voting power to delegates who vote on their behalf. In practice, only 17% of tokens are delegated, and delegates participate on only 33% of proposals — a critical gap where responsibility arrives but action does not.

**What went wrong**: The original DAO (2016) lost $50M to a reentrancy exploit. The governance process was too slow to respond to an active attack, and Ethereum had to hard-fork to recover funds — splitting the chain into Ethereum and Ethereum Classic. Typical DAO voter turnout is 3–15%. Flash loan attacks let adversaries borrow governance tokens, vote, and repay in a single transaction block. The Beanstalk hack exploited an unmonitored 1-day timelock — the timelock is only useful if someone is watching.

**What went right**: Uniswap's DAO manages a $2.6–5.4B treasury and has coordinated cross-chain deployments, grants programs, and protocol fee changes. VitaDAO has funded 21 longevity research projects through decentralized grant-making. Nouns DAO generates continuous funding through daily NFT auctions with 100% of proceeds flowing to the treasury.

**MolochDAO** introduced "rage quitting" — any member can exit and withdraw their share of the treasury before a proposal executes. This creates a credible exit threat: if a proposal is bad enough, members leave and take the money, so proposals must maintain genuine consensus.

### What We Can Learn

The proposal-review-vote-timelock-execute lifecycle is a general pattern for any system where changes need collective consent before taking effect. The timelock is the critical insight: it separates approval from execution, giving affected parties time to object or exit.

Delegation solves the voter apathy problem by concentrating decision-making in active participants while preserving the ability to revoke. But delegation without participation tracking creates phantom governance — power is delegated but never exercised.

Rage quitting is a powerful alignment mechanism for any collective: if members can leave with their share when they disagree, proposals must serve the collective's actual interest.

### Adoption Recommendations

**Proposal lifecycle for plans and policies**: Changes to shared infrastructure (harness configuration, domain structure, governance policies) should follow a review → approval → delay → execution pattern. The delay period is not bureaucracy — it is a monitoring window where automated checks or human review can catch problems before they become permanent.

**Delegation with accountability**: When agents delegate work (e.g., a duty officer dispatching to sub-agents), track delegation *and* execution. A task delegated but never acted on is worse than a task never delegated — it creates false confidence that work is happening. Measure delegate participation rates.

**Exit rights on shared resources**: Any agent contributing to a shared pool (knowledge, compute, attention) should be able to withdraw its contribution if the pool's direction changes. This prevents lock-in to bad collective decisions.

**Gasless voting for low-stakes decisions**: Snapshot-style off-chain voting increased DAO participation from 8.3% to 42.7% by removing the cost of voting. For internal systems, the analog is reducing the friction of providing input — lightweight polling for routine decisions, full proposals only for structural changes.

## 2. Smart Contracts as Autonomous Agents

### What Crypto Does

Smart contracts are programs stored on a blockchain that execute when triggered. They cannot self-execute on a timer — they need an external actor to submit a transaction. Three mechanisms provide this trigger:

**Keeper networks** (Chainlink Automation, Gelato Network) are decentralized marketplaces of bots that monitor blockchain state and execute contract functions when conditions are met. A contract defines a `checkUpkeep()` function that returns true when execution should happen. Keeper nodes monitor continuously and compete to execute, earning fees from a pre-funded balance. This separates *what* should happen (contract logic) from *when* it happens (keeper monitoring).

**Account abstraction** (ERC-4337) turns wallets into programmable smart contracts. A wallet can enforce arbitrary rules: multisig approval, spending limits, time-locks, recovery keys, or automated responses to external conditions. Over 40 million smart accounts have been deployed, with 100 million operations executed. The wallet becomes an autonomous agent with its own logic, not just a key-holder.

**MEV bots** (Maximal Extractable Value) are autonomous agents that exploit the ordering of transactions for profit. A sandwich bot sees a pending swap in the mempool, front-runs it (buying the asset to raise the price), lets the victim's swap execute at the inflated price, then sells. A single bot extracted $6.3M in April 2023 across 120,000+ attacks. MEV bots operate without human intervention, continuously monitoring state, simulating profitability, and executing when conditions are favorable.

The lesson from "code is law" is dual: well-designed contracts execute with perfect reliability, but badly designed contracts execute their flaws with the same perfection. Terra/Luna's algorithmic stablecoin collapsed because the code did exactly what it was programmed to do — the design created a death spiral where falling prices forced hyperinflationary token minting, expanding supply from 1 billion to 6 trillion in three days and destroying $40 billion.

### What We Can Learn

The keeper pattern — separating condition monitoring from action execution — is the general form of event-driven automation. The contract defines *what* and *when*; the keeper handles *that*. This is structurally identical to the hook pattern in agentic systems: hooks monitor for conditions and trigger actions.

Account abstraction teaches that agents should have programmable identity — not just "who is this agent" but "what rules govern this agent's behavior." An agent's capabilities, spending limits, approval requirements, and recovery procedures should be encoded in its definition, not managed ad hoc.

MEV bots demonstrate both the power and danger of autonomous agents in shared environments. Any system with shared state and asynchronous operations will develop agents that exploit ordering and timing. This is not a bug — it is an emergent property of autonomous agents in competitive environments.

### Adoption Recommendations

**Keeper-style event monitoring**: Separate condition detection from action execution. Hooks should be pure condition checkers that emit events; a separate execution layer decides when and how to act. This makes conditions testable independently of actions.

**Agent-level policy enforcement**: Each agent definition should include its operational constraints — what it can modify, what requires approval, what it cannot do — encoded as machine-readable policy, not just prose instructions. The agent's "wallet" (its operational scope) should enforce these rules automatically.

**Adversarial robustness for shared state**: Any system where multiple autonomous agents read and write shared state should expect ordering-dependent behavior. Design for it: use optimistic concurrency (check-then-act with conflict detection), log all state transitions, and treat unexpected state changes as signals rather than errors.

**Timelock on irreversible actions**: Smart contract timelocks exist because execution is irreversible. Any autonomous action that is hard to undo — deleting content, publishing to external systems, modifying shared configuration — should include a delay between decision and execution.

## 3. NFTs as Provenance and Ownership

### What Crypto Does

An NFT (Non-Fungible Token) records three things immutably: who created it, who owns it now, and every transfer in between. The ownership chain is the ledger; the metadata (name, image, attributes) can be stored on-chain or off-chain.

**Provenance** is automatic — every transaction is a permanent, timestamped record. An artwork's complete ownership history, from minting through every sale, is auditable by anyone. This is not a feature that was designed; it is a consequence of putting ownership records on an append-only ledger.

**Soulbound Tokens (SBTs)**, proposed by Buterin, Weyl, and Ohlhaver in 2022, are non-transferable NFTs used for credentials and reputation. A university degree, a certification, a proof of attendance — all bound to the recipient's wallet permanently. Over 8 million Proof of Attendance Protocol (POAP) tokens have been minted. The privacy tradeoff is severe: a Cornell study showed that 4–5 public SBTs are sufficient to uniquely identify an individual in a dataset of 10,000 wallets with >97% accuracy.

**Token Bound Accounts** (ERC-6551) give each NFT its own smart contract wallet. An NFT can own other assets — currency, equipment, sub-NFTs. When the NFT is transferred, everything it owns transfers with it. A game character NFT holds its equipment, currency, and achievement tokens; selling the character sells the entire inventory as a unit.

**Dynamic NFTs** have metadata that changes based on external conditions, typically fed by oracles. A sports card NFT updates its stats when the player scores. A sword NFT evolves from "common" to "legendary" after 100 battles. The metadata is mutable; the ownership and provenance record is not.

**What broke**: approximately 20% of 500,000 sampled NFTs have broken metadata — 76,000 unresolvable addresses, 4,600 broken images, 19,000 dead IPFS links. The ownership record is permanent, but the thing being owned can disappear.

### What We Can Learn

The critical distinction is between *identity* (permanent, append-only) and *description* (mutable, losable). Blockchain NFTs get identity right and description wrong. Most metadata lives off-chain on servers that can go down, creating a permanent record of ownership over a thing that no longer exists.

Token Bound Accounts solve the composition problem: an entity that owns sub-entities should transfer as a unit. This is the "character with inventory" pattern, applicable to any hierarchical entity structure.

SBTs demonstrate that credentials are a different kind of entity than transferable assets. The non-transferability is the point — a credential's value comes from being bound to its recipient. But aggregating non-transferable credentials creates a fingerprint, so credential systems need selective disclosure.

Dynamic NFTs show that entities can have both immutable identity and mutable state. The provenance of who created it and who has held it is append-only; the current state of the thing itself can evolve.

### Adoption Recommendations

**Append-only entity history**: Every entity in the system should have an immutable creation record and an append-only modification log. The current state is a view computed from the log, not a mutable field. This makes provenance automatic — you get "who created this, when, and every change since" for free.

**Hierarchical entity ownership via Token Bound Accounts pattern**: When an entity (a plan, a domain, a project) owns sub-entities (tasks, terms, files), model this explicitly. Transferring ownership of the parent should transfer all children. The EAVT datastore already supports this — the pattern is encoding `part-of` relations that propagate operations.

**Non-transferable credentials for agent capabilities**: Agent certifications (the Academy pattern) should be soulbound — tied to the specific agent, not transferable. An agent's demonstrated competence at a task is not transferable to another agent. Track credentials per agent, not per role.

**Separate identity from description**: Entity identity (hash, creation timestamp, creator) should be immutable and self-contained. Entity description (current state, metadata) should be mutable but versioned. Never store description in the identity layer, and never let description loss destroy identity.

## 4. Web3 Game Economies

### What Crypto Does

Web3 games put game state on a blockchain, making assets player-owned, economies transparent, and rules verifiable.

**Axie Infinity** was the largest play-to-earn game, peaking at 2.7 million daily active users in November 2021. Players bred and battled creatures (Axies), earning Smooth Love Potion (SLP) tokens. A scholarship system let asset owners lend Axies to players (primarily in the Philippines) who earned tokens and split proceeds. At peak, players earned $200–1,000/month. Then it collapsed: SLP supply inflated 16,000% in 12 months as more players minted tokens than the economy could absorb. Price crashed from $0.34 to below $0.005. Users dropped from 2.7M to 88K. The dual-token economy (SLP for earning, AXS for governance) could not prevent the death spiral because the earning token had no sink — nothing consumed SLP fast enough to offset creation. A 56% emissions cut in February 2022 came too late.

**Loot (for Adventurers)** took the opposite approach. It was 8,000 NFTs, each containing only a text list of fantasy items ("Divine Robe, Katana, War Belt...") stored entirely on-chain. No game, no art, no economy. The community built everything else: 40+ derivative projects created art, games, lore, and currencies on top of Loot's shared primitives. Adventure Gold (AGLD) tokens emerged as community currency, reaching ~$50K in value per Loot holder at peak. Loot succeeded because it was a *protocol* — a shared vocabulary that anyone could build on — not a product.

**Dark Forest** pioneered cryptographic fog of war. In a strategy game on a public blockchain, all state is visible to everyone — there is no hidden information. Dark Forest solved this with zero-knowledge proofs: planet coordinates are stored as hashes, and players submit zk-SNARK proofs that their moves are valid without revealing where they are. Players discover planets by brute-forcing hash computations locally, creating computational fog of war. The game was fully extensible — community members built custom clients, plugins, and autonomous agents that played the game. One player deployed a bot that managed their empire while they slept.

### What We Can Learn

Axie Infinity's collapse is a lesson in token sink design. Any system that rewards contribution with tokens (points, credits, reputation) must have sinks that consume tokens at a rate proportional to creation. Without sinks, inflation destroys the token's value and contributor motivation. The 561 system's operational accounting (tasks as transactions, knowledge as assets) must balance production with consumption.

Loot demonstrates the power of shared primitives. By publishing only vocabulary — a list of item names with no implementation — Loot enabled an ecosystem of builders. The items were composable because they were minimal and unambiguous. This is the term definition pattern: publish precise definitions, let implementations reference them.

Dark Forest shows that autonomous agents in shared environments are not an edge case — they are an inevitability. Any system with programmatic access to game state will develop bots. Design for agent participation from the start rather than treating it as an abuse.

The scholarship system in Axie is a delegation pattern: asset owners delegate usage rights to operators who do the work and share proceeds. This mirrors the duty officer pattern — the system owns the tools, officers use them, and value flows back to the system.

### Adoption Recommendations

**Token sink design for operational accounting**: If the system tracks contribution (tasks completed, knowledge produced), it must also track consumption. A task completed is a credit; using the output of that task is a debit. Without consumption tracking, the ledger inflates and contribution metrics become meaningless.

**Shared primitives over shared implementations**: Publish term definitions, not implementations. When multiple agents or systems need to coordinate, the coordination layer should be a shared vocabulary (like Loot's item list), not a shared codebase. Each consumer builds its own implementation against the shared vocabulary.

**Design for bot participation**: Any system with programmatic state access will develop automated participants. Rather than preventing this, formalize it: provide clean APIs for automated agents, track which actions are human-initiated vs agent-initiated, and design review processes that assume some fraction of contributions are automated.

**Scholarship/delegation as a first-class economic pattern**: Model the relationship between asset owners and operators explicitly. The system owns infrastructure; agents operate it; value (completed work, knowledge produced) flows through defined channels. Track the full flow: who owns the resource, who operates it, what value was produced, how it was distributed.

## 5. Tokenomics and Incentive Design

### What Crypto Does

**Token bonding curves** are smart contracts that define a deterministic relationship between token supply and price. When someone buys, new tokens are minted and the price increases along the curve. When someone sells, tokens are burned and the price decreases. The curve is immutable — all participants can predict future prices given current supply. Early supporters buy cheap; late entrants pay more. A linear curve (`price = supply * constant`) gives steady growth; a quadratic curve (`price = supply² * constant`) rewards early participants more steeply; a sigmoid curve stays flat until a threshold, then jumps.

**Staking** requires locking tokens to earn rewards and demonstrate commitment. Ethereum 2.0 validators lock 32 ETH (~3–4% APY). If they validate bad transactions or go offline, they are *slashed* — forced to lose part of their stake. The incentive structure: you earn by participating honestly, and you lose by participating dishonestly or not participating at all.

**Retroactive Public Goods Funding** (Optimism's RetroPGF) distributes protocol revenue to projects based on *past* impact rather than upfront grants. The core insight: it is easier to agree on what *was* useful than to predict what *will* be useful. Optimism has distributed over 50 million OP tokens to 200+ projects across multiple rounds. Round 4 allocated 10M tokens to 76 projects; Round 5 allocated 8M tokens to OP Stack contributors.

**Harberger taxes** create continuous fair-value auctions. An asset owner declares its value, pays continuous tax proportional to that value, and anyone can force a purchase at the declared price. Undervalue and someone buys you out. Overvalue and you overpay in taxes. The mechanism converges on true market value and ensures assets flow to whoever values them most.

**What broke**: Terra/Luna's algorithmic stablecoin offered 19.5% APY on deposits. When confidence broke, the redemption mechanism forced hyperinflationary token minting — supply from 1 billion to 6 trillion in three days, $40 billion destroyed. Lesson: if yields exceed sustainable protocol economics, the system is extracting from late entrants to pay early ones. That is a Ponzi.

### What We Can Learn

Retroactive funding is the most directly applicable pattern. Rewarding proven impact avoids the prediction problem inherent in upfront grants and proposals. Instead of trying to predict which work will be valuable, let work happen, then reward what turned out to matter.

Staking with slashing creates accountability with teeth. It is not enough to declare commitment — commitment must be backed by something at risk. The cost of dishonest or negligent participation must exceed the benefit.

Bonding curves formalize the relationship between scarcity and value. Early contributors to a knowledge base or system are working with less infrastructure and more uncertainty — their contributions are worth more per unit than later contributions that build on established foundations.

Harberger taxes solve the resource hoarding problem. Any scarce resource (attention, namespace, priority) that can be claimed but not actively used should face a continuous cost of holding. This prevents squatting and ensures resources flow to active users.

### Adoption Recommendations

**Retroactive recognition over upfront planning**: Track what agents and contributors actually produced, then recognize high-impact work after the fact. This complements upfront planning — plans say what *should* happen; retroactive recognition says what *did* matter. Weight future task assignment by demonstrated past impact.

**Stake-like accountability for autonomous agents**: Agents running autonomously should have something at risk — accumulated reputation, resource allocation priority, autonomy scope. An agent that produces low-quality work or causes rework should see its autonomy reduced (slashing). An agent that consistently delivers should see its autonomy expanded (staking rewards).

**Contribution valuation that respects timing**: Early contributions to a domain, system, or project — when nothing exists and everything must be figured out — are inherently more valuable per unit than later contributions that build on established patterns. Valuation systems should account for the difficulty frontier at the time of contribution.

**Holding costs for claimed resources**: Any agent that claims a task, reserves a namespace, or holds a resource lock should face a continuous cost for holding without acting. This prevents task hoarding, stale claims, and resource lock-up. The cost need not be monetary — it can be visibility (publishing how long a claim has been held without progress).

## 6. Content-Addressed Storage

### What Crypto Does

**IPFS** (InterPlanetary File System) identifies content by *what it is* rather than *where it is*. A file's address is its cryptographic hash — the Content Identifier (CID). The same content always produces the same CID, regardless of who stores it or where. Content is broken into chunks, organized into a Merkle DAG (Directed Acyclic Graph), and distributed across nodes. Any node that has the content can serve it.

The critical weakness: IPFS is a *network*, not a *storage guarantee*. Content that no node pins will be garbage-collected and lost. This is why ~20% of NFTs have broken metadata — the IPFS links point to content that no one is pinning anymore.

**Arweave** solves permanence with a different economic model. Miners must prove they store random historical data (Proof of Access / SPoRA) to mine new blocks. The "blockweave" structure links each block to both its predecessor and a random recall block, ensuring old data stays available. Storage is paid once and maintained by an endowment model — the upfront fee generates yield that pays miners indefinitely.

**Filecoin** creates a storage market with cryptographic proofs. Storage providers submit Proof of Replication (they actually stored the data, not just claimed to) and Proof of Spacetime (they continued storing it over time). Clients pay storage providers in FIL tokens through a market mechanism.

### What We Can Learn

Content addressing is the fundamental insight: identity should be derived from content, not from location. A file at `/path/to/document.md` has location-based identity — move the file, break the reference. A file identified by its content hash has content-based identity — the reference is valid as long as the content exists anywhere.

The IPFS failure mode — content exists but nobody is serving it — maps to any caching or distribution system. A reference to content that nobody maintains is worse than no reference, because it looks valid until you try to follow it.

Arweave's endowment model solves the "who pays for maintenance" problem. Upfront payment generates yield that covers ongoing costs. This is applicable to any system with long-lived assets that require ongoing maintenance (hosting, verification, backups).

### Adoption Recommendations

**Content-derived entity identity**: Entity IDs in the knowledge graph should be derivable from entity content — a hash of the canonical form. This makes deduplication automatic (same content = same hash) and makes references content-stable rather than location-dependent. The EAVT datastore already uses entity IDs; the question is whether those IDs are content-derived.

**Pin guarantees for referenced content**: Every reference in the system should point to content that is guaranteed to exist. If a term links to a source, and that source can be garbage-collected, the link will rot. Either ensure referenced content is pinned (maintained by the system) or mark external references with an explicit "this may break" flag.

**Merkle DAG structure for compound entities**: A text that references terms, which reference other terms, forms a DAG. Storing the hash of each node in the DAG creates a Merkle DAG — any change to any node propagates a hash change up to the root. This makes integrity verification automatic: compute the root hash and compare to the stored root.

## 7. Merkle Trees and Verifiable Computation

### What Crypto Does

A **Merkle tree** hashes pairs of data recursively until a single root hash remains. The root hash is a fingerprint of the entire dataset. To prove that a specific item is in the dataset, you only need to provide the item and the sibling hashes along the path to the root — a "Merkle proof." For 1,000 transactions, the proof is ~10 hashes (log₂ scale). Light clients can verify inclusion without downloading the full block.

**Ethereum's Merkle Patricia Trie** extends this to key-value state. Every account balance, contract storage slot, and receipt is a leaf in a trie. The state root hash in each block header commits to the entire world state. Any state claim ("account X has balance Y at block N") can be verified with a proof against the state root.

**Zero-knowledge proofs** extend verification further: prove that a computation was performed correctly without revealing the inputs. zk-SNARKs (Succinct Non-interactive Arguments of Knowledge) produce compact proofs (~128 bytes) that verify in milliseconds but require a trusted setup ceremony. zk-STARKs (Scalable Transparent Arguments of Knowledge) need no trusted setup and are post-quantum secure but produce larger proofs.

**Rollups** apply these proofs to scale blockchain computation. Optimistic rollups assume transactions are valid and only verify when challenged (fraud proofs, 7-day challenge window). ZK rollups prove validity upfront (validity proofs, near-instant finality). The tradeoff: optimistic rollups are cheaper to operate but slower to finalize; ZK rollups are more expensive but provide immediate certainty.

**Dark Forest** used zk-SNARKs for game mechanics: players prove their moves are valid (origin planet exists, is owned by them, destination is in range) without revealing planet coordinates. The proof is verified on-chain; the coordinates remain private. Proof generation costs ~200K gas per move.

### What We Can Learn

Merkle roots are a general integrity mechanism: hash a dataset, store the root, and any future claim about the dataset's contents can be verified against the root. This applies to any audit trail — if you store the Merkle root of your event log at each checkpoint, you can prove that no events were added, removed, or modified between checkpoints.

The optimistic vs. validity proof tradeoff is a general design choice: assume correctness and verify on challenge (cheaper, slower resolution) vs. prove correctness upfront (more expensive, immediate certainty). Most internal systems should use the optimistic approach — assume agent output is correct, verify on review — because the cost of upfront verification exceeds the cost of occasional correction.

### Adoption Recommendations

**Merkle roots for event log integrity**: Periodically compute and store the Merkle root of the event log (observations, tool calls, session records). This creates tamper-evident checkpoints — if any event is modified after the fact, the root will not match. The cost is minimal (one hash computation per checkpoint) and the benefit is an unforgeable audit trail.

**Optimistic verification for agent output**: Default to accepting agent output and verifying on review (the optimistic rollup model). Reserve upfront verification (the ZK rollup model) for irreversible or high-stakes operations. This matches the existing code review pattern — agents produce output, reviewers verify it, corrections happen during review rather than blocking production.

**Inclusion proofs for content claims**: When an agent claims "this entity has attribute X," the system should be able to verify the claim against a known-good state root without re-reading the entire datastore. This is the Merkle proof pattern: precompute state roots, verify claims against roots.

## 8. The MUD Framework: Autonomous Worlds

### What Crypto Does

MUD is an open-source framework by Lattice for building "autonomous worlds" — persistent, permissionlessly extensible game worlds on Ethereum. It is the closest existing analog to what a non-blockchain autonomous system is trying to be.

**Architecture**: MUD uses an Entity Component System (ECS) pattern:

- **Store**: A custom key-value database implemented as a smart contract. Uses tight encoding that achieves 33% storage reduction versus standard Solidity. Schemas are registered at deployment and are immutable; data within schemas is mutable.
- **World**: A singleton access-control kernel that sits above Store. All reads and writes go through World, which enforces namespace-scoped permissions. The World contract is the single entry point for all state.
- **Systems**: Stateless smart contracts that implement logic. Systems have zero internal state — they read from and write to Store through World. This is the critical architectural decision: logic is stateless and replaceable; state is centralized and permanent.
- **Tables**: Schema-defined key-value storage within Store. Tables can be registered after deployment (dynamic schema). Store hooks implement the observer pattern — external contracts are notified when table data changes.

**Autonomous Worlds** are defined by Ludens (Lattice co-founder) through three conditions: (1) autonomy — rules live in code, not in operator discretion; (2) permissionless creation — anyone can extend the world without approval; (3) physical law adherence — rules are stable, transparent, and cannot be changed by operators after deployment.

**OPCraft**, a Minecraft-like voxel world built on MUD, demonstrated the pattern. Millions of on-chain entities, built in 1.5 months. Community members built custom clients (2D isometric, 3D visualizations) without core team coordination. A player deployed an on-chain "communist guild" with binding rules that required members to share resources. All of this happened permissionlessly — no one asked for or granted permission.

**Sky Strife**, a real-time strategy game, uses a specialized rollup (Redstone) for sub-second block times and account delegation for burner wallet signing.

### What We Can Learn

MUD's core architectural insight is the total separation of state from logic. Systems are stateless — they cannot accumulate hidden state, they cannot break when redeployed, and they can be replaced without data migration. All state lives in one place (Store/Tables), accessed through one interface (World), with one permission model (namespace-scoped access control).

This is the pattern our system is converging toward: the EAVT datastore holds all state; agents (Systems) are stateless processors that read from and write to the datastore; the harness (World) enforces access control. MUD proves this architecture works at scale with dynamic schema registration, real-time state synchronization, and permissionless extension.

The autonomous worlds concept — that the system should persist and evolve independently of any single operator — is the definition of semioversal autonomy. MUD achieves this through blockchain immutability; we can achieve it through append-only event logs, deterministic state reconstruction, and agent replaceability.

Permissionless extension — anyone can add new Systems to a MUD World — maps to the plugin/skill model. New capabilities should be installable without modifying existing infrastructure, operating within namespace-scoped permissions.

Store hooks (the observer pattern) are exactly the hook system: when state changes, registered observers are notified and can react. MUD proves that hooks on state changes are a sufficient coordination mechanism for complex multi-system interaction.

### Adoption Recommendations

**Total state/logic separation**: Formalize the pattern where agents are stateless processors and all persistent state lives in the datastore. Agents should not maintain hidden state between invocations. If an agent needs to remember something, it writes to the datastore. This makes agents replaceable (any agent of the same type can pick up any task) and state auditable (all state is in one place).

**Namespace-scoped access control**: Each agent or system should operate within a namespace that defines what state it can read and write. A writer agent can modify content files; it cannot modify harness configuration. A bookkeeper can modify the ledger; it cannot modify the library. MUD's World contract enforces this at the infrastructure level rather than relying on agent self-restraint.

**Dynamic schema registration**: The datastore should support adding new entity types and attribute types after deployment, without modifying existing schemas. MUD's Table registration pattern shows this works: new tables (new entity types) can be added at runtime, and existing systems continue to function.

**Observer hooks on state changes**: When any entity in the datastore is created, modified, or deleted, registered hooks should fire. This is the primary coordination mechanism — systems do not call each other directly; they react to state changes. MUD calls these Store hooks; we call them harness hooks. The pattern is identical.

**Permissionless extension model**: New agents, skills, and commands should be installable without modifying existing infrastructure. Define a clear interface (what state a new system can access, what events it can emit) and allow extension within those boundaries. MUD proves this works — OPCraft had community-built extensions that the core team never anticipated.

## Synthesis: What Blockchain Got Right and What It Over-Engineered

Blockchain systems solve coordination problems with cryptographic guarantees suitable for adversarial environments where participants do not trust each other. Most internal autonomous systems operate in a cooperative environment where participants are trusted but fallible. The patterns are transferable; the trust model is not.

**What to adopt directly**:

- Append-only event logs with Merkle root checkpoints (integrity without blockchain)
- Content-addressed entity identity (deduplication and reference stability)
- Proposal → review → delay → execute lifecycle for structural changes
- State/logic separation with namespace-scoped access control (the MUD pattern)
- Observer hooks as the primary coordination mechanism
- Retroactive recognition of proven impact
- Holding costs for claimed-but-unused resources

**What to adapt**:

- Delegation with participation tracking (not token-weighted, but capability-scoped)
- Optimistic verification (assume correct, verify on review) rather than upfront ZK proofs
- Agent reputation as a form of staking (earned through performance, lost through failure)
- Shared vocabulary as coordination protocol (the Loot pattern, not the Axie pattern)

**What to leave on the blockchain**:

- Trustless consensus (we trust our agents; we verify their output)
- Token-based incentives (we do not need financial speculation to motivate contribution)
- Gas fees as spam prevention (we control who has access)
- Immutability as a hard constraint (we want append-only history, not immutable history)

The blockchain ecosystem's most valuable export is not its technology but its design patterns: how to coordinate autonomous agents, track provenance, enforce rules automatically, and create systems that persist and evolve independently of any single operator. These patterns are older than blockchain — they come from distributed systems, game theory, and organizational design. Blockchain made them legible by implementing them in code where anyone could read, audit, and build on them. That legibility is the real contribution.
