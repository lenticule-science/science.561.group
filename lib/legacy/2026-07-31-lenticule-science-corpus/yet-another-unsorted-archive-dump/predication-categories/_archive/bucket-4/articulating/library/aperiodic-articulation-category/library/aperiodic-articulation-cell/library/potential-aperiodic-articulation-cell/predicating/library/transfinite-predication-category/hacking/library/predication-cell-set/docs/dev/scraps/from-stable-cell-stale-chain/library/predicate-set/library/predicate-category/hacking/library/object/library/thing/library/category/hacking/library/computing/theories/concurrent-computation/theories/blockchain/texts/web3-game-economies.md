---
title: "Web3 Game Economies: From Play-to-Earn Collapse to Sustainable Design"
description: Why most play-to-earn games failed, what Axie Infinity teaches us about token inflation, and how bottom-up worldbuilding creates value.
date-created: 2026-04-05
sources:
  - title: "Axie Infinity Has Left Filipino Gamers Despondent + In Debt"
    url: https://time.com/6199385/axie-infinity-crypto-game-philippines-debt/
  - title: "Axie Infinity Reduces SLP Emissions to Prevent 'Collapse'"
    url: https://www.coindesk.com/tech/2022/02/08/axie-infinity-reduces-slp-emissions-to-prevent-collapse
  - title: "Axie Infinity (Part 2): Redemption or Ruin?"
    url: https://www.deconstructoroffun.com/blog/2022/6/17/axie-infinity-part-2-redemption-or-ruin
  - title: "Axie Infinity revenue and player count statistics"
    url: https://prioridata.com/data/axie-infinity-users/
  - title: "What is Loot Project"
    url: https://www.coingecko.com/research/publications/what-is-loot
  - title: "Loot: The Epitome of Composability"
    url: https://naavik.co/deep-dives/loot-deconstruction-pro/
  - title: "Dark Forest plugins and community tools"
    url: https://github.com/darkforest-eth/plugins
  - title: "Web3 Game Development Guide for Executives"
    url: https://tokenminds.co/blog/web3-development/web3-game-development
  - title: "How the Play-to-Earn Industry Can Rebuild Better After the Ronin Attack"
    url: https://www.coindesk.com/opinion/2022/04/07/how-the-play-to-earn-industry-can-rebuild-better-after-the-ronin-attack
---

## The Axie Infinity Collapse: Token Inflation and Scholarship Collapse

Axie Infinity was the highest-profile play-to-earn game, reaching 2.7 million daily active users in November 2021 with AXS (the governance token) peaking at $155. Over $4 billion in transactions flowed through the game, with daily volumes hitting $1 billion. In Southeast Asia, especially the Philippines, players reported earning $200-1,000 monthly through SLP (Smooth Love Potion), the in-game currency.

The economic model was simple and fatal: SLP has an uncapped supply. Players earn SLP by battling others (roughly 44%) and completing adventure mode quests (roughly 40%), with 14% minted from daily quest completion. The cap was meant to be economic demand (breeding consumes SLP), but it was always set far too low.

By January 2022, one year after launch, SLP supply had grown 16,000% (160x). About 4x more SLP was created daily than consumed. The token price collapsed from $0.34 (July 2021) to less than half a penny by spring 2022. From 2.7 million daily active users, only 760,000 remained.

The scholarship system accelerated the collapse. Investors ("managers") bought Axies and lent them to "scholars" in developing countries, taking 30-50% of earnings. This created a class of full-time farmers focused on maximizing SLP production. By late 2021, scholars' average earnings had already dropped below the Philippines' minimum wage, but the economic pressure kept them grinding.

When SLP crashed, the scholarship system collapsed entirely. Managers had negative returns and stopped recruiting. Scholars were left holding bags of worthless tokens and had invested time (opportunity cost) for no return.

The root cause: **Confusing token speculation with game economy design**. Axie's tokenomics assumed:
- Players would always want SLP for breeding
- Breeding demand would grow with player count
- The token price would continue rising

None of this proved true. As more players entered, SLP supply exploded. Breeding demand didn't keep pace. The token's only value was speculation, which evaporates when new players stop entering.

## The Pinning Question: Distributed Storage for Game Economies

Axie Infinity's economic failure offers a cautionary lesson: if you're building on-chain game economies, you must ask what makes the token valuable. Is it:

1. **Utility within the game** (e.g., for crafting, breeding, unlocking content)
2. **Governance** (e.g., voting on game direction)
3. **Staking rewards** (e.g., earning fees from other activity)
4. **Pure speculation** (e.g., hoping new players will pay more)

Category 4 is unsustainable. Category 1 is the only foundation for a real economy.

