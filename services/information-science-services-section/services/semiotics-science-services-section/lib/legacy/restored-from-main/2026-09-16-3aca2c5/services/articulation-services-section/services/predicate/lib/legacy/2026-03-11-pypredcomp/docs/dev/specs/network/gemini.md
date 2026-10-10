---
title: "Gemini"
description: "Gemini protocol per gemini.circumlunar.space spec. Small-web protocol; optional driver."
kind: spec
status: normative
version: "0.6"
---


Per https://gemini.circumlunar.space/docs/specification.html.
Optional small-web protocol; the OS may serve persona content over Gemini at v0.6+.

## 1. Substrate cells

```json
{"subject": "gemini-page:<uri>", "predicate": "kind", "object": "gemini-page", "value": "True"}
{"subject": "gemini-page:<uri>", "predicate": "content-gemtext", "object": "<text>", "value": "True"}
```

## 2. Server

`gemini://<persona>.
561.local/...
` routes via a Gemini server driver.
Pages are substrate cells.

## 3. Conformance

Serve a page; client (Lagrange / Amfora) renders correctly.
