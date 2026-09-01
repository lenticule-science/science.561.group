---

name: sheaf-semantics
  - "Sheaf Semantics"
  - "sheaf semantics"
date-created: 2025-12-26
introduces: concept
tags: []
---

## Concrete example first

You have two overlapping local traces and assign a meaning to a recognition term on each one. If those local meanings agree on overlap, sheaf semantics says they must glue to one global meaning. If they disagree on overlap, no global meaning is allowed.

## Formal definition

In GFRTU, an RTL judgment is interpreted as a single arrow in the sheaf topos
$R=\mathbf{Sh}(T,J)$, not as disconnected per-trace functions.
Fiberwise components appear because arrows of sheaves are natural families satisfying compatibility with restriction maps.

So **sheaf semantics** is the requirement that interpretation respects locality, compatibility on overlaps, and gluing in $(T,J)$.

## Why it matters in GFRTU

- It turns trace-indexed data into coherent global semantics.
- It prevents contradictory local interpretations from entering the universe.
- It is one of the three closure principles used to generate GFRTU.