For distributed game storage and economies to work, you need:
- Strong game mechanics that create genuine scarcity
- Multiple sinks for tokens (ways to spend them that don't increase supply elsewhere)
- A clear cap on supply
- Community governance that prevents runaway inflation
- Infrastructure that enables player interoperability

## Loot: Bottom-Up Worldbuilding and Composability

In contrast, Loot (for Adventurers) took an inverse approach. Released in August 2021 as a response to the over-financialization of NFTs, Loot is a collection of 8,000 on-chain-generated bags containing randomized adventurer gear (weapons, armor, accessories) stored purely as text.

Crucially, the Loot team released **no art**, **no roadmap**, **no team** — just the contract and the data. The entire project invited the community to build on top of it.

What happened next demonstrates the power of composability. Over 40 derivative projects launched, including:

- **Realms**: 8,000 procedurally generated territories divided into 16 ruling orders, creating geography and political structure
- **Crypts and Caverns**: Generative, on-chain dungeon maps with floors, doors, and points of interest that integrate into text-based, 2D, or 3D games
- **Genesis Adventurers**: Character models compatible with Loot gear
- **Adventure Gold (AGLD)**: An ERC20 token that became the currency for the entire Lootverse. Each Loot NFT holder could claim 10,000 AGLD, worth roughly $50,000 when announced.

The mechanism: Because Loot data is stored on-chain and fully open-source, any developer could read the item descriptions from the contract and build on them. A Realms builder could write logic that said "if you own a Loot bag, you can govern a Realm." A game developer could query "what items does this Loot bag have?" and customize gameplay accordingly.

This is composability at the protocol level: every derivative project increases the value of Loot itself by expanding the universe in which those bags exist.

The key insight: **Value accrues to primitives, not to applications**. The Loot contract is the primitive. Every game built on top of it adds value to Loot ownership.

Contrast with Axie: Axies are valuable only because Axie Infinity the game exists. If the game fails, Axies have no value outside of it. Loot is valuable because it's a shared universe that any builder can use.

## Dark Forest: Decentralized Game Logic and Community Tooling

Dark Forest is an on-chain space-conquest game that uses zero-knowledge proofs to hide player positions from the chain itself. The innovation isn't just the cryptography — it's the plugin system.

Starting with v0.5, Dark Forest enabled players to write scripts that interact with the game. These plugins allow players to:
- Create custom UI views of game data
- Automate common gameplay flows
- Reskin the entire game interface
- Create tools like mini-maps, remote miners, and bots

The community response created hundreds of tools. Dark Forest even ran a Community Plugins Contest with award categories and offered Developer Grants to players building particularly useful or creative tools.

The economic lesson: **Value accumulates when you let players extend the game**. By lowering the barrier to contribution, Dark Forest created a culture of tooling and collaboration that Axie Infinity never achieved.

This mirrors the open-source software model: proprietary games are read-only. Open games with plugin systems become platforms.

## Sustainable Web3 Game Design

From these three case studies, several principles emerge:

### 1. Scarcity Must Be Real

In Axie, SLP has no effective cap. In Loot, the bag supply is fixed at 8,000. Real scarcity creates real value. Once a derivative (like Realms) is introduced, scarcity compounds: there are only 8,000 Loot bags, 8,000 Realms, and limited governance power distributed among 16 orders. Scarcity was built in from the start.

### 2. Tokens Need Multiple Sinks

If a token has only one use (breeding in Axie), its value collapses when that demand falls. Tokens need multiple ways to be spent:
- Crafting
- Governance voting
- Staking for rewards
- Trading fees
- Access to new content

### 3. Build Primitives, Not Applications

Axie is an application. Loot is a primitive. Dark Forest is somewhere between — it's an application with a plugin system that lets players build primitives on top.

Primitives are composable. Applications are not. If you're building a web3 game, ask: what do I want to remain constant even if my game changes? That's the primitive layer. Loot got this right by making the bag data the permanent layer and allowing games to be built on top of it.

### 4. Align Incentives Across Supply and Demand

The fundamental error in Axie was that supply incentives (players grinding SLP) diverged from demand incentives (only breeders consuming SLP). Early on, investors in Southeast Asia saw SLP farming as income. Axie Infinity saw farmers as assets generating platform value. Once the token price fell, both lost interest simultaneously.

A sustainable model requires:
- Clear cap on token supply announced upfront
- Meaningful, ongoing sinks for tokens that grow with player count
- Governance that adjusts parameters if supply/demand imbalance emerges
- Transparency about inflation and token economics

### 5. Infrastructure Enables Interoperability

The reason Loot succeeded where Axie Infinity failed is that Loot is infrastructure. Any developer can check if a wallet owns a Loot bag and build on that. Loot itself doesn't need to manage every derivative use case.

For games, this means:
- Store character state on-chain, not just in a centralized database
- Use standard token formats (ERC721 for characters, ERC20 for currencies)
- Document the contract interface so builders can extend it
- Allow wallets to hold assets that work across multiple games

## The Ronin Hack and Recovery

In March 2022, the Ronin bridge (which connects Ronin, a sidechain for Axie Infinity, to Ethereum) was exploited for 173,600 ether and 25.5 million USDC — $625 million at the time. This was one of the largest crypto heists ever.

The hack stained the entire play-to-earn industry, but the response showed potential for collaboration. Builders shared information, analyzed the attack, and worked to rebuild confidence. Immutable X and Ronin learned distinct lessons:

- **Immutable X**: Solved the biggest problem in crypto gaming — gas fees and wallet friction — through their zkEVM solution, making transactions cheap and seamless.
- **Ronin**: Focused on mobile and browser-based casual games, building more defensible infrastructure.

The industry's transition from "play-to-earn" (speculation) to "play-and-earn" (earned rewards tied to real game progression) reflects maturation. Games that survive understand that tokens are tools for aligning incentives, not substitutes for actual game design.

## See Also

- [Content-Addressed Storage: IPFS, Arweave, and the Permaweb](./content-addressed-storage.md)
- [Merkle Trees, Merkle Patricia Tries, and Verifiable Computation](./merkle-trees-and-verifiable-computation.md)
