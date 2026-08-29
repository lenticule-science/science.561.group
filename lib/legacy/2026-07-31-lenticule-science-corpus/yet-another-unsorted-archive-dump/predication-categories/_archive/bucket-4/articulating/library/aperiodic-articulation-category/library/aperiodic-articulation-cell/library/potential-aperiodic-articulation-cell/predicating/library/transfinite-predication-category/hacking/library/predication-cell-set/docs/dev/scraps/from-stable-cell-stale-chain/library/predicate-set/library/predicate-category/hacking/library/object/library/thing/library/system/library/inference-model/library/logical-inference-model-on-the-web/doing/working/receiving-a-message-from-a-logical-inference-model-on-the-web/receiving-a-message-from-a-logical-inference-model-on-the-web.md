---
name: receiving-a-message-from-a-logical-inference-model-on-the-web
description: The parsing half of the web-I/O leaf — takes the raw text from sending and returns the structured response cell.
specializing: logical-inference-model-on-the-web
---

The script is the dual of `sending-a-message-to-a-logical-inference-model-on-the-web`. Together they form the bottom of the dispatch chain: send performs the HTTP round-trip; receive turns the raw text into the response cell shape the dispatch chain expects upward.
