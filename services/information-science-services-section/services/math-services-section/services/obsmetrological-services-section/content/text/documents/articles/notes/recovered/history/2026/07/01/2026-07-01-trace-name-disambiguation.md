---
title: "Trace now means folded carrier"
date: 2026-07-01
status: dev-note
claim: "bare Trace is reserved for the finite folded carrier of a move word; Salem's y = x + 1/x polynomial is named as a trace resolvent"
---

This note records the trace-name cleanup made on 2026-07-01.

## Retired Salem name

The old `salemTrace` name is retired in active Lean, Blueprint, and Verso
surfaces. The Salem polynomial `y^2 - y - 3`, obtained from
`y = x + 1/x`, is now named:

- `Infomaterial.Persistence.Aperiodic.StepN.salemTraceResolvent`
- `Infomaterial.Persistence.Aperiodic.StepN.salemTraceResolvent_unit_circle`
- `Infomaterial.Persistence.Aperiodic.StepN.salemTraceResolvent_real_root`

That object is a trace resolvent of a reciprocal Salem polynomial. It is not the
field-theoretic or carrier-theoretic trace sense.

## Bare Trace

Bare `Trace` now names the general finite fold carrier:

```text
initial carrier + finite step word + one-step advance -> accumulated carrier
```

The Articulating instance starts from `Articulating.utter floor` and folds
utterance moves with `Articulating.pair`. This is the byte-like carrier answer
for a sequence of moves in the `it -> bit -> byte` line: not an octet, and not a
new primitive, but the finite addressable replay carrier of a witnessed move
word.

## Proved in Lean

The new proved Lean surface is:

- `Infomaterial.Trace.carrier`: carrier is `List.foldl` over the trace word.
- `Infomaterial.Trace.carrier_snoc`: appending one step advances the carrier
  once.
- `Infomaterial.Trace.articulating_carrier_depth`: the Articulating carrier's
  depth is the number of folded utterance moves.
- `Infomaterial.Trace.articulating_carrier_floor`: the Articulating carrier's
  floor is the trace floor.
- `Infomaterial.Trace.ofArticulating_carrier`: reading an existing
  `Articulating` as a trace and folding it back returns the original carrier.
- `Infomaterial.Trace.ofArticulating_length`: the trace length read from an
  `Articulating` is its depth.
- `Infomaterial.Closure.Collatz.traceOfWord_eq_trace_carrier`: the Collatz
  `traceOfWord` fold is the `Branch`/`AffineTrace` specialization of the same
  `Trace` fold shape.

These are ordinary proved declarations, not frontier claims.

## Still open

The stronger computational claim that every runtime byte row, serialization
stream, or witness log preserves exactly this trace carrier is not proved here.
That remains a frontier obligation: each concrete byte-level substrate still
needs its own carrier-preservation theorem or a red Blueprint node before it can
be treated as a faithful Trace realization.
