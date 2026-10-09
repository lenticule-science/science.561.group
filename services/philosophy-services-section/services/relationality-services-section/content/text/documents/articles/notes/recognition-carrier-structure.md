---
title: Recognition Carrier Structure
keywords:
  - recognition
  - carrier
layer: internal-theorem
status: plan
depends-on:
  - theorem/internal/universal-state-hypertensor
  - theorem/internal/trace-infrastructure
  - theorem/internal/policy-stack
  - acts/recognize-observation
  - acts/recognize-judgement-triad
  - acts/recognize-context
description: Earned structure.
---

**Earned structure.** There exists a single relational structure

```text
RecognitionCarrier = (state, payload, trace, policy,
                      π_state, π_payload, π_trace, π_policy,
                      ExtendsTrace, RefinesPolicy, Stable)
```

whose points are quadruples `(r, c, (tau), p)` earned exactly when one of the
recognition acts [Recognize Observation](./recognize-observation.md),
[Recognize Judgement Triad](./recognize-judgement-triad.md), or
[Recognize Context](./recognize-context.md) succeeds on a `State`
value `r` (from [Relational Quasicrystalline Hypertensor Sheaf](./universal-state-hypertensor.md)),
producing payload `c`, trace `(tau)`, and policy snapshot `p` (from
[Policy Stack](./policy-stack.md)).

- `state` is the carrier of sheaf sections `State := Section`.
- `payload` ranges over the earned recognition payloads `c` produced by the
  recognition acts above.
- `trace` ranges over finite traces from [Trace Infrastructure](./trace-infrastructure.md).
- `policy` ranges over policy regimes and guards from [Policy Stack](./policy-stack.md).

**Projections.** The maps

```text
π_state   : RecognitionCarrier → State
π_payload : RecognitionCarrier → payload
π_trace   : RecognitionCarrier → Trace
π_policy  : RecognitionCarrier → policy
```

return the corresponding component of a quadruple.

**Relations.**

- `ExtendsTrace(x, y)` holds when `π_state(x) = π_state(y)`,
  `π_payload(x) = π_payload(y)`, `π_policy(x) = π_policy(y)`, and
  `π_trace(x)` is a prefix of `π_trace(y)` as defined by
  [Trace Infrastructure](./trace-infrastructure.md).
- `RefinesPolicy(x, y)` holds when `π_state(x) = π_state(y)`,
  `π_payload(x) = π_payload(y)`, `π_trace(x) = π_trace(y)`, and
  `π_policy(y)` refines `π_policy(x)` in the order earned by
  [Policy Stack](./policy-stack.md).

**Stable subset.** `Stable ⊆ RecognitionCarrier` consists of those points
`x` such that any re-application of the same recognition act and policy to
`π_state(x)` returns a point `y` with the same payload and state and with
`ExtendsTrace(x, y)` and/or `RefinesPolicy(x, y)` true.
