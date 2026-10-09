---
title: "Base Identity, Roles and Treasury"
description: "EAS predeploys, Hats Protocol, Safe, Zodiac Roles and Chainlink feeds on Base: addresses, verification, audit links"
date-created: 2026-10-08
aliases:
  - "base-identity-roles-treasury"
keywords:
  - eas
  - hats
  - safe
  - zodiac
  - chainlink
teaches:
  - "Base Identity, Roles and Treasury"
requires: []
authors:
  - claude-sonnet-5-5
type: text
references:
  easpredeploy2026:
    authors:
      - EAS Predeploy
    title: Ethereum Attestation Service predeploys on Base
    year: 2026
    url: https://github.com/ethereum-attestation-service/eas-contracts
  hatsprotocol2026:
    authors:
      - Hats Protocol
    title: Hats Protocol v1 on Base
    year: 2026
    url: https://github.com/Hats-Protocol/hats-protocol
  safecontracts2026:
    authors:
      - Safe Contracts
    title: Safe singleton and proxy factory on Base
    year: 2026
    url: https://github.com/safe-global/safe-smart-account
  zodiacmodules2026:
    authors:
      - Zodiac Modules
    title: Zodiac Roles, ModuleProxyFactory, Delay and Reality
    year: 2026
    url: https://github.com/gnosisguild/zodiac-modifier-roles
  chainlinkfeeds2026:
    authors:
      - Chainlink Feeds
    title: Chainlink Data Feeds on Base
    year: 2026
    url: https://reference-data-directory.vercel.app/feeds-ethereum-mainnet-base-1.json
---

This note states what first-party reads on 2026-10-08 establish about the Base primitives for membership attestation, role assignment, treasury custody and price reference.

## Attestation

EAS Predeploy 2026 finds the Ethereum Attestation Service and its schema registry as Base predeploys at 0x4200...0021 and 0x4200...0020, both version 1.0.1. Because they are predeploys at fixed addresses, a contract on Base can call them with no deployment of its own. The attestation a pool would write is a record signed by an attester about a recipient under a registered schema.

## Roles and custody

Hats Protocol 2026 finds Hats Protocol v1 at 0x3bc1...d137 on Base, verified, with 1,899 top hats registered. A hat is an ERC-1155 token that a tree admin can mint to an address and revoke; a contract can check whether an address wears a hat. Safe Contracts 2026 reads the Safe 1.4.1 singleton and proxy factory on Base and Gnosis, and the Morpho DAO Safe on Base is a 5 of 9. Zodiac Modules 2026 reads the Zodiac Roles v2 mastercopy and ModuleProxyFactory on Base: Roles lets a Safe grant an address a scoped permission set, such as calling one function on one target with bounded parameters. The Delay and Reality mastercopies were not found at the address tested (search row empty).

## Price reference

Chainlink Feeds 2026 reads the Base USDC / USD feed at $0.99981288 and the sequencer uptime feed answering 0 (up). The sUSDS / USDS exchange-rate feed answers 1.1121, matching the Spark rate provider read in the yield-venues record.

## Not found

Delay and Reality mastercopies on Base; Gitcoin Passport, Kleros, UMA, World ID and Basenames were not read in this pass.
