---
title: "Hive layer-2 and smart-contract options: Hive Engine, Magi (VSC) and the node itself"
description: "What the Hive Engine sidechain and the Magi (VSC) layer-2 are, who holds their keys, what bridges to other chains exist in code and on chain, and what was looked for and not found, as of 2026-10-08."
date-created: 2026-10-08
aliases:
  - hive layer 2 options
keywords: [Hive Engine, Magi, VSC, sidechain, bridge, custody, HBD, threshold signing]
teaches:
  - how Hive Engine pegs HIVE and HBD and who controls the peg accounts
  - how Magi settles contracts and custody against the Hive witness set
  - which Hive-to-EVM bridge paths exist and which were not found
requires: []
authors: [claude-sonnet-5-5]
type: text
references:
  hiveengineaddr2026:
    authors:
      - Hive Engine Repos
    title: github.com/hive-engine organization repositories (search API, 2026-10-08)
    year: 2026
    url: https://github.com/hive-engine
  hiveenginepeg2026:
    authors:
      - Hive Engine Contracts
    title: hive-engine/hivesmartcontracts contracts/hivepegged.js (raw.githubusercontent.com read 2026-10-08)
    year: 2026
    url: https://github.com/hive-engine/hivesmartcontracts/blob/master/contracts/hivepegged.js
  hiveenginerpc2026:
    authors:
      - Hive Engine RPC
    title: "api.hive-engine.com/rpc blockchain, contracts: getLatestBlockInfo, tokens.tokens, witnesses.witnesses and witnesses.params"
    year: 2026
    url: https://api.hive-engine.com/rpc/contracts
  hiveenginebridge2026:
    authors:
      - Hive Engine Bridge Accounts
    title: api.hive.blog get_accounts for honey-swap, graphene-swap, hive-engine
    year: 2026
    url: https://api.hive.blog
  magidocs2026:
    authors:
      - Magi Docs
    title: "vsc-eco/docs: FAQ, Native Asset Mapping, Feeless In-Protocol Transactions, Stablecoin (HBD) as the Base Asset"
    year: 2026
    url: https://github.com/vsc-eco/docs/blob/main/src/content/docs/FAQ.md
  maginode2026:
    authors:
      - Magi Node
    title: "vsc-eco/go-vsc-node README and docs (commit 3d4c965f, 2026-10-08): index.md, tss.md, consensus-upgrades.md, magi-lean-audit.md"
    year: 2026
    url: https://github.com/vsc-eco/go-vsc-node/blob/main/docs/index.md
  vscgateway2026:
    authors:
      - VSC Gateway Account
    title: api.hive.blog get_accounts vsc.gateway, magi.network, vsc.network
    year: 2026
    url: https://api.hive.blog
---

Hive itself has no contract virtual machine; the base layer carries balances, authorities, the internal HIVE/HBD market and `custom_json` records (see the mechanics note of the same date). Two systems add programmability by reading the Hive block stream.

## Hive Engine

Hive Engine is a sidechain whose nodes read every Hive block and execute JavaScript contracts whose inputs are Hive operations carrying a contract name, an action and a JSON payload; each sidechain transaction is listed with its sender, contract, action, payload and the Hive block it references (Hive Engine RPC 2026). The node repository is pushed on 2026-10-06 and its contracts folder holds the tokens, market, market pools, NFT, witnesses, distribution and `hivepegged` contracts (Hive Engine Repos 2026, Hive Engine Contracts 2026). The Steem-era fork of the same code was last pushed in 2023. At the time of reading the sidechain was at block 63,539,307, referencing Hive block 110,602,657, so it follows the chain without lag (Hive Engine RPC 2026).

Its own consensus is a witness round: 21 slots, 20 top witnesses, 28 enabled witnesses, and 13 witness signatures required (Hive Engine RPC 2026). That is a separate trust domain from Hive's witnesses; a Hive Engine token balance is secured by the sidechain witness set, not by Hive consensus.

