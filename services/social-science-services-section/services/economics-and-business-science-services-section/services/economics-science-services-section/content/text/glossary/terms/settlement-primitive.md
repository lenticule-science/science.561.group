---
name: "Settlement Primitive"
description: "The underlying value-transfer mechanism a higher-level payment protocol delegates the actual moving of funds to — usually shared, general-purpose infrastructure the protocol does not own outright, which is why measuring the primitive's activity does not cleanly measure the protocol's."
domain: economics
requires: []
enables: x402
date-created: 2026-08-27
date-modified: 2026-08-27
---

A settlement primitive is the mechanism that actually moves value, sitting beneath a payment protocol's own rules about *when* and *how much* to move.
The protocol defines the challenge-and-agreement layer — in [x402](./x402.md)'s case, the HTTP 402 handshake, the price, the payee — and then hands the "make the money move" step to a primitive that was very often not built for that protocol specifically.
This layering is normal and not a design flaw: a credit-card network's settlement primitive is the correspondent-banking and card-network rails underneath it, not something Visa or Mastercard invented from nothing; a stablecoin protocol's settlement primitive is the underlying blockchain's own transfer function.

x402's `exact` payment scheme, on EVM chains, delegates settlement to [EIP-3009](./eip-3009.md)'s [transfer-with-authorization](./transfer-with-authorization.md) mechanism — a signature-based, gas-delegatable ERC-20 transfer that predates x402 and was not built exclusively for it; USDC's own contracts implement it independent of any x402 activity at all.
This is the general and recurring shape of the problem: **a settlement primitive is usually shared infrastructure**, used by whichever protocols find it convenient, and a primitive's own on-chain footprint is therefore a superset of any one protocol built on top of it, not a proxy for that protocol alone.
The practical consequence, worked through at length in [the note on the Bazaar undercounting settlement](../../documents/articles/notes/2026/08/27/2026-08-27-x402-bazaar-undercounts-settlement-by-an-order-of-magnitude.md): a 2026-08-27 on-chain measurement of EIP-3009 `AuthorizationUsed` events on Base USDC — roughly 3.28 million extrapolated per 30 days — is the best available proxy for x402 settlement volume precisely *because* EIP-3009 is x402's settlement primitive, and simultaneously cannot be read as an exact count of x402 volume, precisely because a settlement primitive is shared rather than owned.
That figure is graded **[UNVERIFIED]** as to its true x402-specific share for exactly this reason, and is treated in that note as an upper bound rather than a measurement.

Other protocols choose different settlement primitives for the same reason x402 chose EIP-3009 — gasless, signature-authorized transfer that a relayer rather than the payer can submit — without the same primitive being involved: EIP-2612's `permit` function (a separate, earlier gas-delegation standard many ERC-20 tokens implement, requiring a subsequent `transferFrom` rather than moving funds in one call) and Solana's own SPL token-program transfer instructions (which x402's Solana support uses instead of EIP-3009, since EIP-3009 is EVM-specific) are both settlement primitives in the same structural role, serving different protocols or different chains.
The general lesson this term exists to hold in place: whenever a note in this section reasons from on-chain activity back to a specific protocol's volume, the reasoning is only as tight as the primitive-to-protocol mapping, and that mapping should be checked, not assumed, before a chain-level count is presented as a protocol-level one.
