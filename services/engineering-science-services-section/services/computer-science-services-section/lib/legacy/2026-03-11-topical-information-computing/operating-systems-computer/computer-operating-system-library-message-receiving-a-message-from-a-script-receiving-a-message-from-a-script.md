---
name: receiving-a-message-from-a-script
description: Turn a local script send result into the structured response envelope returned by the script dispatch chain.
source: message
target: message
---

# Receiving a message from a script

This transformer is the receiving half of the local script execution boundary.
It takes the output of `sending-parameters-to-a-script`, adds the receive timestamp, and returns the structured response envelope used by script dispatch.