The pegged assets are the weak point for a settlement design. SWAP.HIVE is bought with a 0.75 percent fee (minimum 0.001 HIVE) by sending HIVE to the peg account (Hive Engine Contracts 2026). The peg accounts are ordinary Hive accounts: `honey-swap` holds 601,521 HIVE under one key with threshold 1, and `graphene-swap`, the issuer of SWAP.HBD, holds 6,538.78 HBD liquid plus 40,066.90 HBD in savings under one key with threshold 1 (Hive Engine Bridge Accounts 2026). SWAP.HBD supply is 219,175.01; the HBD held on chain by its issuer is 46,605.68, 21.3 percent of that supply. The brief expected a Hive Engine multisignature bridge for HBD; no multisignature authority was found on the peg accounts. SWAP.USDT, issued by `he-nuked`, is described in its own metadata as deprecated with supply 1,161,568.998 (Hive Engine RPC 2026). Hive Engine therefore gives contracts and tokens, with custody of the pegged assets resting on single keys. It has no EVM connection in anything read here.

## Magi (VSC)

Magi, built by the vsc-eco organization, is a layer-2 whose nodes read the Hive stream, whose accounts and balances use HBD as the base asset, and whose contracts are WebAssembly modules run in WasmEdge. Its documents state mainnet launched 2025-03-31, that it has no token of its own, that every liquidity pool pairs against HBD, and that resource credits track HBD held and regenerate about 25 percent a day (Magi Docs 2026). The node README describes "a layer-2 network on top of the Hive blockchain, providing threshold signing, contract execution, and bridging to external chains" (Magi Node 2026).

Custody. The Hive-side vault is the account `vsc.gateway`. It holds 217,175.35 HIVE, 4,702.25 HBD and 3,866.12 HBD in savings. Both its owner and active authorities are 18 keys with threshold 6667 of 10000; the weights are 149 or 150 for nine keys and range up to 2,417 for the largest (VSC Gateway Account 2026). The signing keys for non-Hive chains are threshold-signature keys (ECDSA and EdDSA) generated and reshared by the elected witness committee; a key becomes active only after a leader posts a commitment to Hive carrying a verified BLS quorum proof, and only the slot leader broadcasts the resulting Hive operations (Magi Node 2026). Consensus upgrades activate only when 80 percent of committee stake announces the new version.

Reach. Native asset mapping holds the foreign asset in a vault on its home chain and records ownership on Magi; Bitcoin is implemented, Litecoin, Dash and Solana are described as planned (Magi Docs 2026). The node ships a mapping bot for BTC, LTC, DASH, DOGE and BCH. For Ethereum-family chains the organization publishes a zero-knowledge light client (SP1 plus Helios) whose Groth16 proofs of beacon-chain finality are submitted permissionlessly to a WASM verifier contract that stores headers for the EVM bridge to read (Magi Node 2026). A swap SDK targets HIVE, HBD and BTC through Hive Keychain, PeakD and Ecency. No deployed EVM contract for the Magi bridge, and no EVM-chain wrapped HIVE or HBD, was found (searches below), so the zk bridge is code, not a measured route.

Maturity. The project's own audit dated 2026-04-29 lists a critical finding that the epoch-boundary settlement handler is effectively disabled and a high finding that the duplicate-transaction guard is process-local memory rather than consensus state (Magi Node 2026). The protocol is funded in part by DHF proposal 378 at 900 HBD per day, which has 19.6e15 votes against 81.66e15 for the return proposal and therefore receives nothing at present (see the mechanics note).

## Reading for a pool

For a pool whose ledger lives on Hive the available programmability is: operation-level primitives on layer 1 (recurring transfers, escrow, savings, weighted authorities), Hive Engine token contracts with single-key peg custody, or Magi WASM contracts secured by an elected committee of Hive witnesses with an 18-key, two-thirds gateway. The Magi gateway is the only bridge-shaped Hive custody found with a weighted multisignature, but its HBD balance is under 9,000 against 217,175 HIVE, and it holds no EVM-chain assets that were measured.
