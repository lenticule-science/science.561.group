---
title: "HTTP/2"
description: "HTTP/2 transport per RFC 9113. Default HTTP version for the substrate's HTTP server. Server push, multiplexed streams."
kind: spec
status: normative
version: "0.2"
---

# HTTP/2

Per RFC 9113 (https://datatracker.ietf.org/doc/html/rfc9113).

## 1. Substrate use cases

- HTTP server (per [http-addressing.md](http-addressing.md)) defaults to HTTP/2.
- Federation pull/push uses HTTP/2 long-poll for efficiency.
- Server push for streaming substrate-event subscriptions (alternative to WebSocket).

## 2. Implementation

Python: FastAPI on uvicorn (HTTP/2 via `h2` library).
Rust: hyper / axum native HTTP/2.

## 3. Configuration

```json
{"subject": "system", "predicate": "http-version-default", "object": "h2", "value": "True"}
```

HTTP/1.1 fallback supported for clients that don't speak h2.

## 4. Conformance

HTTP/2 binding passes:

1. RFC 9113 conformance per `h2spec` test suite.
2. Server push works for subscribed clients.
3. HTTP/1.1 clients fallback gracefully.
