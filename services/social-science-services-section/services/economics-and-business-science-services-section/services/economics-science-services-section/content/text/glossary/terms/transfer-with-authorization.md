---
title: "Transfer With Authorization"
description: "The EIP-3009 function-level mechanic — transferWithAuthorization/receiveWithAuthorization, an EIP-712-signed, random-nonce, third-party-relayable ERC-20 transfer — that fires the AuthorizationUsed event x402's on-chain settlement volume is measured by counting."
defines: Transfer With Authorization
domain: economics
requires: [eip-3009]
enables: [x402-facilitator]
date-created: 2026-08-27
date-modified: 2026-08-27
---

Transfer With Authorization is the specific function-level mechanic [EIP-3009](./eip-3009.md) defines, read directly from the specification's text this pass.
Two external functions carry it: `transferWithAuthorization(address from, address to, uint256 value, uint256 validAfter, uint256 validBefore, bytes32 nonce, uint8 v, bytes32 r, bytes32 s)` and an equivalent `receiveWithAuthorization` with the same parameter list.
`from` and `to` are the token holder and recipient; `value` is the amount; `validAfter`/`validBefore` are a signed authorization's time window (the "not before, not after" bounds a signer builds into the authorization itself, letting a signature expire on its own without an on-chain revocation step); `nonce` is a signer-chosen random 32 bytes, not a sequential counter (the rationale is [EIP-3009](./eip-3009.md)'s own, carried there in full); and `v, r, s` are the EIP-712 signature components proving the holder authorized exactly this transfer.
Anyone — not necessarily the token holder, and not necessarily anyone the holder has interacted with before — can submit this call and pay its gas, which is the entire point: the token holder never needs ETH, never signs an on-chain transaction, and never pays gas, only an off-chain EIP-712 message.

**Replay protection** works two ways at once, and the specification is explicit about both. First, per-authorization: on successful execution the contract fires `event AuthorizationUsed(address indexed authorizer, bytes32 indexed nonce)` and marks that `(authorizer, nonce)` pair permanently used, so the identical signed authorization cannot be submitted twice — an `AuthorizationCanceled` event exists as well, for a signer who wants to invalidate an authorization before it is ever used. Second, cross-chain and cross-contract: the EIP-712 domain separator folds in the token contract's own address and the chain ID at signing time, so a signature valid on one deployment of one token on one chain cannot be replayed against a different deployment, a different token, or a different chain — this is what makes an authorization signed for USDC on Base unusable against USDC on, say, Polygon, even though both are the identically-coded contract.

**This is the exact event the 2026-08-27 on-chain measurement counted.**
The 561 Group coordinator's `eth_getLogs` query against Base mainnet USDC filtered on topic0 `0x98de503528ee59b575ef0c0a2576a82497bfc029a5685b209e9ec333479b10a5` — this pass independently verified that hash, computing `keccak256("AuthorizationUsed(address,bytes32)")` directly (via a local pycryptodome Keccak implementation, not carried forward from any secondary source) and confirming it matches the coordinator's reported topic0 exactly, byte for byte.
That confirms the coordinator's query counted genuine `AuthorizationUsed` events and nothing else — every one of the 2,279 events in the sampled 900-block window is a completed `transferWithAuthorization` or `receiveWithAuthorization` call, no more and no less.
What that count cannot distinguish is *which* higher-level protocol initiated each authorization: [x402](./x402.md)'s `exact` scheme is one caller of this mechanism, via its [facilitator](./x402-facilitator.md), but the function is public infrastructure any application can call, which is the mechanical reason the on-chain count is only an upper bound on x402 volume — see [the note on the Bazaar undercounting settlement](../../documents/articles/notes/2026/08/27/2026-08-27-x402-bazaar-undercounts-settlement-by-an-order-of-magnitude.md) and the [settlement-primitive](./settlement-primitive.md) entry for why a shared primitive resists attribution to any one protocol built on it.
