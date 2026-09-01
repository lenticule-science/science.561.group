---
name: logical-inference-model-on-the-web
description: An inference-model specialized by its bridge being over HTTP. The Kleisli-of-distribution-monad morphism is realized as a request/response pair against a URL endpoint speaking a JSON wire protocol.
specializing: inference-model
transport: http
realizes-standard: rfc-9110
---

A **logical-inference-model-on-the-web** is an [inference-model](../../inference-model.md) whose Kleisli morphism is realized as an HTTP request/response pair against a URL endpoint. The specialization narrows the abstract Kleisli-arrow framing of inference-model to the case the wire is HTTP — the request is serialized as a JSON body (typically against an OpenAI-style or Anthropic-style chat-completion API), the response is the sampled output as JSON, and the adapter normalizes between the OS's query format and the provider's wire format.

## Why a sub-structure rather than a frontmatter cell

An inference-model whose transport differs (e.g., local stdio, gRPC, message-bus) is the same Kleisli object but with a different byte-level realization. Promoting transport-by-HTTP to its own sub-structure separates the wire-level invariants (URL scheme, TLS, HTTP/1.1 vs HTTP/2, JSON request/response envelopes) from the abstract inference-model definition. Future specializations (logical-inference-model-on-the-localhost, logical-inference-model-on-a-message-bus) would each warrant their own sub-structure under inference-model/library/.

## Distinguishing predication-shape

- `base-url(logical-inference-model-on-the-web, url)` — the HTTPS endpoint root.
- `http-method(logical-inference-model-on-the-web, {post | get})` — typically POST.
- `request-envelope(logical-inference-model-on-the-web, json-schema)` — the JSON body shape (e.g., OpenAI chat-completion shape, Anthropic messages shape).
- `response-envelope(logical-inference-model-on-the-web, json-schema)` — the JSON response shape.
- `auth-scheme(logical-inference-model-on-the-web, {bearer-token | x-api-key | header})` — authentication wire convention.
- `streaming-supported(logical-inference-model-on-the-web, bool)` — whether the endpoint supports server-sent-events streaming.

(All other characteristic cells of the parent inference-model form apply.)
