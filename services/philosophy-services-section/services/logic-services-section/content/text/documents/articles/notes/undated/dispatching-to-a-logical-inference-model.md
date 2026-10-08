---
name: dispatching-to-a-logical-inference-model
description: The model-router layer of the dispatch chain — finds the first model whose skills list advertises the work's needed skill and hands off to the right sub-dispatcher (web vs. local).
specializing: inference-model
composes:
  - dispatching-to-a-logical-inference-model-on-the-web
title: dispatching-to-a-logical-inference-model
---

The narrowing step from "we need inference" to "we need *this specific model* for inference." The picker reads each model record's `skills:` list and stops at first match. First match wins for now; ranking by cost, latency, and rate-limit headroom is deferred.
