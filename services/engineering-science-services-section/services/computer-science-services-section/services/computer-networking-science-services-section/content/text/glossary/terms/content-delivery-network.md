---
description: A content delivery network is a distributed system of edge servers, positioned across many networks and geographic locations, that caches and serves an origin server's content from a location topologically closer to a requesting client than the origin itself.
identity: content-delivery-network
name: Content delivery network
date-created: 2026-09-08
references:
  nygrensitaramansun2010:
    authors:
      - Erik Nygren
      - Ramesh K. Sitaraman
      - Jennifer Sun
    title: "The Akamai Network: A Platform for High-Performance Internet Applications"
    publication: ACM SIGOPS Operating Systems Review 44(3)
    year: 2010
    url: https://www.akamai.com/site/en/documents/research-paper/the-akamai-network-a-platform-for-high-performance-internet-applications-technical-publication.pdf
  cloudflare2026:
    authors:
      - Cloudflare, Inc.
    title: How Cloudflare's CDN Works
    publisher: Cloudflare Developer Docs
    year: 2026
    url: https://developers.cloudflare.com/fundamentals/concepts/how-cloudflare-works/
---
A content delivery network is a distributed system of edge servers, positioned across many networks and geographic locations, that caches and serves an origin server's content from a location topologically closer to a requesting client than the origin itself, reducing latency and origin load for repeated requests. Nygren, Sitaraman, and Sun's description of the Akamai platform states the architecture at scale: tens of thousands of servers across roughly a thousand networks, using DNS-based request mapping to direct a client to a nearby edge server that serves cached content directly and can also accelerate dynamic and application traffic between edge and origin.

A content delivery network differs from ordinary web hosting in that it does not replace the origin, it sits in front of it: DNS for the hosted domain is pointed at the CDN operator's edge network, which serves a cached response when one exists and fetches from the origin server when it does not. Static content such as images, stylesheets, and scripts is cached by default under this design, first-party documentation for Cloudflare's implementation states, while dynamic content such as generated HTML is not cached unless the operator configures it to be. See [web-hosting](./web-hosting.md).

Adopting a content delivery network routes a domain's DNS, and therefore its request traffic, through the CDN operator's infrastructure rather than merely alongside it, which is the structural centralization the arrangement implies: the small number of large CDN operators that serve most of the web's cached traffic each become a point through which a large share of otherwise-unrelated sites' traffic, and therefore each site's exposure to that operator's own policy and legal compulsion, passes. A collective evaluating a CDN for its members' hosted sites is trading origin-level latency and load for a new, shared dependency on the CDN operator, on top of whatever dependency already exists on the underlying [web-hosting](./web-hosting.md).
