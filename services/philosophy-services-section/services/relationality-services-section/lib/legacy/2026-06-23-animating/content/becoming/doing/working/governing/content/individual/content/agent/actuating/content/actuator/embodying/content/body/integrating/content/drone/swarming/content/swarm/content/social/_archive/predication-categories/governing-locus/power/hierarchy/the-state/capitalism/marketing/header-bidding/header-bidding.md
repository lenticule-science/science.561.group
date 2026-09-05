---
title: Header Bidding
description: "A programmatic advertising technique where multiple ad exchanges bid simultaneously on each impression before the ad server makes its decision — replacing the sequential waterfall with a parallel auction."
domain: web-business
restricts: programmatic-advertising
optimizes: programmatic-advertising
acts-on: impression
measured-by: revenue-per-mille
date-created: 2026-03-29
references:
  - id: prebid2015
    type: document
    title: Prebid.js: An Open-Source Header Bidding Solution
    author:
      - literal: AppNexus
    container-title: Prebid.org
    issued:
      - year: 2015
    URL: https://prebid.org
---

Header bidding is a [programmatic advertising](./programmatic-advertising.md) technique in which a publisher solicits bids from multiple ad exchanges and supply-side platforms (SSPs) simultaneously, before the publisher's primary ad server (typically Google Ad Manager) makes its allocation decision.
The name comes from the technique's original implementation: a JavaScript snippet placed in the page's HTML `<head>` section that fires bid requests to multiple demand sources as the page loads.

Header bidding replaced the **waterfall** model that dominated programmatic advertising before roughly 2015.
In a waterfall, the publisher's ad server offered each impression to demand sources sequentially, in a predetermined priority order — typically Google AdX first, then the next-highest-priority exchange, then the next, and so on.
Each source had a floor price; if it didn't bid above the floor, the impression cascaded to the next source.
The problem: the waterfall was based on historical average prices, not real-time competition.
A demand source ranked fifth might have been willing to pay more for a specific impression than the source ranked first, but never got the chance to bid because the first source cleared its floor price.

Header bidding solved this by making the auction parallel rather than sequential.
All demand sources see every impression simultaneously and bid in real time.
The highest bid wins, regardless of the source's priority ranking.
The result: more competition per impression, which increases [RPMs](./revenue-per-mille.md) for publishers.

Industry reports from 2016-2018 showed 20-50% RPM increases when publishers switched from waterfall to header bidding, with some seeing larger gains depending on their demand partner mix.
The improvement comes from two sources: higher clearing prices (competition raises bids) and reduced passback waste (in the waterfall, impressions that cascaded through all sources without a qualifying bid were often sold at remnant prices or went unfilled entirely).

**Prebid.js**, released as open source by AppNexus in 2015 [@prebid2015], became the dominant header bidding wrapper.
It standardized how publishers integrate multiple demand partners, manage timeouts (how long to wait for bids before the page loads the ad server's fallback), and configure auction rules.
As of 2025, Prebid.js is used by over 70% of the top 10,000 websites running header bidding.
Premium ad networks like Mediavine and Raptive run proprietary header bidding stacks built on similar principles but optimized for their specific publisher portfolios.

**Server-side header bidding** moved the auction from the user's browser to a server, reducing page load impact.
Client-side header bidding (the original approach) adds JavaScript to the page that fires bid requests from the user's browser — each demand partner adds latency.
With dozens of partners, this could add 1-3 seconds to page load time, degrading user experience and [viewability](./impression.md).
Server-side bidding runs the auction on a server, sending a single consolidated request from the browser and receiving a single response.
The tradeoff: server-side bidding reduces latency but also reduces cookie access (the server doesn't have the user's browser cookies), which can lower bid prices because advertisers have less targeting data.

**For publishers evaluating ad networks**, header bidding capability is now table stakes.
A network that runs header bidding (Mediavine, Raptive, Playwire) will outperform one that doesn't (basic AdSense) on the same traffic, because the competitive auction mechanics extract more value per [impression](./impression.md).
The publisher's decision is whether to implement header bidding independently (using Prebid.js, requiring technical sophistication) or to outsource it to a managed network (sacrificing 25-35% of revenue in exchange for turnkey optimization).
