---
name: dispatching-a-script
description: The script-side counterpart of dispatching-logical-inference — resolves a skill slug to its script and drives the send/receive pair to run it.
specializing: script
composes:
  - sending-parameters-to-a-script
  - receiving-a-message-from-a-script
---

Pairs with `dispatching-logical-inference` as the two leaves of the dispatch chain that actually do the work: one talks to LLMs over the wire, this one talks to local scripts.
Process and procedure kind-dispatchers chain here; derivation and inquiry kind-dispatchers chain to inference.
