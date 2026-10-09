---
name: "Stablecoin"
description: "A blockchain token whose issuer promises to redeem it at a fixed value in another asset, usually one US dollar, and holds reserves to back that promise; the settlement asset of nearly all x402 payments, and in the United States a regulated 'payment stablecoin' under the GENIUS Act of 2025."
domain: economics
enables: [x402, settlement-primitive]
date-created: 2026-09-27
date-modified: 2026-09-27
references:
  - "Guiding and Establishing National Innovation for U.S. Stablecoins (GENIUS) Act, enacted 2025-07-18."
  - "Office of the Comptroller of the Currency, proposed rule implementing the GENIUS Act, Federal Register 2026-03-02, https://www.federalregister.gov/documents/2026/03/02/2026-04089/implementing-the-guiding-and-establishing-national-innovation-for-us-stablecoins-act-for-the"
  - "TRM Labs, x402 settlement analysis, reported by PYMNTS 2026-09-15, https://www.pymnts.com/news/artificial-intelligence/2026/agentic-payments-are-growing-most-x402-payments-are-not-from-ai-agents"
---

A stablecoin is a token on a blockchain whose issuer promises to redeem it at a
fixed value in another asset, and holds reserves to back the promise. The
common kind is a fiat-backed dollar token: one token redeems for one US dollar,
and the issuer holds cash and short-term government debt against the tokens
outstanding. USDC (issued by Circle) and USDT (issued by Tether) are the
largest.

A stablecoin is not a bank deposit. The holder's claim is on the issuer, and
the token's value depends on the reserves and on the issuer's willingness and
ability to redeem. Most fiat-backed issuers also keep the power to freeze a
token held at a given address. That makes a stablecoin both a settlement asset
and a point of control, which this section's
[payment chokepoint](./payment-chokepoint.md) term describes.

In the United States the GENIUS Act, enacted on 2025-07-18, makes a "payment
stablecoin" a regulated instrument. Only a permitted issuer may issue one: a
subsidiary of an insured bank, a federal qualified issuer approved by the
Office of the Comptroller of the Currency, or a state qualified issuer. The Act
takes effect on 2027-01-18, or 120 days after final implementing rules if that
comes sooner. The OCC published its proposed rule on 2026-03-02.

Stablecoins are the settlement asset of [x402](./x402.md). TRM Labs found that
99.6% of the value in about 199 million x402 settlements from May 2025 to
September 2026 was USDC. On EVM chains, the `exact` scheme moves USDC through
[EIP-3009](./eip-3009.md) `transferWithAuthorization`, which lets a third party
submit a payer's signed transfer. That mechanism is what lets a
[facilitator](./x402-facilitator.md) settle a payment the buyer never broadcast
itself.
