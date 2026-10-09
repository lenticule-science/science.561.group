---
title: "Moving USDC across chains with CCTP v2, and the Hive to EVM bridging reality"
description: "Measured domains, contract addresses, attester threshold, Fast Transfer fee and allowance for Circle's CCTP v2 on Base, Arbitrum, Optimism and Solana; Gnosis and Hive are outside it; three cross-chain pool architectures compared against what exists between Hive and EVM chains."
date-created: 2026-10-08
aliases:
  - cctp and hive bridging
keywords: [CCTP, USDC, Fast Transfer, Gnosis, Hive, bridge, hub and spoke, intents]
teaches:
  - how CCTP v2 burn-and-mint is attested and what it costs
  - which chains it covers and which it does not
  - what exists between Hive and EVM chains and what does not
requires: []
authors: [claude-sonnet-5-5]
type: text
references:
  circlechains2026:
    authors:
      - Circle CCTP Chains
    title: developers.circle.com CCTP supported blockchains and domains
    year: 2026
    url: https://developers.circle.com/cctp/cctp-supported-blockchains
  cctponchain2026:
    authors:
      - CCTP On Chain
    title: cast reads of CCTP v2 contracts on Base, Arbitrum, Optimism and Gnosis (2026-10-08)
    year: 2026
    url: https://basescan.org/address/0x81D40F21F12A8F0E3252Bccb954D722d4c464B64
  circlecontracts2026:
    authors:
      - Circle CCTP Contracts
    title: developers.circle.com CCTP EVM smart contracts and technical guide
    year: 2026
    url: https://developers.circle.com/cctp/evm-smart-contracts
  cctpiris2026:
    authors:
      - Circle Iris API
    title: iris-api.circle.com v2 burn fees and fastBurn allowance (2026-10-08T19:49)
    year: 2026
    url: https://iris-api.circle.com/v2/fastBurn/USDC/allowance
  llamausdc2026:
    authors:
      - DeFiLlama USDC
    title: stablecoins.llama.fi stablecoins with chainCirculating (2026-10-08)
    year: 2026
    url: https://stablecoins.llama.fi/stablecoins?includePrices=true
---

## CCTP v2 as measured

Circle's cross-chain transfer protocol burns USDC on the source chain and mints native USDC on the destination after Circle's attestation service signs the burn message. Domains used by the chains in question: Ethereum 0, OP Mainnet 2, Arbitrum 3, Solana 5, Base 6 (Circle CCTP Chains 2026). Gnosis has no domain: the supported-chains table and domain list do not contain it, and the contract addresses have no code on Gnosis (Circle CCTP Chains 2026, CCTP On Chain 2026). No Hive domain exists.

On every listed EVM mainnet chain, TokenMessengerV2 is 0x28b5a0e9C621a5BadaA536219b3a228C8168cf5d, MessageTransmitterV2 is 0x81D40F21F12A8F0E3252Bccb954D722d4c464B64 and TokenMinterV2 is 0xfd78EE919681417d192449715b2594ab58f5D002 (Circle CCTP Contracts 2026). Reads on Base, Arbitrum and Optimism confirmed 2,175-byte proxies at those addresses with local domains 6, 3 and 2, version 1, a signature threshold of 2, and on Base 2 enabled attesters, a per-message burn limit of 10 million USDC, and a Base USDC supply of 4.35 billion (CCTP On Chain 2026). The attester threshold is therefore two signatures from a set of two on Base at the time of reading, and the message transmitter's owner and attester manager are separate addresses controlled outside the contracts. The trust model is Circle: the attester keys are Circle's, and the docs name the service Iris as the signer; contracts were audited by two firms (Circle CCTP Contracts 2026).

Hooks are metadata attached to the burn message; the protocol does not run them, so an integrator's contract must read the hook data on the destination and act on it (Circle CCTP Contracts 2026). A pool deposit that arrives with hook data naming the pool and member would be executed by the pool's own receiving contract after a relayer submits the attested message.

Costs and speed. Standard transfers cost no protocol fee and are attested at finalized level; Fast Transfer is attested at a lower confirmation threshold (1000) for a fee read from the interface: 1.3 basis points from Base to Arbitrum and 1.4 from Arbitrum to Base. Fast Transfer draws on an allowance that read 53.25 million USDC remaining (Circle Iris API 2026). On 10,000 USDC the Fast fee is 1.30 USDC.

Where the dollars are. Circulating USDC is 66.24 billion in total; Ethereum holds 45.8 billion, Solana 6.8 billion, Base 4.35 billion, Arbitrum 2.48 billion and Gnosis 12.8 million, which is a bridged representation and not CCTP-minted (DeFiLlama USDC 2026). USDT circulates 76.6 billion on Ethereum, 2.9 billion on Solana and 0.7 million on Gnosis.

## Three pool architectures

| | Hive ledger with bridged edges | EVM hub with CCTP and message spokes | Intent-based, solver-settled |
|---|---|---|---|
| Where state lives | pool books and member balances in Hive accounts, savings and custom_json | one pool contract on Base (or another CCTP chain) | pool contract per chain, orders settled by solvers |
| How USDC arrives | not possible natively; HIVE and HBD only | CCTP burn on a spoke, hook, mint to the hub | solver fills on the destination chain, repaid later |
| Trust beyond the chain | Hive witnesses; any exit to EVM needs a custodian or layer-2 | Circle attesters for dollars; message layer (Hyperlane ISM, LayerZero DVNs) for state | solver capital plus the settlement layer (for Across, bonded bundles and UMA) |
| Coverage of Base, Arbitrum, Optimism, Solana | none native | all four are CCTP domains; Gnosis is not | Across has Base, Arbitrum, Optimism and Solana but not Gnosis |
| Gnosis | exit paths unmeasured | needs Hyperlane, LayerZero, CCIP, Wormhole or the Gnosis AMB with 4 of 7 validators | Across not deployed there |
| Requires a listing | none | none for CCTP use or Hyperlane and LayerZero deployment | yes: Across supports fixed chains and tokens |

## What exists between Hive and EVM chains

Measured here: HBD has a CoinGecko record of 33.6 million USD market capitalisation, a 24-hour volume of 5.10 USD, no ticker list and no contract address on any chain; HIVE trades about 695,000 USD a day (both figures are cited in the Hive mechanics note of the same date). DeFiLlama has neither an HBD stablecoin entry nor a Hive chain. No wrapped HIVE or HBD token on an EVM chain was found, and the registries of Hyperlane, LayerZero, CCIP and the IBC documents do not list Hive. What does exist is on the Hive side: the Hive Engine sidechain's pegged SWAP.HBD (219,175 units, issuer account holding 46,606 HBD under a single key) and the Magi layer-2 with an 18-key gateway and zero-knowledge Ethereum light-client code whose EVM deployment was not found. The practical route from a Hive-denominated pool to USDC on Base is therefore an off-chain or exchange step that was not measured, and the on-chain designs available to a cooperative put its dollar ledger on an EVM chain and treat Hive as an additional settlement or accounting venue.
