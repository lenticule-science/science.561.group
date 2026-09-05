---
name: cosmic-increment-sequence
description: "An instance of increment-sequence (cross-tower analog of collatz-increment-sequence): the time-indexed posits that drive cosmic-thermalization. Each step injects the next epoch's scale factor a(τ) as positive evidence on the base (redshift-indexed observables). The discretization of continuous cosmic time into thermalizing stages is asserted (hacking)."
depends-on: [increment-sequence, redshift-reindexing]
derives-from: increment-sequence
status: hacking
---

**Cosmic-increment-sequence** is the [[increment-sequence]] instance that drives [[cosmic-thermalization]] — the cross-tower analog of [[collatz-increment-sequence]].
It fixes:

- **base**: redshift-indexed observables (cite [[redshift-reindexing]]); predicate `reached-scale`; entities = scale-factor values a(τ).
- **per-step evidence**: `u_{τ+1}(reached-scale)(a_{τ+1}) = t`, else ⊥, where a_{τ+1} is the next epoch's scale factor along the expansion history.
