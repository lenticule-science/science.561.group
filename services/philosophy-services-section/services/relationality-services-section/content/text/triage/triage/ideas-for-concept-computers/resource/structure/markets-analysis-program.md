---
title: Markets Analysis Program
kind: structure
layer: program
status: someday
derived_from:
- computer/structure/computer-kernel
uses:
- system/structure/recognition-carrier
- system/structure/trace-carrier
produces: []
---

This program models markets as recognitions so prices, flows, and sentiment can
be analysed with provenance.

## Behaviour

- Represent instruments, orders, trades, participants, and venues as
  recognitions with provenance.
- Link to external data (news, policy, macro indicators) without breaking
  relational invariants.
- Measure liquidity, volatility, depth, spreads, and sentiment traces.

## Intended operators

- Ingest and normalise market data into recognitions.
- Analyse market structure and dynamics; compare across venues or assets.
- Trace how policy or events propagate through market measurements.

## Proof
- Derived from: [Computer Kernel](../../../computer/structure/computer-kernel.md).
- Shows that: this program instantiates the computer kernel to realise the described behaviour without extending machine semantics.
