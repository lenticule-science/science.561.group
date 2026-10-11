---
name: "Yield Donation"
date-created: 2026-10-08
aliases:
  - "yield donating"
  - "donated yield"
  - "principal-preserving donation"
description: "A funding structure in which depositors keep a claim on their principal while the return earned on it is routed to a recipient fixed by rule or vote."
references: {}
---

**Yield donation** separates a deposit's principal from the return on it. The depositor keeps a redeemable claim on the principal; the return is sent to a recipient chosen by contract parameter, holder vote, or governance.

Three implementations differ in where the separation happens. In a share-minting vault such as an [ERC-4626 tokenized vault](./erc-4626-tokenized-vault.md), a report step mints new shares equal to the profit to a router address, leaving depositors' share counts unchanged. In a reserve-backed [stablecoin](../../../../../economics-science-services-section/content/text/glossary/terms/stablecoin.md), the issuer earns the return off chain and passes a revenue share to a foundation, which donates it. In a staking ledger, an operator stakes the assets and publishes a split of the proceeds. The cost to the depositor is the forgone return and the risk of the venue holding the principal; a loss can fall on the principal unless donor shares are burned first or the issuer's reserve covers it.

See also [staking yield](./staking-yield.md) and [dragon router](./dragon-router.md).
