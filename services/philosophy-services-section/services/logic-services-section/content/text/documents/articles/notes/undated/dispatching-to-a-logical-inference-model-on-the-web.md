---
name: dispatching-to-a-logical-inference-model-on-the-web
description: The web-I/O pair coordinator at the second-from-bottom of the dispatch chain — composes sending and receiving for one model on the web.
specializing: logical-inference-model-on-the-web
composes:
  - sending-a-message-to-a-logical-inference-model-on-the-web
  - receiving-a-message-from-a-logical-inference-model-on-the-web
title: dispatching-to-a-logical-inference-model-on-the-web
---

The next layer up from the wire-I/O pair. Knows nothing about which model to pick (that is the upper layer's concern); only knows how to drive the send/receive pair against the model handed in.
