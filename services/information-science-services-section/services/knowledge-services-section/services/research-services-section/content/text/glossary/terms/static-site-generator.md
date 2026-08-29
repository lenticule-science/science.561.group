---
title: "static site generator"
date-created: 2025-01-01
aliases:
  - "static site generator"
  - "SSG"
date: 2026-02-23T10:08:00
type: term
tags: []
defines:
  - "static site generator"
  - "SSG"
---

A static site generator (SSG) is software that takes source files -- typically written in [Markdown](../../technology/disciplines/computing/specifications/markdown/index.md) or a similar lightweight markup language -- and produces plain HTML, CSS, and JavaScript files that can be served directly by a web server without any server-side processing at request time.

This site (emsenn.net) is built with [quartz|Quartz](quartz|Quartz), a static site generator designed for publishing Obsidian vaults as websites. Other well-known SSGs include Hugo, Jekyll, Eleventy, and Astro.

Static site generators stand in contrast to dynamic content management systems (CMSes) like WordPress or Drupal, which assemble each page on the server when a visitor requests it. A dynamic CMS queries a database, runs server-side code, and constructs the HTML response for every page view. An SSG does all of this work once, at build time, and produces files that a server delivers without further computation.

This architecture offers several practical advantages:

- **Speed.** Pre-built HTML files load faster than dynamically generated pages because the server performs no computation per request.
- **Security.** With no server-side application or database running, the attack surface shrinks. There is no SQL injection, no PHP vulnerability, no CMS admin panel to compromise.
- **Version control.** Because the source files are plain text, they integrate with Git and other version control systems. Every change to the site is tracked, diffable, and reversible.
- **Portability.** The output is plain HTML. It can be hosted on any web server, any CDN, or any object storage service. Moving between hosts requires copying files, not migrating a database.

The tradeoff is that SSGs cannot handle content that changes per-visitor or per-request (user logins, personalized feeds, real-time data) without adding client-side JavaScript or external services. For sites whose content changes only when the author publishes -- research sites, documentation, blogs -- this tradeoff favors the static approach.

## Related terms

- [Markdown](../../technology/disciplines/computing/specifications/markdown/index.md) -- the markup language most SSGs use as their source format
- [quartz|Quartz](quartz|Quartz) -- the static site generator that builds this site
