---
title: "ERC Standards for Vaults"
description: "What ERC-4626, ERC-7540, ERC-7575, ERC-6909 and ERC-3009 specify: status, functions, interface ids"
date-created: 2026-10-08
aliases:
  - "erc-standards-for-vaults"
keywords:
  - erc-4626
  - erc-7540
  - erc-7575
  - erc-6909
  - erc-3009
teaches:
  - "ERC Standards for Vaults"
requires: []
authors:
  - claude-sonnet-5-5
type: text
references:
  erc4626text2026:
    authors:
      - ERC-4626 Text
    title: "ERC-4626: Tokenized Vaults"
    year: 2026
    url: https://eips.ethereum.org/EIPS/eip-4626
  erc7540text2026:
    authors:
      - ERC-7540 Text
    title: "ERC-7540: Asynchronous ERC-4626 Tokenized Vaults"
    year: 2026
    url: https://github.com/ethereum/ERCs/blob/master/ERCS/erc-7540.md
  erc7575text2026:
    authors:
      - ERC-7575 Text
    title: "ERC-7575: Multi-Asset ERC-4626 Vaults"
    year: 2026
    url: https://github.com/ethereum/ERCs/blob/master/ERCS/erc-7575.md
  erc6909text2026:
    authors:
      - ERC-6909 Text
    title: "ERC-6909: Minimal Multi-Token Interface"
    year: 2026
    url: https://github.com/ethereum/ERCs/blob/master/ERCS/erc-6909.md
  erc3009text2026:
    authors:
      - ERC-3009 Text
    title: "ERC-3009: Transfer With Authorization"
    year: 2026
    url: https://github.com/ethereum/ERCs/blob/master/ERCS/erc-3009.md
---

This note states what the text of the standards says; production implementations are reported only where an address was read.

## Vaults

ERC-4626 Text 2026 is Final and defines the single-asset tokenized vault: asset, totalAssets, convert, preview, max and the four entry and exit functions; its two convert functions must round down. Every vault in the Base yield-venues record (MetaMorpho, Vault V2, sDAI, Spark savings) answers this interface. ERC-7540 Text 2026 extends it to asynchronous deposit and redemption through a request, pending, claimable and claim sequence with operators; its preview functions must revert for the asynchronous direction, and its ERC-165 ids are 0xe3bc4e65, 0x2f0a18c5 and 0xce3bbe50. ERC-7575 Text 2026 separates the share token from the vault with share(), allowing several vaults over one share token.

## Tokens

ERC-6909 Text 2026 defines many token ids in one contract with per-id balances and operators. ERC-3009 Text 2026 defines signed transfers that a relayer submits, a 4337-free way to give a member gasless transfers of a token that implements it.

## Not found

No production ERC-7540 vault address on Base was read, and ERC-3009 support in USDC on Base was not called; both search rows are empty. ERC-4337, ERC-7579 and RIP-7212 texts were not read.
