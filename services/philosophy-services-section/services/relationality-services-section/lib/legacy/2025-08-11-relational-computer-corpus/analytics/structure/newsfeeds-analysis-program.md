---

name: newsfeeds-analysis-program
layer: program
derived_from:
- computer/structure/computer-kernel
uses:
- system/structure/recognition-carrier
- system/structure/trace-carrier
produces: []
---

This program analyses newsfeeds as recognitions to surface bias, coverage, and
influence.

## Behaviour

- Represent articles, sources, topics, and timelines as recognitions with
  provenance.
- Track information structure, framing, and repetition across feeds.
- Measure coverage balance, sentiment, and propagation patterns.

## Intended operators

- Ingest and align newsfeeds with traceable metadata.
- Compare topicalization and framing across sources.
- Alert on anomalies or gaps in coverage.

## Proof
- Derived from: [Computer Kernel](../../../computer/structure/computer-kernel.md).
- Shows that: this program instantiates the computer kernel to realise the described behaviour without extending machine semantics.

