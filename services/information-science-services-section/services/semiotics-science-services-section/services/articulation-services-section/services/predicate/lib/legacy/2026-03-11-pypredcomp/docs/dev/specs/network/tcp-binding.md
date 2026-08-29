---
title: "TCP binding"
description: "Raw TCP connections through the substrate. Drivers can open TCP sockets via this binding."
kind: spec
status: normative
version: "0.2"
---

# TCP binding

The OS exposes raw TCP via a substrate binding.
Drivers (matrix, smtp, custom drivers) use this to open and operate TCP sockets.

## 1. Substrate cells for TCP

```json
{"subject": "tcp:<peer-uri>", "predicate": "kind", "object": "tcp-connection", "value": "True"}
{"subject": "tcp:<peer-uri>", "predicate": "state", "object": "open|connecting|closing|closed", "value": "True"}
{"subject": "tcp:<peer-uri>", "predicate": "owned-by-driver", "object": "driver:<slug>", "value": "True"}
```

A TCP connection is a substrate entity owned by a driver.
Lifecycle events are substrate events.

## 2. Capability

`network-tcp-connect` to a target host:port.

## 3. Implementation

Python: asyncio's TCP transports.
Rust: tokio's TcpStream.

## 4. Conformance

Round-trip TCP via a test driver with a fixture peer.
