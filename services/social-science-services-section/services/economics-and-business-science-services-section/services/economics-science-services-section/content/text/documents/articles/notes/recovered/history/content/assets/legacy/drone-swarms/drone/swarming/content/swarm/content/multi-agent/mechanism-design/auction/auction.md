---
type: object
class: classical
status: active
depends-on:
  - teaching/explanations/mechanism-design.md
see-also:
  - ../morphisms/auction-mechanism.md
references:
  - references/vickrey1961.md
---

# Auction

An **auction** is a [mechanism](teaching/explanations/mechanism-design.md) for allocating goods, contracts, or tasks via competitive bidding.
Bidders submit valuations or prices according to a specified format; the auction rule selects winner(s) and determines payments.

## Auction families

- **English (open ascending).** Bidders raise the price publicly until only one remains.
  Winner pays final bid.
- **Dutch (open descending).** Auctioneer lowers price until a bidder accepts.
  Winner pays acceptance price.
- **First-price sealed-bid.** Bidders submit private bids; highest bid wins, pays bid amount.
- **Second-price sealed-bid (Vickrey).** Highest bid wins, pays second-highest bid amount.
  Truthful bidding is dominant strategy (Vickrey 1961).
- **Combinatorial.** Bidders bid on bundles of items; allocation maximizes total value (NP-hard in general).
- **All-pay.** All bidders pay their bids regardless of winning.
  Used in research-funding allocation, lobbying models.
- **Multi-unit.** Multiple identical units sold; uniform pricing or discriminatory pricing.

## Properties

Auctions are characterized by:

- **Allocation rule.** Who wins.
- **Payment rule.** What winners (and possibly losers) pay.
- **Information structure.** What bidders know about each other's valuations and bids.
- **Incentive properties.** Whether truthful bidding is optimal.
- **Revenue properties.** Expected revenue to the seller.
- **Efficiency properties.** Whether the highest-value bidder wins.

## Foundational results

- **Revenue equivalence theorem.** Under standard assumptions (independent private values, risk-neutral bidders, symmetric distribution), all standard auctions yield the same expected revenue.
  Surprising and influential.
- **Vickrey auction's truthfulness.** Second-price sealed- bid makes truthful bidding a *dominant strategy* — bidder optimum regardless of others' bids.
  The simplest practical incentive-compatible auction.
- **VCG generalization.** Vickrey-Clarke-Groves mechanisms extend Vickrey's truthfulness to multi-item combinatorial settings.

## Practical applications

- **Spectrum auctions.** Government allocation of radio spectrum to telecoms.
- **Online advertising.** Real-time bidding for ad impressions; uses VCG-like mechanisms.
- **Treasury auctions.** Government debt issuance.
- **Art and luxury goods.** Christie's, Sotheby's English auctions.
- **Compute and bandwidth markets.** Dynamic resource allocation in cloud and networking.

## In multi-agent AI systems

Auctions appear when:

- **Resource allocation among AI agents.** Compute, bandwidth, attention.
- **Task allocation in multi-agent systems.** Contract Net Protocol uses bidding for task assignment.
- **Ad-tech.** AI agents bid in real-time auctions on behalf of advertisers.
- **Decentralized AI marketplaces.** Where AI services transact, auction mechanisms govern pricing.

## Limits

- **Strategic complexity.** Real bidders may not bid optimally; behavioral deviations affect outcomes.
- **Common-value vs private-value.** Common-value settings (where bidders value the item similarly but uncertainly) introduce winner's-curse problems.
- **Collusion.** Bidders may collude, undermining auction guarantees.
- **Implementation.** Combinatorial auctions face computational complexity barriers.

## Status

Mature theoretical area with extensive practical deployment.
Active research extends classical results to combinatorial settings, repeated auctions, machine- learning-driven bidding, and multi-agent AI systems.
