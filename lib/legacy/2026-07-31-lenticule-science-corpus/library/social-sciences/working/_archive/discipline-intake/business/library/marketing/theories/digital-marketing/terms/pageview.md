---

name: "Pageview"
description: "A single instance of a web page being loaded in a browser — the fundamental unit of measurement for web traffic and the denominator in most monetization metrics."
domain: web-business
date-created: 2026-03-29
---

A pageview is a single instance of a web page being loaded (or reloaded) in a browser. It is the fundamental unit of measurement for web traffic and the denominator in most monetization metrics, including [revenue per mille](./revenue-per-mille.md).

Pageviews became the standard currency of web analytics in the mid-1990s because they were easy to count (each page request generated a server log entry) and easy to understand (more pageviews = more people seeing the content). The metric has survived despite legitimate criticisms because advertisers, publishers, and analytics platforms all organize their systems around it.

A pageview is not the same as a **unique visitor** or a **session**. One person visiting a site and reading five articles generates five pageviews but counts as one unique visitor and (usually) one session. This distinction matters for monetization: advertising revenue scales with pageviews (more pages loaded = more ad impressions served), but subscription value correlates more with unique visitors (each person is a potential subscriber regardless of how many pages they read).

The metric has known blind spots. A pageview doesn't capture how long someone spent on the page, whether they actually read the content, or whether they scrolled past the fold. A visitor who opens a page by accident and closes it after one second counts the same as someone who reads a 3,000-word article to the end. This is why **engaged pageviews** — pageviews where the user remained on the page for a minimum duration (Google Analytics 4 uses 10 seconds) or scrolled past a threshold — have become an increasingly important supplementary metric, particularly for advertisers evaluating content quality.

Web applications that load content dynamically without full page reloads (single-page applications, infinite scroll) complicate pageview counting. Modern analytics tools handle this through virtual pageviews — JavaScript events that register as pageviews when new content loads into the same page frame — but inconsistent implementation across sites makes cross-site pageview comparisons less reliable than they were in the era of static pages.