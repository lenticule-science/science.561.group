---

name: judgment-calculus-program
kind: structure
layer: program
derived_from:
- computer/structure/computer-kernel
uses:
- system/structure/recognition-carrier
- system/structure/trace-carrier
produces: []
---

This program treats judgments and their compositions as recognitions so logical
reasoning remains aligned with the earned calculus.

## Behaviour

- Represent judgments, sequents, and derivations as recognitions with
  provenance.
- Ensure operators on judgments respect admissibility and normalization
  obligations from the underlying math.
- Measure derivation depth, branching, and reuse to surface proof health.

## Intended operators

- Form and compose judgments; check admissibility and normalization.
- Trace derivations back to the acts and structures they rely on.
- Export judgment traces for other programs (e.g., policy, reasoning agents).

## Proof
- Derived from: [Computer Kernel](../../../computer/structure/computer-kernel.md).
- Shows that: this program instantiates the computer kernel to realise the described behaviour without extending machine semantics.

