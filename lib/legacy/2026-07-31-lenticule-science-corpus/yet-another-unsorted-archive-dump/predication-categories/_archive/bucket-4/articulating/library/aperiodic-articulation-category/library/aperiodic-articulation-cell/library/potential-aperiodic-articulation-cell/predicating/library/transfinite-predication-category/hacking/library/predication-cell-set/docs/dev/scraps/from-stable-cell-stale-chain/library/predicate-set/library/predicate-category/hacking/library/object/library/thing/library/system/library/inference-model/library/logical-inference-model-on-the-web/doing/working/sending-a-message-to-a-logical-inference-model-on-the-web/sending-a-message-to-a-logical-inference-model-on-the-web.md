---
name: sending-a-message-to-a-logical-inference-model-on-the-web
description: The web-I/O leaf of the dispatch chain that performs the actual HTTP round-trip against a web-hosted inference model.
specializing: logical-inference-model-on-the-web
---

The script is the actual wire I/O at the bottom of the dispatch chain. Its caller (`dispatching-to-a-logical-inference-model-on-the-web`) has already resolved which model to talk to; this script just performs the HTTP POST and returns the response text.

Adapter selection reads the model record's `provider:` cell and dispatches to `doing/working/inferring/adapters/<provider>.mjs`.
