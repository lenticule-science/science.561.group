---
title: research residual
generated-by: certified-research-cell
generates: variational stabilization
status: derived
session: 2026-06-23
---

# research residual

The **research residual** measures the remaining distance between a research
cell and certification.

## Definition

For `r : X -> C Y`, define:

```text
res(r) := C r - r
```

where subtraction is read in whatever additive or linear reflection of the
ambient setting is being used for measurement.

Define the action:

```text
S[r] := 1/2 <res(r), res(r)>
```

## Proposition: certified cells are critical cells

A research cell is certified exactly when its residual vanishes:

```text
res(r) = 0  iff  C r ~= r
```

and, under the usual positive pairing assumption, critical minima of `S` are
precisely certified cells.

## Proof

By definition, `res(r)` is the difference between applying the closure again and
the current research cell. It vanishes exactly when closure changes nothing,
which is the idempotence condition for certification. Since `S` is the squared
size of the residual, its minimum occurs exactly at vanishing residual.

The residual is the proof obligation left by an inquiry: it says what still
changes when the act is reclosed.
