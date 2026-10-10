---
name: sending-parameters-to-a-script
description: The local-execution leaf of the dispatch chain that invokes a script and captures its return value. Dual of sending-a-message-to-a-logical-inference-model-on-the-web.
specializing: script
---

The script-side analog of the wire I/O at the bottom of the inference chain.
Knows nothing about which script to pick (that is `dispatching-a-script`'s job); only knows how to invoke one once the path is fixed.
