---
title: "Language for frontend rendering"
description: "Server-rendered HTML is the default; which Rust template engine."
kind: question
status: closed-out-of-scope
closed: 2026-05-03
closed-reason: "Captain directive 2026-05-03: stop developing RustyPredComp; PyPredComp only. Rust-side frontend template choice is moot until/unless RustyPredComp is reopened."
---

# Language for frontend rendering

[decisions/web-gui-server-rendered-html.md](../decisions/web-gui-server-rendered-html.md) commits to server-rendered HTML.
Multiple Rust template engines fit; the captain picks.

## Candidates

- **askama** — Jinja-like syntax, compile-time checked.
  Static HTML generation.
  Most idiomatic for compile-time-template-validation.
- **tera** — Jinja-like, runtime-evaluated.
  More dynamic but slower.
- **maud** — DSL embedded in Rust.
  Very fast; less Jinja-familiar.
- **liquid** — Shopify's.
  Less common.
- **leptos / dioxus / yew (server-side rendering modes)** — these are reactive framework SSR; might pull in client-runtime expectations.

## Trade-offs

- **askama**: best ergonomics, compile-time checks.
  Standard recommendation.
- **maud**: fastest, but DSL-vs-template tradeoff; fewer collaborators write `maud!
  ` macros than write Jinja templates.
- **tera**: more flexible at runtime; the captain can edit templates without recompiling.

## Captain's view

(To be written.)

## Resolution

Pick one; document in `decisions/template-engine.md`; plan 06 implements with the chosen engine.
