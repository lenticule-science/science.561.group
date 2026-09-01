---
name: sending
gerund: sending
agent-noun: sender
imperative: send
description: Transmitting a message across a boundary — to another process, to a remote endpoint over the wire, to a script as parameters.
---

A send transformer. The transformer takes a message and a destination and transmits the message bytes (or arguments) to the destination. The output is a transmit-witness record naming what was sent, to whom, when, and with what envelope.

## Domain and codomain

- **Domain:** a send-spec — a tuple `(message, destination, envelope)` where the message is the payload to transmit, the destination names the receiver (a URL, a script path, a queue file, a socket), and the envelope carries protocol-level metadata (headers, auth, content-type).
- **Codomain:** a transmit-witness record naming the destination, the bytes sent, and the timestamp.

## Morphological forms in naming grammar

- `gerund: sending` heads skills built on this transformer: `sending-a-message-to-a-logical-inference-model-on-the-web`, `sending-parameters-to-a-script`, etc.
- `agent-noun: sender` heads agents that invoke such skills.
- `imperative: send` heads scripts that body such skills: `send-a-message-to-a-logical-inference-model-on-the-web.mjs`, `send-parameters-to-a-script.mjs`, etc.

## Distinct from adjacent transformers

- `dispatching` finds the receiver; sending pushes the bytes once the receiver is fixed.
- `writing` commits bytes to the cell store; sending crosses a process boundary (network, child process, socket).
- `receiving` is the dual: read bytes from a boundary; sending pushes bytes across one.

## Step-induction role

Sending is the wire-level act at the bottom of a dispatch chain. After all narrowing is done and exactly one destination remains, sending is what actually crosses the boundary. The witness it emits is the primary record that the OS reached the outside world (a remote API, a subprocess, an inbound queue of another loop).
