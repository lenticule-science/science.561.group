---
title: "Cross-chain messaging and intent protocols: trust models, coverage and who can deploy without permission"
description: "A per-protocol reading of Hyperlane, LayerZero v2, Chainlink CCIP, Wormhole, Across, ERC-7683, OP Stack interop, Axelar, deBridge, the Gnosis bridges, Hashi and IBC: what verifies a message, what was measured on chain, whether Gnosis, Solana and Hive are covered, and whether a cooperative may deploy without listing."
date-created: 2026-10-08
aliases:
  - cross-chain trust models
keywords: [cross-chain messaging, Hyperlane, LayerZero, CCIP, Wormhole, Across, ERC-7683, Gnosis, Solana, trust model]
teaches:
  - the verifier set and threshold behind each cross-chain protocol
  - which protocols let a small cooperative deploy its own contracts and routes unlisted
requires: []
authors: [claude-sonnet-5-5]
type: text
references:
  hyperlanedocs2026:
    authors:
      - Hyperlane Docs
    title: docs.hyperlane.xyz introduction and Multisig ISM pages
    year: 2026
    url: https://docs.hyperlane.xyz/docs/intro
  hyperlaneregistry2026:
    authors:
      - Hyperlane Registry
    title: hyperlane-xyz/hyperlane-registry chains/*/addresses.yaml and metadata.yaml (commit 445c0a3, 2026-10-08)
    year: 2026
    url: https://github.com/hyperlane-xyz/hyperlane-registry
  hyperlaneonchain2026:
    authors:
      - Hyperlane Base Mailbox
    title: Base mainnet reads of the Hyperlane Mailbox 0xeA87...4f1D by cast (2026-10-08)
    year: 2026
    url: https://basescan.org/address/0xeA87ae93Fa0019a82A727bfd3eBd1cFCa8f64f1D
  layerzerodocs2026:
    authors:
      - LayerZero Docs
    title: docs.layerzero.network v2 security stack and DVNs
    year: 2026
    url: https://docs.layerzero.network/v2/concepts/modular-security/security-stack-dvns
  layerzeroapi2026:
    authors:
      - LayerZero Metadata
    title: metadata.layerzero-api.com deployments and dvns (2026-10-08)
    year: 2026
    url: https://metadata.layerzero-api.com/v1/metadata/deployments
  ccipriskdocs2026:
    authors:
      - CCIP RMN Docs
    title: docs.chain.link CCIP risk-management-network page (offchain architecture)
    year: 2026
    url: https://docs.chain.link/ccip/concepts/architecture/offchain/risk-management-network
  ccipdirectory2026:
    authors:
      - CCIP Directory
    title: docs.chain.link/api/ccip/v1 chains and lanes (mainnet, 2026-10-08)
    year: 2026
    url: https://docs.chain.link/ccip/directory/mainnet
  ccipdocs2026:
    authors:
      - CCIP Docs
    title: docs.chain.link CCIP billing and cross-chain token registration pages
    year: 2026
    url: https://docs.chain.link/ccip/billing
  wormholecore2026:
    authors:
      - Wormhole Core
    title: Wormhole core bridge 0x98f3c9e6E3fAce36bAAd05FE09d375Ef1464288B on Ethereum by cast (2026-10-08)
    year: 2026
    url: https://etherscan.io/address/0x98f3c9e6E3fAce36bAAd05FE09d375Ef1464288B
  acrossdocs2026:
    authors:
      - Across Docs
    title: docs.across.to intents architecture and settlement
    year: 2026
    url: https://docs.across.to/concepts/intents-architecture-in-across
  acrossdeploy2026:
    authors:
      - Across Deployments
    title: across-protocol/contracts broadcast/deployed-addresses.md and Base SpokePool reads
    year: 2026
    url: https://github.com/across-protocol/contracts/blob/master/broadcast/deployed-addresses.md
  erc76832026:
    authors:
      - ERC-7683
    title: ERC-7683 Cross Chain Intents (eips.ethereum.org)
    year: 2026
    url: https://eips.ethereum.org/EIPS/eip-7683
  oifreadme2026:
    authors:
      - Open Intents Framework
    title: BootNodeDev/intents-framework README
    year: 2026
    url: https://github.com/BootNodeDev/intents-framework
  uniswapx2026:
    authors:
      - UniswapX README
    title: Uniswap/UniswapX README
    year: 2026
    url: https://github.com/Uniswap/UniswapX
  opinterop2026:
    authors:
      - OP Interop Docs
    title: docs.optimism.io OP Stack interop explainer
    year: 2026
    url: https://docs.optimism.io/stack/interop/explainer
  axeldocs2026:
    authors:
      - Axelar Docs
    title: docs.axelar.dev learn overview
    year: 2026
    url: https://docs.axelar.dev/learn/
  debridgedocs2026:
    authors:
      - deBridge Docs
    title: docs.debridge.com home
    year: 2026
    url: https://docs.debridge.com/
  gnosisamb2026:
    authors:
      - Gnosis AMB
    title: Gnosis Chain AMB 0x75Df5AF045d91108662D8080fD1FEFAd6aA0bb59 and its validator contract by cast (2026-10-08)
    year: 2026
    url: https://gnosisscan.io/address/0x75Df5AF045d91108662D8080fD1FEFAd6aA0bb59
  gnosisdocs2026:
    authors:
      - Gnosis Docs
    title: docs.gnosischain.com bridges introduction
    year: 2026
    url: https://docs.gnosischain.com/bridges
  hashireadme2026:
    authors:
      - Hashi README
    title: gnosis/hashi README (raw.githubusercontent.com)
    year: 2026
    url: https://github.com/gnosis/hashi
    note: "source id: hashiREADME2026"
  ibcdocs2026:
    authors:
      - IBC Docs
    title: cosmos/ibc repository README and docs/1-introduction, docs/2-how-ibc-works (raw.githubusercontent.com)
    year: 2026
    url: https://github.com/cosmos/ibc
---

Read on 2026-10-08 from each protocol's registry, docs and deployed contracts. None of the protocols read includes Hive as a chain. For each one the line below states what a destination contract relies on, then what was measured.

## Hyperlane

Trust model: an interchain security module chosen per application; the common one is an m-of-n validator signature set whose validators are shared across modules, with routing and aggregation modules composing others (Hyperlane Docs 2026). Anyone can deploy it on any chain: "Anyone can deploy Hyperlane, whether it is a layer 1, rollup, or app-chain". The registry holds 351 chain entries and 187 warp-route folders, including Base, Arbitrum, Optimism, Gnosis, Ethereum and Solana with mailbox addresses (Hyperlane Registry 2026), and a single ETH warp route covering Arbitrum, Base, Gnosis, Optimism and ten other chains. Measured: the Base mailbox's default ISM reports module type 2 (aggregation), and the mailbox is owned by a Safe with 10 owners and threshold 6 (Hyperlane Base Mailbox 2026). The default module is therefore administered by a 6-of-10 key set. An application that sets its own ISM, with validators it chooses, does not depend on that default. Hive: not in the registry.

## LayerZero v2

Trust model: each application picks required and optional decentralized verifier networks (DVNs) and a threshold per channel; an executor delivers once the endpoint has the verifications (LayerZero Docs 2026). If an application does not configure, the default applies, which may change without notice, may contain a dead verifier that blocks delivery, and has LayerZero Labs as default DVN and executor. The docs recommend at least one required DVN not run by LayerZero Labs. Coverage: 186 mainnet v2 deployments with the same endpoint address, 0x1a44...728c, on Ethereum, Optimism, Arbitrum, Gnosis (eid 30145) and Base, and a Solana program (LayerZero Metadata 2026). Base lists 49 DVNs and Gnosis 19. Permissionless: an application can deploy its own OApp or OFT and configure its stack with no listing; whether a given DVN supports a given lane is the DVN's own listing. Hive: no deployment.

## Chainlink CCIP

Trust model: a committee of verifier node operators plus an independent risk layer that can curse a chain or lane, after which sends and executions on it revert; the docs state the committee verifier has 16 node operators (CCIP RMN Docs 2026). Token pools carry per-chain rate limits. Coverage: 78 mainnet chains (75 EVM, Solana, Aptos, Canton) and 816 lanes, with routers on Base, Arbitrum, Ethereum and Gnosis (CCIP Directory 2026). Hive is absent. Permissioning: token registration is self-serve with no Chainlink approval when the token exposes `owner()`, `getCCIPAdmin()` or a default admin role; the token's admin deploys its own pools (CCIP Docs 2026). Fees are fixed per lane: $0.225 to $0.25 between two non-Ethereum EVM chains, $1.35 to $1.50 into Ethereum, plus any pool fee the token owner sets.

## Wormhole

Trust model: a fixed guardian set signs observed messages; a destination core contract accepts a message with a quorum signature. Measured: guardian set index 7 holds 19 guardians so the quorum is 13; the message fee is 0 (Wormhole Core 2026). Core contracts exist on Base, Arbitrum and Gnosis (chain id 25); the Gnosis core contract reports guardian set index 4. Applications can publish and receive messages without registration; the guardian set is the single verifier set for every user. The history of exploits against Wormhole was not read in this record.

## Across and ERC-7683

Across is an intent bridge: a relayer fronts capital on the destination chain, and settlement of relayer repayment goes through bundles proposed to the HubPool on Ethereum under a bond, with UMA's optimistic oracle accepting unless disputed; the user is protected by the relayer's capital and the fill deadline, the relayer by the bundle process (Across Docs 2026). SpokePools are deployed on Base (0x09ae...EC64, deadline buffer 21,600 s), Arbitrum, Optimism, Mainnet and Solana, and not on Gnosis; the Base SpokePool's cross-domain admin is the HubPool (Across Deployments 2026). A cooperative cannot list a new chain or token on Across; it uses supported ones. ERC-7683 is a Draft standard for describing cross-chain orders and resolving them; it "does not standardize or guarantee the security of the protocol that ultimately settles the order" (ERC-7683 2026). The Open Intents Framework supplies Solidity contracts, a reference solver and a UI implementing it with pluggable settlement, deployable without permission (Open Intents Framework 2026). UniswapX as read is a same-chain order protocol (UniswapX README 2026).

## OP Stack interop

Messages are an initiating log and an executing message through a predeploy, with a per-chain dependency set; the docs call the work active development, rolled out iteratively, with no activation date on the page (OP Interop Docs 2026). Gnosis and Solana are not OP Stack chains; interop covers only chains in the Superchain dependency set.

## Axelar, deBridge

Axelar: a proof-of-stake validator network whose stake-weighted key shares authorise gateway execution at a threshold; the page read gives neither validator count nor numeric threshold, and says nothing of permissionless token deployment (Axelar Docs 2026). deBridge: a per-order solver network with no shared pools; orders can be cancelled by the user; Gnosis and Hive are not mentioned on the page read (deBridge Docs 2026).

## Gnosis Chain bridges and Hashi

The Gnosis bridge between Ethereum and Gnosis uses an arbitrary message bridge whose validator contract on the Gnosis side lists 7 validators with 4 required signatures (Gnosis AMB 2026). Gnosis documentation says bridging to Gnosis takes one block confirmation with the Fast Confirmation Rule (Gnosis Docs 2026). Hashi aggregates hash oracles from several bridges: an owner sets how many adapters must agree on a block hash for a domain (Hashi README 2026). The deployed address list was not on the page read.

## IBC

Each chain verifies the other's writes with an on-chain light client; relayers carry packets and are not trusted; the repository now states implementations for Cosmos, EVM chains and Solana, and verification ranging from light clients to permissioned attestation (IBC Docs 2026). No IBC connection to Hive was found.

## Summary by deployment permission

| Protocol | Verifier | Gnosis | Solana | Deploy own contracts and routes without listing |
|---|---|---|---|---|
| Hyperlane | per-app ISM, usually m-of-n validators; default ISM governed by 6-of-10 Safe | yes | yes | yes |
| LayerZero v2 | per-app required and optional DVNs; default is LayerZero Labs | yes | yes | yes, per-lane DVN availability varies |
| CCIP | committee of 16 node operators plus curse layer | yes | yes | tokens self-register; lanes are Chainlink-listed |
| Wormhole | 13 of 19 guardians | yes | not read here | messages yes; token registrations not read here |
| Across | HubPool, relayer capital, UMA oracle | no SpokePool | yes | no, supported tokens and chains only |
| ERC-7683 / Open Intents | settlement-defined | contracts deployable anywhere EVM | not covered | yes |
| OP interop | dependency set of OP chains | not an OP chain | no | only inside the Superchain |
| Axelar, deBridge | validator set; solvers | not read | partial | not stated on pages read |
| IBC | light clients | via EVM implementation | stated | yes by design |

Looked for and not found: Hive as a chain in any of Hyperlane, LayerZero, CCIP and IBC sources read; a challenge window length for Across; a validator count for Axelar.
