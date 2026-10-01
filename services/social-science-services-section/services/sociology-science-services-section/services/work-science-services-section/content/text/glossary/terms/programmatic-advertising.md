---

name: "Programmatic Advertising"
description: "The automated buying and selling of ad space on websites through real-time auctions — the dominant form of indirect web monetization."
domain: web-business
restricts: Web Monetization
uses: Revenue Per Mille, Pageview, Impression, Two-Sided Market
date-created: 2026-03-29
defines: Programmatic Advertising
related: Affiliate Marketing
date-modified: 2026-03-29
---

Programmatic advertising is the automated buying and selling of ad space on websites through real-time auctions. When a visitor loads a web page containing programmatic ad slots, an auction occurs in the milliseconds between the page request and the page rendering: the publisher's ad server sends information about the visitor and the page to an ad exchange, advertisers' algorithms bid on the right to show that visitor an ad, and the winning ad is displayed — all before the page finishes loading.

This system replaced the older model of direct ad sales, where a publisher's sales team would negotiate deals with individual advertisers (e.g., "Ford will pay $50,000 for a month of banner ads on the sports section"). Direct sales required human relationships, minimum spend thresholds, and manual trafficking of ad creatives. Programmatic advertising commoditized the process: any publisher with sufficient traffic can connect to an ad network or exchange and begin earning revenue immediately, and any advertiser can reach specific audiences across millions of sites without negotiating individual deals.

The **supply chain** of programmatic advertising has several layers. The publisher integrates ad code from a **supply-side platform** (SSP) like Google Ad Manager, Index Exchange, or OpenX. The SSP connects to **ad exchanges** where inventory is auctioned. **Demand-side platforms** (DSPs) bid on behalf of advertisers, using targeting data to decide which impressions to buy and how much to bid. **Data management platforms** (DMPs) provide the audience data — demographics, browsing behavior, purchase history — that informs bidding decisions. At each layer, intermediaries take a cut. Studies by the ISBA (2020) and the ANA (2023) found that roughly 40-65% of advertiser spending is absorbed by intermediaries before reaching the publisher. This is sometimes called the "ad tech tax."

For publishers, programmatic advertising is the lowest-effort monetization model: install a script, and revenue appears. But the [RPMs](./revenue-per-mille.md) for open-market programmatic ads are also the lowest — typically $2-8 for general-interest content with a U.S. audience. Premium ad management companies (Mediavine, Raptive, Playwire) improve on this by optimizing ad placement, running header bidding auctions that increase competition among buyers, and enforcing quality standards that attract higher-paying advertisers. These networks typically require minimum traffic thresholds (Mediavine: 50,000 sessions/month) and take 25-35% of ad revenue.

The programmatic ecosystem faces structural pressures. Ad-blocking software removes ads before they load, eliminating revenue from 30-40% of desktop users. Privacy regulations (GDPR in Europe, CCPA in California) restrict the behavioral data that makes targeted advertising valuable. Google's phased deprecation of third-party cookies in Chrome — the primary mechanism for cross-site user tracking — is forcing the industry toward contextual targeting (ads matched to page content rather than user behavior) and first-party data strategies. These shifts generally reduce programmatic RPMs for small publishers while benefiting large publishers with direct advertiser relationships and substantial first-party data.

## Related

- [Revenue per mille](./revenue-per-mille.md) — the metric used to evaluate programmatic ad performance per page
- [Pageview](./pageview.md) — each pageview triggers a new programmatic auction
- [Web monetization](./web-monetization.md) — the broader practice that programmatic advertising is one model within
- [Affiliate marketing](./affiliate-marketing.md) — an alternative monetization model that often yields higher RPMs but requires editorial integration
