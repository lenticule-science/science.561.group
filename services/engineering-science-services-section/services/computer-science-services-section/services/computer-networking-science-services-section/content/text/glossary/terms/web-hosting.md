---
description: Web hosting is the service of storing a website's content on a server connected to the Internet and making it available to clients over HTTP.
identity: web-hosting
name: Web hosting
date-created: 2026-09-08
references:
  kuroseross2020:
    authors:
      - James F. Kurose
      - Keith W. Ross
    title: "Computer Networking: A Top-Down Approach, 8th Edition"
    publisher: Pearson
    year: 2020
---
Web hosting is the service of storing a website's content on a server connected to the Internet and making it available to clients over HTTP, differentiated along two independent axes: whether content is static (stored unchanged and served as-is) or dynamic (generated per request by server-side code), and whether the underlying server resources are shared among many customers, dedicated to one customer, or allocated as an isolated virtual slice of a shared physical machine. Kurose and Ross's standard networking text states the client-server architecture this rests on: an HTTP server holds content addressed by URL, and a client issues one request per object it needs.

Web hosting differs from a content delivery network in topology: web hosting names where a site's authoritative copy is stored and served from, a single location or a small set of locations an operator directly controls, while a content delivery network interposes many geographically distributed edge servers between the client and that origin. Shared hosting differs from dedicated hosting in isolation, not in protocol: on shared hosting, one physical server's resources and, often, its IP address are divided among unrelated customers, so one customer's traffic spike or security compromise can degrade or implicate the others, while dedicated hosting gives one customer exclusive use of the underlying hardware. See [content-delivery-network](./content-delivery-network.md).

A collective hosting many members' static and dynamic sites on shared infrastructure concentrates administrative risk in one place: a single legal, financial, or network-level action against the hosting operator, rather than against any one hosted site, can take every hosted site offline at once, which is the structural reason hosting scale is itself an exposure a purely technical hosting design does not remove. This is the same concentration [domain-name-seizure](./domain-name-seizure.md) exploits at the naming layer rather than the hosting layer.
